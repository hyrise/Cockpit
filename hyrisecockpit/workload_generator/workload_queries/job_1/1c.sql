SELECT MIN(mc.note) AS production_note, MIN(t.title) AS movie_title, MIN(t.production_year) AS movie_year
FROM company_type_job_1 AS ct, info_type_job_1 AS it, movie_companies_job_1 AS mc, movie_info_idx_job_1 AS mi_idx, title_job_1 AS t
WHERE ct.kind = 'production companies'
		AND it.info = 'top 250 rank'
		AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%'
		AND (mc.note LIKE '%(co-production)%')
		AND t.production_year > 2010
		AND ct.id = mc.company_type_id
		AND t.id = mc.movie_id
		AND t.id = mi_idx.movie_id
		AND mc.movie_id = mi_idx.movie_id
		AND it.id = mi_idx.info_type_id;
