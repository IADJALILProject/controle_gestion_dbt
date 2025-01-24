
WITH base_data AS (
    SELECT
        mc.control_id,
        mc.department_id,
        mc.control_date,
        mc.expenses,
        mc.revenue,
        (mc.revenue - mc.expenses) AS net_profit,
        mc.status,
        mc.updated_at
    FROM "gestion"."public_staging"."stg_management_control" mc
),

aggregated_data AS (
    SELECT
        control_id,
        department_id,
        DATE_TRUNC('month', control_date) AS control_month,
        DATE_TRUNC('year', control_date) AS control_year,
        SUM(expenses) AS total_expenses,
        SUM(revenue) AS total_revenue,
        SUM(revenue - expenses) AS total_net_profit
    FROM base_data
    GROUP BY control_id, department_id, control_month, control_year
)

SELECT
    control_id,
    department_id,
    control_year,
    control_month,
    total_expenses,
    total_revenue,
    total_net_profit
FROM aggregated_data