{{ config(materialized='table') }}
{%- call set_sql_header(config) %}
CREATE TEMP FUNCTION TOP_BROWSERS(browser STRING) AS (
    IF(

        browser IN UNNEST(
            [
                'Chrome',
                'Safari',
            ]
        ),
        browser,
        'other'
    )
);
{%- endcall %}
SELECT 
domain,
TOP_BROWSERS(browser) as browser,
sum(views_count) as views_count
from {{ ref('views_data') }}
GROUP BY ALL
