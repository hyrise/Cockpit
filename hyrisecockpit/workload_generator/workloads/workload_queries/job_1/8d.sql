SELECT MIN(an1.name_job_1) AS costume_designer_pseudo, MIN(t.title_job_1) AS movie_with_costumes
FROM aka_name_job_1 AS an1, cast_info_job_1 AS ci, company_name_job_1 AS cn, movie_companies_job_1 AS mc, name_job_1 AS n1, role_type_job_1 AS rt,
	title_job_1 AS t
WHERE cn.country_code = '[us]'
		AND rt.role = 'costume designer'
		AND an1.person_id = n1.id
		AND n1.id = ci.person_id
		AND ci.movie_id = t.id
		AND t.id = mc.movie_id
		AND mc.company_id = cn.id
		AND ci.role_id = rt.id
		AND an1.person_id = ci.person_id
		AND ci.movie_id = mc.movie_id;
