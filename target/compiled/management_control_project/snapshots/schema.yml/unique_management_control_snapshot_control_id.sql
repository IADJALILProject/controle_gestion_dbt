
    
    

select
    control_id as unique_field,
    count(*) as n_records

from "gestion"."snapshots"."management_control_snapshot"
where control_id is not null
group by control_id
having count(*) > 1


