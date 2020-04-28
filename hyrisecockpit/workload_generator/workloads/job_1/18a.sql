SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(t.title) AS movie_title
FROM cast_info_job_1 AS ci, info_type_job_1 AS it1, info_type_job_1 AS it2, movie_info_job_1 AS mi, movie_info_idx_job_1 AS mi_idx, name_job_1 AS n,
	title AS t
WHERE ci.note IN ('(producer)', '(executive producer)')
		AND it1.info = 'budget'
		AND it2.info = 'votes'
		AND n.gender = 'm'
		AND n.name LIKE '%Tim%'
		AND t.id = mi.movie_id
		AND t.id = mi_idx.movie_id
		AND t.id = ci.movie_id
		AND ci.movie_id = mi.movie_id
		AND ci.movie_id = mi_idx.movie_id
		AND mi.movie_id = mi_idx.movie_id
		AND n.id = ci.person_id
		AND it1.id = mi.info_type_id
		AND it2.id = mi_idx.info_type_id;
