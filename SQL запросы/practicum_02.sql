SELECT
	ROUND(AVG(q_per_day),
	0)
FROM
	(
	SELECT
		COUNT(*) AS q_per_day
	FROM
		stackoverflow.posts
	WHERE
		creation_date:: date BETWEEN '2008-11-01' AND '2008-11-18'
		AND post_type_id = 1
	GROUP BY
		creation_date:: date) AS t