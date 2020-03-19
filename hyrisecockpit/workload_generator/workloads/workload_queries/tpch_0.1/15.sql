CREATE VIEW revenue0 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-12-01'
		AND l_shipdate < '1995-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue0
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue0)
ORDER BY s_suppkey;

DROP VIEW revenue0;

---

CREATE VIEW revenue1 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-08-01'
		AND l_shipdate < '1995-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue1
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue1)
ORDER BY s_suppkey;

DROP VIEW revenue1;

---

CREATE VIEW revenue2 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-07-01'
		AND l_shipdate < '1995-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue2
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue2)
ORDER BY s_suppkey;

DROP VIEW revenue2;

---

CREATE VIEW revenue3 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-08-01'
		AND l_shipdate < '1997-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue3
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue3)
ORDER BY s_suppkey;

DROP VIEW revenue3;

---

CREATE VIEW revenue4 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-04-01'
		AND l_shipdate < '1994-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue4
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue4)
ORDER BY s_suppkey;

DROP VIEW revenue4;

---

CREATE VIEW revenue5 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-03-01'
		AND l_shipdate < '1995-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue5
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue5)
ORDER BY s_suppkey;

DROP VIEW revenue5;

---

CREATE VIEW revenue6 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-07-01'
		AND l_shipdate < '1995-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue6
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue6)
ORDER BY s_suppkey;

DROP VIEW revenue6;

---

CREATE VIEW revenue7 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-06-01'
		AND l_shipdate < '1996-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue7
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue7)
ORDER BY s_suppkey;

DROP VIEW revenue7;

---

CREATE VIEW revenue8 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-07-01'
		AND l_shipdate < '1997-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue8
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue8)
ORDER BY s_suppkey;

DROP VIEW revenue8;

---

CREATE VIEW revenue9 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-08-01'
		AND l_shipdate < '1995-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue9
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue9)
ORDER BY s_suppkey;

DROP VIEW revenue9;

---

CREATE VIEW revenue10 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-04-01'
		AND l_shipdate < '1996-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue10
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue10)
ORDER BY s_suppkey;

DROP VIEW revenue10;

---

CREATE VIEW revenue11 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-08-01'
		AND l_shipdate < '1994-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue11
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue11)
ORDER BY s_suppkey;

DROP VIEW revenue11;

---

CREATE VIEW revenue12 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-08-01'
		AND l_shipdate < '1996-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue12
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue12)
ORDER BY s_suppkey;

DROP VIEW revenue12;

---

CREATE VIEW revenue13 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-09-01'
		AND l_shipdate < '1997-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue13
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue13)
ORDER BY s_suppkey;

DROP VIEW revenue13;

---

CREATE VIEW revenue14 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-01-01'
		AND l_shipdate < '1994-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue14
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue14)
ORDER BY s_suppkey;

DROP VIEW revenue14;

---

CREATE VIEW revenue15 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-08-01'
		AND l_shipdate < '1994-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue15
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue15)
ORDER BY s_suppkey;

DROP VIEW revenue15;

---

CREATE VIEW revenue16 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-05-01'
		AND l_shipdate < '1993-08-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue16
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue16)
ORDER BY s_suppkey;

DROP VIEW revenue16;

---

CREATE VIEW revenue17 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-03-01'
		AND l_shipdate < '1993-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue17
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue17)
ORDER BY s_suppkey;

DROP VIEW revenue17;

---

CREATE VIEW revenue18 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-01-01'
		AND l_shipdate < '1996-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue18
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue18)
ORDER BY s_suppkey;

DROP VIEW revenue18;

---

CREATE VIEW revenue19 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-04-01'
		AND l_shipdate < '1994-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue19
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue19)
ORDER BY s_suppkey;

DROP VIEW revenue19;

---

CREATE VIEW revenue20 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-10-01'
		AND l_shipdate < '1996-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue20
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue20)
ORDER BY s_suppkey;

DROP VIEW revenue20;

---

CREATE VIEW revenue21 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-01-01'
		AND l_shipdate < '1993-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue21
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue21)
ORDER BY s_suppkey;

DROP VIEW revenue21;

---

CREATE VIEW revenue22 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-10-01'
		AND l_shipdate < '1994-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue22
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue22)
ORDER BY s_suppkey;

DROP VIEW revenue22;

---

CREATE VIEW revenue23 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-12-01'
		AND l_shipdate < '1994-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue23
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue23)
ORDER BY s_suppkey;

DROP VIEW revenue23;

---

CREATE VIEW revenue24 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-05-01'
		AND l_shipdate < '1996-08-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue24
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue24)
ORDER BY s_suppkey;

DROP VIEW revenue24;

---

