WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;

---

WITH ssci AS
		(SELECT ss_customer_tpcds_1_sk customer_tpcds_1_sk, ss_item_tpcds_1_sk item_tpcds_1_sk
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY ss_customer_tpcds_1_sk, ss_item_tpcds_1_sk),
	csci AS
		(SELECT cs_bill_customer_tpcds_1_sk customer_tpcds_1_sk,cs_item_tpcds_1_sk item_tpcds_1_sk
			FROM catalog_sales_tpcds_1,date_dim_tpcds_1
			WHERE cs_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1200 AND 1200 + 11
			GROUP BY cs_bill_customer_tpcds_1_sk,cs_item_tpcds_1_sk)
SELECT sum(CASE
															WHEN ssci.customer_tpcds_1_sk IS NOT NULL
																				AND csci.customer_tpcds_1_sk IS NULL THEN 1
															ELSE 0
											END) store_tpcds_1_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) catalog_only,
	sum(CASE
									WHEN ssci.customer_tpcds_1_sk IS NOT NULL
														AND csci.customer_tpcds_1_sk IS NOT NULL THEN 1
									ELSE 0
					END) store_tpcds_1_and_catalog
FROM ssci
FULL OUTER JOIN csci ON (ssci.customer_tpcds_1_sk = csci.customer_tpcds_1_sk
																									AND ssci.item_tpcds_1_sk = csci.item_tpcds_1_sk)
LIMIT 100;
