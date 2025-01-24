
  
    

  create  table "gestion"."public"."dim_departement__dbt_tmp"
  
  
    as
  
  (
    

SELECT DISTINCT
    department_id
FROM "gestion"."public_staging"."stg_management_control"
  );
  