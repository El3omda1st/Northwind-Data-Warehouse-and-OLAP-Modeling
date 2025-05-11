{{ config(materialized='table') }}

with dates as (
    select
        d::date as date_full,
        to_char(d, 'YYYYMMDD')::integer as date_key,
        extract(year from d) as year,
        extract(month from d) as month,
        extract(quarter from d) as quarter,
        to_char(d, 'YYYY-MM') as year_month,
        to_char(d, 'Month') as month_name,
        extract(week from d) as week_number,
        to_char(d, 'Day') as day_name,
        case when extract(isodow from d) in (5, 6) then true else false end as is_weekend
    from generate_series(
        date '2000-01-01',
        date '2030-12-31',
        interval '1 day'
    ) as d
)

select * from dates
