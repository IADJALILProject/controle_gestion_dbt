
    
    

select
    status_code as unique_field,
    count(*) as n_records

from "gestion"."public"."dim_status"
where status_code is not null
group by status_code
having count(*) > 1


