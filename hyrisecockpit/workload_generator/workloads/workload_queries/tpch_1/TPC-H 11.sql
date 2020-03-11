SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'PERU'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'PERU')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'MOZAMBIQUE'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'MOZAMBIQUE')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'INDONESIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ETHIOPIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ETHIOPIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'JAPAN'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'JAPAN')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'JAPAN'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'JAPAN')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'MOZAMBIQUE'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'MOZAMBIQUE')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'INDIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'INDIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAQ'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'IRAQ')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED KINGDOM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'UNITED KINGDOM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'EGYPT'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'EGYPT')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ARGENTINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ARGENTINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'GERMANY'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'GERMANY')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED KINGDOM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'UNITED KINGDOM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAN'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'IRAN')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ROMANIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'BRAZIL'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'BRAZIL')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'KENYA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'KENYA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ROMANIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED STATES'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'UNITED STATES')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'FRANCE'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'FRANCE')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'CHINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'CHINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'INDIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'INDIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'INDONESIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'VIETNAM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'VIETNAM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'CANADA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'CANADA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'KENYA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'KENYA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'MOROCCO'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'MOROCCO')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ARGENTINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ARGENTINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED KINGDOM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'UNITED KINGDOM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ARGENTINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ARGENTINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'PERU'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'PERU')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'JAPAN'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'JAPAN')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'KENYA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'KENYA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ARGENTINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ARGENTINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED STATES'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'UNITED STATES')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'INDONESIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ARGENTINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ARGENTINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'INDONESIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ALGERIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ALGERIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ARGENTINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ARGENTINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED STATES'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'UNITED STATES')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED KINGDOM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'UNITED KINGDOM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'VIETNAM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'VIETNAM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'KENYA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'KENYA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'VIETNAM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'VIETNAM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAN'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'IRAN')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'BRAZIL'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'BRAZIL')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'CANADA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'CANADA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'PERU'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'PERU')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ARGENTINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ARGENTINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'CHINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'CHINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'JORDAN'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'JORDAN')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'INDIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'INDIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'EGYPT'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'EGYPT')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED STATES'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'UNITED STATES')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'INDONESIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'GERMANY'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'GERMANY')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'VIETNAM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'VIETNAM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'CHINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'CHINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ALGERIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ALGERIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'EGYPT'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'EGYPT')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ETHIOPIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ETHIOPIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'VIETNAM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'VIETNAM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'EGYPT'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'EGYPT')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAN'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'IRAN')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAQ'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'IRAQ')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'VIETNAM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'VIETNAM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'FRANCE'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'FRANCE')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAQ'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'IRAQ')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'SAUDI ARABIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'SAUDI ARABIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ALGERIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ALGERIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ETHIOPIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ETHIOPIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'GERMANY'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'GERMANY')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'FRANCE'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'FRANCE')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'CHINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'CHINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'CHINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'CHINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'INDONESIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ALGERIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ALGERIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'KENYA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'KENYA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'KENYA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'KENYA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'SAUDI ARABIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'SAUDI ARABIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'CHINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'CHINA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED STATES'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'UNITED STATES')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAN'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'IRAN')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'INDONESIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'FRANCE'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'FRANCE')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'CANADA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'CANADA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ROMANIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED KINGDOM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'UNITED KINGDOM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED KINGDOM'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'UNITED KINGDOM')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'FRANCE'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'FRANCE')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'EGYPT'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'EGYPT')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'FRANCE'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'FRANCE')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'BRAZIL'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'BRAZIL')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'INDIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'INDIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ALGERIA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ALGERIA')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'MOZAMBIQUE'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'MOZAMBIQUE')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'MOROCCO'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'MOROCCO')
ORDER BY value DESC;

---

SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS value
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey
		AND s_nationkey = n_nationkey
		AND n_name = 'ARGENTINA'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) >
		(SELECT SUM(ps_supplycost * ps_availqty) * 0.000100
			FROM partsupp, supplier, nation
			WHERE ps_suppkey = s_suppkey
					AND s_nationkey = n_nationkey
					AND n_name = 'ARGENTINA')
ORDER BY value DESC;
