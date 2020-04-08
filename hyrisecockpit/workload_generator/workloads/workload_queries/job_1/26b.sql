SELECT MIN(chn.name_job_1) AS character_name_job_1, MIN(mi_idx.info) AS rating, MIN(t.title_job_1) AS complete_hero_movie
FROM complete_cast_job_1 AS cc, comp_cast_type_job_1 AS cct1, comp_cast_type_job_1 AS cct2, char_name_job_1 AS chn, cast_info_job_1 AS ci,
	info_type_job_1 AS it2, keyword_job_1 AS k, kind_type_job_1 AS kt, movie_info_job_1_idx AS mi_idx, movie_keyword_job_1 AS mk, name_job_1 AS n,
	title_job_1 AS t
WHERE cct1.kind = 'cast'
		AND cct2.kind LIKE '%complete%'
		AND chn.name_job_1 IS NOT NULL
		AND (chn.name_job_1 LIKE '%man%'
							OR chn.name_job_1 LIKE '%Man%')
		AND it2.info = 'rating'
		AND k.keyword_job_1 IN ('superhero', 'marvel-comics', 'based-on-comic', 'fight')
		AND kt.kind = 'movie'
		AND mi_idx.info > '8.0'
		AND t.production_year > 2005
		AND kt.id = t.kind_id
		AND t.id = mk.movie_id
		AND t.id = ci.movie_id
		AND t.id = cc.movie_id
		AND t.id = mi_idx.movie_id
		AND mk.movie_id = ci.movie_id
		AND mk.movie_id = cc.movie_id
		AND mk.movie_id = mi_idx.movie_id
		AND ci.movie_id = cc.movie_id
		AND ci.movie_id = mi_idx.movie_id
		AND cc.movie_id = mi_idx.movie_id
		AND chn.id = ci.person_role_id
		AND n.id = ci.person_id
		AND k.id = mk.keyword_job_1_id
		AND cct1.id = cc.subject_id
		AND cct2.id = cc.status_id
		AND it2.id = mi_idx.info_type_job_1_id;
