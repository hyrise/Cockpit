SELECT MIN(cn.name_job_1) AS company_name_job_1, MIN(lt.link) AS link_type_job_1, MIN(t.title_job_1) AS western_follow_up
FROM company_name_job_1 AS cn, company_type_job_1 AS ct, keyword_job_1 AS k, link_type_job_1 AS lt, movie_companies_job_1 AS mc, movie_info_job_1 AS mi,
	movie_keyword_job_1 AS mk, movie_link_job_1 AS ml, title_job_1 AS t
WHERE cn.country_code != '[pl]'
		AND (cn.name_job_1 LIKE '%Film%'
							OR cn.name_job_1 LIKE '%Warner%')
		AND ct.kind = 'production companies'
		AND k.keyword_job_1 = 'sequel'
		AND lt.link LIKE '%follow%'
		AND mc.note IS NULL
		AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German',
																			'English')
		AND t.production_year BETWEEN 1950 AND 2010
		AND lt.id = ml.link_type_job_1_id
		AND ml.movie_id = t.id
		AND t.id = mk.movie_id
		AND mk.keyword_job_1_id = k.id
		AND t.id = mc.movie_id
		AND mc.company_type_job_1_id = ct.id
		AND mc.company_id = cn.id
		AND mi.movie_id = t.id
		AND ml.movie_id = mk.movie_id
		AND ml.movie_id = mc.movie_id
		AND mk.movie_id = mc.movie_id
		AND ml.movie_id = mi.movie_id
		AND mk.movie_id = mi.movie_id
		AND mc.movie_id = mi.movie_id;
