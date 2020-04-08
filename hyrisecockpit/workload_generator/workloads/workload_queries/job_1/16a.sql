SELECT MIN(an.name_job_1) AS cool_actor_pseudonym, MIN(t.title_job_1) AS series_name_job_1d_after_char
FROM aka_name_job_1 AS an, cast_info_job_1 AS ci, company_name_job_1 AS cn, keyword_job_1 AS k, movie_companies_job_1 AS mc,
	movie_keyword_job_1 AS mk, name_job_1 AS n, title_job_1 AS t
WHERE cn.country_code = '[us]'
		AND k.keyword_job_1 = 'character-name_job_1-in-title_job_1'
		AND t.episode_nr >= 50
		AND t.episode_nr < 100
		AND an.person_id = n.id
		AND n.id = ci.person_id
		AND ci.movie_id = t.id
		AND t.id = mk.movie_id
		AND mk.keyword_job_1_id = k.id
		AND t.id = mc.movie_id
		AND mc.company_id = cn.id
		AND an.person_id = ci.person_id
		AND ci.movie_id = mc.movie_id
		AND ci.movie_id = mk.movie_id
		AND mc.movie_id = mk.movie_id;
