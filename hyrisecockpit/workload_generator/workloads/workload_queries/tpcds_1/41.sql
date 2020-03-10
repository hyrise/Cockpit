SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;

---

SELECT DISTINCT(I_PRODUCT_NAME)
FROM ITEM I1
WHERE I_MANUFACT_ID BETWEEN 738 AND 738 + 40
		AND
				(SELECT COUNT(*) AS ITEM_CNT
					FROM ITEM
					WHERE (I_MANUFACT = I1.I_MANUFACT
												AND ((I_CATEGORY = 'Women'
																		AND (I_COLOR = 'powder'
																							OR I_COLOR = 'khaki')
																		AND (I_UNITS = 'Ounce'
																							OR I_UNITS = 'Oz')
																		AND (I_SIZE = 'medium'
																							OR I_SIZE = 'extra large'))
																	OR (I_CATEGORY = 'Women'
																					AND (I_COLOR = 'brown'
																										OR I_COLOR = 'honeydew')
																					AND (I_UNITS = 'Bunch'
																										OR I_UNITS = 'Ton')
																					AND (I_SIZE = 'N/A'
																										OR I_SIZE = 'small'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'floral'
																										OR I_COLOR = 'deep')
																					AND (I_UNITS = 'N/A'
																										OR I_UNITS = 'Dozen')
																					AND (I_SIZE = 'petite'
																										OR I_SIZE = 'petite'))
																	OR (I_CATEGORY = 'Men'
																					AND (I_COLOR = 'light'
																										OR I_COLOR = 'cornflower')
																					AND (I_UNITS = 'Box'
																										OR I_UNITS = 'Pound')
																					AND (I_SIZE = 'medium'
																										OR I_SIZE = 'extra large'))))
							OR (I_MANUFACT = I1.I_MANUFACT
											AND ((I_CATEGORY = 'Women'
																	AND (I_COLOR = 'midnight'
																						OR I_COLOR = 'snow')
																	AND (I_UNITS = 'Pallet'
																						OR I_UNITS = 'Gross')
																	AND (I_SIZE = 'medium'
																						OR I_SIZE = 'extra large'))
																OR (I_CATEGORY = 'Women'
																				AND (I_COLOR = 'cyan'
																									OR I_COLOR = 'papaya')
																				AND (I_UNITS = 'Cup'
																									OR I_UNITS = 'Dram')
																				AND (I_SIZE = 'N/A'
																									OR I_SIZE = 'small'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'orange'
																									OR I_COLOR = 'frosted')
																				AND (I_UNITS = 'Each'
																									OR I_UNITS = 'Tbl')
																				AND (I_SIZE = 'petite'
																									OR I_SIZE = 'petite'))
																OR (I_CATEGORY = 'Men'
																				AND (I_COLOR = 'forest'
																									OR I_COLOR = 'ghost')
																				AND (I_UNITS = 'Lb'
																									OR I_UNITS = 'Bundle')
																				AND (I_SIZE = 'medium'
																									OR I_SIZE = 'extra large'))))) > 0
ORDER BY I_PRODUCT_NAME
LIMIT 100;
