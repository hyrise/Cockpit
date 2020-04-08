SELECT MIN(mi.info) AS release_date, MIN(t.title_job_1) AS modern_american_internet_movie
FROM aka_title_job_1 AS AT, company_name_job_1 AS cn, company_type_job_1 AS ct, info_type_job_1 AS it1, keyword_job_1 AS k,
	movie_companies_job_1 AS mc, movie_info_job_1 AS mi, movie_keyword_job_1 AS mk, title_job_1 AS t
WHERE cn.country_code = '[us]'
		AND it1.info = 'release dates'
		AND mi.note LIKE '%internet%'
		AND mi.info IS NOT NULL
		AND (mi.info LIKE 'USA:% 199%'
							OR mi.info LIKE 'USA:% 200%')
		AND t.production_year > 1990
		AND t.id = at.movie_id
		AND t.id = mi.movie_id
		AND t.id = mk.movie_id
		AND t.id = mc.movie_id
		AND mk.movie_id = mi.movie_id
		AND mk.movie_id = mc.movie_id
		AND mk.movie_id = at.movie_id
		AND mi.movie_id = mc.movie_id
		AND mi.movie_id = at.movie_id
		AND mc.movie_id = at.movie_id
		AND k.id = mk.keyword_job_1_id
		AND it1.id = mi.info_type_job_1_id
		AND cn.id = mc.company_id
		AND ct.id = mc.company_type_job_1_id;
