SELECT
	title
FROM
	stackoverflow.posts
WHERE
	user_id IN (
	SELECT
		user_id
	FROM
		stackoverflow.badges
	GROUP BY
		user_id
	HAVING
		COUNT(id) > 1000)
	AND NOT title = ''