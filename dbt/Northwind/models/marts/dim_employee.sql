with source as (
    select 
        e.id,
        company,
        p.privilege_name,
        last_name,
        first_name,
        email_address,
        job_title,
        business_phone,
        home_phone,
        mobile_phone,
        fax_number,
        address,
        city,
        state_province,
        zip_postal_code,
        country_region,
        web_page,
        notes,
        attachments
    from {{ref('stg_employees') }} as e
    left join {{ref('stg_employee_privileges')}} as ep 
    on e.id = ep.employee_id
    left join {{ref('stg_privileges')}} as p 
    on ep.privilege_id = p.id
)
select * from source
