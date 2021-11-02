
with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

final as (
    select a.order_id, a.order_date, a.customer_id, b.amount from orders a left join payments b on a.order_id = b.order_id
)

select * from final