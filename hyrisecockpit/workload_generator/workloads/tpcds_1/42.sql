SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;

---

SELECT dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category, sum(ss_ext_sales_price)
FROM date_dim_tpcds_1 dt, store_sales_tpcds_1, item_tpcds_1
 WHERE dt.d_date_sk = store_sales_tpcds_1.ss_sold_date_sk
		AND store_sales_tpcds_1.ss_item_sk = item_tpcds_1.i_item_sk
		AND item_tpcds_1.i_manager_id = 1
		AND dt.d_moy = 11
		AND dt.d_year = 2000
GROUP BY dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
ORDER BY sum(ss_ext_sales_price) DESC,dt.d_year, item_tpcds_1.i_category_id, item_tpcds_1.i_category
LIMIT 100 ;
