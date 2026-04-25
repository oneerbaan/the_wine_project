WITH WINE_REVIEWS AS (
    SELECT * FROM WINE_DATA.DEV_RAW.WINE_REVIEWS
)
SELECT
    title as product_name,
    points as points,
    winery as winery,
    country as country,
    variety as variety,
    province as region,
    description as review_description,
    designation as designation,
    taster_name as taster_name,
    taster_twitter_handle as taster_socials
FROM
    WINE_REVIEWS