SELECT MIN(kt.kind) AS movie_kind, MIN(t.title) AS complete_nerdy_internet_movie
FROM complete_cast_job_1 AS cc, comp_cast_type_job_1 AS cct1, company_name_job_1 AS cn, company_type_job_1 AS ct, info_type_job_1 AS it1,
	keyword AS k, kind_type_job_1 AS kt, movie_companies_job_1 AS mc, movie_info_job_1 AS mi, movie_keyword_job_1 AS mk, title_job_1 AS t
WHERE cct1.kind = 'complete+verified'
		AND cn.country_code = '[us]'
		AND it1.info = 'release dates'
		AND k.keyword IN ('nerd', 'loner', 'alienation', 'dignity')
		AND kt.kind IN ('movie')
		AND mi.note LIKE '%internet%'
		AND mi.info LIKE 'USA:% 200%'
		AND t.production_year > 2000
		AND kt.id = t.kind_id
		AND t.id = mi.movie_id
		AND t.id = mk.movie_id
		AND t.id = mc.movie_id
		AND t.id = cc.movie_id
		AND mk.movie_id = mi.movie_id
		AND mk.movie_id = mc.movie_id
		AND mk.movie_id = cc.movie_id
		AND mi.movie_id = mc.movie_id
		AND mi.movie_id = cc.movie_id
		AND mc.movie_id = cc.movie_id
		AND k.id = mk.keyword_id
		AND it1.id = mi.info_type_id
		AND cn.id = mc.company_id
		AND ct.id = mc.company_type_id
		AND cct1.id = cc.status_id;
