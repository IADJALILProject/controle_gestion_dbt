{{ config(
    materialized='incremental',
    unique_key='control_id',
    on_schema_change='sync_all_columns'   
) }}

WITH enriched_control AS (
    SELECT
        control_id,
        department_id,
        control_date,
        expenses,
        revenue,
        revenue - expenses AS net_profit,
        EXTRACT(YEAR FROM control_date) AS control_year,
        EXTRACT(MONTH FROM control_date) AS control_month,
        status
    FROM {{ ref('stg_management_control') }}
)

SELECT *
FROM enriched_control
