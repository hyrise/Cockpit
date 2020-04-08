SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'IRAQ'
											AND n2.n_name = 'UNITED STATES')
										OR (n1.n_name = 'UNITED STATES'
														AND n2.n_name = 'IRAQ'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'MOROCCO'
											AND n2.n_name = 'PERU')
										OR (n1.n_name = 'PERU'
														AND n2.n_name = 'MOROCCO'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'IRAN'
											AND n2.n_name = 'VIETNAM')
										OR (n1.n_name = 'VIETNAM'
														AND n2.n_name = 'IRAN'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'IRAN'
											AND n2.n_name = 'VIETNAM')
										OR (n1.n_name = 'VIETNAM'
														AND n2.n_name = 'IRAN'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'ROMANIA'
											AND n2.n_name = 'UNITED STATES')
										OR (n1.n_name = 'UNITED STATES'
														AND n2.n_name = 'ROMANIA'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'ARGENTINA'
											AND n2.n_name = 'CHINA')
										OR (n1.n_name = 'CHINA'
														AND n2.n_name = 'ARGENTINA'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'BRAZIL'
											AND n2.n_name = 'CHINA')
										OR (n1.n_name = 'CHINA'
														AND n2.n_name = 'BRAZIL'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'IRAN'
											AND n2.n_name = 'SAUDI ARABIA')
										OR (n1.n_name = 'SAUDI ARABIA'
														AND n2.n_name = 'IRAN'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'JORDAN'
											AND n2.n_name = 'ARGENTINA')
										OR (n1.n_name = 'ARGENTINA'
														AND n2.n_name = 'JORDAN'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'VIETNAM'
											AND n2.n_name = 'ROMANIA')
										OR (n1.n_name = 'ROMANIA'
														AND n2.n_name = 'VIETNAM'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'ARGENTINA'
											AND n2.n_name = 'VIETNAM')
										OR (n1.n_name = 'VIETNAM'
														AND n2.n_name = 'ARGENTINA'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'UNITED STATES'
											AND n2.n_name = 'ALGERIA')
										OR (n1.n_name = 'ALGERIA'
														AND n2.n_name = 'UNITED STATES'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'ROMANIA'
											AND n2.n_name = 'KENYA')
										OR (n1.n_name = 'KENYA'
														AND n2.n_name = 'ROMANIA'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'JORDAN'
											AND n2.n_name = 'KENYA')
										OR (n1.n_name = 'KENYA'
														AND n2.n_name = 'JORDAN'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'GERMANY'
											AND n2.n_name = 'MOROCCO')
										OR (n1.n_name = 'MOROCCO'
														AND n2.n_name = 'GERMANY'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'INDONESIA'
											AND n2.n_name = 'MOZAMBIQUE')
										OR (n1.n_name = 'MOZAMBIQUE'
														AND n2.n_name = 'INDONESIA'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'VIETNAM'
											AND n2.n_name = 'ARGENTINA')
										OR (n1.n_name = 'ARGENTINA'
														AND n2.n_name = 'VIETNAM'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'UNITED STATES'
											AND n2.n_name = 'EGYPT')
										OR (n1.n_name = 'EGYPT'
														AND n2.n_name = 'UNITED STATES'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'CHINA'
											AND n2.n_name = 'IRAN')
										OR (n1.n_name = 'IRAN'
														AND n2.n_name = 'CHINA'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'ALGERIA'
											AND n2.n_name = 'PERU')
										OR (n1.n_name = 'PERU'
														AND n2.n_name = 'ALGERIA'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'IRAQ'
											AND n2.n_name = 'ALGERIA')
										OR (n1.n_name = 'ALGERIA'
														AND n2.n_name = 'IRAQ'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'UNITED KINGDOM'
											AND n2.n_name = 'PERU')
										OR (n1.n_name = 'PERU'
														AND n2.n_name = 'UNITED KINGDOM'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'IRAN'
											AND n2.n_name = 'CHINA')
										OR (n1.n_name = 'CHINA'
														AND n2.n_name = 'IRAN'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'INDIA'
											AND n2.n_name = 'BRAZIL')
										OR (n1.n_name = 'BRAZIL'
														AND n2.n_name = 'INDIA'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'FRANCE'
											AND n2.n_name = 'ARGENTINA')
										OR (n1.n_name = 'ARGENTINA'
														AND n2.n_name = 'FRANCE'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'ROMANIA'
											AND n2.n_name = 'CHINA')
										OR (n1.n_name = 'CHINA'
														AND n2.n_name = 'ROMANIA'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'PERU'
											AND n2.n_name = 'ETHIOPIA')
										OR (n1.n_name = 'ETHIOPIA'
														AND n2.n_name = 'PERU'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'JAPAN'
											AND n2.n_name = 'ARGENTINA')
										OR (n1.n_name = 'ARGENTINA'
														AND n2.n_name = 'JAPAN'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'UNITED STATES'
											AND n2.n_name = 'JAPAN')
										OR (n1.n_name = 'JAPAN'
														AND n2.n_name = 'UNITED STATES'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'VIETNAM'
											AND n2.n_name = 'ARGENTINA')
										OR (n1.n_name = 'ARGENTINA'
														AND n2.n_name = 'VIETNAM'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'FRANCE'
											AND n2.n_name = 'MOZAMBIQUE')
										OR (n1.n_name = 'MOZAMBIQUE'
														AND n2.n_name = 'FRANCE'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'CHINA'
											AND n2.n_name = 'ALGERIA')
										OR (n1.n_name = 'ALGERIA'
														AND n2.n_name = 'CHINA'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'ALGERIA'
											AND n2.n_name = 'CANADA')
										OR (n1.n_name = 'CANADA'
														AND n2.n_name = 'ALGERIA'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;

---

SELECT supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year, SUM(volume) AS revenue
FROM
		(SELECT n1.n_name AS supp_nation_tpch_0_1, n2.n_name AS cust_nation_tpch_0_1, SUBSTR(l_shipdate,
																																																																1, 4) AS l_year,
				l_extendedprice * (1 - l_discount) AS volume
			FROM supplier_tpch_0_1, lineitem_tpch_0_1, orders_tpch_0_1, customer_tpch_0_1, nation_tpch_0_1 n1, nation_tpch_0_1 n2
			WHERE s_suppkey = l_suppkey
					AND o_orderkey = l_orderkey
					AND c_custkey = o_custkey
					AND s_nation_tpch_0_1key = n1.n_nation_tpch_0_1key
					AND c_nation_tpch_0_1key = n2.n_nation_tpch_0_1key
					AND ((n1.n_name = 'UNITED STATES'
											AND n2.n_name = 'ALGERIA')
										OR (n1.n_name = 'ALGERIA'
														AND n2.n_name = 'UNITED STATES'))
					AND l_shipdate BETWEEN '1995-01-01' AND '1996-12-31' ) AS shipping
GROUP BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year
ORDER BY supp_nation_tpch_0_1, cust_nation_tpch_0_1, l_year;
