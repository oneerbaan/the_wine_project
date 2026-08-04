WITH wine_reviews_source AS(
    SELECT * FROM {{ref ('wine_reviews_source')}}
)
SELECT
    {{convert_data_type('product_name','STRING')}} AS product_name,
    {{convert_data_type('points','FLOAT')}} AS points,
    {{convert_data_type('winery','STRING')}} AS winery,
    {{handle_nulls('country','STRING',"'Unknown'")}},
    {{handle_nulls('variety','STRING',"'Unknown'")}},
    {{handle_nulls('region','STRING',"'Unknown'")}},
    {{convert_data_type('review_description','STRING')}} AS review_description,
    {{handle_nulls('designation','STRING',"'Unknown'")}},
    {{handle_nulls('taster_name','STRING',"'Unknown'")}},
    {{handle_nulls('taster_socials','STRING',"'Unknown'")}}
FROM
    wine_reviews_source