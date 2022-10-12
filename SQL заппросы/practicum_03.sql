SELECT
	COUNT(DISTINCT id)
FROM
	(
(
	SELECT
		id,
		creation_date::date
	FROM
		stackoverflow.users) AS t1
INNER JOIN 
(
	SELECT
		user_id,
		creation_date::date
	FROM
		stackoverflow.badges) AS t2 ON
	t1.id = t2.user_id
	AND t1.creation_date = t2.creation_date) AS l