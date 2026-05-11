{% macro replace_spl_char(column_name, data_type) %}
    REGEXP_REPLACE(
        {{ convert_data_type(column_name, data_type) }},
        '^.+,\\s*',
        ''
    ) AS {{ column_name }}
{% endmacro %}