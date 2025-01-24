{% snapshot management_control_snapshot %}
    {{
        config(
            target_schema='snapshots',
            target_database='gestion',
            unique_key='control_id',
            strategy='timestamp',
            updated_at='updated_at::timestamp'  
        )
    }}

    SELECT 
        control_id,
        department_id,
        control_date,
        expenses,
        revenue,
        status,
        updated_at::timestamp AS updated_at  
    FROM {{ ref('stg_management_control') }}
{% endsnapshot %}