CREATE VIEW revenue25 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-08-01'
		AND l_shipdate < '1994-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue25
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue25)
ORDER BY s_suppkey;

DROP VIEW revenue25;

---

CREATE VIEW revenue26 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-02-01'
		AND l_shipdate < '1997-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue26
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue26)
ORDER BY s_suppkey;

DROP VIEW revenue26;

---

CREATE VIEW revenue27 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-01-01'
		AND l_shipdate < '1993-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue27
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue27)
ORDER BY s_suppkey;

DROP VIEW revenue27;

---

CREATE VIEW revenue28 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-09-01'
		AND l_shipdate < '1995-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue28
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue28)
ORDER BY s_suppkey;

DROP VIEW revenue28;

---

CREATE VIEW revenue29 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-02-01'
		AND l_shipdate < '1997-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue29
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue29)
ORDER BY s_suppkey;

DROP VIEW revenue29;

---

CREATE VIEW revenue30 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-04-01'
		AND l_shipdate < '1993-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue30
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue30)
ORDER BY s_suppkey;

DROP VIEW revenue30;

---

CREATE VIEW revenue31 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-09-01'
		AND l_shipdate < '1994-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue31
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue31)
ORDER BY s_suppkey;

DROP VIEW revenue31;

---

CREATE VIEW revenue32 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-07-01'
		AND l_shipdate < '1997-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue32
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue32)
ORDER BY s_suppkey;

DROP VIEW revenue32;

---

CREATE VIEW revenue33 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-11-01'
		AND l_shipdate < '1997-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue33
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue33)
ORDER BY s_suppkey;

DROP VIEW revenue33;

---

CREATE VIEW revenue34 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-04-01'
		AND l_shipdate < '1993-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue34
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue34)
ORDER BY s_suppkey;

DROP VIEW revenue34;

---

CREATE VIEW revenue35 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-01-01'
		AND l_shipdate < '1994-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue35
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue35)
ORDER BY s_suppkey;

DROP VIEW revenue35;

---

CREATE VIEW revenue36 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-09-01'
		AND l_shipdate < '1994-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue36
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue36)
ORDER BY s_suppkey;

DROP VIEW revenue36;

---

CREATE VIEW revenue37 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-06-01'
		AND l_shipdate < '1997-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue37
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue37)
ORDER BY s_suppkey;

DROP VIEW revenue37;

---

CREATE VIEW revenue38 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-11-01'
		AND l_shipdate < '1996-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue38
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue38)
ORDER BY s_suppkey;

DROP VIEW revenue38;

---

CREATE VIEW revenue39 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-07-01'
		AND l_shipdate < '1994-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue39
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue39)
ORDER BY s_suppkey;

DROP VIEW revenue39;

---

CREATE VIEW revenue40 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-02-01'
		AND l_shipdate < '1996-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue40
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue40)
ORDER BY s_suppkey;

DROP VIEW revenue40;

---

CREATE VIEW revenue41 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-03-01'
		AND l_shipdate < '1997-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue41
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue41)
ORDER BY s_suppkey;

DROP VIEW revenue41;

---

CREATE VIEW revenue42 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-08-01'
		AND l_shipdate < '1996-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue42
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue42)
ORDER BY s_suppkey;

DROP VIEW revenue42;

---

CREATE VIEW revenue43 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-01-01'
		AND l_shipdate < '1993-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue43
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue43)
ORDER BY s_suppkey;

DROP VIEW revenue43;

---

CREATE VIEW revenue44 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-04-01'
		AND l_shipdate < '1996-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue44
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue44)
ORDER BY s_suppkey;

DROP VIEW revenue44;

---

CREATE VIEW revenue45 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-12-01'
		AND l_shipdate < '1995-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue45
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue45)
ORDER BY s_suppkey;

DROP VIEW revenue45;

---

CREATE VIEW revenue46 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-01-01'
		AND l_shipdate < '1993-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue46
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue46)
ORDER BY s_suppkey;

DROP VIEW revenue46;

---

CREATE VIEW revenue47 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-01-01'
		AND l_shipdate < '1996-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue47
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue47)
ORDER BY s_suppkey;

DROP VIEW revenue47;

---

CREATE VIEW revenue48 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-11-01'
		AND l_shipdate < '1995-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue48
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue48)
ORDER BY s_suppkey;

DROP VIEW revenue48;

---

CREATE VIEW revenue49 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-05-01'
		AND l_shipdate < '1993-08-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue49
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue49)
ORDER BY s_suppkey;

DROP VIEW revenue49;

---

CREATE VIEW revenue50 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-06-01'
		AND l_shipdate < '1995-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue50
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue50)
ORDER BY s_suppkey;

DROP VIEW revenue50;

---

