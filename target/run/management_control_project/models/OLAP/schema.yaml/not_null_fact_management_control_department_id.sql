select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select department_id
from "gestion"."public"."fact_management_control"
where department_id is null



      
    ) dbt_internal_test