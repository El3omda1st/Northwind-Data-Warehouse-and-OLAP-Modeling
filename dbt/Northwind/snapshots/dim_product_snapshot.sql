    {% snapshot dim_product_snapshot %}

    {{
        config(
            target_schema='snapshots',
            unique_key='id',
            strategy='check',
            check_cols=[
                'product_code',
                'product_name',
                'description',
                'standard_cost',
                'list_price',
                'reorder_level',
                'target_level',
                'quantity_per_unit',
                'discontinued',
                'minimum_reorder_quantity'
            ]
        )
    }}

    select * from {{ ref('dim_product') }}

    {% endsnapshot %}
