SELECT
	COUNT(*)
FROM
	stackoverflow.posts
WHERE
	post_type_id = 1
	AND (favorites_count >= 100
		OR score > 300)