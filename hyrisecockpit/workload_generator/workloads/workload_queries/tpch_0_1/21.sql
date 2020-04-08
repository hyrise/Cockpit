SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'IRAQ'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'ROMANIA'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'JAPAN'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'KENYA'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'BRAZIL'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'CANADA'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'SAUDI ARABIA'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'RUSSIA'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'RUSSIA'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'VIETNAM'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'GERMANY'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'UNITED KINGDOM'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'CANADA'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'GERMANY'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;

---

SELECT s_name, count(*) AS numwait
FROM supplier_tpch_0_1, lineitem_tpch_0_1 l1, orders_tpch_0_1, nation_tpch_0_1
WHERE s_suppkey = l1.l_suppkey
		AND o_orderkey = l1.l_orderkey
		AND o_orders_tpch_0_1tatus = 'F'
		AND l1.l_receiptdate > l1.l_commitdate
		AND EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l2
					WHERE l2.l_orderkey = l1.l_orderkey
							AND l2.l_suppkey <> l1.l_suppkey)
		AND NOT EXISTS
				(SELECT *
					FROM lineitem_tpch_0_1 l3
					WHERE l3.l_orderkey = l1.l_orderkey
							AND l3.l_suppkey <> l1.l_suppkey
							AND l3.l_receiptdate > l3.l_commitdate )
		AND s_nation_tpch_0_1key = n_nation_tpch_0_1key
		AND n_name = 'CHINA'
GROUP BY s_name
ORDER BY numwait DESC, s_name
LIMIT 100;
