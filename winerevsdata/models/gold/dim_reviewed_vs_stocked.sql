WITH wines AS (

    SELECT *
    FROM {{ ref('dim_lcbo_wines') }}

),

reviews AS (

    SELECT *
    FROM {{ ref('fct_wine_reviews') }}

),

matched_wineries AS (

    SELECT

        reviews.product_name,
        reviews.country,
        reviews.region,
        reviews.points,
        reviews.variety,
        reviews.winery,

        wines.producer,

        JAROWINKLER_SIMILARITY(
            TRIM(LOWER(reviews.winery)),
            TRIM(LOWER(wines.producer))
        ) AS similarity_score,

        ROW_NUMBER() OVER (
            PARTITION BY reviews.winery
            ORDER BY
                JAROWINKLER_SIMILARITY(
                    TRIM(LOWER(reviews.winery)),
                    TRIM(LOWER(wines.producer))
                ) DESC
        ) AS rn

    FROM reviews

    LEFT JOIN wines
        ON LEFT(TRIM(LOWER(reviews.winery)), 1)
           =
           LEFT(TRIM(LOWER(wines.producer)), 1)

)

SELECT

    product_name,
    country,
    region,
    points,
    winery,
    producer,
    similarity_score,

    CASE
        WHEN similarity_score >= 90 THEN 'Yes'
        ELSE 'No'
    END AS is_available,

    variety

FROM matched_wineries

WHERE rn = 1