SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('29', '14', '17', '10', '22', '19', '25')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('29', '14', '17', '10', '22', '19', '25'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('25', '15', '22', '32', '29', '24', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('25', '15', '22', '32', '29', '24', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('18', '17', '34', '21', '22', '15', '24')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('18', '17', '34', '21', '22', '15', '24'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('25', '19', '32', '33', '22', '31', '16')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('25', '19', '32', '33', '22', '31', '16'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('16', '15', '22', '17', '14', '23', '33')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('16', '15', '22', '17', '14', '23', '33'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('23', '24', '10', '15', '29', '17', '19')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('23', '24', '10', '15', '29', '17', '19'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('19', '32', '12', '24', '16', '30', '27')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('19', '32', '12', '24', '16', '30', '27'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('23', '17', '11', '10', '16', '14', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('23', '17', '11', '10', '16', '14', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '33', '31', '16', '26', '30', '14')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '33', '31', '16', '26', '30', '14'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('18', '11', '13', '27', '14', '25', '31')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('18', '11', '13', '27', '14', '25', '31'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('13', '29', '26', '31', '10', '20', '15')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('13', '29', '26', '31', '10', '20', '15'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('32', '14', '21', '25', '20', '17', '29')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('32', '14', '21', '25', '20', '17', '29'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('27', '23', '34', '25', '32', '21', '22')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('27', '23', '34', '25', '32', '21', '22'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '31', '23', '28', '34', '14', '26')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '31', '23', '28', '34', '14', '26'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('23', '31', '13', '32', '20', '21', '33')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('23', '31', '13', '32', '20', '21', '33'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('24', '32', '15', '11', '34', '13', '22')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('24', '32', '15', '11', '34', '13', '22'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('20', '21', '10', '23', '17', '16', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('20', '21', '10', '23', '17', '16', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('16', '26', '19', '33', '31', '29', '14')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('16', '26', '19', '33', '31', '29', '14'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('22', '23', '26', '11', '31', '13', '27')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('22', '23', '26', '11', '31', '13', '27'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('13', '33', '23', '24', '19', '10', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('13', '33', '23', '24', '19', '10', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('18', '15', '27', '23', '30', '32', '13')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('18', '15', '27', '23', '30', '32', '13'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('22', '27', '25', '26', '24', '10', '19')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('22', '27', '25', '26', '24', '10', '19'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('33', '17', '18', '13', '24', '12', '25')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('33', '17', '18', '13', '24', '12', '25'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('11', '16', '33', '18', '17', '31', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('11', '16', '33', '18', '17', '31', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('31', '24', '10', '12', '30', '21', '22')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('31', '24', '10', '12', '30', '21', '22'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('32', '33', '28', '13', '12', '20', '24')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('32', '33', '28', '13', '12', '20', '24'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('26', '10', '16', '20', '22', '19', '24')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('26', '10', '16', '20', '22', '19', '24'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('22', '21', '24', '20', '30', '34', '31')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('22', '21', '24', '20', '30', '34', '31'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '16', '20', '17', '26', '13', '30')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '16', '20', '17', '26', '13', '30'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('23', '26', '17', '28', '13', '19', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('23', '26', '17', '28', '13', '19', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('14', '10', '11', '15', '30', '12', '26')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('14', '10', '11', '15', '30', '12', '26'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '26', '32', '11', '13', '15', '29')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '26', '32', '11', '13', '15', '29'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('18', '20', '22', '17', '32', '25', '14')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('18', '20', '22', '17', '32', '25', '14'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '19', '16', '12', '24', '21', '29')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '19', '16', '12', '24', '21', '29'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('30', '34', '29', '19', '32', '27', '25')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('30', '34', '29', '19', '32', '27', '25'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('29', '12', '26', '32', '17', '33', '24')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('29', '12', '26', '32', '17', '33', '24'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('30', '31', '20', '17', '34', '33', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('30', '31', '20', '17', '34', '33', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('26', '21', '27', '29', '16', '19', '22')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('26', '21', '27', '29', '16', '19', '22'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '29', '33', '13', '14', '12', '31')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '29', '33', '13', '14', '12', '31'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('10', '33', '34', '17', '23', '13', '15')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('10', '33', '34', '17', '23', '13', '15'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('28', '18', '12', '16', '14', '29', '19')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('28', '18', '12', '16', '14', '29', '19'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('29', '28', '20', '11', '19', '10', '23')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('29', '28', '20', '11', '19', '10', '23'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('10', '29', '34', '15', '28', '16', '22')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('10', '29', '34', '15', '28', '16', '22'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('30', '12', '24', '10', '14', '23', '27')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('30', '12', '24', '10', '14', '23', '27'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('30', '12', '34', '33', '20', '28', '29')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('30', '12', '34', '33', '20', '28', '29'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('15', '19', '17', '18', '30', '28', '25')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('15', '19', '17', '18', '30', '28', '25'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('10', '19', '17', '33', '27', '30', '22')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('10', '19', '17', '33', '27', '30', '22'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('23', '32', '34', '24', '31', '13', '11')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('23', '32', '34', '24', '31', '13', '11'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('29', '14', '18', '10', '22', '21', '33')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('29', '14', '18', '10', '22', '21', '33'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('20', '15', '21', '25', '12', '14', '10')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('20', '15', '21', '25', '12', '14', '10'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('15', '24', '20', '25', '28', '16', '11')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('15', '24', '20', '25', '28', '16', '11'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('19', '13', '24', '30', '31', '27', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('19', '13', '24', '30', '31', '27', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('33', '11', '18', '15', '23', '13', '22')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('33', '11', '18', '15', '23', '13', '22'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('20', '19', '14', '12', '29', '26', '21')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('20', '19', '14', '12', '29', '26', '21'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('20', '32', '14', '19', '12', '30', '25')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('20', '32', '14', '19', '12', '30', '25'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('31', '34', '30', '23', '32', '15', '19')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('31', '34', '30', '23', '32', '15', '19'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('16', '14', '18', '34', '17', '13', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('16', '14', '18', '34', '17', '13', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('16', '17', '11', '24', '32', '15', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('16', '17', '11', '24', '32', '15', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('22', '20', '17', '27', '18', '15', '13')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('22', '20', '17', '27', '18', '15', '13'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('12', '21', '20', '29', '34', '11', '15')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('12', '21', '20', '29', '34', '11', '15'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('22', '17', '25', '24', '21', '32', '26')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('22', '17', '25', '24', '21', '32', '26'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('32', '20', '10', '24', '19', '14', '26')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('32', '20', '10', '24', '19', '14', '26'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('26', '19', '24', '21', '18', '34', '29')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('26', '19', '24', '21', '18', '34', '29'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('24', '19', '34', '14', '13', '30', '23')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('24', '19', '34', '14', '13', '30', '23'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('19', '17', '33', '30', '22', '25', '15')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('19', '17', '33', '30', '22', '25', '15'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('31', '17', '26', '19', '24', '15', '18')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('31', '17', '26', '19', '24', '15', '18'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '27', '30', '11', '31', '23', '32')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '27', '30', '11', '31', '23', '32'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('19', '23', '17', '31', '30', '14', '32')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('19', '23', '17', '31', '30', '14', '32'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('24', '29', '26', '32', '13', '27', '17')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('24', '29', '26', '32', '13', '27', '17'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('27', '11', '21', '33', '12', '23', '15')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('27', '11', '21', '33', '12', '23', '15'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('24', '27', '11', '29', '32', '33', '22')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('24', '27', '11', '29', '32', '33', '22'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '25', '31', '26', '13', '19', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '25', '31', '26', '13', '19', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '31', '28', '10', '22', '26', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '31', '28', '10', '22', '26', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('29', '14', '22', '33', '13', '17', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('29', '14', '22', '33', '13', '17', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('33', '31', '11', '29', '15', '14', '16')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('33', '31', '11', '29', '15', '14', '16'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('28', '13', '27', '33', '23', '22', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('28', '13', '27', '33', '23', '22', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('25', '10', '18', '32', '31', '24', '33')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('25', '10', '18', '32', '31', '24', '33'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('13', '17', '22', '32', '26', '14', '29')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('13', '17', '22', '32', '26', '14', '29'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('34', '32', '28', '31', '19', '20', '11')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('34', '32', '28', '31', '19', '20', '11'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('33', '19', '34', '22', '26', '24', '30')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('33', '19', '34', '22', '26', '24', '30'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('34', '26', '33', '15', '32', '29', '16')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('34', '26', '33', '15', '32', '29', '16'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('18', '11', '16', '12', '28', '22', '32')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('18', '11', '16', '12', '28', '22', '32'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('27', '10', '29', '34', '25', '21', '32')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('27', '10', '29', '34', '25', '21', '32'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('20', '17', '11', '33', '25', '13', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('20', '17', '11', '33', '25', '13', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('19', '32', '26', '15', '18', '31', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('19', '32', '26', '15', '18', '31', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('27', '24', '26', '11', '13', '21', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('27', '24', '26', '11', '13', '21', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('24', '13', '31', '34', '22', '11', '23')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('24', '13', '31', '34', '22', '11', '23'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('27', '18', '19', '31', '17', '32', '23')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('27', '18', '19', '31', '17', '32', '23'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('10', '21', '16', '25', '18', '14', '23')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('10', '21', '16', '25', '18', '14', '23'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('15', '24', '34', '33', '20', '11', '14')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('15', '24', '34', '33', '20', '11', '14'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('33', '22', '29', '28', '14', '18', '25')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('33', '22', '29', '28', '14', '18', '25'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('27', '24', '19', '25', '32', '16', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('27', '24', '19', '25', '32', '16', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('23', '15', '10', '17', '12', '13', '33')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('23', '15', '10', '17', '12', '13', '33'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '22', '24', '13', '20', '30', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '22', '24', '13', '20', '30', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('31', '15', '18', '14', '13', '23', '24')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('31', '15', '18', '14', '13', '23', '24'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('20', '31', '14', '26', '17', '23', '10')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('20', '31', '14', '26', '17', '23', '10'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('26', '15', '12', '11', '30', '21', '32')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('26', '15', '12', '11', '30', '21', '32'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('29', '17', '31', '20', '15', '13', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('29', '17', '31', '20', '15', '13', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('29', '13', '32', '11', '18', '10', '24')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('29', '13', '32', '11', '18', '10', '24'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer_tpch_0_1
 			WHERE SUBSTR(c_phone, 1, 2) IN ('19', '32', '14', '18', '13', '16', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer_tpch_0_1
 								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('19', '32', '14', '18', '13', '16', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders_tpch_0_1
 								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;
