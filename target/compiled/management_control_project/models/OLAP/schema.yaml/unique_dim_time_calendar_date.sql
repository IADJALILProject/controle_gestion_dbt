
    
    

select
    calendar_date as unique_field,
    count(*) as n_records

from "gestion"."public"."dim_time"
where calendar_date is not null
group by calendar_date
having count(*) > 1


