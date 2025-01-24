

WITH monthly_control AS (
    SELECT
        control_year,
        control_month,
        SUM(expenses) AS total_expenses,
        SUM(revenue) AS total_revenue,
        SUM(net_profit) AS total_net_profit
    FROM "gestion"."public_intermediate"."int_management_control"
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
    
)

SELECT *
FROM summary_with_validation
ORDER BY control_year, control_month