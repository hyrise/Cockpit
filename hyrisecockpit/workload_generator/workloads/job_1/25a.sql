SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name) AS male_writer,
	MIN(t.title) AS violent_movie_title
FROM cast_info_job_1 AS ci, info_type_job_1 AS it1, info_type_job_1 AS it2, keyword_job_1 AS k, movie_info_job_1 AS mi,
	movie_info_idx AS mi_idx, movie_keyword_job_1 AS mk, name_job_1 AS n, title_job_1 AS t
WHERE ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)')
		AND it1.info = 'genres'
		AND it2.info = 'votes'
		AND k.keyword IN ('murder', 'blood', 'gore', 'death', 'female-nudity')
		AND mi.info = 'Horror'
		AND n.gender = 'm'
		AND t.id = mi.movie_id
		AND t.id = mi_idx.movie_id
		AND t.id = ci.movie_id
		AND t.id = mk.movie_id
		AND ci.movie_id = mi.movie_id
		AND ci.movie_id = mi_idx.movie_id
		AND ci.movie_id = mk.movie_id
		AND mi.movie_id = mi_idx.movie_id
		AND mi.movie_id = mk.movie_id
		AND mi_idx.movie_id = mk.movie_id
		AND n.id = ci.person_id
		AND it1.id = mi.info_type_id
		AND it2.id = mi_idx.info_type_id
		AND k.id = mk.keyword_id;
