SELECT MIN(chn.name_job_1) AS CHARACTER, MIN(t.title_job_1) AS movie_with_american_producer
FROM char_name_job_1 AS chn, cast_info_job_1 AS ci, company_name_job_1 AS cn, company_type_job_1 AS ct, movie_companies_job_1 AS mc,
	role_type_job_1 AS rt, title_job_1 AS t
WHERE ci.note LIKE '%(producer)%'
		AND cn.country_code = '[us]'
		AND t.production_year > 1990
		AND t.id = mc.movie_id
		AND t.id = ci.movie_id
		AND ci.movie_id = mc.movie_id
		AND chn.id = ci.person_role_id
		AND rt.id = ci.role_id
		AND cn.id = mc.company_id
		AND ct.id = mc.company_type_job_1_id;
