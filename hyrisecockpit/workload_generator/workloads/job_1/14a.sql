SELECT MIN(mi_idx.info) AS rating, MIN(t.title) AS northern_dark_movie
FROM info_type_job_1 AS it1, info_type_job_1 AS it2, keyword_job_1 AS k, kind_type_job_1 AS kt, movie_info_job_1 AS mi,
	movie_info_idx AS mi_idx, movie_keyword_job_1 AS mk, title_job_1 AS t
WHERE it1.info = 'countries'
		AND it2.info = 'rating'
		AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence')
		AND kt.kind = 'movie'
		AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German',
																			'USA', 'American')
		AND mi_idx.info < '8.5'
		AND t.production_year > 2010
		AND kt.id = t.kind_id
		AND t.id = mi.movie_id
		AND t.id = mk.movie_id
		AND t.id = mi_idx.movie_id
		AND mk.movie_id = mi.movie_id
		AND mk.movie_id = mi_idx.movie_id
		AND mi.movie_id = mi_idx.movie_id
		AND k.id = mk.keyword_id
		AND it1.id = mi.info_type_id
		AND it2.id = mi_idx.info_type_id;
