SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1996-01-01'
		AND o_orderdate < '1997-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1995-01-01'
		AND o_orderdate < '1996-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND o_orderdate >= '1997-01-01'
		AND o_orderdate < '1998-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND o_orderdate >= '1994-01-01'
		AND o_orderdate < '1995-01-01'
GROUP BY n_name
ORDER BY revenue DESC;

---

SELECT n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 WHERE c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND l_suppkey = s_suppkey
		AND c_nationkey = s_nationkey
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND o_orderdate >= '1993-01-01'
		AND o_orderdate < '1994-01-01'
GROUP BY n_name
ORDER BY revenue DESC;
