SELECT MIN(mc.note) AS production_note, MIN(t.title_job_1) AS movie_title_job_1, MIN(t.production_year) AS movie_year
FROM company_type_job_1 AS ct, info_type_job_1 AS it, movie_companies_job_1 AS mc, movie_info_job_1_idx AS mi_idx, title_job_1 AS t
WHERE ct.kind = 'production companies'
		AND it.info = 'bottom 10 rank'
		AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%'
		AND t.production_year BETWEEN 2005 AND 2010
		AND ct.id = mc.company_type_job_1_id
		AND t.id = mc.movie_id
		AND t.id = mi_idx.movie_id
		AND mc.movie_id = mi_idx.movie_id
		AND it.id = mi_idx.info_type_job_1_id;
