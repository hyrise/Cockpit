SELECT MIN(t.title) AS movie_title
FROM company_name_job_1 AS cn, keyword_job_1 AS k, movie_companies_job_1 AS mc, movie_keyword_job_1 AS mk, title_job_1 AS t
WHERE cn.country_code = '[de]'
		AND k.keyword = 'character-name-in-title'
		AND cn.id = mc.company_id
		AND mc.movie_id = t.id
		AND t.id = mk.movie_id
		AND mk.keyword_id = k.id
		AND mc.movie_id = mk.movie_id;
