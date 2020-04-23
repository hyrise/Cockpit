SELECT MIN(cn.name) AS producing_company, MIN(lt.link) AS link_type_job_1, MIN(t.title) AS complete_western_sequel
FROM complete_cast_job_1 AS cc, comp_cast_type_job_1 AS cct1, comp_cast_type_job_1 AS cct2, company_name_job_1 AS cn, company_type_job_1 AS ct,
	keyword AS k, link_type_job_1 AS lt, movie_companies_job_1 AS mc, movie_info_job_1 AS mi, movie_keyword_job_1 AS mk,
	movie_link AS ml, title_job_1 AS t
WHERE cct1.kind IN ('cast', 'crew')
		AND cct2.kind = 'complete'
		AND cn.country_code != '[pl]'
		AND (cn.name LIKE '%Film%'
							OR cn.name LIKE '%Warner%')
		AND ct.kind = 'production companies'
		AND k.keyword = 'sequel'
		AND lt.link LIKE '%follow%'
		AND mc.note IS NULL
		AND mi.info IN ('Sweden', 'Germany', 'Swedish', 'German')
		AND t.production_year BETWEEN 1950 AND 2000
		AND lt.id = ml.link_type_id
		AND ml.movie_id = t.id
		AND t.id = mk.movie_id
		AND mk.keyword_id = k.id
		AND t.id = mc.movie_id
		AND mc.company_type_id = ct.id
		AND mc.company_id = cn.id
		AND mi.movie_id = t.id
		AND t.id = cc.movie_id
		AND cct1.id = cc.subject_id
		AND cct2.id = cc.status_id
		AND ml.movie_id = mk.movie_id
		AND ml.movie_id = mc.movie_id
		AND mk.movie_id = mc.movie_id
		AND ml.movie_id = mi.movie_id
		AND mk.movie_id = mi.movie_id
		AND mc.movie_id = mi.movie_id
		AND ml.movie_id = cc.movie_id
		AND mk.movie_id = cc.movie_id
		AND mc.movie_id = cc.movie_id
		AND mi.movie_id = cc.movie_id;
