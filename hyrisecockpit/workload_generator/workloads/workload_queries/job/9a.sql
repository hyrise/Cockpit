SELECT MIN(AN.NAME) AS ALTERNATIVE_NAME, MIN(CHN.NAME) AS CHARACTER_NAME, MIN(T.TITLE) AS MOVIE
FROM AKA_NAME AS AN, CHAR_NAME AS CHN, CAST_INFO AS CI, COMPANY_NAME AS CN, MOVIE_COMPANIES AS MC, NAME AS N,
	ROLE_TYPE AS RT, TITLE AS T
WHERE CI.NOTE IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)',
																			'(voice: English version)')
		AND CN.COUNTRY_CODE = '[us]'
		AND MC.NOTE IS NOT NULL
		AND (MC.NOTE LIKE '%(USA)%'
							OR MC.NOTE LIKE '%(worldwide)%')
		AND N.GENDER = 'f'
		AND N.NAME LIKE '%Ang%'
		AND RT.ROLE = 'actress'
		AND T.PRODUCTION_YEAR BETWEEN 2005 AND 2015
		AND CI.MOVIE_ID = T.ID
		AND T.ID = MC.MOVIE_ID
		AND CI.MOVIE_ID = MC.MOVIE_ID
		AND MC.COMPANY_ID = CN.ID
		AND CI.ROLE_ID = RT.ID
		AND N.ID = CI.PERSON_ID
		AND CHN.ID = CI.PERSON_ROLE_ID
		AND AN.PERSON_ID = N.ID
		AND AN.PERSON_ID = CI.PERSON_ID;
