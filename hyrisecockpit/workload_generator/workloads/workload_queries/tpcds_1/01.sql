WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;

---

WITH customer_tpcds_1_total_return AS
		(SELECT sr_customer_tpcds_1_sk AS ctr_customer_tpcds_1_sk, sr_store_tpcds_1_sk AS ctr_store_tpcds_1_sk, sum(sr_return_amt) AS ctr_total_return
			FROM store_tpcds_1_returns, date_dim_tpcds_1
			WHERE sr_returned_date_sk = d_date_sk
					AND d_year = 2000
			GROUP BY sr_customer_tpcds_1_sk, sr_store_tpcds_1_sk)
SELECT c_customer_tpcds_1_id
FROM customer_tpcds_1_total_return ctr1, store_tpcds_1, customer_tpcds_1
WHERE ctr1.ctr_total_return >
				(SELECT avg(ctr_total_return) * 1.2
					FROM customer_tpcds_1_total_return ctr2
					WHERE ctr1.ctr_store_tpcds_1_sk = ctr2.ctr_store_tpcds_1_sk)
		AND s_store_tpcds_1_sk = ctr1.ctr_store_tpcds_1_sk
		AND s_state = 'TN'
		AND ctr1.ctr_customer_tpcds_1_sk = c_customer_tpcds_1_sk
ORDER BY c_customer_tpcds_1_id
LIMIT 100;
