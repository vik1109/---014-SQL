SELECT
	user_id,
	COUNT(DISTINCT post_id) AS num_of_posts
FROM
	stackoverflow.votes
WHERE
	vote_type_id IN (
	SELECT
		id
	FROM
		stackoverflow.vote_types
	WHERE
		name = 'Close')
GROUP BY
	user_id
ORDER BY
	num_of_posts DESC,
	user_id DESC
LIMIT 10