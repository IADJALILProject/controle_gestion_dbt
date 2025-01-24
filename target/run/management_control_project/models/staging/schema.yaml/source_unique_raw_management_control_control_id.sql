select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    control_id as unique_field,
    count(*) as n_records

from "gestion"."public_seeds"."management_control"
where control_id is not null
group by control_id
having count(*) > 1



      
    ) dbt_internal_test