# noqa
# type: ignore
# flake8: noqa

from . import rand


def makeForLoad():  # noqa
    """Create random NURand constants, appropriate for loading the database."""
    cLast = rand.number(0, 255)
    cId = rand.number(0, 1023)
    orderLineItemId = rand.number(0, 8191)
    return NURandC(cLast, cId, orderLineItemId)


def validCRun(cRun, cLoad):  # noqa
    """Returns true if the cRun value is valid for running. See TPC-C 2.1.6.1 (page 20)"""
    cDelta = abs(cRun - cLoad)
    return 65 <= cDelta and cDelta <= 119 and cDelta != 96 and cDelta != 112


def makeForRun(loadC):  # noqa
    """Create random NURand constants for running TPC-C. TPC-C 2.1.6.1. (page 20) specifies the valid range for these constants."""
    cRun = rand.number(0, 255)
    while validCRun(cRun, loadC.cLast) == False:
        cRun = rand.number(0, 255)
    assert validCRun(cRun, loadC.cLast)  # nosec

    cId = rand.number(0, 1023)
    orderLineItemId = rand.number(0, 8191)
    return NURandC(cRun, cId, orderLineItemId)


class NURandC:  # noqa
    def __init__(self, cLast, cId, orderLineItemId):  # noqa
        self.cLast = cLast
        self.cId = cId
        self.orderLineItemId = orderLineItemId
