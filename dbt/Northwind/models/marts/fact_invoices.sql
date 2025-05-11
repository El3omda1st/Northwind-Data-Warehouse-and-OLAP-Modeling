with source as (
  select
      i.id as invoice_id,
      o.customer_id,
      o.employee_id,
      cast(to_char(i.invoice_date, 'YYYYMMDD') as int) as invoice_date_key,
      cast(to_char(i.due_date, 'YYYYMMDD') as int) as due_date_key,
      i.tax,
      i.shipping,
      i.amount_due,
      (i.amount_due + i.tax + i.shipping) as total_invoice_amount,
      (i.due_date - i.invoice_date) as payment_terms_days
  from {{ ref('stg_invoices') }} as i
  join {{ ref('stg_orders') }} as o
    on i.order_id = o.id
)
select * from source