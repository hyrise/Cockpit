SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%smoke%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%antique%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%rosy%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%lime%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%medium%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%tomato%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%turquoise%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%black%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%lemon%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%yellow%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%navy%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%violet%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%snow%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%orange%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%lemon%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%azure%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
