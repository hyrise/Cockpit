SELECT MIN(cn.name_job_1) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title_job_1) AS mainstream_movie
FROM company_name_job_1 AS cn, company_type_job_1 AS ct, info_type_job_1 AS it1, info_type_job_1 AS it2, movie_companies_job_1 AS mc,
	movie_info_job_1 AS mi, movie_info_job_1_idx AS mi_idx, title_job_1 AS t
WHERE cn.country_code = '[us]'
		AND ct.kind = 'production companies'
		AND it1.info = 'genres'
		AND it2.info = 'rating'
		AND mi.info IN ('Drama', 'Horror', 'Western', 'Family')
		AND mi_idx.info > '7.0'
		AND t.production_year BETWEEN 2000 AND 2010
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
