{% macro convert_data_type(column_name,data_type) %}
    CAST ({{column_name}} AS {{data_type}}) AS {{column_name}}
{% endmacro %}