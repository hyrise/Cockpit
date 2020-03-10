SELECT MIN(T.TITLE) AS MOVIE_TITLE
FROM KEYWORD AS K, MOVIE_INFO AS MI, MOVIE_KEYWORD AS MK, TITLE AS T
WHERE K.KEYWORD LIKE '%sequel%'
		AND MI.INFO IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German',
																			'USA', 'American')
		AND T.PRODUCTION_YEAR > 1990
		AND T.ID = MI.MOVIE_ID
		AND T.ID = MK.MOVIE_ID
		AND MK.MOVIE_ID = MI.MOVIE_ID
		AND K.ID = MK.KEYWORD_ID;
