WITH WINE_REVIEWS AS (
    SELECT * FROM WINE_DATA.DEV_RAW.WINE_REVIEWS
)
SELECT
    title as product_name,
    points as points,
    winery as winery,
    country as country,
    variety as variety,
    province as province,
    region_1 as region_1,
    region_2 as region_2,
    description as review_description,
    designation as designation,
    taster_name as taster_name,
    taster_twitter_handle as taster_socials
FROM
    WINE_REVIEWS