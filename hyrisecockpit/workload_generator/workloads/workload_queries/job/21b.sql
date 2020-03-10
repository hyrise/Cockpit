SELECT MIN(CN.NAME) AS COMPANY_NAME, MIN(LT.LINK) AS LINK_TYPE, MIN(T.TITLE) AS GERMAN_FOLLOW_UP
FROM COMPANY_NAME AS CN, COMPANY_TYPE AS CT, KEYWORD AS K, LINK_TYPE AS LT, MOVIE_COMPANIES AS MC, MOVIE_INFO AS MI,
	MOVIE_KEYWORD AS MK, MOVIE_LINK AS ML, TITLE AS T
WHERE CN.COUNTRY_CODE != '[pl]'
		AND (CN.NAME LIKE '%Film%'
							OR CN.NAME LIKE '%Warner%')
		AND CT.KIND = 'production companies'
		AND K.KEYWORD = 'sequel'
		AND LT.LINK LIKE '%follow%'
		AND MC.NOTE IS NULL
		AND MI.INFO IN ('Germany', 'German')
		AND T.PRODUCTION_YEAR BETWEEN 2000 AND 2010
		AND LT.ID = ML.LINK_TYPE_ID
		AND ML.MOVIE_ID = T.ID
		AND T.ID = MK.MOVIE_ID
		AND MK.KEYWORD_ID = K.ID
		AND T.ID = MC.MOVIE_ID
		AND MC.COMPANY_TYPE_ID = CT.ID
		AND MC.COMPANY_ID = CN.ID
		AND MI.MOVIE_ID = T.ID
		AND ML.MOVIE_ID = MK.MOVIE_ID
		AND ML.MOVIE_ID = MC.MOVIE_ID
		AND MK.MOVIE_ID = MC.MOVIE_ID
		AND ML.MOVIE_ID = MI.MOVIE_ID
		AND MK.MOVIE_ID = MI.MOVIE_ID
		AND MC.MOVIE_ID = MI.MOVIE_ID;
