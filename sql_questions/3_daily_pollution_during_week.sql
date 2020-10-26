/**
date_generate BETWEEN 
    DATE_SUB('2013-09-26 12:01', INTERVAL 5 day) 
    AND DATE_SUB('2013-09-26 12:01', INTERVAL -5 day)
**/

SET @init := '2019-01-22 20:00:00', @end := '2019-01-22 22:00:00';

SELECT s.`name` AS Station, pm.`AVG_PM`, o3.`AVG_O3`, no2.`AVG_NO2`
FROM Station s
    LEFT JOIN (SELECT s.`ID`, AVG(r.`pm_val`) as AVG_PM
        FROM Registry r
            LEFT JOIN Station s on s.`ID` = r.`station_ID`
        WHERE
            r.`date_generate` >= @init
            AND r.`date_generate` <= @end
            AND r.`pm_val` >= 0
        GROUP BY s.`ID`) pm on pm.`ID` = s.`ID`
    LEFT JOIN (SELECT s.`ID`, AVG(r.`o3_val`) as AVG_O3
        FROM Registry r
            LEFT JOIN Station s on s.`ID` = r.`station_ID`
        WHERE
            r.`date_generate` >= @init
            AND r.`date_generate` <= @end
            AND r.`o3_val` >= 0
        GROUP BY s.`ID`) o3 on o3.`ID` = s.`ID`
    LEFT JOIN (SELECT s.`ID`, AVG(r.`no2_val`) as AVG_NO2
        FROM Registry r
            LEFT JOIN Station s on s.`ID` = r.`station_ID`
        WHERE
            r.`date_generate` >= @init
            AND r.`date_generate` <= @end
            AND r.`no2_val` >= 0
        GROUP BY s.`ID`) no2 on no2.`ID` = s.`ID`
;

/** 
Dividing by day we can't see any "defined" patron. Also tried to search by hour
but seems like pollution isn't cleared in ranges of hours because hours with
most trafic like 7h to 9h have more or less the same pollution as 12h-14h or 22h-00h
**/