SELECT
	*,
	DENSE_RANK() OVER(
	ORDER BY count_ids DESC) AS rnk
FROM
	(
	SELECT
		user_id,
		COUNT(DISTINCT id) AS count_ids
	FROM
		stackoverflow.badges
	WHERE
		DATE_TRUNC('day', creation_date) BETWEEN '2008-11-15' AND '2008-12-15'
	GROUP BY
		user_id) AS t
ORDER BY
	count_ids DESC,
	user_id
LIMIT 10