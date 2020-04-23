SELECT MIN(mi.info) AS release_date, MIN(t.title) AS youtube_movie
FROM aka_title_job_1 AS AT, company_name_job_1 AS cn, company_type_job_1 AS ct, info_type_job_1 AS it1, keyword_job_1 AS k,
	movie_companies AS mc, movie_info_job_1 AS mi, movie_keyword_job_1 AS mk, title_job_1 AS t
WHERE cn.country_code = '[us]'
		AND cn.name = 'YouTube'
		AND it1.info = 'release dates'
		AND mc.note LIKE '%(200%)%'
		AND mc.note LIKE '%(worldwide)%'
		AND mi.note LIKE '%internet%'
		AND mi.info LIKE 'USA:% 200%'
		AND t.production_year BETWEEN 2005 AND 2010
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
		AND k.id = mk.keyword_id
		AND it1.id = mi.info_type_id
		AND cn.id = mc.company_id
		AND ct.id = mc.company_type_id;
