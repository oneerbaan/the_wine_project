WITH reviews AS (
    SELECT *
    FROM {{ ref('fct_wine_reviews') }}
)

SELECT
    TRIM(LOWER(winery)) AS winery,
    country,
    ROUND(AVG(points),2) AS avg_points,
    COUNT(*) AS total_reviews
FROM reviews
WHERE points IS NOT NULL AND winery IS NOT NULL
GROUP BY TRIM(LOWER(winery)), country
ORDER BY avg_points DESC