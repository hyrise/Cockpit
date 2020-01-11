SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%blush%') as profit
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
      AND s_nationkey = n_nationkey AND p_name like '%wheat%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%almond%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%bisque%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%papaya%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%coral%') as profit
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
      AND s_nationkey = n_nationkey AND p_name like '%burnished%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%midnight%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%orchid%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%frosted%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%grey%') as profit
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
      AND s_nationkey = n_nationkey AND p_name like '%black%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%thistle%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%dim%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%chartreuse%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%cornsilk%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%chocolate%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%royal%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%aquamarine%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%bisque%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%chocolate%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%metallic%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%khaki%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%tan%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%sandy%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%thistle%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%tan%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%cornflower%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%cornsilk%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%seashell%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%blanched%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%drab%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%royal%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%goldenrod%') as profit
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
      AND s_nationkey = n_nationkey AND p_name like '%honeydew%') as profit
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
      AND s_nationkey = n_nationkey AND p_name like '%firebrick%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
SELECT nation, o_year, SUM(amount) as sum_profit FROM (SELECT n_name as nation, SUBSTR(o_orderdate, 1, 4) as o_year,
      l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
      FROM part, supplier, lineitem, partsupp, orders, nation WHERE s_suppkey = l_suppkey
      AND ps_suppkey = l_suppkey AND ps_partkey = l_partkey AND p_partkey = l_partkey AND o_orderkey = l_orderkey
      AND s_nationkey = n_nationkey AND p_name like '%blush%') as profit
      GROUP BY nation, o_year ORDER BY nation, o_year DESC;
