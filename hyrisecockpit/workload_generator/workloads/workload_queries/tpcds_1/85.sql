SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;

---

SELECT SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
FROM web_sales_tpcds_1, web_returns_tpcds_1, web_page_tpcds_1, customer_demographics_tpcds_1 cd1, customer_demographics_tpcds_1 cd2,
	customer_address_tpcds_1, date_dim_tpcds_1, reason_tpcds_1
WHERE ws_web_page_tpcds_1_sk = wp_web_page_tpcds_1_sk
		AND ws_item_tpcds_1_sk = wr_item_tpcds_1_sk
		AND ws_order_number = wr_order_number
		AND ws_sold_date_sk = d_date_sk
		AND d_year = 2000
		AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
		AND cd2.cd_demo_sk = wr_returning_cdemo_sk
		AND ca_address_sk = wr_refunded_addr_sk
		AND r_reason_tpcds_1_sk = wr_reason_tpcds_1_sk
		AND ((cd1.cd_marital_status = 'M'
								AND cd1.cd_marital_status = cd2.cd_marital_status
								AND cd1.cd_education_status = 'Advanced Degree'
								AND cd1.cd_education_status = cd2.cd_education_status
								AND ws_sales_price BETWEEN 100.00 AND 150.00)
							OR (cd1.cd_marital_status = 'S'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = 'College'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 50.00 AND 100.00)
							OR (cd1.cd_marital_status = 'W'
											AND cd1.cd_marital_status = cd2.cd_marital_status
											AND cd1.cd_education_status = '2 yr Degree'
											AND cd1.cd_education_status = cd2.cd_education_status
											AND ws_sales_price BETWEEN 150.00 AND 200.00))
		AND ((ca_country = 'United States'
								AND ca_state IN ('IN', 'OH', 'NJ')
								AND ws_net_profit BETWEEN 100 AND 200)
							OR (ca_country = 'United States'
											AND ca_state IN ('WI', 'CT', 'KY')
											AND ws_net_profit BETWEEN 150 AND 300)
							OR (ca_country = 'United States'
											AND ca_state IN ('LA', 'IA', 'AR')
											AND ws_net_profit BETWEEN 50 AND 250))
GROUP BY r_reason_tpcds_1_desc
ORDER BY SUBSTR(r_reason_tpcds_1_desc, 1, 20), avg(ws_quantity), avg(wr_refunded_cash), avg(wr_fee)
LIMIT 100;
