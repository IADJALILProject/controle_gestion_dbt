select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select monthly_net_profit
from "gestion"."public_management_control"."control_growth"
where monthly_net_profit is null



      
    ) dbt_internal_test