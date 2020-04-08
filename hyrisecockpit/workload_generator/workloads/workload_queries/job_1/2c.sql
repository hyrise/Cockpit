SELECT MIN(t.title_job_1) AS movie_title_job_1
FROM company_name_job_1 AS cn, keyword_job_1 AS k, movie_companies_job_1 AS mc, movie_keyword_job_1 AS mk, title_job_1 AS t
WHERE cn.country_code = '[sm]'
		AND k.keyword_job_1 = 'character-name_job_1-in-title_job_1'
		AND cn.id = mc.company_id
		AND mc.movie_id = t.id
		AND t.id = mk.movie_id
		AND mk.keyword_job_1_id = k.id
		AND mc.movie_id = mk.movie_id;