CREATE VIEW revenue51 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-07-01'
		AND l_shipdate < '1994-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue51
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue51)
ORDER BY s_suppkey;

DROP VIEW revenue51;

---

CREATE VIEW revenue52 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-02-01'
		AND l_shipdate < '1997-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue52
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue52)
ORDER BY s_suppkey;

DROP VIEW revenue52;

---

CREATE VIEW revenue53 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-04-01'
		AND l_shipdate < '1993-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue53
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue53)
ORDER BY s_suppkey;

DROP VIEW revenue53;

---

CREATE VIEW revenue54 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-02-01'
		AND l_shipdate < '1997-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue54
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue54)
ORDER BY s_suppkey;

DROP VIEW revenue54;

---

CREATE VIEW revenue55 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-10-01'
		AND l_shipdate < '1995-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue55
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue55)
ORDER BY s_suppkey;

DROP VIEW revenue55;

---

CREATE VIEW revenue56 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-09-01'
		AND l_shipdate < '1996-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue56
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue56)
ORDER BY s_suppkey;

DROP VIEW revenue56;

---

CREATE VIEW revenue57 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-06-01'
		AND l_shipdate < '1994-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue57
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue57)
ORDER BY s_suppkey;

DROP VIEW revenue57;

---

CREATE VIEW revenue58 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-07-01'
		AND l_shipdate < '1994-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue58
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue58)
ORDER BY s_suppkey;

DROP VIEW revenue58;

---

CREATE VIEW revenue59 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-10-01'
		AND l_shipdate < '1998-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue59
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue59)
ORDER BY s_suppkey;

DROP VIEW revenue59;

---

CREATE VIEW revenue60 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-06-01'
		AND l_shipdate < '1993-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue60
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue60)
ORDER BY s_suppkey;

DROP VIEW revenue60;

---

CREATE VIEW revenue61 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-05-01'
		AND l_shipdate < '1996-08-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue61
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue61)
ORDER BY s_suppkey;

DROP VIEW revenue61;

---

CREATE VIEW revenue62 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-11-01'
		AND l_shipdate < '1997-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue62
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue62)
ORDER BY s_suppkey;

DROP VIEW revenue62;

---

CREATE VIEW revenue63 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-09-01'
		AND l_shipdate < '1993-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue63
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue63)
ORDER BY s_suppkey;

DROP VIEW revenue63;

---

CREATE VIEW revenue64 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-07-01'
		AND l_shipdate < '1995-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue64
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue64)
ORDER BY s_suppkey;

DROP VIEW revenue64;

---

CREATE VIEW revenue65 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-10-01'
		AND l_shipdate < '1996-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue65
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue65)
ORDER BY s_suppkey;

DROP VIEW revenue65;

---

CREATE VIEW revenue66 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-12-01'
		AND l_shipdate < '1996-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue66
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue66)
ORDER BY s_suppkey;

DROP VIEW revenue66;

---

CREATE VIEW revenue67 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-08-01'
		AND l_shipdate < '1996-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue67
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue67)
ORDER BY s_suppkey;

DROP VIEW revenue67;

---

CREATE VIEW revenue68 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-01-01'
		AND l_shipdate < '1997-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue68
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue68)
ORDER BY s_suppkey;

DROP VIEW revenue68;

---

CREATE VIEW revenue69 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-06-01'
		AND l_shipdate < '1997-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue69
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue69)
ORDER BY s_suppkey;

DROP VIEW revenue69;

---

CREATE VIEW revenue70 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-01-01'
		AND l_shipdate < '1997-04-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue70
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue70)
ORDER BY s_suppkey;

DROP VIEW revenue70;

---

CREATE VIEW revenue71 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-03-01'
		AND l_shipdate < '1995-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue71
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue71)
ORDER BY s_suppkey;

DROP VIEW revenue71;

---

CREATE VIEW revenue72 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-02-01'
		AND l_shipdate < '1997-05-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue72
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue72)
ORDER BY s_suppkey;

DROP VIEW revenue72;

---

CREATE VIEW revenue73 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-04-01'
		AND l_shipdate < '1993-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue73
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue73)
ORDER BY s_suppkey;

DROP VIEW revenue73;

---

CREATE VIEW revenue74 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-03-01'
		AND l_shipdate < '1995-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue74
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue74)
ORDER BY s_suppkey;

DROP VIEW revenue74;

---

CREATE VIEW revenue75 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-10-01'
		AND l_shipdate < '1995-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue75
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue75)
ORDER BY s_suppkey;

DROP VIEW revenue75;

---

CREATE VIEW revenue76 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-06-01'
		AND l_shipdate < '1996-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue76
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue76)
ORDER BY s_suppkey;

