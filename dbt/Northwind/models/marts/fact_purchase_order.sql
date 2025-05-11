with details as (
    select
        purchase_order_id,
        sum(quantity) as total_quantity,
        sum(quantity * unit_cost) as total_amount
    from {{ ref('stg_purchase_order_details') }}
    group by purchase_order_id
),
source as (
    select
        po.id as purchase_order_id,
        po.supplier_id,
        po.created_by,
        po.approved_by,
        po.submitted_by,
        pos.status as order_status,
        cast(to_char(po.creation_date, 'YYYYMMDD') as int) as order_date_key,
        cast(to_char(po.submitted_date, 'YYYYMMDD') as int) as submitted_date_key,
        cast(to_char(po.expected_date, 'YYYYMMDD') as int) as expected_date_key,
        cast(to_char(po.approved_date, 'YYYYMMDD') as int) as approved_date_key,
        cast(to_char(po.payment_date, 'YYYYMMDD') as int) as payment_date_key,
        po.shipping_fee,
        po.taxes,
        po.payment_amount,
        po.payment_method,
        d.total_quantity,
        d.total_amount
        from {{ ref('stg_purchase_orders') }} po
        left join {{ ref('stg_purchase_order_status') }} pos
            on po.status_id = pos.id
        left join details d
            on po.id = d.purchase_order_id
) select * from source
