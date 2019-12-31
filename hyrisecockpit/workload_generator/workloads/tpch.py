"""Module for generating TPC-H workload."""

from datetime import date, timedelta
from secrets import choice, randbelow
from typing import Any, List, Tuple


def generate_tpch(factor: int) -> List:
    """Generate TPC-H workload."""
    querylist: List[Tuple[str, Any]] = []

    segments = [
        "AUTOMOBILE",
        "BUILDING",
        "FURNITURE",
        "MACHINERY",
        "HOUSEHOLD",
    ]  # pre-defined segment names
    r_name = [
        "AFRICA",
        "AMERICA",
        "ASIA",
        "EUROPE",
        "MIDDLE EAST",
    ]  # pre-defined region names
    syllable_3 = [
        "TIN",
        "NICKEL",
        "BRASS",
        "STEEL",
        "COPPER",
    ]  # pre-defined types from Syllable 3

    # __________TPCH 1________________

    query1 = """
    SELECT
        l_returnflag,
        l_linestatus,
        sum(l_quantity) as sum_qty,
        sum(l_extendedprice) as sum_base_price,
        sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
        sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
        avg(l_quantity) as avg_qty,
        avg(l_extendedprice) as avg_price,
        avg(l_discount) as avg_disc,
        count(*) as count_order
    FROM
        lineitem
    WHERE
        l_shipdate <= (%s)
    GROUP BY
        l_returnflag,
        l_linestatus
    ORDER BY
        l_returnflag,
        l_linestatus;
    """

    delta = timedelta(60 + randbelow(60))

    parameters1 = (str(date(1998, 12, 1) - delta),)
    querylist.append((query1, parameters1))

    # __________TPCH 2________________

    query2 = """
    SELECT
        s_acctbal,
        s_name,
        n_name,
        p_partkey,
        p_mfgr,
        s_address,
        s_phone,
        s_comment
    FROM
        part,
        supplier,
        partsupp,
        nation,
        region
    WHERE
        p_partkey = ps_partkey
        and s_suppkey = ps_suppkey
        and p_size = (%s)
        and p_type LIKE (%s)
        and s_nationkey = n_nationkey
        and n_regionkey = r_regionkey
        and r_name = (%s)
        and ps_supplycost = (
            SELECT
                min(ps_supplycost)
            FROM
                partsupp, supplier,
                nation, region
            WHERE
                p_partkey = ps_partkey
                and s_suppkey = ps_suppkey
                and s_nationkey = n_nationkey
                and n_regionkey = r_regionkey
                and r_name = (%s)
            )
      ORDER BY
        s_acctbal desc,
        n_name,
        s_name,
        p_partkey;
    """

    size = str(randbelow(50) + 1)
    type = choice(syllable_3)
    region = choice(r_name)

    parameters2 = (
        size,
        type,
        region,
        region,
    )

    querylist.append((query2, parameters2))

    # __________TPCH 3________________

    query3 = """
    SELECT
        l_orderkey,
        sum(l_extendedprice*(1-l_discount)) as revenue,
        o_shippriority
        o_orderdate,
    FROM
        customer,
        orders,
        lineitem
    WHERE
        c_mktsegment = (%s)
        and c_custkey = o_custkey
        and l_orderkey = o_orderkey
        and o_orderdate < date (%s)
        and l_shipdate > date (%s)
    GROUP BY
        l_orderkey,
        o_orderdate,
        o_shippriority
    ORDER BY
        revenue desc,
        o_orderdate;
    """

    segment = choice(segments)
    r_date = str(date(1995, 3, randbelow(31) + 1))
    parameters3 = (
        segment,
        r_date,
        r_date,
    )

    querylist.append((query3, parameters3))

    return querylist
