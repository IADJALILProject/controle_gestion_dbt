
      
  
    

  create  table "gestion"."public_intermediate"."int_management_control__dbt_tmp"
  
  
    as
  
  (
    

WITH enriched_control AS (
    SELECT
        control_id,
        department_id,
        control_date,
        expenses,
        revenue,
        revenue - expenses AS net_profit,
        EXTRACT(YEAR FROM control_date) AS control_year,
        EXTRACT(MONTH FROM control_date) AS control_month,
        status
    FROM "gestion"."public_staging"."stg_management_control"
)

SELECT *
FROM enriched_control
  );
  
  