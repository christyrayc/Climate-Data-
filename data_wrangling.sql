--1: How many records are there in the temperature data?
	select count(*) from mean_temperature;
-------------------------------------------------------------
--2: Get a list of all countries included. Remove all duplicates and sort it alphabetically.

SELECT DISTINCT CN AS country
FROM stations s 
ORDER BY country;
------------------------------------------------------------------------------


--3: Get the number of weather stations for each country. Group by the number of stations in descending order!
--SELECT countries, COUNT(stations) AS stations_count
--FROM mean_temperature
--GROUP BY countries
--ORDER BY stations_count DESC;

	
SELECT CN AS country, COUNT(STAID) AS number_of_stations
FROM stations
GROUP BY CN
ORDER BY number_of_stations DESC;


------------------------------------------------------------------------------------------
---4: What’s the average height of stations in Switzerland compared to Netherlands?
SELECT
    CN AS country,
    AVG(HGHT) AS average_height
FROM
    stations s 
WHERE
    CN IN ('CH', 'NL')
GROUP BY
    CN;
	
-------------------------------------------------------------------------------------
---5: What is the highest station in Germany?
SELECT
    MAX(HGHT) AS highest_height
FROM
    stations 
WHERE
    CN = 'DE';
---------------------------------------------------------------------------------------
--6: What’s the minimum and maximum daily average temperature ever recorded in Germany?
SELECT
    MIN(t.tg) AS min_daily_avg_temperature,
    MAX(t.tg) AS max_daily_avg_temperature
FROM
    mean_temperature  t
INNER JOIN
    stations s  ON t.staid = s.staid
WHERE
    s.CN = 'DE';
----------------------------------------------------------------------------------

