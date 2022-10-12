SELECT
	title,
	user_id,
	score,
	ROUND(AVG(score) OVER(PARTITION BY user_id), 0)
FROM
	stackoverflow.posts
WHERE
	NOT title = ''
	AND NOT score = 0