
      update "gestion"."snapshots"."management_control_snapshot"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "management_control_snapshot__dbt_tmp200432210563" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "gestion"."snapshots"."management_control_snapshot".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      
        and "gestion"."snapshots"."management_control_snapshot".dbt_valid_to is null;
      


    insert into "gestion"."snapshots"."management_control_snapshot" ("control_id", "department_id", "control_date", "expenses", "revenue", "status", "updated_at", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."control_id",DBT_INTERNAL_SOURCE."department_id",DBT_INTERNAL_SOURCE."control_date",DBT_INTERNAL_SOURCE."expenses",DBT_INTERNAL_SOURCE."revenue",DBT_INTERNAL_SOURCE."status",DBT_INTERNAL_SOURCE."updated_at",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "management_control_snapshot__dbt_tmp200432210563" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  