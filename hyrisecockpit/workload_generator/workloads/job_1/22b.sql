SELECT MIN(cn.name) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title) AS western_violent_movie
FROM company_name_job_1 AS cn, company_type_job_1 AS ct, info_type_job_1 AS it1, info_type_job_1 AS it2, keyword_job_1 AS k, kind_type_job_1 AS kt,
	movie_companies AS mc, movie_info_job_1 AS mi, movie_info_idx_job_1 AS mi_idx, movie_keyword_job_1 AS mk, title_job_1 AS t
WHERE cn.country_code != '[us]'
		AND it1.info = 'countries'
		AND it2.info = 'rating'
		AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence')
		AND kt.kind IN ('movie', 'episode')
		AND mc.note NOT LIKE '%(USA)%'
		AND mc.note LIKE '%(200%)%'
		AND mi.info IN ('Germany', 'German', 'USA', 'American')
		AND mi_idx.info < '7.0'
		AND t.production_year > 2009
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
		AND k.id = mk.keyword_id
		AND it1.id = mi.info_type_id
		AND it2.id = mi_idx.info_type_id
		AND ct.id = mc.company_type_id
		AND cn.id = mc.company_id;
