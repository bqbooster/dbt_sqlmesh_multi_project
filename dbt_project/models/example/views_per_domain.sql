{{ config(materialized='table') }}
SELECT domain, sum(views_count) as views_count
from {{ ref('views_data') }}
GROUP BY ALL
