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
					AND p_name like '%smoke%') AS profit
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
					AND p_name like '%antique%') AS profit
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
					AND p_name like '%lime%') AS profit
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
					AND p_name like '%medium%') AS profit
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
					AND p_name like '%tomato%') AS profit
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
					AND p_name like '%turquoise%') AS profit
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
					AND p_name like '%lemon%') AS profit
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
					AND p_name like '%yellow%') AS profit
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
					AND p_name like '%navy%') AS profit
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
					AND p_name like '%lemon%') AS profit
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
					AND p_name like '%azure%') AS profit
GROUP BY nation, o_year
ORDER BY nation, o_year DESC;
