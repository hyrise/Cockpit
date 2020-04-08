WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;

---

WITH sr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(sr_return_quantity) sr_item_tpcds_1_qty
			FROM store_tpcds_1_returns, item_tpcds_1, date_dim_tpcds_1
			WHERE sr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND sr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	cr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(cr_return_quantity) cr_item_tpcds_1_qty
			FROM catalog_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE cr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND cr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id),
	wr_item_tpcds_1s AS
		(SELECT i_item_tpcds_1_id item_tpcds_1_id, sum(wr_return_quantity) wr_item_tpcds_1_qty
			FROM web_returns_tpcds_1, item_tpcds_1, date_dim_tpcds_1
			WHERE wr_item_tpcds_1_sk = i_item_tpcds_1_sk
					AND d_date IN
							(SELECT d_date
								FROM date_dim_tpcds_1
								WHERE d_week_seq IN
												(SELECT d_week_seq
													FROM date_dim_tpcds_1
													WHERE d_date IN ('2000-06-30', '2000-09-27', '2000-11-17')))
					AND wr_returned_date_sk = d_date_sk
			GROUP BY i_item_tpcds_1_id)
SELECT sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty,
	(sr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 sr_dev, cr_item_tpcds_1_qty,
	(cr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 cr_dev, wr_item_tpcds_1_qty,
	(wr_item_tpcds_1_qty * 1.0000) / (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0000 * 100 wr_dev, (sr_item_tpcds_1_qty + cr_item_tpcds_1_qty + wr_item_tpcds_1_qty) / 3.0 average
FROM sr_item_tpcds_1s, cr_item_tpcds_1s, wr_item_tpcds_1s
WHERE sr_item_tpcds_1s.item_tpcds_1_id = cr_item_tpcds_1s.item_tpcds_1_id
		AND sr_item_tpcds_1s.item_tpcds_1_id = wr_item_tpcds_1s.item_tpcds_1_id
ORDER BY sr_item_tpcds_1s.item_tpcds_1_id, sr_item_tpcds_1_qty
LIMIT 100;
