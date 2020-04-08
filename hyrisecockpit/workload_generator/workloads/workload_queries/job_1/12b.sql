SELECT MIN(mi.info) AS budget, MIN(t.title_job_1) AS unsuccsessful_movie
FROM company_name_job_1 AS cn, company_type_job_1 AS ct, info_type_job_1 AS it1, info_type_job_1 AS it2, movie_companies_job_1 AS mc,
	movie_info_job_1 AS mi, movie_info_job_1_idx AS mi_idx, title_job_1 AS t
WHERE cn.country_code = '[us]'
		AND ct.kind IS NOT NULL
		AND (ct.kind = 'production companies'
							OR ct.kind = 'distributors')
		AND it1.info = 'budget'
		AND it2.info = 'bottom 10 rank'
		AND t.production_year > 2000
		AND (t.title_job_1 LIKE 'Birdemic%'
							OR t.title_job_1 LIKE '%Movie%')
		AND t.id = mi.movie_id
		AND t.id = mi_idx.movie_id
		AND mi.info_type_job_1_id = it1.id
		AND mi_idx.info_type_job_1_id = it2.id
		AND t.id = mc.movie_id
		AND ct.id = mc.company_type_job_1_id
		AND cn.id = mc.company_id
		AND mc.movie_id = mi.movie_id
		AND mc.movie_id = mi_idx.movie_id
		AND mi.movie_id = mi_idx.movie_id;
