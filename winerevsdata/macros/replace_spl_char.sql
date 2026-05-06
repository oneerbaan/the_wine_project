{% macro remove_spl_char(model,column_name) %}
SELECT
    REGEXP_REPLACE({{column_name}}, '^.+,\\s*', '') AS {{column_name}}
FROM {{model}}
{% endmacro %}