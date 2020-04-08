SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;

---

SELECT ca_state, cd_gender, cd_marital_status, cd_dep_count, count(*) cnt1, min(cd_dep_count),
	max(cd_dep_count), avg(cd_dep_count), cd_dep_employed_count, count(*) cnt2, min(cd_dep_employed_count),
	max(cd_dep_employed_count), avg(cd_dep_employed_count), cd_dep_college_count, count(*) cnt3,
	min(cd_dep_college_count), max(cd_dep_college_count), avg(cd_dep_college_count)
FROM customer_tpcds_1 c, customer_address_tpcds_1 ca, customer_demographics_tpcds_1
WHERE c.c_current_addr_sk = ca.ca_address_sk
		AND cd_demo_sk = c.c_current_cdemo_sk
		AND EXISTS
				(SELECT *
					FROM store_tpcds_1_sales, date_dim_tpcds_1
					WHERE c.c_customer_tpcds_1_sk = ss_customer_tpcds_1_sk
							AND ss_sold_date_sk = d_date_sk
							AND d_year = 2002
							AND d_qoy < 4)
		AND (EXISTS
									(SELECT *
										FROM web_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = ws_bill_customer_tpcds_1_sk
												AND ws_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4)
							OR EXISTS
									(SELECT *
										FROM catalog_sales_tpcds_1, date_dim_tpcds_1
										WHERE c.c_customer_tpcds_1_sk = cs_ship_customer_tpcds_1_sk
												AND cs_sold_date_sk = d_date_sk
												AND d_year = 2002
												AND d_qoy < 4))
GROUP BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
ORDER BY ca_state, cd_gender, cd_marital_status, cd_dep_count, cd_dep_employed_count, cd_dep_college_count
LIMIT 100;
