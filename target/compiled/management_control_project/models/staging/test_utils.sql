SELECT
    md5(cast(coalesce(cast(control_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(department_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS unique_key,
    *
FROM "gestion"."public_staging"."stg_management_control"