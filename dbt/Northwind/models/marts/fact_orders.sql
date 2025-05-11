
with source as (
    select
        o.id as order_id,
        os.status_name as order_status,
        od.product_id,
        od.quantity,
        od.unit_price,
        ods.status as order_details_status,
        od.discount,
        od.quantity * od.unit_price * (1 - od.discount) as total_price,
        cast(to_char(date_allocated, 'YYYYMMDD') as int) as date_allocated,
        od.purchase_order_id,
        od.inventory_id,
        cast(to_char(order_date, 'YYYYMMDD') as int) as order_date_key,
        o.employee_id,
        o.customer_id,
        cast(to_char(shipped_date, 'YYYYMMDD') as int) as shipped_date_key,
        o.shipper_id,
        o.shipping_fee,
        o.taxes,
        shipping_fee + taxes as total_additional_charges,
        cast(to_char(paid_date, 'YYYYMMDD') as int) as paid_date_key
    from {{ ref('stg_orders') }} as o
    join {{ ref('stg_order_details') }} as od
        on o.id = od.order_id
    left join {{ ref('dim_order_details_status') }} as ods
        on od.status_id = ods.id
    left join {{ ref ('dim_order_status') }} as os
        on o.status_id = os.id
)
select * from source