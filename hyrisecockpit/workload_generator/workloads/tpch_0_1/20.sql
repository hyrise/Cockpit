SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'ghost%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'PERU'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'seashell%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'INDIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'smoke%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ALGERIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'black%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'VIETNAM'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'chocolate%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'black%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'ivory%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'KENYA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'brown%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED KINGDOM'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'snow%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'BRAZIL'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'wheat%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'JAPAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'khaki%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'maroon%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ARGENTINA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'rosy%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED KINGDOM'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'puff%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOROCCO'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'khaki%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'deep%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'CHINA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'drab%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'goldenrod%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'medium%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOROCCO'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'bisque%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'JORDAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'drab%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'mint%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'PERU'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'navajo%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'BRAZIL'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'powder%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'RUSSIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'cream%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'BRAZIL'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'turquoise%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'BRAZIL'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'powder%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'PERU'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'dodger%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'EGYPT'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'cyan%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'indian%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'SAUDI ARABIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'ghost%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'JORDAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'royal%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'lemon%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ARGENTINA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'navy%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'JORDAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'yellow%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOZAMBIQUE'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'beige%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'grey%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'RUSSIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'lace%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'misty%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'royal%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'tan%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'JORDAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'blush%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'GERMANY'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'peach%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOZAMBIQUE'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'cream%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'RUSSIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'firebrick%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'EGYPT'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'sandy%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOROCCO'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'hot%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAQ'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'purple%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED STATES'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'salmon%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'SAUDI ARABIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'olive%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'coral%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOZAMBIQUE'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'wheat%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'maroon%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'SAUDI ARABIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'mint%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'CHINA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'tan%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'JAPAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'papaya%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'SAUDI ARABIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'wheat%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOZAMBIQUE'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'dim%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'VIETNAM'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'blue%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'SAUDI ARABIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'almond%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'sky%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'JORDAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'midnight%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'PERU'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'orchid%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'RUSSIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'green%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOROCCO'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'cornflower%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOZAMBIQUE'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'chocolate%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'floral%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'CANADA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'dodger%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOZAMBIQUE'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'smoke%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'CHINA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'deep%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED KINGDOM'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'dim%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'INDIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'sienna%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'UNITED KINGDOM'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'orange%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'BRAZIL'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'moccasin%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'JORDAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'grey%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'CANADA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'saddle%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'SAUDI ARABIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'maroon%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'metallic%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'PERU'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'antique%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'IRAN'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'plum%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'EGYPT'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'navajo%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'medium%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ETHIOPIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'navajo%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ALGERIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'spring%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'royal%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'CHINA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'salmon%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ALGERIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'saddle%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'firebrick%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1994-01-01'
												AND l_shipdate < '1995-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'dark%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'ROMANIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'gainsboro%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOZAMBIQUE'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'drab%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1996-01-01'
												AND l_shipdate < '1997-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'MOZAMBIQUE'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'grey%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'EGYPT'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'tomato%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1993-01-01'
												AND l_shipdate < '1994-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'INDIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'turquoise%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'VIETNAM'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'lavender%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'FRANCE'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'chocolate%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1995-01-01'
												AND l_shipdate < '1996-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'RUSSIA'
ORDER BY s_name;

---

SELECT s_name, s_address
FROM supplier_tpch_0_1, nation_tpch_0_1
 WHERE s_suppkey IN
				(SELECT ps_suppkey
					FROM partsupp_tpch_0_1
 					WHERE ps_partkey IN
									(SELECT p_partkey
										FROM part_tpch_0_1
 										WHERE p_name like 'plum%')
							AND ps_availqty >
									(SELECT 0.5 * SUM(l_quantity)
										FROM lineitem_tpch_0_1
 										WHERE l_partkey = ps_partkey
												AND l_suppkey = ps_suppkey
												AND l_shipdate >= '1997-01-01'
												AND l_shipdate < '1998-01-01'))
		AND s_nationkey = n_nationkey
		AND n_name = 'INDONESIA'
ORDER BY s_name;
