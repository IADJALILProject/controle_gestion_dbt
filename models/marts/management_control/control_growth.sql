{{ config(
    materialized='incremental',
    unique_key='control_year, control_month'
) }}

WITH monthly_summary AS (
    SELECT
        control_year,
        control_month,
        SUM(net_profit) AS monthly_net_profit
    FROM {{ ref('int_management_control') }}
    GROUP BY control_year, control_month
),

growth_calculation AS (
    SELECT
        control_year,
        control_month,
        monthly_net_profit,
        LAG(monthly_net_profit) OVER (ORDER BY control_year, control_month) AS previous_month_net_profit
    FROM monthly_summary
)

SELECT
    control_year,
    control_month,
    monthly_net_profit,
    {{ calculate_growth('CAST(monthly_net_profit AS NUMERIC)', 'CAST(previous_month_net_profit AS NUMERIC)') }} AS growth_rate
FROM growth_calculation
