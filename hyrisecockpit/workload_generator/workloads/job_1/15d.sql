SELECT MIN(at.title) AS aka_title_job_1, MIN(t.title) AS internet_movie_title
FROM aka_title_job_1 AS AT, company_name_job_1 AS cn, company_type_job_1 AS ct, info_type_job_1 AS it1, keyword_job_1 AS k,
	movie_companies AS mc, movie_info_job_1 AS mi, movie_keyword_job_1 AS mk, title_job_1 AS t
WHERE cn.country_code = '[us]'
		AND it1.info = 'release dates'
		AND mi.note LIKE '%internet%'
		AND t.production_year > 1990
		AND t.id = at.movie_id
		AND t.id = mi.movie_id
		AND t.id = mk.movie_id
		AND t.id = mc.movie_id
		AND mk.movie_id = mi.movie_id
		AND mk.movie_id = mc.movie_id
		AND mk.movie_id = at.movie_id
		AND mi.movie_id = mc.movie_id
		AND mi.movie_id = at.movie_id
		AND mc.movie_id = at.movie_id
		AND k.id = mk.keyword_id
		AND it1.id = mi.info_type_id
		AND cn.id = mc.company_id
		AND ct.id = mc.company_type_id;
