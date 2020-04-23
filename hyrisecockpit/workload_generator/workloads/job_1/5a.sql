SELECT MIN(t.title) AS typical_european_movie
FROM company_type_job_1 AS ct, info_type_job_1 AS it, movie_companies_job_1 AS mc, movie_info_job_1 AS mi, title_job_1 AS t
WHERE ct.kind = 'production companies'
		AND mc.note LIKE '%(theatrical)%'
		AND mc.note LIKE '%(France)%'
		AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German')
		AND t.production_year > 2005
		AND t.id = mi.movie_id
		AND t.id = mc.movie_id
		AND mc.movie_id = mi.movie_id
		AND ct.id = mc.company_type_id
		AND it.id = mi.info_type_id;
