SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(t.title_job_1) AS movie_title_job_1
FROM cast_info_job_1 AS ci, info_type_job_1 AS it1, info_type_job_1 AS it2, movie_info_job_1 AS mi, movie_info_job_1_idx AS mi_idx, name_job_1 AS n,
	title_job_1 AS t
WHERE ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)')
		AND it1.info = 'genres'
		AND it2.info = 'votes'
		AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War')
		AND n.gender = 'm'
		AND t.id = mi.movie_id
		AND t.id = mi_idx.movie_id
		AND t.id = ci.movie_id
		AND ci.movie_id = mi.movie_id
		AND ci.movie_id = mi_idx.movie_id
		AND mi.movie_id = mi_idx.movie_id
		AND n.id = ci.person_id
		AND it1.id = mi.info_type_job_1_id
		AND it2.id = mi_idx.info_type_job_1_id;
