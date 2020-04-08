SELECT MIN(t.title_job_1) AS movie_title_job_1
FROM keyword_job_1 AS k, movie_info_job_1 AS mi, movie_keyword_job_1 AS mk, title_job_1 AS t
WHERE k.keyword_job_1 LIKE '%sequel%'
		AND mi.info IN ('Bulgaria')
		AND t.production_year > 2010
		AND t.id = mi.movie_id
		AND t.id = mk.movie_id
		AND mk.movie_id = mi.movie_id
		AND k.id = mk.keyword_job_1_id;