DROP VIEW revenue76;

---

CREATE VIEW revenue77 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-03-01'
		AND l_shipdate < '1996-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue77
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue77)
ORDER BY s_suppkey;

DROP VIEW revenue77;

---

CREATE VIEW revenue78 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-11-01'
		AND l_shipdate < '1995-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue78
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue78)
ORDER BY s_suppkey;

DROP VIEW revenue78;

---

CREATE VIEW revenue79 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-12-01'
		AND l_shipdate < '1994-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue79
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue79)
ORDER BY s_suppkey;

DROP VIEW revenue79;

---

CREATE VIEW revenue80 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-05-01'
		AND l_shipdate < '1995-08-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue80
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue80)
ORDER BY s_suppkey;

DROP VIEW revenue80;

---

CREATE VIEW revenue81 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-04-01'
		AND l_shipdate < '1995-07-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue81
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue81)
ORDER BY s_suppkey;

DROP VIEW revenue81;

---

CREATE VIEW revenue82 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-03-01'
		AND l_shipdate < '1996-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue82
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue82)
ORDER BY s_suppkey;

DROP VIEW revenue82;

---

CREATE VIEW revenue83 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-07-01'
		AND l_shipdate < '1994-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue83
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue83)
ORDER BY s_suppkey;

DROP VIEW revenue83;

---

CREATE VIEW revenue84 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-03-01'
		AND l_shipdate < '1995-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue84
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue84)
ORDER BY s_suppkey;

DROP VIEW revenue84;

---

CREATE VIEW revenue85 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-08-01'
		AND l_shipdate < '1997-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue85
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue85)
ORDER BY s_suppkey;

DROP VIEW revenue85;

---

CREATE VIEW revenue86 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-11-01'
		AND l_shipdate < '1994-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue86
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue86)
ORDER BY s_suppkey;

DROP VIEW revenue86;

---

CREATE VIEW revenue87 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-03-01'
		AND l_shipdate < '1993-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue87
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue87)
ORDER BY s_suppkey;

DROP VIEW revenue87;

---

CREATE VIEW revenue88 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-07-01'
		AND l_shipdate < '1994-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue88
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue88)
ORDER BY s_suppkey;

DROP VIEW revenue88;

---

CREATE VIEW revenue89 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-07-01'
		AND l_shipdate < '1997-10-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue89
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue89)
ORDER BY s_suppkey;

DROP VIEW revenue89;

---

CREATE VIEW revenue90 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-12-01'
		AND l_shipdate < '1995-03-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue90
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue90)
ORDER BY s_suppkey;

DROP VIEW revenue90;

---

CREATE VIEW revenue91 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-09-01'
		AND l_shipdate < '1996-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue91
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue91)
ORDER BY s_suppkey;

DROP VIEW revenue91;

---

CREATE VIEW revenue92 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1993-06-01'
		AND l_shipdate < '1993-09-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue92
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue92)
ORDER BY s_suppkey;

DROP VIEW revenue92;

---

CREATE VIEW revenue93 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1995-11-01'
		AND l_shipdate < '1996-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue93
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue93)
ORDER BY s_suppkey;

DROP VIEW revenue93;

---

CREATE VIEW revenue94 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-10-01'
		AND l_shipdate < '1997-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue94
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue94)
ORDER BY s_suppkey;

DROP VIEW revenue94;

---

CREATE VIEW revenue95 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1997-10-01'
		AND l_shipdate < '1998-01-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue95
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue95)
ORDER BY s_suppkey;

DROP VIEW revenue95;

---

CREATE VIEW revenue96 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-03-01'
		AND l_shipdate < '1994-06-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue96
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue96)
ORDER BY s_suppkey;

DROP VIEW revenue96;

---

CREATE VIEW revenue97 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1996-08-01'
		AND l_shipdate < '1996-11-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue97
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue97)
ORDER BY s_suppkey;

DROP VIEW revenue97;

---

CREATE VIEW revenue98 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-09-01'
		AND l_shipdate < '1994-12-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue98
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue98)
ORDER BY s_suppkey;

DROP VIEW revenue98;

---

CREATE VIEW revenue99 (supplier_no, total_revenue) AS
SELECT l_suppkey, SUM(l_extendedprice * (1 - l_discount))
FROM lineitem
WHERE l_shipdate >= '1994-11-01'
		AND l_shipdate < '1995-02-01'
GROUP BY l_suppkey;

SELECT s_suppkey, s_name, s_address, s_phone, total_revenue
FROM supplier, revenue99
WHERE s_suppkey = supplier_no
		AND total_revenue =
				(SELECT max(total_revenue)
					FROM revenue99)
ORDER BY s_suppkey;

DROP VIEW revenue99;
