SELECT control_month, COUNT(*)
FROM "gestion"."public_management_control"."control_summary"
GROUP BY control_month
HAVING COUNT(*) > 1