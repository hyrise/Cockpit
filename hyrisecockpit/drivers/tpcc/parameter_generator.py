# noqa
# type: ignore
# flake8: noqa

"""Module for TPC-C parameters generation."""
from datetime import datetime as d_datetime
from random import choices
from typing import Tuple

import hyrisecockpit.drivers.tpcc.constants as constants
from hyrisecockpit.drivers.__default__.task_types import TPCCTask
from hyrisecockpit.drivers.tpcc.util import *


class datetime:
    """Datetime object."""

    @classmethod
    def now(cls):
        """Generate current timestamp."""
        return int(d_datetime.now().timestamp())


class TPCCParameterGenerator:  # noqa
    """Generates TPC-C parameters for transactions."""

    def __init__(self, warehouses=5):  # noqa
        """Initialize a parameter generator."""
        self.apply_scalefactor(warehouses)

    def apply_scalefactor(self, warehouses):
        """Apply number of the warehouses as scalefactor."""
        self._warehouses = warehouses
        self.scaleParameters = scaleparameters.makeDefault(warehouses)

    ## DEF

    ## ----------------------------------------------
    ## generateDeliveryParams
    ## ----------------------------------------------
    def generateDeliveryParams(self):  # noqa
        """Return parameters for DELIVERY"""
        w_id = self.makeWarehouseId()
        o_carrier_id = rand.number(constants.MIN_CARRIER_ID, constants.MAX_CARRIER_ID)
        ol_delivery_d = datetime.now()
        return makeParameterDict(locals(), "w_id", "o_carrier_id", "ol_delivery_d")

    ## DEF

    ## ----------------------------------------------
    ## generateNewOrderParams
    ## ----------------------------------------------
    def generateNewOrderParams(self):  # noqa
        """Return parameters for NEW_ORDER"""
        w_id = self.makeWarehouseId()
        d_id = self.makeDistrictId()
        c_id = self.makeCustomerId()
        ol_cnt = rand.number(constants.MIN_OL_CNT, constants.MAX_OL_CNT)
        o_entry_d = datetime.now()

        ## 1% of transactions roll back
        rollback = False  # FIXME rand.number(1, 100) == 1

        i_ids = []
        i_w_ids = []
        i_qtys = []
        for i in range(0, ol_cnt):
            if rollback and i + 1 == ol_cnt:
                i_ids.append(self.scaleParameters.items + 1)
            else:
                i_id = self.makeItemId()
                while i_id in i_ids:
                    i_id = self.makeItemId()
                i_ids.append(i_id)

            ## 1% of items are from a remote warehouse
            remote = rand.number(1, 100) == 1
            if self.scaleParameters.warehouses > 1 and remote:
                i_w_ids.append(
                    rand.numberExcluding(
                        self.scaleParameters.starting_warehouse,
                        self.scaleParameters.ending_warehouse,
                        w_id,
                    )
                )
            else:
                i_w_ids.append(w_id)

            i_qtys.append(rand.number(1, constants.MAX_OL_QUANTITY))
        ## FOR

        return makeParameterDict(
            locals(), "w_id", "d_id", "c_id", "o_entry_d", "i_ids", "i_w_ids", "i_qtys"
        )

    ## DEF

    ## ----------------------------------------------
    ## generateOrderStatusParams
    ## ----------------------------------------------
    def generateOrderStatusParams(self):  # noqa
        """Return parameters for ORDER_STATUS"""
        w_id = self.makeWarehouseId()
        d_id = self.makeDistrictId()
        c_last = None
        c_id = None

        ## 60%: order status by last name
        if rand.number(1, 100) <= 60:
            c_last = rand.makeRandomLastName(self.scaleParameters.customersPerDistrict)

        ## 40%: order status by id
        else:
            c_id = self.makeCustomerId()

        return makeParameterDict(locals(), "w_id", "d_id", "c_id", "c_last")

    ## DEF

    ## ----------------------------------------------
    ## generatePaymentParams
    ## ----------------------------------------------
    def generatePaymentParams(self):  # noqa
        """Return parameters for PAYMENT"""
        x = rand.number(1, 100)
        y = rand.number(1, 100)

        w_id = self.makeWarehouseId()
        d_id = self.makeDistrictId()
        c_w_id = None
        c_d_id = None
        c_id = None
        c_last = None
        h_amount = rand.fixedPoint(2, constants.MIN_PAYMENT, constants.MAX_PAYMENT)
        h_date = datetime.now()

        ## 85%: paying through own warehouse (or there is only 1 warehouse)
        if self.scaleParameters.warehouses == 1 or x <= 85:
            c_w_id = w_id
            c_d_id = d_id
        ## 15%: paying through another warehouse:
        else:
            ## select in range [1, num_warehouses] excluding w_id
            c_w_id = rand.numberExcluding(
                self.scaleParameters.starting_warehouse,
                self.scaleParameters.ending_warehouse,
                w_id,
            )
            assert c_w_id != w_id  # nosec
            c_d_id = self.makeDistrictId()

        ## 60%: payment by last name
        if y <= 60:
            c_last = rand.makeRandomLastName(self.scaleParameters.customersPerDistrict)
        ## 40%: payment by id
        else:
            assert y > 60  # nosec
            c_id = self.makeCustomerId()

        return makeParameterDict(
            locals(),
            "w_id",
            "d_id",
            "h_amount",
            "c_w_id",
            "c_d_id",
            "c_id",
            "c_last",
            "h_date",
        )

    ## DEF

    ## ----------------------------------------------
    ## generateStockLevelParams
    ## ----------------------------------------------
    def generateStockLevelParams(self):  # noqa
        """Returns parameters for STOCK_LEVEL"""
        w_id = self.makeWarehouseId()
        d_id = self.makeDistrictId()
        threshold = rand.number(
            constants.MIN_STOCK_LEVEL_THRESHOLD, constants.MAX_STOCK_LEVEL_THRESHOLD
        )
        return makeParameterDict(locals(), "w_id", "d_id", "threshold")

    ## DEF

    def makeWarehouseId(self):  # noqa
        w_id = rand.number(
            self.scaleParameters.starting_warehouse,
            self.scaleParameters.ending_warehouse,
        )
        assert w_id >= self.scaleParameters.starting_warehouse, (  # nosec
            "Invalid W_ID: %d" % w_id
        )
        assert w_id <= self.scaleParameters.ending_warehouse, (  # nosec
            "Invalid W_ID: %d" % w_id
        )
        return w_id

    ## DEF

    def makeDistrictId(self):  # noqa
        return rand.number(1, self.scaleParameters.districtsPerWarehouse)

    ## DEF

    def makeCustomerId(self):  # noqa
        return rand.NURand(1023, 1, self.scaleParameters.customersPerDistrict)

    ## DEF

    def makeItemId(self):  # noqa
        return rand.NURand(8191, 1, self.scaleParameters.items)

    ## DEF

    def generate_transactions(self, frequency, weights) -> Tuple[int, int]:
        """Generate random transaction."""
        generated_transaction_types = choices(
            population=list(weights.keys()),
            weights=list(weights.values()),
            k=frequency,
        )

        generators = {
            "stock_level": self.generateStockLevelParams,
            "delivery": self.generateDeliveryParams,
            "order_status": self.generateOrderStatusParams,
            "payment": self.generatePaymentParams,
            "new_order": self.generateNewOrderParams,
        }

        return [
            TPCCTask(
                type="tpcc_transaction",  # TODO: do we still need it?
                args=generators[transaction_type](),
                benchmark="tpcc",
                scalefactor=self._warehouses,
                transaction_type=transaction_type,
            )
            for transaction_type in generated_transaction_types
        ]


## CLASS


def makeParameterDict(values, *args):  # noqa
    return dict(map(lambda x: (x, values[x]), args))


## DEF
