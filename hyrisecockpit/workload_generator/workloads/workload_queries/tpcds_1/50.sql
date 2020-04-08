SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;

---

SELECT s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip,
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 30)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 60)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 90)
														AND (sr_returned_date_sk - ss_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (sr_returned_date_sk - ss_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM store_tpcds_1_sales, store_tpcds_1_returns, store_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2
WHERE d2.d_year = 2001
		AND d2.d_moy = 8
		AND ss_ticket_number = sr_ticket_number
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_sold_date_sk = d1.d_date_sk
		AND sr_returned_date_sk = d2.d_date_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_store_tpcds_1_sk = s_store_tpcds_1_sk
GROUP BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
ORDER BY s_store_tpcds_1_name, s_company_id, s_street_number, s_street_name, s_street_type, s_suite_number, s_city,
	s_county, s_state, s_zip
LIMIT 100;
