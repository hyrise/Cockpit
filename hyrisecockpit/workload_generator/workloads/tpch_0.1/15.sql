CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-12-01'
		AND l_shipdate < '1995-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-08-01'
		AND l_shipdate < '1995-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-07-01'
		AND l_shipdate < '1995-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-08-01'
		AND l_shipdate < '1997-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-04-01'
		AND l_shipdate < '1994-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-03-01'
		AND l_shipdate < '1995-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-07-01'
		AND l_shipdate < '1995-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-06-01'
		AND l_shipdate < '1996-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-07-01'
		AND l_shipdate < '1997-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-08-01'
		AND l_shipdate < '1995-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-04-01'
		AND l_shipdate < '1996-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-08-01'
		AND l_shipdate < '1994-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-08-01'
		AND l_shipdate < '1996-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-09-01'
		AND l_shipdate < '1997-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-01-01'
		AND l_shipdate < '1994-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-08-01'
		AND l_shipdate < '1994-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-05-01'
		AND l_shipdate < '1993-08-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-03-01'
		AND l_shipdate < '1993-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-01-01'
		AND l_shipdate < '1996-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-04-01'
		AND l_shipdate < '1994-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-10-01'
		AND l_shipdate < '1996-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-01-01'
		AND l_shipdate < '1993-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-10-01'
		AND l_shipdate < '1994-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-12-01'
		AND l_shipdate < '1994-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-05-01'
		AND l_shipdate < '1996-08-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-08-01'
		AND l_shipdate < '1994-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-02-01'
		AND l_shipdate < '1997-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-01-01'
		AND l_shipdate < '1993-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-09-01'
		AND l_shipdate < '1995-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-02-01'
		AND l_shipdate < '1997-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-04-01'
		AND l_shipdate < '1993-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-09-01'
		AND l_shipdate < '1994-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-07-01'
		AND l_shipdate < '1997-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-11-01'
		AND l_shipdate < '1997-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-04-01'
		AND l_shipdate < '1993-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-01-01'
		AND l_shipdate < '1994-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-09-01'
		AND l_shipdate < '1994-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-06-01'
		AND l_shipdate < '1997-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-11-01'
		AND l_shipdate < '1996-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-07-01'
		AND l_shipdate < '1994-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-02-01'
		AND l_shipdate < '1996-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-03-01'
		AND l_shipdate < '1997-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-08-01'
		AND l_shipdate < '1996-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-01-01'
		AND l_shipdate < '1993-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-04-01'
		AND l_shipdate < '1996-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-12-01'
		AND l_shipdate < '1995-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-01-01'
		AND l_shipdate < '1993-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-01-01'
		AND l_shipdate < '1996-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-11-01'
		AND l_shipdate < '1995-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-05-01'
		AND l_shipdate < '1993-08-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-06-01'
		AND l_shipdate < '1995-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-07-01'
		AND l_shipdate < '1994-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-02-01'
		AND l_shipdate < '1997-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-04-01'
		AND l_shipdate < '1993-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-02-01'
		AND l_shipdate < '1997-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-10-01'
		AND l_shipdate < '1995-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-09-01'
		AND l_shipdate < '1996-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-06-01'
		AND l_shipdate < '1994-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-07-01'
		AND l_shipdate < '1994-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-10-01'
		AND l_shipdate < '1998-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-06-01'
		AND l_shipdate < '1993-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-05-01'
		AND l_shipdate < '1996-08-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-11-01'
		AND l_shipdate < '1997-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-09-01'
		AND l_shipdate < '1993-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-07-01'
		AND l_shipdate < '1995-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-10-01'
		AND l_shipdate < '1996-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-12-01'
		AND l_shipdate < '1996-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-08-01'
		AND l_shipdate < '1996-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-01-01'
		AND l_shipdate < '1997-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-06-01'
		AND l_shipdate < '1997-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-01-01'
		AND l_shipdate < '1997-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-03-01'
		AND l_shipdate < '1995-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-02-01'
		AND l_shipdate < '1997-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-04-01'
		AND l_shipdate < '1993-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-03-01'
		AND l_shipdate < '1995-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-10-01'
		AND l_shipdate < '1995-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-06-01'
		AND l_shipdate < '1996-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-03-01'
		AND l_shipdate < '1996-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-11-01'
		AND l_shipdate < '1995-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-12-01'
		AND l_shipdate < '1994-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-05-01'
		AND l_shipdate < '1995-08-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-04-01'
		AND l_shipdate < '1995-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-03-01'
		AND l_shipdate < '1996-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-07-01'
		AND l_shipdate < '1994-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-03-01'
		AND l_shipdate < '1995-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-08-01'
		AND l_shipdate < '1997-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-11-01'
		AND l_shipdate < '1994-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-03-01'
		AND l_shipdate < '1993-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-07-01'
		AND l_shipdate < '1994-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-07-01'
		AND l_shipdate < '1997-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-12-01'
		AND l_shipdate < '1995-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-09-01'
		AND l_shipdate < '1996-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-06-01'
		AND l_shipdate < '1993-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-11-01'
		AND l_shipdate < '1996-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-10-01'
		AND l_shipdate < '1997-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-10-01'
		AND l_shipdate < '1998-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-03-01'
		AND l_shipdate < '1994-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-08-01'
		AND l_shipdate < '1996-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-09-01'
		AND l_shipdate < '1994-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];

---

CREATE VIEW revenue[STREAM_ID] (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-11-01'
		AND l_shipdate < '1995-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue[STREAM_ID]
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue[STREAM_ID])
ORDER BY s_suppkey;

DROP VIEW revenue[STREAM_ID];
