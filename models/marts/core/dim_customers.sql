with customers as (

    select * from {{ ref('stg_customers')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),
payments as
(
    SELECT * FROM {{ ref('stg_payments') }} WHERE paymentStatus = 'success'
),
customer_orders as (

    select
        orders.customer_id,

        min(orders.order_date) as first_order_date,
        max(orders.order_date) as most_recent_order_date,
        count(orders.order_id) as number_of_orders,
        sum(payments.orderAmount) as totalCustomerPayments

    from orders
    left outer join payments on orders.order_id = payments.orderID

    group by 1

),


final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        customer_orders.totalCustomerPayments

    from customers

    left join customer_orders using (customer_id)

)

select * from final