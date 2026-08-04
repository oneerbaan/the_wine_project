{% test spl_char(model,column_name) %}
SELECT DISTINCT
    {{column_name}},
    REGEXP_REPLACE({{column_name}}, '[A-Za-z ]', '') AS SPECIAL_CHARS_FOUND
FROM {{ model }}
WHERE {{ column_name }} IS NOT NULL
  AND {{ column_name }} != REGEXP_REPLACE({{ column_name }}, '[^A-Za-z ]', '')
ORDER BY {{ column_name }}
{% endtest %}