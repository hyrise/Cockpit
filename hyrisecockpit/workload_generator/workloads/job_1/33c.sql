SELECT MIN(cn1.name) AS first_company, MIN(cn2.name) AS second_company, MIN(mi_idx1.info) AS first_rating,
	MIN(mi_idx2.info) AS second_rating, MIN(t1.title) AS first_movie, MIN(t2.title) AS second_movie
FROM company_name_job_1 AS cn1, company_name_job_1 AS cn2, info_type_job_1 AS it1, info_type_job_1 AS it2, kind_type_job_1 AS kt1,
	kind_type AS kt2, link_type_job_1 AS lt, movie_companies_job_1 AS mc1, movie_companies_job_1 AS mc2,
	movie_info_idx AS mi_idx1, movie_info_idx_job_1 AS mi_idx2, movie_link_job_1 AS ml, title_job_1 AS t1, title_job_1 AS t2
WHERE cn1.country_code != '[us]'
		AND it1.info = 'rating'
		AND it2.info = 'rating'
		AND kt1.kind IN ('tv series', 'episode')
		AND kt2.kind IN ('tv series', 'episode')
		AND lt.link IN ('sequel', 'follows', 'followed by')
		AND mi_idx2.info < '3.5'
		AND t2.production_year BETWEEN 2000 AND 2010
		AND lt.id = ml.link_type_id
		AND t1.id = ml.movie_id
		AND t2.id = ml.linked_movie_id
		AND it1.id = mi_idx1.info_type_id
		AND t1.id = mi_idx1.movie_id
		AND kt1.id = t1.kind_id
		AND cn1.id = mc1.company_id
		AND t1.id = mc1.movie_id
		AND ml.movie_id = mi_idx1.movie_id
		AND ml.movie_id = mc1.movie_id
		AND mi_idx1.movie_id = mc1.movie_id
		AND it2.id = mi_idx2.info_type_id
		AND t2.id = mi_idx2.movie_id
		AND kt2.id = t2.kind_id
		AND cn2.id = mc2.company_id
		AND t2.id = mc2.movie_id
		AND ml.linked_movie_id = mi_idx2.movie_id
		AND ml.linked_movie_id = mc2.movie_id
		AND mi_idx2.movie_id = mc2.movie_id;
