WITH wine_reviews_cleaned AS (
    SELECT * FROM {{ref ('wine_reviews_cleaned')}}
)
SELECT
    {{ dbt_utils.generate_surrogate_key(['product_name','review_description','taster_name']) }} AS review_id,
    *
FROM wine_reviews_cleaned
WHERE review_description IS NOT NULL