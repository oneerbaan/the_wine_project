{% macro convert_data_type(column_name,data_type) %}
    TRY_CAST ({{column_name}} AS {{data_type}})
{% endmacro %}