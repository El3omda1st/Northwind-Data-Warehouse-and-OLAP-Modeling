with source as (
    select
        p.id,
        s.company as supplier_name,
        p.product_code,
        p.product_name,
        p.description,
        p.standard_cost,
        p.list_price,
        p.reorder_level,
        p.target_level,
        p.quantity_per_unit,
        p.discontinued,
        p.minimum_reorder_quantity
    from {{ ref('stg_products') }} as p
    left join {{ ref('stg_suppliers') }} as s
        on s.id = ANY (string_to_array(p.supplier_ids, ';')::BIGINT[])
)
select * from source
