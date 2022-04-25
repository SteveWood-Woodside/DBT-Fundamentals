WITH P AS
(
    SELECT
        ID as paymentID,
        ORDERID AS orderID,
        paymentMethod,
        "STATUS" AS paymentStatus,
        AMOUNT/100 as orderAmount,
        CREATED as orderDate
    FROM
        {{ source('stripe', 'payment') }}--raw.stripe.payment
)
SELECT * FROM P