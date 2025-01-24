

WITH raw_data AS (
    SELECT
        control_id,
        department_id,
        control_date,
        expenses,
        revenue,
        UPPER(status) AS status,
        CURRENT_TIMESTAMP::timestamp AS updated_at 
    FROM "gestion"."public_seeds"."management_control"
)

SELECT
    control_id,
    department_id,
    control_date,
    expenses,
    revenue,
    status,
    updated_at
FROM raw_data
WHERE status NOT IN ('CANCELLED', 'FAILED')