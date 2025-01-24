{{ config(
    materialized='incremental', 
    unique_key='control_year, control_month'
) }}

WITH monthly_control AS (
    SELECT
        control_year,
        control_month,
        SUM(expenses) AS total_expenses,
        SUM(revenue) AS total_revenue,
        SUM(net_profit) AS total_net_profit
    FROM {{ ref('int_management_control') }}
    GROUP BY control_year, control_month
),

summary_with_validation AS (
    SELECT
        control_year,
        control_month,
        total_expenses,
        total_revenue,
        total_net_profit
    FROM monthly_control
    {% if is_incremental() %}
    WHERE (control_year, control_month) NOT IN (
        SELECT DISTINCT
            control_year,
            control_month
        FROM {{ this }}
    )
    {% endif %}
)

SELECT *
FROM summary_with_validation
ORDER BY control_year, control_month

