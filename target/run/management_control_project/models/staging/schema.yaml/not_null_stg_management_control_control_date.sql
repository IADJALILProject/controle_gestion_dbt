select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select control_date
from "gestion"."public_staging"."stg_management_control"
where control_date is null



      
    ) dbt_internal_test