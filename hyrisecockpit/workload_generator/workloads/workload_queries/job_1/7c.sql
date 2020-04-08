SELECT MIN(n.name_job_1) AS cast_member_name_job_1, MIN(pi.info) AS cast_member_info
FROM aka_name_job_1 AS an, cast_info_job_1 AS ci, info_type_job_1 AS it, link_type_job_1 AS lt, movie_link_job_1 AS ml, name_job_1 AS n,
	person_info_job_1 AS pi, title_job_1 AS t
WHERE an.name_job_1 IS NOT NULL
		AND (an.name_job_1 LIKE '%a%'
							OR an.name_job_1 LIKE 'A%')
		AND it.info = 'mini biography'
		AND lt.link IN ('references', 'referenced in', 'features', 'featured in')
		AND n.name_job_1_pcode_cf BETWEEN 'A' AND 'F'
		AND (n.gender = 'm'
							OR (n.gender = 'f'
											AND n.name_job_1 LIKE 'A%'))
		AND pi.note IS NOT NULL
		AND t.production_year BETWEEN 1980 AND 2010
		AND n.id = an.person_id
		AND n.id = pi.person_id
		AND ci.person_id = n.id
		AND t.id = ci.movie_id
		AND ml.linked_movie_id = t.id
		AND lt.id = ml.link_type_job_1_id
		AND it.id = pi.info_type_job_1_id
		AND pi.person_id = an.person_id
		AND pi.person_id = ci.person_id
		AND an.person_id = ci.person_id
		AND ci.movie_id = ml.linked_movie_id;
