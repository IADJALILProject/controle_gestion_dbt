
  
    

  create  table "gestion"."public"."dim_time__dbt_tmp"
  
  
    as
  
  (
    

WITH calendar AS (
    SELECT
        day::date AS calendar_date,
        EXTRACT(year FROM day) AS year,
        EXTRACT(month FROM day) AS month,
        EXTRACT(quarter FROM day) AS quarter,
        EXTRACT(week FROM day) AS week,
        TO_CHAR(day, 'Day') AS day_name
    FROM GENERATE_SERIES(
        '2020-01-01'::DATE,
        '2030-12-31'::DATE,
        '1 day'::INTERVAL
    ) day
)

SELECT *
FROM calendar
  );
  