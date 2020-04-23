SELECT MIN(lt.link) AS link_type_job_1, MIN(t1.title) AS first_movie, MIN(t2.title) AS second_movie
FROM keyword_job_1 AS k, link_type_job_1 AS lt, movie_keyword_job_1 AS mk, movie_link_job_1 AS ml, title_job_1 AS t1, title_job_1 AS t2
WHERE k.keyword = '10,000-mile-club'
		AND mk.keyword_id = k.id
		AND t1.id = mk.movie_id
		AND ml.movie_id = t1.id
		AND ml.linked_movie_id = t2.id
		AND lt.id = ml.link_type_id
		AND mk.movie_id = t1.id;
