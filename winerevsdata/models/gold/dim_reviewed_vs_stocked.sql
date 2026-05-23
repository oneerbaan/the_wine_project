WITH wines AS (
    SELECT *
    FROM {{ ref('dim_lcbo_wines') }}
),

reviews AS (
    SELECT DISTINCT
        TRIM(LOWER(winery)) AS winery
    FROM {{ ref('fct_wine_reviews') }}
)

SELECT
    wines.product_id,
    wines.product_name,

    CASE
        WHEN JAROWINKLER_SIMILARITY(TRIM(LOWER(wines.producer)),reviews.winery) >= 88 THEN 'Yes'
        ELSE 'No'
    END AS is_available,

    wines.abv,
    wines.price,
    wines.producer,
    wines.product_type,
    wines.style,
    wines.country

FROM wines

LEFT JOIN reviews
    ON TRIM(LOWER(wines.producer))
       = reviews.winery