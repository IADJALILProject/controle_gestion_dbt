SELECT control_month, COUNT(*)
FROM {{ ref('control_summary') }}
GROUP BY control_month
HAVING COUNT(*) > 1
