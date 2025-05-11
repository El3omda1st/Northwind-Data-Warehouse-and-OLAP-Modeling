with source as (
    select
        id ,
        status
    from {{ ref ('stg_order_details_status') }}
)
select * from source