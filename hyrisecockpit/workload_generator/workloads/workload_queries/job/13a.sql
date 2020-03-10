SELECT MIN(MI.INFO) AS RELEASE_DATE, MIN(MIIDX.INFO) AS RATING, MIN(T.TITLE) AS GERMAN_MOVIE
FROM COMPANY_NAME AS CN, COMPANY_TYPE AS CT, INFO_TYPE AS IT, INFO_TYPE AS IT2, KIND_TYPE AS KT,
	MOVIE_COMPANIES AS MC, MOVIE_INFO AS MI, MOVIE_INFO_IDX AS MIIDX, TITLE AS T
WHERE CN.COUNTRY_CODE = '[de]'
		AND CT.KIND = 'production companies'
		AND IT.INFO = 'rating'
		AND IT2.INFO = 'release dates'
		AND KT.KIND = 'movie'
		AND MI.MOVIE_ID = T.ID
		AND IT2.ID = MI.INFO_TYPE_ID
		AND KT.ID = T.KIND_ID
		AND MC.MOVIE_ID = T.ID
		AND CN.ID = MC.COMPANY_ID
		AND CT.ID = MC.COMPANY_TYPE_ID
		AND MIIDX.MOVIE_ID = T.ID
		AND IT.ID = MIIDX.INFO_TYPE_ID
		AND MI.MOVIE_ID = MIIDX.MOVIE_ID
		AND MI.MOVIE_ID = MC.MOVIE_ID
		AND MIIDX.MOVIE_ID = MC.MOVIE_ID;
