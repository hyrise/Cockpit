# noqa
# type: ignore
# flake8: noqa

import random

from . import nurand

SYLLABLES = [
    "BAR",
    "OUGHT",
    "ABLE",
    "PRI",
    "PRES",
    "ESE",
    "ANTI",
    "CALLY",
    "ATION",
    "EING",
]

nurandVar = None  # NURand


def setNURand(nu):  # noqa
    global nurandVar
    nurandVar = nu


## DEF


def NURand(a, x, y):  # noqa
    """A non-uniform random number, as defined by TPC-C 2.1.6. (page 20)."""
    global nurandVar
    assert x <= y  # nosec
    if nurandVar is None:
        setNURand(nurand.makeForLoad())

    if a == 255:
        c = nurandVar.cLast
    elif a == 1023:
        c = nurandVar.cId
    elif a == 8191:
        c = nurandVar.orderLineItemId
    else:
        raise Exception("a = " + a + " is not a supported value")

    return (((number(0, a) | number(x, y)) + c) % (y - x + 1)) + x


## DEF


def number(minimum, maximum):  # noqa
    value = random.randint(minimum, maximum)  # nosec
    assert minimum <= value and value <= maximum  # nosec
    return value


## DEF


def numberExcluding(minimum, maximum, excluding):  # noqa
    """An in the range [minimum, maximum], excluding excluding."""
    assert minimum < maximum  # nosec
    assert minimum <= excluding and excluding <= maximum  # nosec

    ## Generate 1 less number than the range
    num = number(minimum, maximum - 1)

    ## Adjust the numbers to remove excluding
    if num >= excluding:
        num += 1
    assert minimum <= num and num <= maximum and num != excluding  # nosec
    return num


## DEF


def fixedPoint(decimal_places, minimum, maximum):  # noqa
    assert decimal_places > 0  # nosec
    assert minimum < maximum  # nosec

    multiplier = 1
    for i in range(0, decimal_places):
        multiplier *= 10

    int_min = int(minimum * multiplier + 0.5)
    int_max = int(maximum * multiplier + 0.5)

    return float(number(int_min, int_max) / float(multiplier))


## DEF


def selectUniqueIds(numUnique, minimum, maximum):  # noqa
    rows = set()
    for i in range(0, numUnique):
        index = None
        while index == None or index in rows:
            index = number(minimum, maximum)
        ## WHILE
        rows.add(index)
    ## FOR
    assert len(rows) == numUnique  # nosec
    return rows


## DEF


def astring(minimum_length, maximum_length):  # noqa
    """A random alphabetic string with length in range [minimum_length, maximum_length]."""
    return randomString(minimum_length, maximum_length, "a", 26)


## DEF


def nstring(minimum_length, maximum_length):  # noqa
    """A random numeric string with length in range [minimum_length, maximum_length]."""
    return randomString(minimum_length, maximum_length, "0", 10)


## DEF


def randomString(minimum_length, maximum_length, base, numCharacters):  # noqa
    length = number(minimum_length, maximum_length)
    baseByte = ord(base)
    string = ""
    for i in range(length):
        string += chr(baseByte + number(0, numCharacters - 1))
    return string


## DEF


def makeLastName(number):  # noqa
    """A last name as defined by TPC-C 4.3.2.3. Not actually random."""
    global SYLLABLES
    assert 0 <= number and number <= 999  # nosec
    indicies = [number / 100, (number / 10) % 10, number % 10]
    return "".join(map(lambda x: SYLLABLES[x], indicies))


## DEF


def makeRandomLastName(maxCID):  # noqa
    """A non-uniform random last name, as defined by TPC-C 4.3.2.3. The name will be limited to maxCID."""
    min_cid = 999
    if (maxCID - 1) < min_cid:
        min_cid = maxCID - 1
    return makeLastName(NURand(255, 0, min_cid))


## DEF
