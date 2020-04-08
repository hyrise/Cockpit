SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'MAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'REG AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'REG AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'MAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'MAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'MAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'REG AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'MAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'MAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'MAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'MAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'MAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'REG AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'REG AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'REG AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'MAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1996-01-01'
		AND l_receiptdate < '1997-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('FOB', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('RAIL', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'TRUCK')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1993-01-01'
		AND l_receiptdate < '1994-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1997-01-01'
		AND l_receiptdate < '1998-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('MAIL', 'SHIP')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('REG AIR', 'MAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('AIR', 'REG AIR')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1995-01-01'
		AND l_receiptdate < '1996-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('SHIP', 'FOB')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;

---

SELECT l_shipmode,
	SUM(CASE
									WHEN o_orderpriority = '1-URGENT'
														OR o_orderpriority = '2-HIGH' THEN 1
									ELSE 0
					END) AS high_line_count,
	SUM(CASE
									WHEN o_orderpriority <> '1-URGENT'
														AND o_orderpriority <> '2-HIGH' THEN 1
									ELSE 0
					END) AS low_line_count
FROM orders_tpch_1, lineitem_tpch_1
WHERE o_orderkey = l_orderkey
		AND l_shipmode IN ('TRUCK', 'RAIL')
		AND l_commitdate < l_receiptdate
		AND l_shipdate < l_commitdate
		AND l_receiptdate >= '1994-01-01'
		AND l_receiptdate < '1995-01-01'
GROUP BY l_shipmode
ORDER BY l_shipmode;
