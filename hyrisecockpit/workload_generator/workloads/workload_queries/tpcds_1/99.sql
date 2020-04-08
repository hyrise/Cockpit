SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;

---

SELECT w_substr, sm_type, cc_name,
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk <= 30) THEN 1
									ELSE 0
					END) AS "30 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 30)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 60) THEN 1
									ELSE 0
					END) AS "31-60 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 60)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 90) THEN 1
									ELSE 0
					END) AS "61-90 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 90)
														AND (cs_ship_date_sk - cs_sold_date_sk <= 120) THEN 1
									ELSE 0
					END) AS "91-120 days",
	sum(CASE
									WHEN (cs_ship_date_sk - cs_sold_date_sk > 120) THEN 1
									ELSE 0
					END) AS ">120 days"
FROM catalog_sales_tpcds_1,
		(SELECT SUBSTR(w_warehouse_tpcds_1_name, 1, 20) w_substr, *
			FROM warehouse_tpcds_1) AS sq1, ship_mode_tpcds_1,
	call_center_tpcds_1, date_dim_tpcds_1
WHERE d_month_seq BETWEEN 1200 AND 1200 + 11
		AND cs_ship_date_sk = d_date_sk
		AND cs_warehouse_tpcds_1_sk = w_warehouse_tpcds_1_sk
		AND cs_ship_mode_tpcds_1_sk = sm_ship_mode_tpcds_1_sk
		AND cs_call_center_tpcds_1_sk = cc_call_center_tpcds_1_sk
GROUP BY w_substr, sm_type, cc_name
ORDER BY w_substr, sm_type, cc_name
LIMIT 100;
