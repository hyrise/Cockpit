SELECT MIN(an.name) AS alternative_name, MIN(chn.name) AS voiced_character_name, MIN(n.name) AS voicing_actress,
	MIN(t.title) AS american_movie
FROM aka_name_job_1 AS an, char_name_job_1 AS chn, cast_info_job_1 AS ci, company_name_job_1 AS cn, movie_companies_job_1 AS mc, name_job_1 AS n,
	role_type AS rt, title_job_1 AS t
WHERE ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)',
																			'(voice: English version)')
		AND cn.country_code = '[us]'
		AND n.gender = 'f'
		AND n.name LIKE '%An%'
		AND rt.role = 'actress'
		AND ci.movie_id = t.id
		AND t.id = mc.movie_id
		AND ci.movie_id = mc.movie_id
		AND mc.company_id = cn.id
		AND ci.role_id = rt.id
		AND n.id = ci.person_id
		AND chn.id = ci.person_role_id
		AND an.person_id = n.id
		AND an.person_id = ci.person_id;