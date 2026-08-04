{% macro handle_nulls(column_name,data_type,default_value)%}
     COALESCE({{convert_data_type(column_name,data_type)}},{{default_value}}) AS {{column_name}}
{% endmacro %}