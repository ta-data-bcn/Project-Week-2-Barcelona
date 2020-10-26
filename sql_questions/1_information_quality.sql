-- INFORMATION QUALITY
SELECT count(1) AS total_registers
FROM Registry r
;

SELECT count(1) AS valid_NO2_registers
FROM Registry r
WHERE r.`no2_val` >= 0
;

SELECT count(1) AS valid_O3_registers
FROM Registry r
WHERE r.`o3_val` >= 0
;

SELECT count(1) AS valid_PM10_registers
FROM Registry r
WHERE r.`pm_val` >= 0
;
/**
more than half of each parameter is right
as long as we have data every hour, should be ok
**/