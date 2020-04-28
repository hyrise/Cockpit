SELECT MIN(chn.name) AS uncredited_voiced_character, MIN(t.title) AS russian_movie
FROM char_name_job_1 AS chn, cast_info_job_1 AS ci, company_name_job_1 AS cn, company_type_job_1 AS ct, movie_companies_job_1 AS mc,
	role_type AS rt, title_job_1 AS t
WHERE ci.note LIKE '%(voice)%'
		AND ci.note LIKE '%(uncredited)%'
		AND cn.country_code = '[ru]'
		AND rt.role = 'actor'
		AND t.production_year > 2005
		AND t.id = mc.movie_id
		AND t.id = ci.movie_id
		AND ci.movie_id = mc.movie_id
		AND chn.id = ci.person_role_id
		AND rt.id = ci.role_id
		AND cn.id = mc.company_id
		AND ct.id = mc.company_type_id;
