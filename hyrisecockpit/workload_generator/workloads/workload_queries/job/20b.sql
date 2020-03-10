SELECT MIN(T.TITLE) AS COMPLETE_DOWNEY_IRONMAN_MOVIE
FROM COMPLETE_CAST AS CC, COMP_CAST_TYPE AS CCT1, COMP_CAST_TYPE AS CCT2, CHAR_NAME AS CHN, CAST_INFO AS CI,
	KEYWORD AS K, KIND_TYPE AS KT, MOVIE_KEYWORD AS MK, NAME AS N, TITLE AS T
WHERE CCT1.KIND = 'cast'
		AND CCT2.KIND LIKE '%complete%'
		AND CHN.NAME NOT LIKE '%Sherlock%'
		AND (CHN.NAME LIKE '%Tony%Stark%'
							OR CHN.NAME LIKE '%Iron%Man%')
		AND K.KEYWORD IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special',
																					'fight', 'violence')
		AND KT.KIND = 'movie'
		AND N.NAME LIKE '%Downey%Robert%'
		AND T.PRODUCTION_YEAR > 2000
		AND KT.ID = T.KIND_ID
		AND T.ID = MK.MOVIE_ID
		AND T.ID = CI.MOVIE_ID
		AND T.ID = CC.MOVIE_ID
		AND MK.MOVIE_ID = CI.MOVIE_ID
		AND MK.MOVIE_ID = CC.MOVIE_ID
		AND CI.MOVIE_ID = CC.MOVIE_ID
		AND CHN.ID = CI.PERSON_ROLE_ID
		AND N.ID = CI.PERSON_ID
		AND K.ID = MK.KEYWORD_ID
		AND CCT1.ID = CC.SUBJECT_ID
		AND CCT2.ID = CC.STATUS_ID;
