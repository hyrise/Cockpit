"""Module for TPC-C transactions generation."""

import hyrisecockpit.workload_generator.tpcc_generator.constants as constants
from hyrisecockpit.workload_generator.tpcc_generator.tpcc_parameter_generator import (  # type: ignore
    TPCCParameterGenerator,
)
from hyrisecockpit.workload_generator.tpcc_generator.util import rand


class TPCCTransactionGenerator:
    """Generates TPC-C transactions with given parameters."""

    def __init__(self, warehouses=10, scalefactor=1.0):  # noqa
        """Initialize a transaction generator."""
        self.parameter_generator = TPCCParameterGenerator(warehouses, scalefactor)

    def generate_random_transaction(self):
        """Select a transaction at random. The number of new order transactions executed per minute is the official "tpmC" metric. See TPC-C 5.4.2 (page 71)."""
        x = rand.number(1, 100)
        params = None
        txn = None
        if x <= 4:  # 4%
            txn, params = (
                constants.TransactionTypes.STOCK_LEVEL,
                self.parameter_generator.generateStockLevelParams(),
            )
        elif x <= 4 + 4:  # 4%
            txn, params = (
                constants.TransactionTypes.DELIVERY,
                self.parameter_generator.generateDeliveryParams(),
            )
        elif x <= 4 + 4 + 4:  # 4%
            txn, params = (
                constants.TransactionTypes.ORDER_STATUS,
                self.parameter_generator.generateOrderStatusParams(),
            )
        elif x <= 43 + 4 + 4 + 4:  # 43%
            txn, params = (
                constants.TransactionTypes.PAYMENT,
                self.parameter_generator.generatePaymentParams(),
            )
        else:  # 45%
            assert x > 100 - 45  # nosec
            txn, params = (
                constants.TransactionTypes.NEW_ORDER,
                self.parameter_generator.generateNewOrderParams(),
            )

        return (txn, params)
