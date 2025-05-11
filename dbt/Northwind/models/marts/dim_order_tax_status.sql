with source as (
    select
        id,
        tax_status_name
    from {{ ref('stg_orders_tax_status') }}
)
select * from source