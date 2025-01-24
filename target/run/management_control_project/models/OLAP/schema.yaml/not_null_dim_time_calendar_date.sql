select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select calendar_date
from "gestion"."public"."dim_time"
where calendar_date is null



      
    ) dbt_internal_test