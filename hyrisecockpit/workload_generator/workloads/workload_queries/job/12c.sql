SELECT MIN(CN.NAME) AS MOVIE_COMPANY, MIN(MI_IDX.INFO) AS RATING, MIN(T.TITLE) AS MAINSTREAM_MOVIE
FROM COMPANY_NAME AS CN, COMPANY_TYPE AS CT, INFO_TYPE AS IT1, INFO_TYPE AS IT2, MOVIE_COMPANIES AS MC,
	MOVIE_INFO AS MI, MOVIE_INFO_IDX AS MI_IDX, TITLE AS T
WHERE CN.COUNTRY_CODE = '[us]'
		AND CT.KIND = 'production companies'
		AND IT1.INFO = 'genres'
		AND IT2.INFO = 'rating'
		AND MI.INFO IN ('Drama', 'Horror', 'Western', 'Family')
		AND MI_IDX.INFO > '7.0'
		AND T.PRODUCTION_YEAR BETWEEN 2000 AND 2010
		AND T.ID = MI.MOVIE_ID
		AND T.ID = MI_IDX.MOVIE_ID
		AND MI.INFO_TYPE_ID = IT1.ID
		AND MI_IDX.INFO_TYPE_ID = IT2.ID
		AND T.ID = MC.MOVIE_ID
		AND CT.ID = MC.COMPANY_TYPE_ID
		AND CN.ID = MC.COMPANY_ID
		AND MC.MOVIE_ID = MI.MOVIE_ID
		AND MC.MOVIE_ID = MI_IDX.MOVIE_ID
		AND MI.MOVIE_ID = MI_IDX.MOVIE_ID;
