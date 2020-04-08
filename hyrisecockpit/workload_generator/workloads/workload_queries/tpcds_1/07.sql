SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;

---

SELECT i_item_tpcds_1_id, avg(ss_quantity) agg1, avg(ss_list_price) agg2, avg(ss_coupon_amt) agg3,
	avg(ss_sales_price) agg4
FROM store_tpcds_1_sales, customer_demographics_tpcds_1, date_dim_tpcds_1, item_tpcds_1, promotion_tpcds_1
WHERE ss_sold_date_sk = d_date_sk
		AND ss_item_tpcds_1_sk = i_item_tpcds_1_sk
		AND ss_cdemo_sk = cd_demo_sk
		AND ss_promo_sk = p_promo_sk
		AND cd_gender = 'M'
		AND cd_marital_status = 'S'
		AND cd_education_status = 'College'
		AND (p_channel_email = 'N'
							OR p_channel_event = 'N')
		AND d_year = 2000
GROUP BY i_item_tpcds_1_id
ORDER BY i_item_tpcds_1_id
LIMIT 100;
