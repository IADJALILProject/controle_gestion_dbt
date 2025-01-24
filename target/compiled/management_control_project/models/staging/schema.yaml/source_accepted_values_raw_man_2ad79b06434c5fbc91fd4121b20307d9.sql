
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from "gestion"."public_seeds"."management_control"
    group by status

)

select *
from all_values
where value_field not in (
    'VALIDATED','PENDING','FAILED','CANCELLED'
)


