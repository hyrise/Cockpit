# noqa
# type: ignore
# flake8: noqa

"""Handler for tasks of the transaction type."""

from time import time_ns
from typing import Tuple

from psycopg2.extensions import AsIs

import hyrisecockpit.drivers.tpcc.constants as constants
from hyrisecockpit.drivers.tpcc.parameter_generator import TPCCParameterGenerator
from hyrisecockpit.drivers.tpcc.query_template import TXN_QUERIES


class TPCCTransactionHandler:
    """Handler for processing of the transaction tasks."""

    def __init__(self):
        """Initialize TransactionHandler."""
        self._handlers = {
            "stock_level": self.doStockLevel,
            "delivery": self.doDelivery,
            "order_status": self.doOrderStatus,
            "payment": self.doPayment,
            "new_order": self.doNewOrder,
        }

    def execute_transaction(self, cursor, transaction_type, parameters) -> None:
        """Execute task of the transaction type."""
        self.conn = cursor._connection
        self.conn.set_session(autocommit=False)

        handler = self._handlers.get(transaction_type)
        assert handler is not None, (  # nosec
            "Unexpected TransactionType: " + transaction_type
        )

        handler(cursor, parameters)
        self.conn.set_session(autocommit=True)

    # ____________________________________________

    def doDelivery(self, cursor, params):  # noqa
        q = TXN_QUERIES["DELIVERY"]

        w_id = params["w_id"]
        o_carrier_id = params["o_carrier_id"]
        ol_delivery_d = params["ol_delivery_d"]

        result = []
        for d_id in range(1, constants.DISTRICTS_PER_WAREHOUSE + 1):
            cursor.execute(q["getNewOrder"], [d_id, w_id])
            newOrder = cursor.fetchone()
            if newOrder == None:
                ## No orders for this district: skip it. Note: This must be reported if > 1%
                continue
            assert len(newOrder) > 0  # nosec
            no_o_id = newOrder[0]

            cursor.execute(q["getCId"], [no_o_id, d_id, w_id])
            c_id = cursor.fetchone()[0]

            cursor.execute(q["sumOLAmount"], [no_o_id, d_id, w_id])
            ol_total = cursor.fetchone()[0]

            cursor.execute(q["deleteNewOrder"], [d_id, w_id, no_o_id])
            cursor.execute(q["updateOrders"], [o_carrier_id, no_o_id, d_id, w_id])
            cursor.execute(q["updateOrderLine"], [ol_delivery_d, no_o_id, d_id, w_id])

            # These must be logged in the "result file" according to TPC-C 2.7.2.2 (page 39)
            # We remove the queued time, completed time, w_id, and o_carrier_id: the client can figure
            # them out
            # If there are no order lines, SUM returns null. There should always be order lines.

            assert (  # nosec
                ol_total != None
            ), "ol_total is NULL: there are no order lines. This should not happen"
            assert ol_total > 0.0  # nosec

            cursor.execute(q["updateCustomer"], [ol_total, c_id, d_id, w_id])

            result.append((d_id, no_o_id))
        ## FOR

        self.conn.commit()
        return result

    ## ----------------------------------------------
    ## doNewOrder
    ## ----------------------------------------------
    def doNewOrder(self, cursor, params):  # noqa
        q = TXN_QUERIES["NEW_ORDER"]

        w_id = params["w_id"]
        d_id = params["d_id"]
        c_id = params["c_id"]
        o_entry_d = params["o_entry_d"]
        i_ids = params["i_ids"]
        i_w_ids = params["i_w_ids"]
        i_qtys = params["i_qtys"]

        assert len(i_ids) > 0  # nosec
        assert len(i_ids) == len(i_w_ids)  # nosec
        assert len(i_ids) == len(i_qtys)  # nosec

        all_local = True
        items = []
        for i in range(len(i_ids)):
            ## Determine if this is an all local order or not
            all_local = all_local and i_w_ids[i] == w_id
            cursor.execute(q["getItemInfo"], [i_ids[i]])
            items.append(cursor.fetchone())
        assert len(items) == len(i_ids)  # nosec

        ## TPCC defines 1% of neworder gives a wrong itemid, causing rollback.
        ## Note that this will happen with 1% of transactions on purpose.
        for item in items:
            if len(item) == 0:
                ## TODO Abort here!
                return
        ## FOR

        ## ----------------
        ## Collect Information from WAREHOUSE, DISTRICT, and CUSTOMER
        ## ----------------
        cursor.execute(q["getWarehouseTaxRate"], [w_id])
        w_tax = cursor.fetchone()[0]

        cursor.execute(q["getDistrict"], [d_id, w_id])
        district_info = cursor.fetchone()
        d_tax = district_info[0]
        d_next_o_id = district_info[1]

        cursor.execute(q["getCustomer"], [w_id, d_id, c_id])
        customer_info = cursor.fetchone()
        c_discount = customer_info[0]

        ## ----------------
        ## Insert Order Information
        ## ----------------
        ol_cnt = len(i_ids)
        o_carrier_id = constants.NULL_CARRIER_ID

        cursor.execute(q["incrementNextOrderId"], [d_next_o_id + 1, d_id, w_id])
        cursor.execute(
            q["createOrder"],
            [d_next_o_id, d_id, w_id, c_id, o_entry_d, o_carrier_id, ol_cnt, all_local],
        )
        cursor.execute(q["createNewOrder"], [d_next_o_id, d_id, w_id])
        ## ----------------
        ## Insert Order Item Information
        ## ----------------
        item_data = []
        total = 0
        for i in range(len(i_ids)):
            ol_number = i + 1
            ol_supply_w_id = i_w_ids[i]
            ol_i_id = i_ids[i]
            ol_quantity = i_qtys[i]

            itemInfo = items[i]
            i_name = itemInfo[1]
            i_data = itemInfo[2]
            i_price = itemInfo[0]
            cursor.execute(
                q["getStockInfo"],
                [AsIs("{:02d}".format(d_id)), ol_i_id, ol_supply_w_id],
            )
            stockInfo = cursor.fetchone()
            if len(stockInfo) == 0:
                logging.warn(
                    "No STOCK record for (ol_i_id=%d, ol_supply_w_id=%d)"
                    % (ol_i_id, ol_supply_w_id)
                )
                continue
            s_quantity = stockInfo[0]
            s_ytd = stockInfo[2]
            s_order_cnt = stockInfo[3]
            s_remote_cnt = stockInfo[4]
            s_data = stockInfo[1]
            s_dist_xx = stockInfo[5]  # Fetches data from the s_dist_[d_id] column
            ## Update stock
            s_ytd += ol_quantity
            if s_quantity >= ol_quantity + 10:
                s_quantity = s_quantity - ol_quantity
            else:
                s_quantity = s_quantity + 91 - ol_quantity
            s_order_cnt += 1

            if ol_supply_w_id != w_id:
                s_remote_cnt += 1

            cursor.execute(
                q["updateStock"],
                [s_quantity, s_ytd, s_order_cnt, s_remote_cnt, ol_i_id, ol_supply_w_id],
            )
            if (
                i_data.find(constants.ORIGINAL_STRING) != -1
                and s_data.find(constants.ORIGINAL_STRING) != -1
            ):
                brand_generic = "B"
            else:
                brand_generic = "G"

            ## Transaction profile states to use "ol_quantity * i_price"
            ol_amount = ol_quantity * i_price
            total += ol_amount

            cursor.execute(
                q["createOrderLine"],
                [
                    d_next_o_id,
                    d_id,
                    w_id,
                    ol_number,
                    ol_i_id,
                    ol_supply_w_id,
                    o_entry_d,
                    ol_quantity,
                    ol_amount,
                    s_dist_xx,
                ],
            )

            ## Add the info to be returned
            item_data.append((i_name, s_quantity, brand_generic, i_price, ol_amount))
        ## FOR

        ## Commit!
        self.conn.commit()

        ## Adjust the total for the discount
        # print "c_discount:", c_discount, type(c_discount)
        # print "w_tax:", w_tax, type(w_tax)
        # print "d_tax:", d_tax, type(d_tax)
        total *= (1 - c_discount) * (1 + w_tax + d_tax)

        ## Pack up values the client is missing (see TPC-C 2.4.3.5)
        misc = [(w_tax, d_tax, d_next_o_id, total)]

        return [customer_info, misc, item_data]

    ## ----------------------------------------------
    ## doOrderStatus
    ## ----------------------------------------------
    def doOrderStatus(self, cursor, params):  # noqa
        q = TXN_QUERIES["ORDER_STATUS"]

        w_id = params["w_id"]
        d_id = params["d_id"]
        c_id = params["c_id"]
        c_last = params["c_last"]

        assert w_id, pformat(params)  # nosec
        assert d_id, pformat(params)  # nosec

        if c_id != None:
            cursor.execute(q["getCustomerByCustomerId"], [w_id, d_id, c_id])
            customer = cursor.fetchone()
        else:
            # Get the midpoint customer's id
            cursor.execute(q["getCustomersByLastName"], [w_id, d_id, c_last])
            all_customers = cursor.fetchall()
            assert len(all_customers) > 0  # nosec
            namecnt = len(all_customers)
            index = int((namecnt - 1) / 2)
            customer = all_customers[index]
            c_id = customer[0]
        assert len(customer) > 0  # nosec
        assert c_id != None  # nosec

        cursor.execute(q["getLastOrder"], [w_id, d_id, c_id])
        order = cursor.fetchone()
        if order:
            cursor.execute(q["getOrderLines"], [w_id, d_id, order[0]])
            orderLines = cursor.fetchall()
        else:
            orderLines = []

        self.conn.commit()
        return [customer, order, orderLines]

    ## ----------------------------------------------
    ## doPayment
    ## ----------------------------------------------
    def doPayment(self, cursor, params):  # noqa
        q = TXN_QUERIES["PAYMENT"]

        w_id = params["w_id"]
        d_id = params["d_id"]
        h_amount = params["h_amount"]
        c_w_id = params["c_w_id"]
        c_d_id = params["c_d_id"]
        c_id = params["c_id"]
        c_last = params["c_last"]
        h_date = params["h_date"]

        if c_id != None:
            cursor.execute(q["getCustomerByCustomerId"], [w_id, d_id, c_id])
            customer = cursor.fetchone()
        else:
            # Get the midpoint customer's id
            cursor.execute(q["getCustomersByLastName"], [w_id, d_id, c_last])
            all_customers = cursor.fetchall()
            assert len(all_customers) > 0  # nosec
            namecnt = len(all_customers)
            index = int((namecnt - 1) / 2)
            customer = all_customers[index]
            c_id = customer[0]
        assert len(customer) > 0  # nosec
        c_balance = customer[14] - h_amount
        c_ytd_payment = customer[15] + h_amount
        c_payment_cnt = customer[16] + 1
        c_data = customer[17]

        cursor.execute(q["getWarehouse"], [w_id])
        warehouse = cursor.fetchone()

        cursor.execute(q["getDistrict"], [w_id, d_id])
        district = cursor.fetchone()

        cursor.execute(q["updateWarehouseBalance"], [h_amount, w_id])
        cursor.execute(q["updateDistrictBalance"], [h_amount, w_id, d_id])

        # Customer Credit Information
        if customer[11] == constants.BAD_CREDIT:
            newData = " ".join(map(str, [c_id, c_d_id, c_w_id, d_id, w_id, h_amount]))
            c_data = newData + "|" + c_data
            if len(c_data) > constants.MAX_C_DATA:
                c_data = c_data[: constants.MAX_C_DATA]
            cursor.execute(
                q["updateBCCustomer"],
                [c_balance, c_ytd_payment, c_payment_cnt, c_data, c_w_id, c_d_id, c_id],
            )
        else:
            c_data = ""
            cursor.execute(
                q["updateGCCustomer"],
                [c_balance, c_ytd_payment, c_payment_cnt, c_w_id, c_d_id, c_id],
            )

        # Concatenate w_name, four spaces, d_name
        h_data = "%s    %s" % (warehouse[0], district[0])
        # Create the history record
        cursor.execute(
            q["insertHistory"],
            [c_id, c_d_id, c_w_id, d_id, w_id, h_date, h_amount, h_data],
        )

        self.conn.commit()

        # TPC-C 2.5.3.3: Must display the following fields:
        # W_ID, D_ID, C_ID, C_D_ID, C_W_ID, W_STREET_1, W_STREET_2, W_CITY, W_STATE, W_ZIP,
        # D_STREET_1, D_STREET_2, D_CITY, D_STATE, D_ZIP, C_FIRST, C_MIDDLE, C_LAST, C_STREET_1,
        # C_STREET_2, C_CITY, C_STATE, C_ZIP, C_PHONE, C_SINCE, C_CREDIT, C_CREDIT_LIM,
        # C_DISCOUNT, C_BALANCE, the first 200 characters of C_DATA (only if C_CREDIT = "BC"),
        # H_AMOUNT, and H_DATE.

        # Hand back all the warehouse, district, and customer data
        return [warehouse, district, customer]

    ## ----------------------------------------------
    ## doStockLevel
    ## ----------------------------------------------
    def doStockLevel(self, cursor, params):  # noqa
        q = TXN_QUERIES["STOCK_LEVEL"]

        w_id = params["w_id"]
        d_id = params["d_id"]
        threshold = params["threshold"]

        cursor.execute(q["getOId"], [w_id, d_id])
        result = cursor.fetchone()
        assert result  # nosec
        o_id = result[0]

        cursor.execute(
            q["getStockCount"], [w_id, d_id, o_id, (o_id - 20), w_id, threshold]
        )

        result = cursor.fetchone()

        self.conn.commit()

        return int(result[0])
