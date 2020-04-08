SELECT
	Age, sum(Number)
FROM
	population
GROUP BY
	Age
ORDER BY
	sum(Number) DESC;