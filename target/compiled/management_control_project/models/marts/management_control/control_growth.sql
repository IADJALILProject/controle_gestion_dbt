

WITH monthly_summary AS (
    SELECT
        control_year,
        control_month,
        SUM(net_profit) AS monthly_net_profit
    FROM "gestion"."public_intermediate"."int_management_control"
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
    
CASE
    WHEN CAST(previous_month_net_profit AS NUMERIC) IS NULL THEN NULL
    WHEN CAST(previous_month_net_profit AS NUMERIC) = 0 THEN NULL
    ELSE ROUND((CAST(monthly_net_profit AS NUMERIC) - CAST(previous_month_net_profit AS NUMERIC)) / CAST(previous_month_net_profit AS NUMERIC) * 100, 2)
END
 AS growth_rate
FROM growth_calculation