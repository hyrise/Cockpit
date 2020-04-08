SELECT MIN(an1.name_job_1) AS actress_pseudonym, MIN(t.title_job_1) AS japanese_movie_dubbed
FROM aka_name_job_1 AS an1, cast_info_job_1 AS ci, company_name_job_1 AS cn, movie_companies_job_1 AS mc, name_job_1 AS n1, role_type_job_1 AS rt,
	title_job_1 AS t
WHERE ci.note = '(voice: English version)'
		AND cn.country_code = '[jp]'
		AND mc.note LIKE '%(Japan)%'
		AND mc.note NOT LIKE '%(USA)%'
		AND n1.name_job_1 LIKE '%Yo%'
		AND n1.name_job_1 NOT LIKE '%Yu%'
		AND rt.role = 'actress'
		AND an1.person_id = n1.id
		AND n1.id = ci.person_id
		AND ci.movie_id = t.id
		AND t.id = mc.movie_id
		AND mc.company_id = cn.id
		AND ci.role_id = rt.id
		AND an1.person_id = ci.person_id
		AND ci.movie_id = mc.movie_id;
