SELECT s.`name` AS Station, pm.AVG_PM, o3.`AVG_O3`, no2.`AVG_NO2`
FROM Station s
    LEFT JOIN (SELECT s.`ID`, AVG(r.`pm_val`) as AVG_PM
        FROM Registry r
            LEFT JOIN Station s on s.`ID` = r.`station_ID`
        WHERE
            r.`date_generate` >= '2018-06-1'
            AND r.`date_generate` <= '2019-02-28'
            AND r.`pm_val` >= 0
        GROUP BY s.`ID`) pm on pm.`ID` = s.`ID`
    LEFT JOIN (SELECT s.`ID`, AVG(r.`o3_val`) as AVG_O3
        FROM Registry r
            LEFT JOIN Station s on s.`ID` = r.`station_ID`
        WHERE
            r.`date_generate` >= '2018-06-1'
            AND r.`date_generate` <= '2019-02-28'
            AND r.`o3_val` >= 0
        GROUP BY s.`ID`) o3 on o3.`ID` = s.`ID`
    LEFT JOIN (SELECT s.`ID`, AVG(r.`no2_val`) as AVG_NO2
        FROM Registry r
            LEFT JOIN Station s on s.`ID` = r.`station_ID`
        WHERE
            r.`date_generate` >= '2018-06-1'
            AND r.`date_generate` <= '2019-02-28'
            AND r.`no2_val` >= 0
        GROUP BY s.`ID`) no2 on no2.`ID` = s.`ID`
;