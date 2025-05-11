with source as (
    select
        it.id as inventory_id,
        itt.type_name as transaction_type,
        cast(to_char(transaction_created_date, 'YYYYMMDD')as int) as transaction_created_date,
        cast(to_char(transaction_modified_date, 'YYYYMMDD')as int) as transaction_modified_date,
        product_id,
        quantity,
        purchase_order_id,
        customer_order_id,
        current_timestamp
    from {{ ref('stg_inventory_transactions') }} as it
    left join {{ ref('stg_inventory_transaction_types')}} as itt 
        on it.transaction_type = itt.id
)
select * from source

-- 