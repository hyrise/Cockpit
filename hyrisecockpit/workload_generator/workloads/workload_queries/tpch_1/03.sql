SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-19'
		AND l_shipdate > '1995-03-19'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-10'
		AND l_shipdate > '1995-03-10'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-06'
		AND l_shipdate > '1995-03-06'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-17'
		AND l_shipdate > '1995-03-17'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-29'
		AND l_shipdate > '1995-03-29'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-24'
		AND l_shipdate > '1995-03-24'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-26'
		AND l_shipdate > '1995-03-26'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-23'
		AND l_shipdate > '1995-03-23'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-02'
		AND l_shipdate > '1995-03-02'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-23'
		AND l_shipdate > '1995-03-23'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-18'
		AND l_shipdate > '1995-03-18'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-06'
		AND l_shipdate > '1995-03-06'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-06'
		AND l_shipdate > '1995-03-06'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-14'
		AND l_shipdate > '1995-03-14'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-07'
		AND l_shipdate > '1995-03-07'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-30'
		AND l_shipdate > '1995-03-30'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-19'
		AND l_shipdate > '1995-03-19'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-19'
		AND l_shipdate > '1995-03-19'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-03'
		AND l_shipdate > '1995-03-03'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-15'
		AND l_shipdate > '1995-03-15'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-30'
		AND l_shipdate > '1995-03-30'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-13'
		AND l_shipdate > '1995-03-13'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-12'
		AND l_shipdate > '1995-03-12'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-04'
		AND l_shipdate > '1995-03-04'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-18'
		AND l_shipdate > '1995-03-18'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-21'
		AND l_shipdate > '1995-03-21'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-13'
		AND l_shipdate > '1995-03-13'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-23'
		AND l_shipdate > '1995-03-23'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-01'
		AND l_shipdate > '1995-03-01'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-04'
		AND l_shipdate > '1995-03-04'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-12'
		AND l_shipdate > '1995-03-12'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-07'
		AND l_shipdate > '1995-03-07'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-12'
		AND l_shipdate > '1995-03-12'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-10'
		AND l_shipdate > '1995-03-10'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-30'
		AND l_shipdate > '1995-03-30'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-06'
		AND l_shipdate > '1995-03-06'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-02'
		AND l_shipdate > '1995-03-02'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-11'
		AND l_shipdate > '1995-03-11'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-03'
		AND l_shipdate > '1995-03-03'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-05'
		AND l_shipdate > '1995-03-05'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-13'
		AND l_shipdate > '1995-03-13'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-29'
		AND l_shipdate > '1995-03-29'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-23'
		AND l_shipdate > '1995-03-23'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-14'
		AND l_shipdate > '1995-03-14'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-06'
		AND l_shipdate > '1995-03-06'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-20'
		AND l_shipdate > '1995-03-20'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-14'
		AND l_shipdate > '1995-03-14'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-25'
		AND l_shipdate > '1995-03-25'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-19'
		AND l_shipdate > '1995-03-19'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-27'
		AND l_shipdate > '1995-03-27'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-12'
		AND l_shipdate > '1995-03-12'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-10'
		AND l_shipdate > '1995-03-10'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-30'
		AND l_shipdate > '1995-03-30'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-13'
		AND l_shipdate > '1995-03-13'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-02'
		AND l_shipdate > '1995-03-02'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-26'
		AND l_shipdate > '1995-03-26'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-09'
		AND l_shipdate > '1995-03-09'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-27'
		AND l_shipdate > '1995-03-27'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-17'
		AND l_shipdate > '1995-03-17'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-05'
		AND l_shipdate > '1995-03-05'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-05'
		AND l_shipdate > '1995-03-05'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-09'
		AND l_shipdate > '1995-03-09'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-02'
		AND l_shipdate > '1995-03-02'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-27'
		AND l_shipdate > '1995-03-27'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-15'
		AND l_shipdate > '1995-03-15'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-22'
		AND l_shipdate > '1995-03-22'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-04'
		AND l_shipdate > '1995-03-04'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-08'
		AND l_shipdate > '1995-03-08'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-22'
		AND l_shipdate > '1995-03-22'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-13'
		AND l_shipdate > '1995-03-13'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-22'
		AND l_shipdate > '1995-03-22'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-31'
		AND l_shipdate > '1995-03-31'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-09'
		AND l_shipdate > '1995-03-09'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-04'
		AND l_shipdate > '1995-03-04'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-06'
		AND l_shipdate > '1995-03-06'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-06'
		AND l_shipdate > '1995-03-06'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-08'
		AND l_shipdate > '1995-03-08'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-04'
		AND l_shipdate > '1995-03-04'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-23'
		AND l_shipdate > '1995-03-23'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-05'
		AND l_shipdate > '1995-03-05'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-15'
		AND l_shipdate > '1995-03-15'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-26'
		AND l_shipdate > '1995-03-26'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-19'
		AND l_shipdate > '1995-03-19'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-24'
		AND l_shipdate > '1995-03-24'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-08'
		AND l_shipdate > '1995-03-08'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-08'
		AND l_shipdate > '1995-03-08'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-11'
		AND l_shipdate > '1995-03-11'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-29'
		AND l_shipdate > '1995-03-29'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-01'
		AND l_shipdate > '1995-03-01'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-27'
		AND l_shipdate > '1995-03-27'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-15'
		AND l_shipdate > '1995-03-15'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-29'
		AND l_shipdate > '1995-03-29'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-30'
		AND l_shipdate > '1995-03-30'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'HOUSEHOLD'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-27'
		AND l_shipdate > '1995-03-27'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'BUILDING'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-28'
		AND l_shipdate > '1995-03-28'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-10'
		AND l_shipdate > '1995-03-10'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'MACHINERY'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-25'
		AND l_shipdate > '1995-03-25'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'FURNITURE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-19'
		AND l_shipdate > '1995-03-19'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-22'
		AND l_shipdate > '1995-03-22'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;

---

SELECT l_orderkey, SUM(l_extendedprice * (1 - l_discount)) AS revenue, o_orderdate, o_shippriority
FROM customer_tpch_1, orders_tpch_1, lineitem_tpch_1
WHERE c_mktsegment = 'AUTOMOBILE'
		AND c_custkey = o_custkey
		AND l_orderkey = o_orderkey
		AND o_orderdate < '1995-03-15'
		AND l_shipdate > '1995-03-15'
GROUP BY l_orderkey, o_orderdate, o_shippriority
ORDER BY revenue DESC, o_orderdate
LIMIT 10;
