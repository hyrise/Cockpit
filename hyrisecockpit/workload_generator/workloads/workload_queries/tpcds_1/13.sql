SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;

---

SELECT AVG(SS_QUANTITY), AVG(SS_EXT_SALES_PRICE), AVG(SS_EXT_WHOLESALE_COST), SUM(SS_EXT_WHOLESALE_COST)
FROM STORE_SALES, STORE, CUSTOMER_DEMOGRAPHICS, HOUSEHOLD_DEMOGRAPHICS, CUSTOMER_ADDRESS, DATE_DIM
WHERE S_STORE_SK = SS_STORE_SK
		AND SS_SOLD_DATE_SK = D_DATE_SK
		AND D_YEAR = 2001 AND((SS_HDEMO_SK = HD_DEMO_SK
																									AND CD_DEMO_SK = SS_CDEMO_SK
																									AND CD_MARITAL_STATUS = 'M'
																									AND CD_EDUCATION_STATUS = 'Advanced Degree'
																									AND SS_SALES_PRICE BETWEEN 100.00 AND 150.00
																									AND HD_DEP_COUNT = 3)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'S'
																												AND CD_EDUCATION_STATUS = 'College'
																												AND SS_SALES_PRICE BETWEEN 50.00 AND 100.00
																												AND HD_DEP_COUNT = 1)
																								OR (SS_HDEMO_SK = HD_DEMO_SK
																												AND CD_DEMO_SK = SS_CDEMO_SK
																												AND CD_MARITAL_STATUS = 'W'
																												AND CD_EDUCATION_STATUS = '2 yr Degree'
																												AND SS_SALES_PRICE BETWEEN 150.00 AND 200.00
																												AND HD_DEP_COUNT = 1)) AND((SS_ADDR_SK = CA_ADDRESS_SK
																																																								AND CA_COUNTRY = 'United States'
																																																								AND CA_STATE IN ('TX',
																																																																							'OH', 'TX')
																																																								AND SS_NET_PROFIT BETWEEN 100 AND 200)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('OR',
																																																																										'NM', 'KY')
																																																											AND SS_NET_PROFIT BETWEEN 150 AND 300)
																																																							OR (SS_ADDR_SK = CA_ADDRESS_SK
																																																											AND CA_COUNTRY = 'United States'
																																																											AND CA_STATE IN ('VA',
																																																																										'TX', 'MS')
																																																											AND SS_NET_PROFIT BETWEEN 50 AND 250)) ;
