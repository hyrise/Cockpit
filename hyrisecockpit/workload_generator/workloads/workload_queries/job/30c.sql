SELECT MIN(MI.INFO) AS MOVIE_BUDGET, MIN(MI_IDX.INFO) AS MOVIE_VOTES, MIN(N.NAME) AS WRITER,
	MIN(T.TITLE) AS COMPLETE_VIOLENT_MOVIE
FROM COMPLETE_CAST AS CC, COMP_CAST_TYPE AS CCT1, COMP_CAST_TYPE AS CCT2, CAST_INFO AS CI, INFO_TYPE AS IT1,
	INFO_TYPE AS IT2, KEYWORD AS K, MOVIE_INFO AS MI, MOVIE_INFO_IDX AS MI_IDX, MOVIE_KEYWORD AS MK, NAME AS N,
	TITLE AS T
WHERE CCT1.KIND = 'cast'
		AND CCT2.KIND = 'complete+verified'
		AND CI.NOTE IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)')
		AND IT1.INFO = 'genres'
		AND IT2.INFO = 'votes'
		AND K.KEYWORD IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital')
		AND MI.INFO IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War')
		AND N.GENDER = 'm'
		AND T.ID = MI.MOVIE_ID
		AND T.ID = MI_IDX.MOVIE_ID
		AND T.ID = CI.MOVIE_ID
		AND T.ID = MK.MOVIE_ID
		AND T.ID = CC.MOVIE_ID
		AND CI.MOVIE_ID = MI.MOVIE_ID
		AND CI.MOVIE_ID = MI_IDX.MOVIE_ID
		AND CI.MOVIE_ID = MK.MOVIE_ID
		AND CI.MOVIE_ID = CC.MOVIE_ID
		AND MI.MOVIE_ID = MI_IDX.MOVIE_ID
		AND MI.MOVIE_ID = MK.MOVIE_ID
		AND MI.MOVIE_ID = CC.MOVIE_ID
		AND MI_IDX.MOVIE_ID = MK.MOVIE_ID
		AND MI_IDX.MOVIE_ID = CC.MOVIE_ID
		AND MK.MOVIE_ID = CC.MOVIE_ID
		AND N.ID = CI.PERSON_ID
		AND IT1.ID = MI.INFO_TYPE_ID
		AND IT2.ID = MI_IDX.INFO_TYPE_ID
		AND K.ID = MK.KEYWORD_ID
		AND CCT1.ID = CC.SUBJECT_ID
		AND CCT2.ID = CC.STATUS_ID;
