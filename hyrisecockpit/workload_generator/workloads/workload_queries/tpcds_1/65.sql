SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;

---

SELECT s_store_tpcds_1_name, i_item_tpcds_1_desc, sc.revenue, i_current_price, i_wholesale_cost, i_brand
FROM store_tpcds_1, item_tpcds_1,

		(SELECT ss_store_tpcds_1_sk, avg(revenue) AS ave
			FROM
					(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
						FROM store_tpcds_1_sales, date_dim_tpcds_1
						WHERE ss_sold_date_sk = d_date_sk
								AND d_month_seq BETWEEN 1176 AND 1176 + 11
						GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sa
			GROUP BY ss_store_tpcds_1_sk) sb,

		(SELECT ss_store_tpcds_1_sk, ss_item_tpcds_1_sk, sum(ss_sales_price) AS revenue
			FROM store_tpcds_1_sales, date_dim_tpcds_1
			WHERE ss_sold_date_sk = d_date_sk
					AND d_month_seq BETWEEN 1176 AND 1176 + 11
			GROUP BY ss_store_tpcds_1_sk, ss_item_tpcds_1_sk) sc
WHERE sb.ss_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND sc.revenue <= 0.1 * sb.ave
		AND s_store_tpcds_1_sk = sc.ss_store_tpcds_1_sk
		AND i_item_tpcds_1_sk = sc.ss_item_tpcds_1_sk
ORDER BY s_store_tpcds_1_name, i_item_tpcds_1_desc
LIMIT 100;
