SELECT MIN(an.name_job_1) AS acress_pseudonym, MIN(t.title_job_1) AS japanese_anime_movie
FROM aka_name_job_1 AS an, cast_info_job_1 AS ci, company_name_job_1 AS cn, movie_companies_job_1 AS mc, name_job_1 AS n, role_type_job_1 AS rt,
	title_job_1 AS t
WHERE ci.note = '(voice: English version)'
		AND cn.country_code = '[jp]'
		AND mc.note LIKE '%(Japan)%'
		AND mc.note NOT LIKE '%(USA)%'
		AND (mc.note LIKE '%(2006)%'
							OR mc.note LIKE '%(2007)%')
		AND n.name_job_1 LIKE '%Yo%'
		AND n.name_job_1 NOT LIKE '%Yu%'
		AND rt.role = 'actress'
		AND t.production_year BETWEEN 2006 AND 2007
		AND (t.title_job_1 LIKE 'One Piece%'
							OR t.title_job_1 LIKE 'Dragon Ball Z%')
		AND an.person_id = n.id
		AND n.id = ci.person_id
		AND ci.movie_id = t.id
		AND t.id = mc.movie_id
		AND mc.company_id = cn.id
		AND ci.role_id = rt.id
		AND an.person_id = ci.person_id
		AND ci.movie_id = mc.movie_id;
