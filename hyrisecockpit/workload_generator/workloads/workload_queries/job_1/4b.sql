SELECT MIN(mi_idx.info) AS rating, MIN(t.title_job_1) AS movie_title_job_1
FROM info_type_job_1 AS it, keyword_job_1 AS k, movie_info_job_1_idx AS mi_idx, movie_keyword_job_1 AS mk, title_job_1 AS t
WHERE it.info = 'rating'
		AND k.keyword_job_1 LIKE '%sequel%'
		AND mi_idx.info > '9.0'
		AND t.production_year > 2010
		AND t.id = mi_idx.movie_id
		AND t.id = mk.movie_id
		AND mk.movie_id = mi_idx.movie_id
		AND k.id = mk.keyword_job_1_id
		AND it.id = mi_idx.info_type_job_1_id;
