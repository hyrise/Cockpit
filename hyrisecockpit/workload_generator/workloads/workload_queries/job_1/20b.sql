SELECT MIN(t.title_job_1) AS complete_downey_ironman_movie
FROM complete_cast_job_1 AS cc, comp_cast_type_job_1 AS cct1, comp_cast_type_job_1 AS cct2, char_name_job_1 AS chn, cast_info_job_1 AS ci,
	keyword_job_1 AS k, kind_type_job_1 AS kt, movie_keyword_job_1 AS mk, name_job_1 AS n, title_job_1 AS t
WHERE cct1.kind = 'cast'
		AND cct2.kind LIKE '%complete%'
		AND chn.name_job_1 NOT LIKE '%Sherlock%'
		AND (chn.name_job_1 LIKE '%Tony%Stark%'
							OR chn.name_job_1 LIKE '%Iron%Man%')
		AND k.keyword_job_1 IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special',
																					'fight', 'violence')
		AND kt.kind = 'movie'
		AND n.name_job_1 LIKE '%Downey%Robert%'
		AND t.production_year > 2000
		AND kt.id = t.kind_id
		AND t.id = mk.movie_id
		AND t.id = ci.movie_id
		AND t.id = cc.movie_id
		AND mk.movie_id = ci.movie_id
		AND mk.movie_id = cc.movie_id
		AND ci.movie_id = cc.movie_id
		AND chn.id = ci.person_role_id
		AND n.id = ci.person_id
		AND k.id = mk.keyword_job_1_id
		AND cct1.id = cc.subject_id
		AND cct2.id = cc.status_id;
