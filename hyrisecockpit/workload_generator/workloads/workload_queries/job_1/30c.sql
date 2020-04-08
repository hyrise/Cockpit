SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name_job_1) AS writer,
	MIN(t.title_job_1) AS complete_violent_movie
FROM complete_cast_job_1 AS cc, comp_cast_type_job_1 AS cct1, comp_cast_type_job_1 AS cct2, cast_info_job_1 AS ci, info_type_job_1 AS it1,
	info_type_job_1 AS it2, keyword_job_1 AS k, movie_info_job_1 AS mi, movie_info_job_1_idx AS mi_idx, movie_keyword_job_1 AS mk, name_job_1 AS n,
	title_job_1 AS t
WHERE cct1.kind = 'cast'
		AND cct2.kind = 'complete+verified'
		AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)')
		AND it1.info = 'genres'
		AND it2.info = 'votes'
		AND k.keyword_job_1 IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital')
		AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War')
		AND n.gender = 'm'
		AND t.id = mi.movie_id
		AND t.id = mi_idx.movie_id
		AND t.id = ci.movie_id
		AND t.id = mk.movie_id
		AND t.id = cc.movie_id
		AND ci.movie_id = mi.movie_id
		AND ci.movie_id = mi_idx.movie_id
		AND ci.movie_id = mk.movie_id
		AND ci.movie_id = cc.movie_id
		AND mi.movie_id = mi_idx.movie_id
		AND mi.movie_id = mk.movie_id
		AND mi.movie_id = cc.movie_id
		AND mi_idx.movie_id = mk.movie_id
		AND mi_idx.movie_id = cc.movie_id
		AND mk.movie_id = cc.movie_id
		AND n.id = ci.person_id
		AND it1.id = mi.info_type_job_1_id
		AND it2.id = mi_idx.info_type_job_1_id
		AND k.id = mk.keyword_job_1_id
		AND cct1.id = cc.subject_id
		AND cct2.id = cc.status_id;
