select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select net_profit
from "gestion"."public_intermediate"."int_management_control"
where net_profit is null



      
    ) dbt_internal_test