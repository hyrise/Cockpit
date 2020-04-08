SELECT MIN(cn.name_job_1) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title_job_1) AS western_violent_movie
FROM company_name_job_1 AS cn, company_type_job_1 AS ct, info_type_job_1 AS it1, info_type_job_1 AS it2, keyword_job_1 AS k, kind_type_job_1 AS kt,
	movie_companies_job_1 AS mc, movie_info_job_1 AS mi, movie_info_job_1_idx AS mi_idx, movie_keyword_job_1 AS mk, title_job_1 AS t
WHERE cn.country_code != '[us]'
		AND it1.info = 'countries'
		AND it2.info = 'rating'
		AND k.keyword_job_1 IN ('murder', 'murder-in-title_job_1', 'blood', 'violence')
		AND kt.kind IN ('movie', 'episode')
		AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German',
																			'USA', 'American')
		AND mi_idx.info < '8.5'
		AND t.production_year > 2005
		AND kt.id = t.kind_id
		AND t.id = mi.movie_id
		AND t.id = mk.movie_id
		AND t.id = mi_idx.movie_id
		AND t.id = mc.movie_id
		AND mk.movie_id = mi.movie_id
		AND mk.movie_id = mi_idx.movie_id
		AND mk.movie_id = mc.movie_id
		AND mi.movie_id = mi_idx.movie_id
		AND mi.movie_id = mc.movie_id
		AND mc.movie_id = mi_idx.movie_id
		AND k.id = mk.keyword_job_1_id
		AND it1.id = mi.info_type_job_1_id
		AND it2.id = mi_idx.info_type_job_1_id
		AND ct.id = mc.company_type_job_1_id
		AND cn.id = mc.company_id;
