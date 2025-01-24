select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      SELECT control_month, COUNT(*)
FROM "gestion"."public_management_control"."control_summary"
GROUP BY control_month
HAVING COUNT(*) > 1
      
    ) dbt_internal_test