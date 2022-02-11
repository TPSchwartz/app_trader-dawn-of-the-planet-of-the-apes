SELECT county, population
	CASE WHEN population <= 100000 THEN 'low population'
		 WHEN population < 500000 THEN 'medium population'
		 ELSE 'high population' END AS pop_total
FROM population
WHERE year = 2017


SELECT company, landed, new_jobs
	CASE WHEN new_jobs < 50 THEN 'small startup'
		 WHEN new_jobs <= 100 THEN 'midsize startup'
		 ELSE 'large startup' END AS startup_size
FROM edc; 

