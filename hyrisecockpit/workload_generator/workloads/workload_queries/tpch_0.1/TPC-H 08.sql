SELECT o_year, SUM(CASE
																							WHEN nation = 'MOZAMBIQUE' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM POLISHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'KENYA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD BRUSHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'FRANCE' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY POLISHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'IRAQ' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY BRUSHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'VIETNAM' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO POLISHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'ROMANIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY PLATED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'FRANCE' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
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
																							WHEN nation = 'ARGENTINA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
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
																							WHEN nation = 'ETHIOPIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD ANODIZED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'PERU' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE ANODIZED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'GERMANY' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
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

SELECT o_year, SUM(CASE
																							WHEN nation = 'IRAQ' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE PLATED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'CANADA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL BRUSHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'VIETNAM' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL POLISHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'FRANCE' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
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
																							WHEN nation = 'GERMANY' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE BRUSHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'CANADA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY POLISHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'ALGERIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY POLISHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'CHINA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE BURNISHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'INDONESIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'ASIA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'SMALL BURNISHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'BRAZIL' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AMERICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE PLATED TIN') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'KENYA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'MEDIUM POLISHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'JORDAN' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE BURNISHED NICKEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'MOZAMBIQUE' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY BURNISHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'IRAQ' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'MIDDLE EAST'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'ECONOMY POLISHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'INDIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
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
																							WHEN nation = 'MOROCCO' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'AFRICA'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'LARGE BURNISHED STEEL') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'ROMANIA' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'PROMO BRUSHED BRASS') AS all_nations
GROUP BY o_year
ORDER BY o_year;

---

SELECT o_year, SUM(CASE
																							WHEN nation = 'FRANCE' THEN volume
																							ELSE 0
																			END) / SUM(volume) AS mkt_share
FROM
		(SELECT SUBSTR(o_orderdate, 1, 4) AS o_year, l_extendedprice * (1 - l_discount) AS volume, n2.n_name AS nation
			FROM part, supplier, lineitem, orders, customer, nation n1, nation n2, region
			WHERE p_partkey = l_partkey
					AND s_suppkey = l_suppkey
					AND l_orderkey = o_orderkey
					AND o_custkey = c_custkey
					AND c_nationkey = n1.n_nationkey
					AND n1.n_regionkey = r_regionkey
					AND r_name = 'EUROPE'
					AND s_nationkey = n2.n_nationkey
					AND o_orderdate BETWEEN '1995-01-01' AND '1996-12-31'
					AND p_type = 'STANDARD BURNISHED COPPER') AS all_nations
GROUP BY o_year
ORDER BY o_year;
