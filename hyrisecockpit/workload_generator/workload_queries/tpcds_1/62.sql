SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;

---

SELECT w_substr, sm_type, web_name,
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 30)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 60)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 90)
														AND (ws_ship_date_sk - ws_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (ws_ship_date_sk - ws_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM web_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) sq1, ship_mode_tpcds_1,
	web_site_tpcds_1, date_dim_tpcds_1
 WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND ws_ship_date_sk = d_date_sk
		AND ws_warehouse_sk = w_warehouse_sk
		AND ws_ship_mode_sk = sm_ship_mode_sk
		AND ws_web_site_sk = web_site_sk
GROUP BY w_substr, sm_type, web_name
ORDER BY w_substr, sm_type, web_name
LIMIT 100;
