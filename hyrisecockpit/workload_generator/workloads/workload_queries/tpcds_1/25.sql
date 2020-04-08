SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;

---

SELECT i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name, sum(ss_net_profit) AS store_tpcds_1_sales_profit,
	sum(sr_net_loss) AS store_tpcds_1_returns_loss, sum(cs_net_profit) AS catalog_sales_tpcds_1_profit
FROM store_tpcds_1_sales, store_tpcds_1_returns, catalog_sales_tpcds_1, date_dim_tpcds_1 d1, date_dim_tpcds_1 d2, date_dim_tpcds_1 d3, store_tpcds_1, item_tpcds_1
WHERE d1.d_moy = 4
		AND d1.d_year = 2001
		AND d1.d_date_sk = ss_sold_date_sk
		AND i_item_tpcds_1_sk = ss_item_tpcds_1_sk
		AND s_store_tpcds_1_sk = ss_store_tpcds_1_sk
		AND ss_customer_tpcds_1_sk = sr_customer_tpcds_1_sk
		AND ss_item_tpcds_1_sk = sr_item_tpcds_1_sk
		AND ss_ticket_number = sr_ticket_number
		AND sr_returned_date_sk = d2.d_date_sk
		AND d2.d_moy BETWEEN 4 AND 10
		AND d2.d_year = 2001
		AND sr_customer_tpcds_1_sk = cs_bill_customer_tpcds_1_sk
		AND sr_item_tpcds_1_sk = cs_item_tpcds_1_sk
		AND cs_sold_date_sk = d3.d_date_sk
		AND d3.d_moy BETWEEN 4 AND 10
		AND d3.d_year = 2001
GROUP BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
ORDER BY i_item_tpcds_1_id, i_item_tpcds_1_desc, s_store_tpcds_1_id, s_store_tpcds_1_name
LIMIT 100;
