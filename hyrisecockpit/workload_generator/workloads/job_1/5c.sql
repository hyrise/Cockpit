SELECT MIN(t.title) AS american_movie
FROM company_type_job_1 AS ct, info_type_job_1 AS it, movie_companies_job_1 AS mc, movie_info_job_1 AS mi, title_job_1 AS t
WHERE ct.kind = 'production companies'
		AND mc.note NOT LIKE '%(TV)%'
		AND mc.note LIKE '%(USA)%'
		AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German',
																			'USA', 'American')
		AND t.production_year > 1990
		AND t.id = mi.movie_id
		AND t.id = mc.movie_id
		AND mc.movie_id = mi.movie_id
		AND ct.id = mc.company_type_id
		AND it.id = mi.info_type_id;
