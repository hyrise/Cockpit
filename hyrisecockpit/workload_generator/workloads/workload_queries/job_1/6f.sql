SELECT MIN(k.keyword_job_1) AS movie_keyword_job_1, MIN(n.name_job_1) AS actor_name_job_1, MIN(t.title_job_1) AS hero_movie
FROM cast_info_job_1 AS ci, keyword_job_1 AS k, movie_keyword_job_1 AS mk, name_job_1 AS n, title_job_1 AS t
WHERE k.keyword_job_1 IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special',
																					'fight', 'violence')
		AND t.production_year > 2000
		AND k.id = mk.keyword_job_1_id
		AND t.id = mk.movie_id
		AND t.id = ci.movie_id
		AND ci.movie_id = mk.movie_id
		AND n.id = ci.person_id;
