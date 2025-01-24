select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_expenses
from "gestion"."public"."fact_management_control"
where total_expenses is null



      
    ) dbt_internal_test