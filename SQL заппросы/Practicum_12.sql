SELECT
	ROW_NUMBER() OVER() AS DAY,
	count AS new_users,
	SUM(count) OVER(
	ORDER BY day_) AS new_users_sum
FROM
	(
	SELECT
		creation_date::date AS day_,
		COUNT(id)
	FROM
		stackoverflow.users
	WHERE
		DATE_TRUNC('day', creation_date) BETWEEN '2008-11-01' AND '2008-11-30'
	GROUP BY
		creation_date::date) AS t