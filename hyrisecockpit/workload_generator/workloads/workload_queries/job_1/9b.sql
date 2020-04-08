SELECT MIN(an.name_job_1) AS alternative_name_job_1, MIN(chn.name_job_1) AS voiced_character, MIN(n.name_job_1) AS voicing_actress,
	MIN(t.title_job_1) AS american_movie
FROM aka_name_job_1 AS an, char_name_job_1 AS chn, cast_info_job_1 AS ci, company_name_job_1 AS cn, movie_companies_job_1 AS mc, name_job_1 AS n,
	role_type_job_1 AS rt, title_job_1 AS t
WHERE ci.note = '(voice)'
		AND cn.country_code = '[us]'
		AND mc.note LIKE '%(200%)%'
		AND (mc.note LIKE '%(USA)%'
							OR mc.note LIKE '%(worldwide)%')
		AND n.gender = 'f'
		AND n.name_job_1 LIKE '%Angel%'
		AND rt.role = 'actress'
		AND t.production_year BETWEEN 2007 AND 2010
		AND ci.movie_id = t.id
		AND t.id = mc.movie_id
		AND ci.movie_id = mc.movie_id
		AND mc.company_id = cn.id
		AND ci.role_id = rt.id
		AND n.id = ci.person_id
		AND chn.id = ci.person_role_id
		AND an.person_id = n.id
		AND an.person_id = ci.person_id;
