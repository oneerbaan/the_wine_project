WITH lcbo_products_cleaned AS (
    SELECT *
    FROM {{ ref('lcbo_products_cleaned') }}
)

SELECT *
FROM lcbo_products_cleaned
WHERE LOWER(class) = 'wine'