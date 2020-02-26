SELECT o_year, SUM(case when nation = 'MOZAMBIQUE' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM POLISHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'KENYA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD BRUSHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'FRANCE' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY POLISHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'IRAQ' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY BRUSHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'VIETNAM' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO POLISHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ROMANIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY PLATED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'FRANCE' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY BRUSHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ARGENTINA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM ANODIZED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ETHIOPIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD ANODIZED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'PERU' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE ANODIZED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'GERMANY' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL ANODIZED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'IRAQ' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE PLATED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'CANADA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL BRUSHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'VIETNAM' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL POLISHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'FRANCE' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL POLISHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'GERMANY' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE BRUSHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'CANADA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY POLISHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ALGERIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY POLISHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'CHINA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE BURNISHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'INDONESIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL BURNISHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'BRAZIL' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE PLATED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'KENYA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM POLISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'JORDAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE BURNISHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'MOZAMBIQUE' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY BURNISHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'IRAQ' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY POLISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'INDIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL POLISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'MOROCCO' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE BURNISHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ROMANIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO BRUSHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'FRANCE' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD BURNISHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
