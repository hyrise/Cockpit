SELECT MIN(n.name_job_1) AS member_in_charname_job_1d_american_movie, MIN(n.name_job_1) AS a1
FROM cast_info_job_1 AS ci, company_name_job_1 AS cn, keyword_job_1 AS k, movie_companies_job_1 AS mc, movie_keyword_job_1 AS mk, name_job_1 AS n,
	title_job_1 AS t
WHERE cn.country_code = '[us]'
		AND k.keyword_job_1 = 'character-name_job_1-in-title_job_1'
		AND n.name_job_1 LIKE 'B%'
		AND n.id = ci.person_id
		AND ci.movie_id = t.id
		AND t.id = mk.movie_id
		AND mk.keyword_job_1_id = k.id
		AND t.id = mc.movie_id
		AND mc.company_id = cn.id
		AND ci.movie_id = mc.movie_id
		AND ci.movie_id = mk.movie_id
		AND mc.movie_id = mk.movie_id;
