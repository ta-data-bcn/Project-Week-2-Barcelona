SELECT
	`District.Name`, sum(Number), Age
FROM 
	population
WHERE 
    Year = '2014' AND
    Age = '0-4'
GROUP BY
	`District.Name`, Age
ORDER BY
	sum(Number) DESC;