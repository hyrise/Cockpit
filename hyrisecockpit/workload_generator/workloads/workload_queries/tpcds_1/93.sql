SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;

---

SELECT ss_customer_tpcds_1_sk, sum(act_sales) sumsales
FROM
		(SELECT ss_item_tpcds_1_sk, ss_ticket_number, ss_customer_tpcds_1_sk,
				CASE
								WHEN sr_return_quantity IS NOT NULL THEN (ss_quantity - sr_return_quantity) * ss_sales_price
								ELSE (ss_quantity * ss_sales_price)
				END act_sales
			FROM store_tpcds_1_sales
			LEFT OUTER JOIN store_tpcds_1_returns ON (sr_item_tpcds_1_sk = ss_item_tpcds_1_sk
																																					AND sr_ticket_number = ss_ticket_number) ,reason_tpcds_1
			WHERE sr_reason_tpcds_1_sk = r_reason_tpcds_1_sk
					AND r_reason_tpcds_1_desc = 'reason_tpcds_1 28') t
GROUP BY ss_customer_tpcds_1_sk
ORDER BY sumsales, ss_customer_tpcds_1_sk
LIMIT 100;
