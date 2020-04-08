SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_brand_id brand_id, item_tpcds_1.i_brand brand, sum(ss_ext_sales_price) ext_price
FROM date_dim_tpcds_1 dt, store_tpcds_1_sales, item_tpcds_1
WHERE dt.d_date_sk = store_tpcds_1_sales.ss_sold_date_sk
		AND store_tpcds_1_sales.ss_item_tpcds_1_sk = item_tpcds_1.i_item_tpcds_1_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_brand, item_tpcds_1.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100 ;
