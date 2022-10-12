SELECT
	id,
	min_delta
FROM
	(
	SELECT
		id,
		user_creation,
		post_creation,
		post_creation - user_creation AS delta,
		MIN(post_creation - user_creation) OVER (PARTITION BY id) AS min_delta
	FROM
		((
		SELECT
			id,
			creation_date AS user_creation
		FROM
			stackoverflow.users) AS users
	INNER JOIN
    (
		SELECT
			user_id,
			creation_date AS post_creation
		FROM
			stackoverflow.posts) AS posts ON
		users.id = posts.user_id) AS t) AS t1
WHERE
	min_delta = delta