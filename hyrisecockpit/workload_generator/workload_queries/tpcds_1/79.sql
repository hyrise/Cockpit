SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;

---

SELECT c_last_name, c_first_name, SUBSTR(s_city, 1, 30), ss_ticket_number, amt, profit
FROM
		(SELECT ss_ticket_number, ss_customer_sk, store_tpcds_1.s_city, sum(ss_coupon_amt) amt, sum(ss_net_profit) profit
			FROM store_sales_tpcds_1, date_dim_tpcds_1, store_tpcds_1, household_demographics_tpcds_1
 			WHERE store_sales_tpcds_1.ss_sold_date_sk = date_dim_tpcds_1.d_date_sk
					AND store_sales_tpcds_1.ss_store_sk = store_tpcds_1.s_store_sk
					AND store_sales_tpcds_1.ss_hdemo_sk = household_demographics_tpcds_1.hd_demo_sk
					AND (household_demographics_tpcds_1.hd_dep_count = 6
										OR household_demographics_tpcds_1.hd_vehicle_count > 2)
					AND date_dim_tpcds_1.d_dow = 1
					AND date_dim_tpcds_1.d_year IN (1999, 1999 + 1, 1999 + 2)
					AND store_tpcds_1.s_number_employees BETWEEN 200 AND 295
			GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, store_tpcds_1.s_city) ms, customer_tpcds_1
 WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, SUBSTR(s_city,
																																						1, 30), profit
LIMIT 100;
