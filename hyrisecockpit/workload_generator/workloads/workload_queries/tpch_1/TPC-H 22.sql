SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('33', '14', '27', '22', '18', '24', '31')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('33', '14', '27', '22', '18', '24', '31'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '31', '33', '25', '28', '16', '20')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '31', '33', '25', '28', '16', '20'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('31', '11', '23', '13', '18', '19', '24')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('31', '11', '23', '13', '18', '19', '24'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('30', '13', '20', '19', '24', '31', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('30', '13', '20', '19', '24', '31', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('14', '15', '24', '11', '18', '31', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('14', '15', '24', '11', '18', '31', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('11', '25', '20', '31', '23', '15', '18')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('11', '25', '20', '31', '23', '15', '18'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('11', '15', '14', '20', '23', '16', '13')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('11', '15', '14', '20', '23', '16', '13'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('34', '18', '25', '30', '10', '32', '31')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('34', '18', '25', '30', '10', '32', '31'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('12', '32', '21', '23', '18', '15', '31')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('12', '32', '21', '23', '18', '15', '31'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '27', '29', '14', '11', '24', '21')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '27', '29', '14', '11', '24', '21'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('18', '26', '15', '17', '27', '20', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('18', '26', '15', '17', '27', '20', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('18', '10', '22', '12', '34', '19', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('18', '10', '22', '12', '34', '19', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('12', '20', '31', '29', '32', '17', '16')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('12', '20', '31', '29', '32', '17', '16'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('18', '14', '25', '27', '21', '17', '30')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('18', '14', '25', '27', '21', '17', '30'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '27', '20', '18', '28', '30', '33')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '27', '20', '18', '28', '30', '33'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('26', '33', '28', '32', '14', '15', '29')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('26', '33', '28', '32', '14', '15', '29'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('14', '12', '25', '28', '21', '10', '30')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('14', '12', '25', '28', '21', '10', '30'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('23', '28', '20', '24', '17', '18', '26')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('23', '28', '20', '24', '17', '18', '26'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('32', '10', '26', '13', '33', '11', '15')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('32', '10', '26', '13', '33', '11', '15'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('15', '17', '19', '13', '23', '14', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('15', '17', '19', '13', '23', '14', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('27', '16', '20', '28', '32', '14', '31')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('27', '16', '20', '28', '32', '14', '31'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('12', '33', '17', '34', '32', '10', '29')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('12', '33', '17', '34', '32', '10', '29'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '10', '22', '24', '33', '18', '13')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '10', '22', '24', '33', '18', '13'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '34', '28', '12', '33', '15', '11')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '34', '28', '12', '33', '15', '11'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('14', '16', '30', '29', '18', '13', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('14', '16', '30', '29', '18', '13', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('32', '31', '22', '19', '25', '13', '33')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('32', '31', '22', '19', '25', '13', '33'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '12', '25', '28', '20', '11', '30')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '12', '25', '28', '20', '11', '30'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('10', '23', '15', '29', '30', '34', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('10', '23', '15', '29', '30', '34', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('26', '31', '33', '28', '27', '12', '11')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('26', '31', '33', '28', '27', '12', '11'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('29', '31', '24', '23', '22', '34', '18')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('29', '31', '24', '23', '22', '34', '18'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('34', '15', '14', '20', '13', '25', '11')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('34', '15', '14', '20', '13', '25', '11'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('19', '21', '27', '10', '11', '13', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('19', '21', '27', '10', '11', '13', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('24', '30', '29', '12', '23', '18', '21')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('24', '30', '29', '12', '23', '18', '21'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('20', '22', '16', '13', '21', '27', '31')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('20', '22', '16', '13', '21', '27', '31'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '22', '18', '17', '11', '23', '20')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '22', '18', '17', '11', '23', '20'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '15', '31', '30', '26', '12', '16')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '15', '31', '30', '26', '12', '16'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '30', '17', '25', '24', '11', '20')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '30', '17', '25', '24', '11', '20'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('32', '11', '20', '21', '30', '23', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('32', '11', '20', '21', '30', '23', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('25', '29', '31', '13', '16', '11', '33')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('25', '29', '31', '13', '16', '11', '33'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('22', '14', '11', '23', '21', '24', '29')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('22', '14', '11', '23', '21', '24', '29'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('11', '12', '34', '17', '15', '14', '32')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('11', '12', '34', '17', '15', '14', '32'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('31', '11', '26', '14', '33', '10', '30')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('31', '11', '26', '14', '33', '10', '30'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '34', '26', '32', '31', '15', '14')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '34', '26', '32', '31', '15', '14'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('18', '27', '30', '17', '11', '23', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('18', '27', '30', '17', '11', '23', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('34', '29', '20', '15', '25', '23', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('34', '29', '20', '15', '25', '23', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('15', '14', '32', '31', '22', '34', '30')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('15', '14', '32', '31', '22', '34', '30'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('11', '16', '26', '19', '10', '22', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('11', '16', '26', '19', '10', '22', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('17', '14', '28', '12', '27', '24', '21')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('17', '14', '28', '12', '27', '24', '21'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('31', '19', '28', '25', '26', '13', '27')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('31', '19', '28', '25', '26', '13', '27'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('28', '33', '31', '15', '20', '10', '32')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('28', '33', '31', '15', '20', '10', '32'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('30', '28', '16', '14', '21', '34', '22')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('30', '28', '16', '14', '21', '34', '22'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('24', '30', '31', '10', '20', '33', '27')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('24', '30', '31', '10', '20', '33', '27'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('30', '31', '17', '32', '13', '22', '15')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('30', '31', '17', '32', '13', '22', '15'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('33', '28', '14', '16', '24', '11', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('33', '28', '14', '16', '24', '11', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('22', '13', '19', '16', '29', '30', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('22', '13', '19', '16', '29', '30', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('19', '15', '21', '24', '22', '29', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('19', '15', '21', '24', '22', '29', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('10', '26', '16', '12', '22', '33', '17')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('10', '26', '16', '12', '22', '33', '17'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('30', '17', '16', '25', '19', '21', '18')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('30', '17', '16', '25', '19', '21', '18'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('25', '33', '11', '17', '31', '32', '16')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('25', '33', '11', '17', '31', '32', '16'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('32', '13', '19', '20', '16', '11', '17')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('32', '13', '19', '20', '16', '11', '17'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('20', '23', '14', '32', '31', '19', '21')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('20', '23', '14', '32', '31', '19', '21'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('12', '18', '19', '14', '21', '30', '26')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('12', '18', '19', '14', '21', '30', '26'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('29', '25', '21', '26', '30', '22', '18')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('29', '25', '21', '26', '30', '22', '18'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('19', '27', '23', '12', '18', '11', '21')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('19', '27', '23', '12', '18', '11', '21'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('33', '19', '11', '12', '28', '14', '31')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('33', '19', '11', '12', '28', '14', '31'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('34', '12', '24', '21', '16', '14', '18')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('34', '12', '24', '21', '16', '14', '18'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('25', '24', '13', '15', '14', '33', '31')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('25', '24', '13', '15', '14', '33', '31'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('32', '17', '27', '23', '19', '33', '24')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('32', '17', '27', '23', '19', '33', '24'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('18', '28', '34', '32', '26', '15', '17')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('18', '28', '34', '32', '26', '15', '17'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('15', '19', '23', '33', '34', '13', '14')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('15', '19', '23', '33', '34', '13', '14'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('32', '27', '19', '13', '16', '18', '14')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('32', '27', '19', '13', '16', '18', '14'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('32', '14', '21', '11', '23', '20', '27')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('32', '14', '21', '11', '23', '20', '27'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('26', '31', '34', '15', '14', '19', '16')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('26', '31', '34', '15', '14', '19', '16'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '29', '17', '15', '23', '31', '26')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '29', '17', '15', '23', '31', '26'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('27', '16', '11', '33', '31', '15', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('27', '16', '11', '33', '31', '15', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('15', '14', '28', '21', '29', '13', '22')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('15', '14', '28', '21', '29', '13', '22'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('26', '21', '14', '13', '28', '25', '16')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('26', '21', '14', '13', '28', '25', '16'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '27', '20', '11', '26', '16', '17')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '27', '20', '11', '26', '16', '17'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('13', '29', '14', '11', '24', '18', '19')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('13', '29', '14', '11', '24', '18', '19'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('15', '17', '18', '16', '21', '31', '32')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('15', '17', '18', '16', '21', '31', '32'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('22', '12', '28', '20', '24', '31', '33')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('22', '12', '28', '20', '24', '31', '33'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('20', '11', '17', '32', '12', '22', '25')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('20', '11', '17', '32', '12', '22', '25'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('12', '30', '22', '17', '14', '24', '31')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('12', '30', '22', '17', '14', '24', '31'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('20', '12', '24', '25', '19', '15', '32')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('20', '12', '24', '25', '19', '15', '32'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('10', '17', '34', '30', '27', '15', '33')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('10', '17', '34', '30', '27', '15', '33'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('23', '15', '29', '24', '10', '20', '26')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('23', '15', '29', '24', '10', '20', '26'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('34', '17', '11', '25', '29', '24', '21')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('34', '17', '11', '25', '29', '24', '21'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('11', '18', '25', '33', '23', '20', '22')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('11', '18', '25', '33', '23', '20', '22'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('11', '31', '21', '25', '12', '17', '28')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('11', '31', '21', '25', '12', '17', '28'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('20', '13', '24', '25', '18', '34', '12')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('20', '13', '24', '25', '18', '34', '12'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('11', '18', '21', '30', '26', '20', '17')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('11', '18', '21', '30', '26', '20', '17'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '15', '25', '32', '28', '24', '16')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '15', '25', '32', '28', '24', '16'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('13', '15', '31', '23', '34', '26', '14')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('13', '15', '31', '23', '34', '26', '14'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('21', '11', '20', '30', '29', '14', '34')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('21', '11', '20', '30', '29', '14', '34'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('34', '13', '20', '14', '12', '24', '16')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('34', '13', '20', '14', '12', '24', '16'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('33', '25', '34', '14', '21', '27', '24')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('33', '25', '34', '14', '21', '27', '24'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('26', '13', '30', '21', '10', '34', '23')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('26', '13', '30', '21', '10', '34', '23'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('18', '19', '21', '12', '26', '25', '27')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('18', '19', '21', '12', '26', '25', '27'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('29', '34', '25', '23', '24', '11', '33')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('29', '34', '25', '23', '24', '11', '33'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;

---

SELECT cntrycode, COUNT(*) AS numcust, SUM(c_acctbal) AS totacctbal
FROM
		(SELECT SUBSTR(c_phone, 1, 2) AS cntrycode, c_acctbal
			FROM customer
			WHERE SUBSTR(c_phone, 1, 2) IN ('13', '14', '18', '33', '31', '21', '15')
					AND c_acctbal >
							(SELECT AVG(c_acctbal)
								FROM customer
								WHERE c_acctbal > 0.00
										AND SUBSTR(c_phone, 1, 2) IN ('13', '14', '18', '33', '31', '21', '15'))
					AND NOT EXISTS
							(SELECT *
								FROM orders
								WHERE o_custkey = c_custkey) ) AS custsale
GROUP BY cntrycode
ORDER BY cntrycode;
