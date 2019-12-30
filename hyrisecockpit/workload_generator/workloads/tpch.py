"""Module for generating TPC-H workload."""

from datetime import date, timedelta
from secrets import randbelow
from typing import List


def generate_tpch(factor: int) -> List:
    """Generate TPC-H workload."""
    querylist = []

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

    # query2 = """
    # SELECT
    # 	s_acctbal,
    # 	s_name,
    # 	n_name,
    # 	p_partkey,
    # 	p_mfgr,
    # 	s_address,
    # 	s_phone,
    # 	s_comment
    # FROM
    # 	part,
    # 	supplier,
    # 	partsupp,
    # 	nation,
    # 	region
    # 	where
    # 	p_partkey = ps_partkey
    # 	and s_suppkey = ps_suppkey
    # 	and p_size = [SIZE]
    # 	and p_type like '%[TYPE]'
    # 	and s_nationkey = n_nationkey
    # 	and n_regionkey = r_regionkey
    # 	and r_name = '[REGION]'
    # 	and ps_supplycost = (
    # 		SELECT
    # 			min(ps_supplycost)
    # 		FROM
    # 			partsupp, supplier,
    # 			nation, region
    # 		WHERE
    # 			p_partkey = ps_partkey
    # 			and s_suppkey = ps_suppkey
    # 			and s_nationkey = n_nationkey
    # 			and n_regionkey = r_regionkey
    # 			and r_name = '[REGION]'
    # 	)
    # ORDER BY
    # 	s_acctbal desc,
    # 	n_name,
    # 	s_name,
    # 	p_partkey;
    # """
    #
    # SIZE = randbelow(50) + 1
    # TYPE =
    # REGION =
    #
    # parameters2 = (SIZE, TYPE, REGION, REGION, )
    #
    # querylist.append((query2, parameters2))

    return querylist
