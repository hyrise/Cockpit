SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'SAUDI ARABIA' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL BURNISHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ALGERIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM PLATED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ARGENTINA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL PLATED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'EGYPT' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD PLATED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ROMANIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO BURNISHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ALGERIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO BRUSHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'PERU' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE BRUSHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'IRAQ' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO BURNISHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'UNITED STATES' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE BRUSHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'BRAZIL' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM PLATED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'MOROCCO' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD BRUSHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ETHIOPIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM BRUSHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'INDIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM PLATED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'KENYA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO ANODIZED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'JORDAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM POLISHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'JAPAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL BRUSHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'BRAZIL' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO POLISHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'BRAZIL' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM ANODIZED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'INDIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY POLISHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'SAUDI ARABIA' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY POLISHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'RUSSIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL PLATED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'PERU' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM PLATED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'EGYPT' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY ANODIZED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'VIETNAM' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE PLATED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ETHIOPIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO BURNISHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'RUSSIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD ANODIZED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ROMANIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE ANODIZED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'UNITED KINGDOM' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL BRUSHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'JAPAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL ANODIZED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'IRAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD ANODIZED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'FRANCE' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY BRUSHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'INDIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE ANODIZED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'IRAQ' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE PLATED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'EGYPT' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO ANODIZED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'BRAZIL' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE BURNISHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'INDONESIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD POLISHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'GERMANY' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY POLISHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'RUSSIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY POLISHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ALGERIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO POLISHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'EGYPT' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO BRUSHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'INDIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD POLISHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'BRAZIL' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM ANODIZED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'EGYPT' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE BRUSHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'UNITED KINGDOM' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE BURNISHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'INDONESIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY BURNISHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'GERMANY' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM BURNISHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'JORDAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY ANODIZED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'JORDAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM BURNISHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'EGYPT' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM PLATED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'MOZAMBIQUE' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL POLISHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ARGENTINA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY BRUSHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'JAPAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD ANODIZED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'UNITED STATES' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM PLATED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'SAUDI ARABIA' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM POLISHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'IRAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY PLATED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ETHIOPIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD ANODIZED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'JORDAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY PLATED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'MOROCCO' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY POLISHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'CHINA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL POLISHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'KENYA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO BURNISHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'GERMANY' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD PLATED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'EGYPT' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD BURNISHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'MOROCCO' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY ANODIZED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ETHIOPIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO ANODIZED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ETHIOPIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE POLISHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'FRANCE' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL POLISHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ROMANIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM PLATED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'FRANCE' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM BRUSHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'MOROCCO' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD PLATED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'IRAQ' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE PLATED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'VIETNAM' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY BRUSHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'UNITED STATES' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD POLISHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'PERU' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM BRUSHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ALGERIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE PLATED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'CHINA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL ANODIZED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'RUSSIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY BRUSHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ARGENTINA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO ANODIZED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'RUSSIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD BRUSHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'MOROCCO' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD BURNISHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'CHINA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY BRUSHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ROMANIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO BRUSHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'JAPAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM ANODIZED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'SAUDI ARABIA' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM PLATED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'CHINA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE POLISHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ROMANIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM BURNISHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'RUSSIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO PLATED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'RUSSIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE ANODIZED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'SAUDI ARABIA' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE ANODIZED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'UNITED STATES' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO ANODIZED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'EGYPT' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE BRUSHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'IRAQ' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD BRUSHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ROMANIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL ANODIZED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year,
	SUM(CASE
									WHEN nation_tpch_1 = 'UNITED KINGDOM' THEN volume
									ELSE 0
					END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE PLATED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'MOROCCO' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO BRUSHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'IRAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL BRUSHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'JORDAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO PLATED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'JORDAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM BRUSHED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'ROMANIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL PLATED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'CANADA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD POLISHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation_tpch_1 = 'IRAQ' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation_tpch_1
 			FROM part_tpch_1, supplier_tpch_1, lineitem_tpch_1, orders_tpch_1, customer_tpch_1, nation_tpch_1 n1, nation_tpch_1 n2, region_tpch_1
 			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO BRUSHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;
