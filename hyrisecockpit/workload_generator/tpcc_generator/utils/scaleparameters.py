# noqa
# type: ignore
# flake8: noqa

import constants


def makeDefault(warehouses):  # noqa
    return ScaleParameters(
        constants.NUM_ITEMS,
        warehouses,
        constants.DISTRICTS_PER_WAREHOUSE,
        constants.CUSTOMERS_PER_DISTRICT,
        constants.INITIAL_NEW_ORDERS_PER_DISTRICT,
    )


## DEF


def makeWithScaleFactor(warehouses, scaleFactor):  # noqa
    assert scaleFactor >= 1.0  # nosec

    items = int(constants.NUM_ITEMS / scaleFactor)
    if items <= 0:
        items = 1
    districts = int(max(constants.DISTRICTS_PER_WAREHOUSE, 1))
    customers = int(max(constants.CUSTOMERS_PER_DISTRICT / scaleFactor, 1))
    newOrders = int(max(constants.INITIAL_NEW_ORDERS_PER_DISTRICT / scaleFactor, 0))

    return ScaleParameters(items, warehouses, districts, customers, newOrders)


## DEF


class ScaleParameters:  # noqa
    def __init__(
        self,
        items,
        warehouses,
        districtsPerWarehouse,
        customersPerDistrict,
        newOrdersPerDistrict,
    ):  # noqa
        assert 1 <= items and items <= constants.NUM_ITEMS  # nosec
        self.items = items
        assert warehouses > 0  # nosec
        self.warehouses = warehouses
        self.starting_warehouse = 1
        assert (  # nosec
            1 <= districtsPerWarehouse
            and districtsPerWarehouse <= constants.DISTRICTS_PER_WAREHOUSE
        )
        self.districtsPerWarehouse = districtsPerWarehouse
        assert (  # nosec
            1 <= customersPerDistrict
            and customersPerDistrict <= constants.CUSTOMERS_PER_DISTRICT
        )
        self.customersPerDistrict = customersPerDistrict
        assert (  # nosec
            0 <= newOrdersPerDistrict
            and newOrdersPerDistrict <= constants.CUSTOMERS_PER_DISTRICT
        )
        assert (  # nosec
            newOrdersPerDistrict <= constants.INITIAL_NEW_ORDERS_PER_DISTRICT
        )
        self.newOrdersPerDistrict = newOrdersPerDistrict
        self.ending_warehouse = self.warehouses + self.starting_warehouse - 1

    ## DEF

    def __str__(self):  # noqa
        out = "%d items\n" % self.items
        out += "%d warehouses\n" % self.warehouses
        out += "%d districts/warehouse\n" % self.districtsPerWarehouse
        out += "%d customers/district\n" % self.customersPerDistrict
        out += "%d initial new orders/district" % self.newOrdersPerDistrict
        return out

    ## DEF


## CLASS
