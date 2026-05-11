{% macro replace_na_num(column_name) %}
    TRY_CAST(NULLIF({{ column_name }}, 'NA') AS FLOAT)
{% endmacro %}