MODEL (
  name dbt_test.daily_views_per_domain,
  kind INCREMENTAL_BY_TIME_RANGE (
    time_column ts
  ),
  start '2024-11-01',
  cron '@daily',
  grain (ts)
);

SELECT
  ts :: TIMESTAMP as ts,
  domain :: STRING as domain,
  SUM(views_count) :: INTEGER AS views_count
FROM
  dbt_test.views_data
WHERE
  ts BETWEEN @start_date AND @end_date
GROUP BY ALL
