WITH wine_reviews_source AS(
    SELECT * FROM {{ref ('wine_reviews_source')}}
)
SELECT
    {{convert_data_type('product_name','STRING'}},
    {{convert_data_type('points','FLOAT'}},
    {{convert_data_type('winery','STRING'}},
    {{convert_data_type('country','STRING'}},
    {{convert_data_type('variety','STRING'}},
    {{convert_data_type('region','STRING'}},
    {{convert_data_type('review_description','STRING'}},
    NVL (designation, 'n/a') AS designation,
    NVL (taster_name, 'n/a') AS taster_name,
    NVL (taster_socials, 'n/a') AS taster_socials
FROM
    wine_reviews_source