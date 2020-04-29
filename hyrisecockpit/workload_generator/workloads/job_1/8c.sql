SELECT MIN(a1.name) AS writer_pseudo_name, MIN(t.title) AS movie_title
FROM aka_name_job_1 AS a1, cast_info_job_1 AS ci, company_name_job_1 AS cn, movie_companies_job_1 AS mc, name_job_1 AS n1, role_type_job_1 AS rt,
	title AS t
WHERE cn.country_code = '[us]'
		AND rt.role = 'writer'
		AND a1.person_id = n1.id
		AND n1.id = ci.person_id
		AND ci.movie_id = t.id
		AND t.id = mc.movie_id
		AND mc.company_id = cn.id
		AND ci.role_id = rt.id
		AND a1.person_id = ci.person_id
		AND ci.movie_id = mc.movie_id;
