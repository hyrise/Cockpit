"""Module for generating mixed workload."""

from random import choices
from secrets import randbelow
from typing import Any, List, Tuple

__simple_query = """SELECT * FROM nation WHERE n_nationkey = (%s);"""
__difficult_query_1 = """SELECT
            l_returnflag,
            l_linestatus,
            SUM(l_quantity) as sum_qty,
            SUM(l_extendedprice) as sum_base_price,
            SUM(l_extendedprice*(1.0-l_discount)) as sum_disc_price,
            SUM(l_extendedprice*(1.0-l_discount)*(1.0+l_tax)) as sum_charge,
            AVG(l_quantity) as avg_qty, AVG(l_extendedprice) as avg_price,
            AVG(l_discount) as avg_disc, COUNT(*) as count_order
            FROM lineitem
            WHERE l_shipdate <= '1998-12-01'
            GROUP BY l_returnflag, l_linestatus
            ORDER BY l_returnflag, l_linestatus;"""
__difficult_query_2 = """SELECT
            sum(l_extendedprice*l_discount) AS REVENUE
            FROM lineitem
            WHERE l_shipdate >= '1994-01-01'
                AND l_shipdate < '1995-01-01'
                AND l_discount BETWEEN .05
                AND .07 AND l_quantity < 24.0;"""


def generate_mixed(
    factor: int, weights: Tuple[int, int, int] = (1, 1, 100)
) -> List[Tuple[str, Any]]:
    """Generate a mixed workload of three different queries."""
    queries = choices(
        [
            (__difficult_query_1, None,),
            (__difficult_query_2, None,),
            (__simple_query, (randbelow(24),)),
        ],
        weights=weights,
        k=factor,
    )

    return queries
