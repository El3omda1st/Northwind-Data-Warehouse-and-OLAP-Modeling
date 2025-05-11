{% snapshot dim_customers_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='id',
        strategy='check',
        check_cols=[
            'company',
            'last_name',
            'first_name',
            'email_address',
            'job_title',
            'business_phone',
            'mobile_phone',
            'address',
            'city',
            'state_province',
            'zip_postal_code',
            'country_region',
            'web_page'
        ]
    )
}}

select * from {{ ref('dim_customers') }}

{% endsnapshot %}
