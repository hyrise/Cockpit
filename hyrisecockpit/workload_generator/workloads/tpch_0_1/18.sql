SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 314)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 314)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 315)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 314)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 313)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 312)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 312)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 315)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 315)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 314)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 315)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 314)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 315)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 314)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;

---

SELECT c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice, SUM(l_quantity)
FROM customer_tpch_0_1, orders_tpch_0_1, lineitem_tpch_0_1
 WHERE o_orderkey IN
				(SELECT l_orderkey
					FROM lineitem_tpch_0_1
 					GROUP BY l_orderkey
					HAVING SUM(l_quantity) > 314)
		AND c_custkey = o_custkey
		AND o_orderkey = l_orderkey
GROUP BY c_name, c_custkey, o_orderkey, o_orderdate, o_totalprice
ORDER BY o_totalprice DESC, o_orderdate
LIMIT 100;
