SELECT MIN(k.keyword) AS movie_keyword_job_1, MIN(n.name) AS actor_name, MIN(t.title) AS marvel_movie
FROM cast_info_job_1 AS ci, keyword_job_1 AS k, movie_keyword_job_1 AS mk, name_job_1 AS n, title_job_1 AS t
WHERE k.keyword = 'marvel-cinematic-universe'
		AND n.name LIKE '%Downey%Robert%'
		AND t.production_year > 2010
		AND k.id = mk.keyword_id
		AND t.id = mk.movie_id
		AND t.id = ci.movie_id
		AND ci.movie_id = mk.movie_id
		AND n.id = ci.person_id;
