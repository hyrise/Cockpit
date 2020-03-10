SELECT MIN(CHN.NAME) AS CHARACTER_NAME, MIN(MI_IDX.INFO) AS RATING, MIN(N.NAME) AS PLAYING_ACTOR,
	MIN(T.TITLE) AS COMPLETE_HERO_MOVIE
FROM COMPLETE_CAST AS CC, COMP_CAST_TYPE AS CCT1, COMP_CAST_TYPE AS CCT2, CHAR_NAME AS CHN, CAST_INFO AS CI,
	INFO_TYPE AS IT2, KEYWORD AS K, KIND_TYPE AS KT, MOVIE_INFO_IDX AS MI_IDX, MOVIE_KEYWORD AS MK, NAME AS N,
	TITLE AS T
WHERE CCT1.KIND = 'cast'
		AND CCT2.KIND LIKE '%complete%'
		AND CHN.NAME IS NOT NULL
		AND (CHN.NAME LIKE '%man%'
							OR CHN.NAME LIKE '%Man%')
		AND IT2.INFO = 'rating'
		AND K.KEYWORD IN ('superhero', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence',
																					'magnet', 'web', 'claw', 'laser')
		AND KT.KIND = 'movie'
		AND MI_IDX.INFO > '7.0'
		AND T.PRODUCTION_YEAR > 2000
		AND KT.ID = T.KIND_ID
		AND T.ID = MK.MOVIE_ID
		AND T.ID = CI.MOVIE_ID
		AND T.ID = CC.MOVIE_ID
		AND T.ID = MI_IDX.MOVIE_ID
		AND MK.MOVIE_ID = CI.MOVIE_ID
		AND MK.MOVIE_ID = CC.MOVIE_ID
		AND MK.MOVIE_ID = MI_IDX.MOVIE_ID
		AND CI.MOVIE_ID = CC.MOVIE_ID
		AND CI.MOVIE_ID = MI_IDX.MOVIE_ID
		AND CC.MOVIE_ID = MI_IDX.MOVIE_ID
		AND CHN.ID = CI.PERSON_ROLE_ID
		AND N.ID = CI.PERSON_ID
		AND K.ID = MK.KEYWORD_ID
		AND CCT1.ID = CC.SUBJECT_ID
		AND CCT2.ID = CC.STATUS_ID
		AND IT2.ID = MI_IDX.INFO_TYPE_ID;
