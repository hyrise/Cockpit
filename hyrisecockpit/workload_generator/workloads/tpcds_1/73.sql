SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;

---

SELECT c_last_name, c_first_name, c_salutation, c_preferred_cust_flag, ss_ticket_number, cnt
FROM
		(SELECT ss_ticket_number, ss_customer_sk, count(*) cnt
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND date_dim_tpcds_1.d_dom BETWEEN 1 AND 2
					AND (household_demographics_tpcds_1.hd_buy_potential = 'Unknown'
										OR household_demographics_tpcds_1.hd_buy_potential = '>10000')
					AND household_demographics_tpcds_1.hd_vehicle_count > 0
					AND CASE
													WHEN household_demographics_tpcds_1.hd_vehicle_count > 0 THEN household_demographics_tpcds_1.hd_dep_count / household_demographics_tpcds_1.hd_vehicle_count
													ELSE NULL
									END > 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_county IN ('Orange County', 'Bronx County', 'Franklin Parish', 'Williamson County')
			GROUP BY ss_ticket_number, ss_customer_sk) dj, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
		AND cnt BETWEEN 1 AND 5
ORDER BY cnt DESC, c_last_name ASC;
