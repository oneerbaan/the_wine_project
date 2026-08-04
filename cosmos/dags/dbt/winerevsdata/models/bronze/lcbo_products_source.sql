WITH LCBO_PRODUCTS AS (
    SELECT * FROM WINE_DATA.DEV_RAW.LCBO_PRODUCTS
)
SELECT
    id AS product_id,
    abv AS abv,
    name AS product_name,
    type AS product_type,
    class AS class,
    price AS price,
    score AS score,
    style AS style,
    sugar AS sugar_content,
    rating AS rating,
    volume AS volume,
    country AS country,
    producer AS producer,
    sweetness AS sweetness,
    total_alcohol_ml AS total_alcohol_ml
FROM
    LCBO_PRODUCTS