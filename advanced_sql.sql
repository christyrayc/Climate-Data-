
--Create a derived table called yearly_mean_temperature that 
--contains the yearly temperature averages for all weather stations from the mean_temperature table. 
--It should contain staid, yearly_temp and year as columns.
     
   select * from yearly_mean_temperature;
  
  SELECT
    STAID AS staid,
    DATE_PART('year', date) AS year,
    AVG(TG) AS yearly_temp
FROM
    mean_temperature
GROUP BY
    staid,
    DATE_PART('year', date);

   ---------------------------------------------------------
   
   --Bucketize tg values in the mean_temperature table.
  -- Use CASE to to return a column that will hold the value hot when the temperature is above 25 degrees, 
 --normal when between 10 and 25 and cold when under 10.
   
   SELECT 
    staid,
    date,
    tg,
    CASE
        WHEN tg > 25 THEN 'hot'
        WHEN tg >= 10 AND tg <= 25 THEN 'normal'
        ELSE 'cold'
    END AS temperature_category
FROM 
    mean_temperature;

   
   
   
   ---------------------------------------------------------------------------
   
  -- Using GROUP BY and a subquery show the yearly average of the maximum temperatures of all stations in the mean_temperature table.
   SELECT
    year,
    AVG(max_temperature) AS yearly_avg_max_temperature
FROM
    (SELECT
        DATE_PART('YEAR', DATE) AS year,
        MAX(TG) AS max_temperature 
    FROM
        mean_temperature
    GROUP BY
        DATE_PART('YEAR', DATE),
        STAID
    ) AS subquery
GROUP BY
    year;
    -----------------------------------------------------------