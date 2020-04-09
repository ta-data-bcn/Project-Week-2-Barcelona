SELECT
	`District.Name`, sum(Number), Age
FROM 
	population
WHERE 
    Year = '2014' AND
    Age = '>=95'
GROUP BY
	`District.Name`, Age
ORDER BY
	sum(Number) DESC;