select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select control_id
from "gestion"."public_staging"."stg_management_control"
where control_id is null



      
    ) dbt_internal_test