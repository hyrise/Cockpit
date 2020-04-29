SELECT MIN(chn.name) AS voiced_char, MIN(n.name) AS voicing_actress, MIN(t.title) AS voiced_animation
FROM aka_name_job_1 AS an, complete_cast_job_1 AS cc, comp_cast_type_job_1 AS cct1, comp_cast_type_job_1 AS cct2, char_name_job_1 AS chn,
	cast_info AS ci, company_name_job_1 AS cn, info_type_job_1 AS it, info_type_job_1 AS it3, keyword_job_1 AS k, movie_companies_job_1 AS mc,
	movie_info AS mi, movie_keyword_job_1 AS mk, name_job_1 AS n, person_info_job_1 AS pi, role_type_job_1 AS rt, title_job_1 AS t
WHERE cct1.kind = 'cast'
		AND cct2.kind = 'complete+verified'
		AND chn.name = 'Queen'
		AND ci.note IN ('(voice)', '(voice) (uncredited)', '(voice: English version)')
		AND cn.country_code = '[us]'
		AND it.info = 'release dates'
		AND it3.info = 'trivia'
		AND k.keyword = 'computer-animation'
		AND mi.info IS NOT NULL
		AND (mi.info LIKE 'Japan:%200%'
							OR mi.info LIKE 'USA:%200%')
		AND n.gender = 'f'
		AND n.name LIKE '%An%'
		AND rt.role = 'actress'
		AND t.title = 'Shrek 2'
		AND t.production_year BETWEEN 2000 AND 2010
		AND t.id = mi.movie_id
		AND t.id = mc.movie_id
		AND t.id = ci.movie_id
		AND t.id = mk.movie_id
		AND t.id = cc.movie_id
		AND mc.movie_id = ci.movie_id
		AND mc.movie_id = mi.movie_id
		AND mc.movie_id = mk.movie_id
		AND mc.movie_id = cc.movie_id
		AND mi.movie_id = ci.movie_id
		AND mi.movie_id = mk.movie_id
		AND mi.movie_id = cc.movie_id
		AND ci.movie_id = mk.movie_id
		AND ci.movie_id = cc.movie_id
		AND mk.movie_id = cc.movie_id
		AND cn.id = mc.company_id
		AND it.id = mi.info_type_id
		AND n.id = ci.person_id
		AND rt.id = ci.role_id
		AND n.id = an.person_id
		AND ci.person_id = an.person_id
		AND chn.id = ci.person_role_id
		AND n.id = pi.person_id
		AND ci.person_id = pi.person_id
		AND it3.id = pi.info_type_id
		AND k.id = mk.keyword_id
		AND cct1.id = cc.subject_id
		AND cct2.id = cc.status_id;
