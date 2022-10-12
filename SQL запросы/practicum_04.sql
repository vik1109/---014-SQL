SELECT
	COUNT(DISTINCT post_id)
FROM
	stackoverflow.votes
WHERE
	post_id IN (
	SELECT
		DISTINCT id
	FROM
		stackoverflow.posts AS t
	WHERE
		user_id IN (
		SELECT
			id
		FROM
			stackoverflow.users
		WHERE
			display_name = 'Joel Coehoorn') )