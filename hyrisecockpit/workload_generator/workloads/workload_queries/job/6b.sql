SELECT MIN(K.KEYWORD) AS MOVIE_KEYWORD, MIN(N.NAME) AS ACTOR_NAME, MIN(T.TITLE) AS HERO_MOVIE
FROM CAST_INFO AS CI, KEYWORD AS K, MOVIE_KEYWORD AS MK, NAME AS N, TITLE AS T
WHERE K.KEYWORD IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special',
																					'fight', 'violence')
		AND N.NAME LIKE '%Downey%Robert%'
		AND T.PRODUCTION_YEAR > 2014
		AND K.ID = MK.KEYWORD_ID
		AND T.ID = MK.MOVIE_ID
		AND T.ID = CI.MOVIE_ID
		AND CI.MOVIE_ID = MK.MOVIE_ID
		AND N.ID = CI.PERSON_ID;
