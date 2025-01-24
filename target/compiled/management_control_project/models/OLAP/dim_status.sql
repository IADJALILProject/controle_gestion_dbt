

SELECT DISTINCT
    status AS status_code,
    CASE
        WHEN status = 'VALIDATED' THEN 'Validé'
        WHEN status = 'PENDING' THEN 'En attente'
        WHEN status = 'FAILED' THEN 'Échec'
        WHEN status = 'CANCELLED' THEN 'Annulé'
        ELSE 'Inconnu'
    END AS status_description
FROM "gestion"."public_staging"."stg_management_control"