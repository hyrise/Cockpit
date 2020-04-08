SELECT MIN(t.title_job_1) AS american_vhs_movie
FROM company_type_job_1 AS ct, info_type_job_1 AS it, movie_companies_job_1 AS mc, movie_info_job_1 AS mi, title_job_1 AS t
WHERE ct.kind = 'production companies'
		AND mc.note LIKE '%(VHS)%'
		AND mc.note LIKE '%(USA)%'
		AND mc.note LIKE '%(1994)%'
		AND mi.info IN ('USA', 'America')
		AND t.production_year > 2010
		AND t.id = mi.movie_id
		AND t.id = mc.movie_id
		AND mc.movie_id = mi.movie_id
		AND ct.id = mc.company_type_job_1_id
		AND it.id = mi.info_type_job_1_id;
