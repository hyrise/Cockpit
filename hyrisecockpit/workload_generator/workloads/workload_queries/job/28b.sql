SELECT MIN(CN.NAME) AS MOVIE_COMPANY, MIN(MI_IDX.INFO) AS RATING, MIN(T.TITLE) AS COMPLETE_EURO_DARK_MOVIE
FROM COMPLETE_CAST AS CC, COMP_CAST_TYPE AS CCT1, COMP_CAST_TYPE AS CCT2, COMPANY_NAME AS CN, COMPANY_TYPE AS CT,
	INFO_TYPE AS IT1, INFO_TYPE AS IT2, KEYWORD AS K, KIND_TYPE AS KT, MOVIE_COMPANIES AS MC, MOVIE_INFO AS MI,
	MOVIE_INFO_IDX AS MI_IDX, MOVIE_KEYWORD AS MK, TITLE AS T
WHERE CCT1.KIND = 'crew'
		AND CCT2.KIND != 'complete+verified'
		AND CN.COUNTRY_CODE != '[us]'
		AND IT1.INFO = 'countries'
		AND IT2.INFO = 'rating'
		AND K.KEYWORD IN ('murder', 'murder-in-title', 'blood', 'violence')
		AND KT.KIND IN ('movie', 'episode')
		AND MC.NOTE NOT LIKE '%(USA)%'
		AND MC.NOTE LIKE '%(200%)%'
		AND MI.INFO IN ('Sweden', 'Germany', 'Swedish', 'German')
		AND MI_IDX.INFO > '6.5'
		AND T.PRODUCTION_YEAR > 2005
		AND KT.ID = T.KIND_ID
		AND T.ID = MI.MOVIE_ID
		AND T.ID = MK.MOVIE_ID
		AND T.ID = MI_IDX.MOVIE_ID
		AND T.ID = MC.MOVIE_ID
		AND T.ID = CC.MOVIE_ID
		AND MK.MOVIE_ID = MI.MOVIE_ID
		AND MK.MOVIE_ID = MI_IDX.MOVIE_ID
		AND MK.MOVIE_ID = MC.MOVIE_ID
		AND MK.MOVIE_ID = CC.MOVIE_ID
		AND MI.MOVIE_ID = MI_IDX.MOVIE_ID
		AND MI.MOVIE_ID = MC.MOVIE_ID
		AND MI.MOVIE_ID = CC.MOVIE_ID
		AND MC.MOVIE_ID = MI_IDX.MOVIE_ID
		AND MC.MOVIE_ID = CC.MOVIE_ID
		AND MI_IDX.MOVIE_ID = CC.MOVIE_ID
		AND K.ID = MK.KEYWORD_ID
		AND IT1.ID = MI.INFO_TYPE_ID
		AND IT2.ID = MI_IDX.INFO_TYPE_ID
		AND CT.ID = MC.COMPANY_TYPE_ID
		AND CN.ID = MC.COMPANY_ID
		AND CCT1.ID = CC.SUBJECT_ID
		AND CCT2.ID = CC.STATUS_ID;
