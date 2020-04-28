SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name) AS writer,
	MIN(t.title) AS violent_liongate_movie
FROM cast_info_job_1 AS ci, company_name_job_1 AS cn, info_type_job_1 AS it1, info_type_job_1 AS it2, keyword_job_1 AS k,
	movie_companies AS mc, movie_info_job_1 AS mi, movie_info_idx_job_1 AS mi_idx, movie_keyword_job_1 AS mk, name_job_1 AS n, title_job_1 AS t
WHERE ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)')
		AND cn.name LIKE 'Lionsgate%'
		AND it1.info = 'genres'
		AND it2.info = 'votes'
		AND k.keyword IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital')
		AND mi.info IN ('Horror', 'Thriller')
		AND n.gender = 'm'
		AND t.id = mi.movie_id
		AND t.id = mi_idx.movie_id
		AND t.id = ci.movie_id
		AND t.id = mk.movie_id
		AND t.id = mc.movie_id
		AND ci.movie_id = mi.movie_id
		AND ci.movie_id = mi_idx.movie_id
		AND ci.movie_id = mk.movie_id
		AND ci.movie_id = mc.movie_id
		AND mi.movie_id = mi_idx.movie_id
		AND mi.movie_id = mk.movie_id
		AND mi.movie_id = mc.movie_id
		AND mi_idx.movie_id = mk.movie_id
		AND mi_idx.movie_id = mc.movie_id
		AND mk.movie_id = mc.movie_id
		AND n.id = ci.person_id
		AND it1.id = mi.info_type_id
		AND it2.id = mi_idx.info_type_id
		AND k.id = mk.keyword_id
		AND cn.id = mc.company_id;
