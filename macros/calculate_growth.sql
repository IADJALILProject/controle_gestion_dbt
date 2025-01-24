{% macro calculate_growth(current, previous) %}
CASE
    WHEN {{ previous }} IS NULL THEN NULL
    WHEN {{ previous }} = 0 THEN NULL
    ELSE ROUND(({{ current }} - {{ previous }}) / {{ previous }} * 100, 2)
END
{% endmacro %}
