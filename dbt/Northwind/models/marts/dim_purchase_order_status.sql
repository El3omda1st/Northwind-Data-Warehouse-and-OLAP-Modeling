with source as (
    select
        id,
        status
    from {{ ref('stg_purchase_order_status') }}
)
select * from source