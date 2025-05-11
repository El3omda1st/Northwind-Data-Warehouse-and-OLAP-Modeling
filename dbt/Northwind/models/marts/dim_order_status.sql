with source as (
    select
    id,
    status_name
    from {{ ref('stg_orders_status') }}
)
select * from source