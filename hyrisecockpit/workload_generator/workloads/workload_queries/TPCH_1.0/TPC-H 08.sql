SELECT o_year, SUM(case when nation = 'SAUDI ARABIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL BURNISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ALGERIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM PLATED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ARGENTINA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL PLATED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'EGYPT' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD PLATED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ROMANIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO BURNISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ALGERIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO BRUSHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'PERU' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE BRUSHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'IRAQ' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO BURNISHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'UNITED STATES' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE BRUSHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'BRAZIL' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM PLATED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'MOROCCO' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD BRUSHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ETHIOPIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM BRUSHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'INDIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM PLATED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'KENYA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO ANODIZED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'JORDAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM POLISHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'JAPAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL BRUSHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'BRAZIL' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO POLISHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'BRAZIL' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM ANODIZED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'INDIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY POLISHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'SAUDI ARABIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY POLISHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'RUSSIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL PLATED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'PERU' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM PLATED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'EGYPT' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY ANODIZED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'VIETNAM' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE PLATED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ETHIOPIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO BURNISHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'RUSSIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD ANODIZED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ROMANIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE ANODIZED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'UNITED KINGDOM' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL BRUSHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'JAPAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL ANODIZED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'IRAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD ANODIZED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'FRANCE' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY BRUSHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'INDIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE ANODIZED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'IRAQ' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE PLATED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'EGYPT' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO ANODIZED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'BRAZIL' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE BURNISHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'INDONESIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD POLISHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'GERMANY' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY POLISHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'RUSSIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY POLISHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ALGERIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO POLISHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'EGYPT' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO BRUSHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'INDIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD POLISHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'BRAZIL' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM ANODIZED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'EGYPT' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE BRUSHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'UNITED KINGDOM' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE BURNISHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'INDONESIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY BURNISHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'GERMANY' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM BURNISHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'JORDAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY ANODIZED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'JORDAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM BURNISHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'EGYPT' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM PLATED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'MOZAMBIQUE' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL POLISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ARGENTINA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY BRUSHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'JAPAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD ANODIZED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'UNITED STATES' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM PLATED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'SAUDI ARABIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM POLISHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'IRAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY PLATED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ETHIOPIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD ANODIZED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'JORDAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY PLATED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'MOROCCO' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY POLISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'CHINA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL POLISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'KENYA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO BURNISHED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'GERMANY' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD PLATED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'EGYPT' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD BURNISHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'MOROCCO' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY ANODIZED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ETHIOPIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO ANODIZED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ETHIOPIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE POLISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'FRANCE' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL POLISHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ROMANIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM PLATED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'FRANCE' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM BRUSHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'MOROCCO' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD PLATED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'IRAQ' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE PLATED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'VIETNAM' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY BRUSHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'UNITED STATES' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD POLISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'PERU' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM BRUSHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ALGERIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE PLATED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'CHINA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL ANODIZED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'RUSSIA' then volume else 0 end) / SUM(volume) as mkt_share
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
     AND '1996-12-31' AND p_type = 'PROMO ANODIZED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'RUSSIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD BRUSHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'MOROCCO' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD BURNISHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'CHINA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'ECONOMY BRUSHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ROMANIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO BRUSHED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'JAPAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM ANODIZED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'SAUDI ARABIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM PLATED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'CHINA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'ASIA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE POLISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ROMANIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM BURNISHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'RUSSIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO PLATED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'RUSSIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE ANODIZED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'SAUDI ARABIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE ANODIZED NICKEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'UNITED STATES' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO ANODIZED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'EGYPT' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE BRUSHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'IRAQ' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD BRUSHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ROMANIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL ANODIZED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'UNITED KINGDOM' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'LARGE PLATED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'MOROCCO' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AFRICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO BRUSHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'IRAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL BRUSHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'JORDAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO PLATED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'JORDAN' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'MEDIUM BRUSHED TIN') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'ROMANIA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'EUROPE' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'SMALL PLATED STEEL') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'CANADA' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'AMERICA' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'STANDARD POLISHED BRASS') as all_nations GROUP BY o_year ORDER BY o_year;
SELECT o_year, SUM(case when nation = 'IRAQ' then volume else 0 end) / SUM(volume) as mkt_share
     FROM (SELECT SUBSTR(o_orderdate, 1, 4) as o_year, l_extendedprice * (1-l_discount) as volume,
     n2.n_name as nation FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
     WHERE p_partkey = l_partkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND
     o_custkey = c_custkey AND c_nationkey = n1.n_nationkey AND n1.n_regionkey = r_regionkey AND
     r_name = 'MIDDLE EAST' AND s_nationkey = n2.n_nationkey AND o_orderdate between '1995-01-01'
     AND '1996-12-31' AND p_type = 'PROMO BRUSHED COPPER') as all_nations GROUP BY o_year ORDER BY o_year;
