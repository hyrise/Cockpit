SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;

---

SELECT ca_zip, sum(cs_sales_price)
FROM catalog_sales_tpcds_1, customer_tpcds_1, customer_address_tpcds_1, date_dim_tpcds_1
WHERE cs_bill_customer_tpcds_1_sk = c_customer_tpcds_1_sk
		AND c_current_addr_sk = ca_address_sk
		AND (SUBSTR(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348',
																																	'81792')
							OR ca_state IN ('CA', 'WA', 'GA')
							OR cs_sales_price > 500)
		AND cs_sold_date_sk = d_date_sk
		AND d_qoy = 2
		AND d_year = 2001
GROUP BY ca_zip
ORDER BY ca_zip
LIMIT 100;
