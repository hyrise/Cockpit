SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'ASIA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'ASIA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'ASIA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'ASIA'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'ASIA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1, supplier_tpch_0_1, nation_tpch_0_1, region_tpch_0_1
WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nation_tpch_0_1key = s_nation_tpch_0_1key
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_region_tpch_0_1key = r_region_tpch_0_1key
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;
