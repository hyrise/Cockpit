"""Module for query templates."""

# -----------------------------------------------------------------------
# Title: py-tpcc source code
# Date: 22 July 2020
# Last commit: e62144ca3809054
# Availability: https://github.com/apavlo/py-tpcc
# -----------------------------------------------------------------------

TXN_QUERIES = {
    "DELIVERY": {
        "getNewOrder": "SELECT NO_O_ID FROM new_order_tpcc_[SF] WHERE NO_D_ID = %s AND NO_W_ID = %s AND NO_O_ID > -1 LIMIT 1",  #
        "deleteNewOrder": "DELETE FROM new_order_tpcc_[SF] WHERE NO_D_ID = %s AND NO_W_ID = %s AND NO_O_ID = %s",  # d_id, w_id, no_o_id
        "getCId": "SELECT O_C_ID FROM order_tpcc_[SF] WHERE O_ID = %s AND O_D_ID = %s AND O_W_ID = %s",  # no_o_id, d_id, w_id
        "updateOrders": "UPDATE order_tpcc_[SF] SET O_CARRIER_ID = %s WHERE O_ID = %s AND O_D_ID = %s AND O_W_ID = %s",  # o_carrier_id, no_o_id, d_id, w_id
        "updateOrderLine": "UPDATE order_line_tpcc_[SF] SET OL_DELIVERY_D = %s WHERE OL_O_ID = %s AND OL_D_ID = %s AND OL_W_ID = %s",  # o_entry_d, no_o_id, d_id, w_id
        "sumOLAmount": "SELECT SUM(OL_AMOUNT) FROM order_line_tpcc_[SF] WHERE OL_O_ID = %s AND OL_D_ID = %s AND OL_W_ID = %s",  # no_o_id, d_id, w_id
        "updateCustomer": "UPDATE customer_tpcc_[SF] SET C_BALANCE = C_BALANCE + %s WHERE C_ID = %s AND C_D_ID = %s AND C_W_ID = %s",  # ol_total, c_id, d_id, w_id
    },
    "NEW_ORDER": {
        "getWarehouseTaxRate": "SELECT W_TAX FROM warehouse_tpcc_[SF] WHERE W_ID = %s",  # w_id
        "getDistrict": "SELECT D_TAX, D_NEXT_O_ID FROM district_tpcc_[SF] WHERE D_ID = %s AND D_W_ID = %s",  # d_id, w_id
        "incrementNextOrderId": "UPDATE district_tpcc_[SF] SET D_NEXT_O_ID = %s WHERE D_ID = %s AND D_W_ID = %s",  # d_next_o_id, d_id, w_id
        "getCustomer": "SELECT C_DISCOUNT, C_LAST, C_CREDIT FROM customer_tpcc_[SF] WHERE C_W_ID = %s AND C_D_ID = %s AND C_ID = %s",  # w_id, d_id, c_id
        "createOrder": "INSERT INTO order_tpcc_[SF] (O_ID, O_D_ID, O_W_ID, O_C_ID, O_ENTRY_D, O_CARRIER_ID, O_OL_CNT, O_ALL_LOCAL) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",  # d_next_o_id, d_id, w_id, c_id, o_entry_d, o_carrier_id, o_ol_cnt, o_all_local
        "createNewOrder": "INSERT INTO new_order_tpcc_[SF] (NO_O_ID, NO_D_ID, NO_W_ID) VALUES (%s, %s, %s)",  # o_id, d_id, w_id
        "getItemInfo": "SELECT I_PRICE, I_NAME, I_DATA FROM item_tpcc_[SF] WHERE I_ID = %s",  # ol_i_id
        "getStockInfo": "SELECT S_QUANTITY, S_DATA, S_YTD, S_ORDER_CNT, S_REMOTE_CNT, S_DIST_%s FROM stock_tpcc_[SF] WHERE S_I_ID = %s AND S_W_ID = %s",  # d_id, ol_i_id, ol_supply_w_id
        "updateStock": "UPDATE stock_tpcc_[SF] SET S_QUANTITY = %s, S_YTD = %s, S_ORDER_CNT = %s, S_REMOTE_CNT = %s WHERE S_I_ID = %s AND S_W_ID = %s",  # s_quantity, s_order_cnt, s_remote_cnt, ol_i_id, ol_supply_w_id
        "createOrderLine": "INSERT INTO order_line_tpcc_[SF] (OL_O_ID, OL_D_ID, OL_W_ID, OL_NUMBER, OL_I_ID, OL_SUPPLY_W_ID, OL_DELIVERY_D, OL_QUANTITY, OL_AMOUNT, OL_DIST_INFO) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",  # o_id, d_id, w_id, ol_number, ol_i_id, ol_supply_w_id, ol_quantity, ol_amount, ol_dist_info
    },
    "ORDER_STATUS": {
        "getCustomerByCustomerId": "SELECT C_ID, C_FIRST, C_MIDDLE, C_LAST, C_BALANCE FROM customer_tpcc_[SF] WHERE C_W_ID = %s AND C_D_ID = %s AND C_ID = %s",  # w_id, d_id, c_id
        "getCustomersByLastName": "SELECT C_ID, C_FIRST, C_MIDDLE, C_LAST, C_BALANCE FROM customer_tpcc_[SF] WHERE C_W_ID = %s AND C_D_ID = %s AND C_LAST = %s ORDER BY C_FIRST",  # w_id, d_id, c_last
        "getLastOrder": "SELECT O_ID, O_CARRIER_ID, O_ENTRY_D FROM order_tpcc_[SF] WHERE O_W_ID = %s AND O_D_ID = %s AND O_C_ID = %s ORDER BY O_ID DESC LIMIT 1",  # w_id, d_id, c_id
        "getOrderLines": "SELECT OL_SUPPLY_W_ID, OL_I_ID, OL_QUANTITY, OL_AMOUNT, OL_DELIVERY_D FROM order_line_tpcc_[SF] WHERE OL_W_ID = %s AND OL_D_ID = %s AND OL_O_ID = %s",  # w_id, d_id, o_id
    },
    "PAYMENT": {
        "getWarehouse": "SELECT W_NAME, W_STREET_1, W_STREET_2, W_CITY, W_STATE, W_ZIP FROM warehouse_tpcc_[SF] WHERE W_ID = %s",  # w_id
        "updateWarehouseBalance": "UPDATE warehouse_tpcc_[SF] SET W_YTD = W_YTD + %s WHERE W_ID = %s",  # h_amount, w_id
        "getDistrict": "SELECT D_NAME, D_STREET_1, D_STREET_2, D_CITY, D_STATE, D_ZIP FROM district_tpcc_[SF] WHERE D_W_ID = %s AND D_ID = %s",  # w_id, d_id
        "updateDistrictBalance": "UPDATE district_tpcc_[SF] SET D_YTD = D_YTD + %s WHERE D_W_ID  = %s AND D_ID = %s",  # h_amount, d_w_id, d_id
        "getCustomerByCustomerId": "SELECT C_ID, C_FIRST, C_MIDDLE, C_LAST, C_STREET_1, C_STREET_2, C_CITY, C_STATE, C_ZIP, C_PHONE, C_SINCE, C_CREDIT, C_CREDIT_LIM, C_DISCOUNT, C_BALANCE, C_YTD_PAYMENT, C_PAYMENT_CNT, C_DATA FROM customer_tpcc_[SF] WHERE C_W_ID = %s AND C_D_ID = %s AND C_ID = %s",  # w_id, d_id, c_id
        "getCustomersByLastName": "SELECT C_ID, C_FIRST, C_MIDDLE, C_LAST, C_STREET_1, C_STREET_2, C_CITY, C_STATE, C_ZIP, C_PHONE, C_SINCE, C_CREDIT, C_CREDIT_LIM, C_DISCOUNT, C_BALANCE, C_YTD_PAYMENT, C_PAYMENT_CNT, C_DATA FROM customer_tpcc_[SF] WHERE C_W_ID = %s AND C_D_ID = %s AND C_LAST = %s ORDER BY C_FIRST",  # w_id, d_id, c_last
        "updateBCCustomer": "UPDATE customer_tpcc_[SF] SET C_BALANCE = %s, C_YTD_PAYMENT = %s, C_PAYMENT_CNT = %s, C_DATA = %s WHERE C_W_ID = %s AND C_D_ID = %s AND C_ID = %s",  # c_balance, c_ytd_payment, c_payment_cnt, c_data, c_w_id, c_d_id, c_id
        "updateGCCustomer": "UPDATE customer_tpcc_[SF] SET C_BALANCE = %s, C_YTD_PAYMENT = %s, C_PAYMENT_CNT = %s WHERE C_W_ID = %s AND C_D_ID = %s AND C_ID = %s",  # c_balance, c_ytd_payment, c_payment_cnt, c_w_id, c_d_id, c_id
        "insertHistory": "INSERT INTO history_tpcc_[SF] VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
    },
    "STOCK_LEVEL": {
        "getOId": "SELECT D_NEXT_O_ID FROM district_tpcc_[SF] WHERE D_W_ID = %s AND D_ID = %s",
        "getStockCount": """
            SELECT COUNT(DISTINCT(OL_I_ID)) FROM order_line_tpcc_[SF], stock_tpcc_[SF]
            WHERE OL_W_ID = %s
              AND OL_D_ID = %s
              AND OL_O_ID < %s
              AND OL_O_ID >= %s
              AND S_W_ID = %s
              AND S_I_ID = OL_I_ID
              AND S_QUANTITY < %s
        """,
    },
}


def get_queries_for_scale_factor(scalefactor):
    """Get query dictionary for a scalefactor."""
    assert scalefactor == int(  # nosec
        scalefactor
    ), "TPC-C Error: Number of the warehouses has fractional part"
    formatted_scalefactor = str(int(scalefactor))
    return {
        transaction_type: {
            query_name: query.replace("[SF]", formatted_scalefactor)
            for query_name, query in transaction_queries.items()
        }
        for transaction_type, transaction_queries in TXN_QUERIES.items()
    }
