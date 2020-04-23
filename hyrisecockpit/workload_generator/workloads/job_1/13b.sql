SELECT MIN(cn.name) AS producing_company, MIN(miidx.info) AS rating, MIN(t.title) AS movie_about_winning
FROM company_name_job_1 AS cn, company_type_job_1 AS ct, info_type_job_1 AS it, info_type_job_1 AS it2, kind_type_job_1 AS kt,
	movie_companies AS mc, movie_info_job_1 AS mi, movie_info_idx_job_1 AS miidx, title_job_1 AS t
WHERE cn.country_code = '[us]'
		AND ct.kind = 'production companies'
		AND it.info = 'rating'
		AND it2.info = 'release dates'
		AND kt.kind = 'movie'
		AND t.title != ''
		AND (t.title LIKE '%Champion%'
							OR t.title LIKE '%Loser%')
		AND mi.movie_id = t.id
		AND it2.id = mi.info_type_id
		AND kt.id = t.kind_id
		AND mc.movie_id = t.id
		AND cn.id = mc.company_id
		AND ct.id = mc.company_type_id
		AND miidx.movie_id = t.id
		AND it.id = miidx.info_type_id
		AND mi.movie_id = miidx.movie_id
		AND mi.movie_id = mc.movie_id
		AND miidx.movie_id = mc.movie_id;
