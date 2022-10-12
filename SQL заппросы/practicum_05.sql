SELECT
	*,
	ROW_NUMBER() OVER(
	ORDER BY id DESC)
FROM
	stackoverflow.vote_types
ORDER BY
	id