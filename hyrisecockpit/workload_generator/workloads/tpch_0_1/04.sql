SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1997-08-01'
		AND o_orderdate < '1997-11-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1994-12-01'
		AND o_orderdate < '1995-03-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1994-12-01'
		AND o_orderdate < '1995-03-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-12-01'
		AND o_orderdate < '1994-03-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-03-01'
		AND o_orderdate < '1993-06-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1994-09-01'
		AND o_orderdate < '1994-12-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1997-01-01'
		AND o_orderdate < '1997-04-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-07-01'
		AND o_orderdate < '1996-10-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1994-05-01'
		AND o_orderdate < '1994-08-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-01-01'
		AND o_orderdate < '1996-04-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1997-01-01'
		AND o_orderdate < '1997-04-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1994-09-01'
		AND o_orderdate < '1994-12-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1995-07-01'
		AND o_orderdate < '1995-10-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-07-01'
		AND o_orderdate < '1993-10-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-09-01'
		AND o_orderdate < '1993-12-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-03-01'
		AND o_orderdate < '1996-06-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-09-01'
		AND o_orderdate < '1993-12-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1997-02-01'
		AND o_orderdate < '1997-05-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1994-04-01'
		AND o_orderdate < '1994-07-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-11-01'
		AND o_orderdate < '1994-02-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-04-01'
		AND o_orderdate < '1993-07-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-11-01'
		AND o_orderdate < '1994-02-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1997-03-01'
		AND o_orderdate < '1997-06-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-01-01'
		AND o_orderdate < '1996-04-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1995-03-01'
		AND o_orderdate < '1995-06-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1995-04-01'
		AND o_orderdate < '1995-07-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-04-01'
		AND o_orderdate < '1996-07-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1995-02-01'
		AND o_orderdate < '1995-05-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-07-01'
		AND o_orderdate < '1993-10-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-08-01'
		AND o_orderdate < '1996-11-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1994-03-01'
		AND o_orderdate < '1994-06-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-02-01'
		AND o_orderdate < '1993-05-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-05-01'
		AND o_orderdate < '1996-08-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-05-01'
		AND o_orderdate < '1993-08-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1994-12-01'
		AND o_orderdate < '1995-03-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1995-12-01'
		AND o_orderdate < '1996-03-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-06-01'
		AND o_orderdate < '1996-09-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-02-01'
		AND o_orderdate < '1996-05-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1997-10-01'
		AND o_orderdate < '1998-01-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1997-02-01'
		AND o_orderdate < '1997-05-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1994-04-01'
		AND o_orderdate < '1994-07-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1994-05-01'
		AND o_orderdate < '1994-08-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-07-01'
		AND o_orderdate < '1993-10-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-02-01'
		AND o_orderdate < '1996-05-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-12-01'
		AND o_orderdate < '1994-03-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-05-01'
		AND o_orderdate < '1993-08-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-11-01'
		AND o_orderdate < '1994-02-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-09-01'
		AND o_orderdate < '1993-12-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1994-03-01'
		AND o_orderdate < '1994-06-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-08-01'
		AND o_orderdate < '1993-11-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-08-01'
		AND o_orderdate < '1993-11-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1997-07-01'
		AND o_orderdate < '1997-10-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-07-01'
		AND o_orderdate < '1996-10-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1997-07-01'
		AND o_orderdate < '1997-10-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-08-01'
		AND o_orderdate < '1993-11-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1997-06-01'
		AND o_orderdate < '1997-09-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1995-03-01'
		AND o_orderdate < '1995-06-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1993-07-01'
		AND o_orderdate < '1993-10-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-11-01'
		AND o_orderdate < '1997-02-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-07-01'
		AND o_orderdate < '1996-10-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1995-10-01'
		AND o_orderdate < '1996-01-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-07-01'
		AND o_orderdate < '1996-10-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1996-08-01'
		AND o_orderdate < '1996-11-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;

---

SELECT o_orderpriority, count(*) AS order_count
FROM orders_tpch_0_1
 WHERE o_orderdate >= '1995-05-01'
		AND o_orderdate < '1995-08-01'
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1
 					WHERE l_orderkey = o_orderkey
							AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;
