SELECT MIN(CHN.NAME) AS VOICED_CHAR, MIN(N.NAME) AS VOICING_ACTRESS, MIN(T.TITLE) AS VOICED_ANIMATION
FROM AKA_NAME AS AN, COMPLETE_CAST AS CC, COMP_CAST_TYPE AS CCT1, COMP_CAST_TYPE AS CCT2, CHAR_NAME AS CHN,
	CAST_INFO AS CI, COMPANY_NAME AS CN, INFO_TYPE AS IT, INFO_TYPE AS IT3, KEYWORD AS K, MOVIE_COMPANIES AS MC,
	MOVIE_INFO AS MI, MOVIE_KEYWORD AS MK, NAME AS N, PERSON_INFO AS PI, ROLE_TYPE AS RT, TITLE AS T
WHERE CCT1.KIND = 'cast'
		AND CCT2.KIND = 'complete+verified'
		AND CHN.NAME = 'Queen'
		AND CI.NOTE IN ('(voice)', '(voice) (uncredited)', '(voice: English version)')
		AND CN.COUNTRY_CODE = '[us]'
		AND IT.INFO = 'release dates'
		AND IT3.INFO = 'trivia'
		AND K.KEYWORD = 'computer-animation'
		AND MI.INFO IS NOT NULL
		AND (MI.INFO LIKE 'Japan:%200%'
							OR MI.INFO LIKE 'USA:%200%')
		AND N.GENDER = 'f'
		AND N.NAME LIKE '%An%'
		AND RT.ROLE = 'actress'
		AND T.TITLE = 'Shrek 2'
		AND T.PRODUCTION_YEAR BETWEEN 2000 AND 2010
		AND T.ID = MI.MOVIE_ID
		AND T.ID = MC.MOVIE_ID
		AND T.ID = CI.MOVIE_ID
		AND T.ID = MK.MOVIE_ID
		AND T.ID = CC.MOVIE_ID
		AND MC.MOVIE_ID = CI.MOVIE_ID
		AND MC.MOVIE_ID = MI.MOVIE_ID
		AND MC.MOVIE_ID = MK.MOVIE_ID
		AND MC.MOVIE_ID = CC.MOVIE_ID
		AND MI.MOVIE_ID = CI.MOVIE_ID
		AND MI.MOVIE_ID = MK.MOVIE_ID
		AND MI.MOVIE_ID = CC.MOVIE_ID
		AND CI.MOVIE_ID = MK.MOVIE_ID
		AND CI.MOVIE_ID = CC.MOVIE_ID
		AND MK.MOVIE_ID = CC.MOVIE_ID
		AND CN.ID = MC.COMPANY_ID
		AND IT.ID = MI.INFO_TYPE_ID
		AND N.ID = CI.PERSON_ID
		AND RT.ID = CI.ROLE_ID
		AND N.ID = AN.PERSON_ID
		AND CI.PERSON_ID = AN.PERSON_ID
		AND CHN.ID = CI.PERSON_ROLE_ID
		AND N.ID = PI.PERSON_ID
		AND CI.PERSON_ID = PI.PERSON_ID
		AND IT3.ID = PI.INFO_TYPE_ID
		AND K.ID = MK.KEYWORD_ID
		AND CCT1.ID = CC.SUBJECT_ID
		AND CCT2.ID = CC.STATUS_ID;
