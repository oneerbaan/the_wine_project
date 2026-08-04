WITH lcbo_products_source AS(
    SELECT * FROM {{ref('lcbo_products_source')}}
)
SELECT
    {{convert_data_type('product_id','STRING')}} AS product_id,
    {{convert_data_type('abv','FLOAT')}} AS abv,
    {{convert_data_type('product_name','STRING')}} AS product_name,
    {{replace_na('product_type','STRING',"'Unknown'")}} AS product_type,
    {{convert_data_type('class','STRING')}} AS class,
    {{convert_data_type('price','FLOAT')}} AS price,
    ROUND({{ replace_na_num('score') }}, 2) AS score,
    {{replace_na('style','STRING',"'Unknown'")}} AS style,
    {{ replace_na_num('sugar_content') }} as sugar_content,
    {{ replace_na_num('rating') }} as rating,
    {{convert_data_type('volume','FLOAT')}} as volume,
    {{replace_spl_char('country','STRING')}},
    {{convert_data_type('producer','STRING')}} AS producer,
    {{replace_na('sweetness','STRING',"'Unknown'")}} AS sweetness,
    {{convert_data_type('total_alcohol_ml','FLOAT')}} AS total_alcohol_ml
FROM
    lcbo_products_source