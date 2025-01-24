{{ config(
    materialized='table' 
) }}

SELECT DISTINCT
    department_id
FROM {{ ref('stg_management_control') }}
