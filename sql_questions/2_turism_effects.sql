-- DOES TURISM AFECTS POLLUTION?
-- first retrieve the most turist months, start of 07 up to end of 08
-- MP10
SELECT s.`name` as Station, AVG(r.`pm_val`) as AVG_PM, MAX(r.`pm_val`) AS MAX_PM
FROM Registry r
	LEFT JOIN Station s on s.`ID` = r.`station_ID`
WHERE
	r.`date_generate` >= '2018-07-1'
	AND r.`date_generate` < '2018-09-01'
	AND r.`pm_val` >= 0
GROUP BY s.`ID`
ORDER BY s.`name` ASC
;
SELECT s.`name` as Station, AVG(r.`pm_val`) as AVG_PM, MAX(r.`pm_val`) AS MAX_PM
FROM Registry r
	LEFT JOIN Station s on s.`ID` = r.`station_ID`
WHERE
	r.`date_generate` >= '2018-10-1'
	AND r.`date_generate` < '2019-11-30'
	AND r.`pm_val` >= 0
GROUP BY s.`ID`
ORDER BY s.`name` ASC
;
/**
seems like turism affects in a positive way to PM as values ar higher during
octover and november than july and august
MAX gets learly 10 times higher passing from a good quality to a moderate state
different areas have more or less the same value, variation is not higher than
half of lowest value
**/

-- O3
SELECT s.`name` as Station, AVG(r.`o3_val`) as AVG_O3, MAX(r.`o3_val`) AS MAX_O3
FROM Registry r
	LEFT JOIN Station s on s.`ID` = r.`station_ID`
WHERE
	r.`date_generate` >= '2018-07-1'
	AND r.`date_generate` <= '2018-09-01'
	AND r.`o3_val` >= 0
GROUP BY s.`ID`
;
SELECT s.`name` as Station, AVG(r.`o3_val`) as AVG_O3, MAX(r.`o3_val`) AS MAX_O3
FROM Registry r
	LEFT JOIN Station s on s.`ID` = r.`station_ID`
WHERE
	r.`date_generate` >= '2018-10-1'
	AND r.`date_generate` <= '2018-11-30'
	AND r.`o3_val` >= 0
GROUP BY s.`ID`
;
/**
in this case, max values get even 3 times higher in no turist months.
Something curious is that, center area seems to stay more or less the same
while Observatori Fabra (near mountain) rises its value from 16 to 266.
MAX values and MEAN values seem to be really far, would be interesting to
investigate the reason for that increment
**/

-- NO2
SELECT s.`name` as Station, AVG(r.`no2_val`) as AVG_NO2, MAX(r.`no2_val`) AS MAX_NO2
FROM Registry r
	LEFT JOIN Station s on s.`ID` = r.`station_ID`
WHERE
	r.`date_generate` >= '2018-07-1'
	AND r.`date_generate` <= '2018-09-01'
	AND r.`no2_val` >= 0
GROUP BY s.`ID`
;
SELECT s.`name` as Station, AVG(r.`no2_val`) as AVG_NO2, MAX(r.`no2_val`) AS MAX_NO2
FROM Registry r
	LEFT JOIN Station s on s.`ID` = r.`station_ID`
WHERE
	r.`date_generate` >= '2018-10-1'
	AND r.`date_generate` <= '2018-11-30'
	AND r.`no2_val` >= 0
GROUP BY s.`ID`
;
/**
follows similar results. Vacational season is good for the city.
MEAN values depending on the area get between 4 and 6 times higher.
MAX values get over recomended breathable limits.
**/

/**
in conclusion, holidays seem to be good months to stay in the city
while working normal months have moderate to high values to be worried
about.
**/
