SELECT
    {{ dbt_utils.generate_surrogate_key(['control_id', 'department_id']) }} AS unique_key,
    *
FROM {{ ref('stg_management_control') }}
