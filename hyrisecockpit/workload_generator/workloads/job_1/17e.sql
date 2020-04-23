SELECT MIN(n.name) AS member_in_charnamed_movie
FROM cast_info_job_1 AS ci, company_name_job_1 AS cn, keyword_job_1 AS k, movie_companies_job_1 AS mc, movie_keyword_job_1 AS mk, name_job_1 AS n,
	title AS t
WHERE cn.country_code = '[us]'
		AND k.keyword = 'character-name-in-title'
		AND n.id = ci.person_id
		AND ci.movie_id = t.id
		AND t.id = mk.movie_id
		AND mk.keyword_id = k.id
		AND t.id = mc.movie_id
		AND mc.company_id = cn.id
		AND ci.movie_id = mc.movie_id
		AND ci.movie_id = mk.movie_id
		AND mc.movie_id = mk.movie_id;
