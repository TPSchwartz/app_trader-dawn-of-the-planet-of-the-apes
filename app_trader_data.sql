WITH asa AS (SELECT *,
			CASE WHEN price < 1 THEN '1'
			ELSE price END AS adjusted_price
			FROM app_store_apps)

		--208,000 is $4000 per month * 52 months
SELECT name, (208000*((2*rating)+1) - 10000*asa.adjusted_price) AS app_profit, price, rating, primary_genre, review_count
FROM asa
ORDER BY app_profit DESC;

SELECT * FROM play_store_apps;

WITH psa AS (SELECT *,
			CASE WHEN TRIM(price)::numeric::money < '$1' THEN '1'
			ELSE TRIM(price)::numeric::money END AS adjusted_price
			FROM play_store_apps)

		--208,000 is $4000 per month * 52 months
SELECT name, (208000*((2*rating)+1) - 10000*psa.adjusted_price) AS app_profit, price, rating, genres, review_count
FROM psa
ORDER BY app_profit DESC;