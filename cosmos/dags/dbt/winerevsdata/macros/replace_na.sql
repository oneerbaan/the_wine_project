{% macro replace_na(column_name, data_type, default_value) %}
    REGEXP_REPLACE(
        {{ convert_data_type(column_name, data_type) }},
        'NA',
        {{ default_value }}
    )
{% endmacro %}