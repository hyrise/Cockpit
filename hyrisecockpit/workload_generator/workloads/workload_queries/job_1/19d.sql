SELECT MIN(n.name_job_1) AS voicing_actress, MIN(t.title_job_1) AS jap_engl_voiced_movie
FROM aka_name_job_1 AS an, char_name_job_1 AS chn, cast_info_job_1 AS ci, company_name_job_1 AS cn, info_type_job_1 AS it,
	movie_companies_job_1 AS mc, movie_info_job_1 AS mi, name_job_1 AS n, role_type_job_1 AS rt, title_job_1 AS t
WHERE ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)',
																			'(voice: English version)')
		AND cn.country_code = '[us]'
		AND it.info = 'release dates'
		AND n.gender = 'f'
		AND rt.role = 'actress'
		AND t.production_year > 2000
		AND t.id = mi.movie_id
		AND t.id = mc.movie_id
		AND t.id = ci.movie_id
		AND mc.movie_id = ci.movie_id
		AND mc.movie_id = mi.movie_id
		AND mi.movie_id = ci.movie_id
		AND cn.id = mc.company_id
		AND it.id = mi.info_type_job_1_id
		AND n.id = ci.person_id
		AND rt.id = ci.role_id
		AND n.id = an.person_id
		AND ci.person_id = an.person_id
		AND chn.id = ci.person_role_id;
