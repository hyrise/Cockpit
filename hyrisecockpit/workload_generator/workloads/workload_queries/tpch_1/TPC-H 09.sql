SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%blush%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%snow%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%wheat%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%almond%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%bisque%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%papaya%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%coral%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%orange%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%burnished%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%midnight%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%orchid%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%frosted%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%grey%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%orange%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%black%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%thistle%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%dim%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%chartreuse%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%cornsilk%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%chocolate%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%royal%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%aquamarine%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%bisque%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%chocolate%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%metallic%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%khaki%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%tan%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%sandy%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%thistle%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%tan%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%cornflower%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%cornsilk%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%seashell%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%blanched%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%drab%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%royal%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%goldenrod%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%rosy%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%honeydew%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%violet%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%firebrick%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;

---

SELECT nation, o_year, SUM(amount) AS sum_profit
FROM
		(SELECT n_name AS nation, SUBSTR(o_orderdate, 1, 4) AS o_year,
				l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity AS amount
			FROM part, supplier, lineitem, partsupp, orders, nation
			WHERE s_suppkey = l_suppkey
					AND ps_suppkey = l_suppkey
					AND ps_partkey = l_partkey
					AND p_partkey = l_partkey
					AND o_orderkey = l_orderkey
					AND s_nationkey = n_nationkey
					AND p_name like '%blush%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;
