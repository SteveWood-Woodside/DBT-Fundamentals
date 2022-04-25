WITH P AS
(
    SELECT
        ID as paymentID,
        ORDERID AS orderID,
        paymentMethod,
        "STATUS" AS paymentStatus,
        AMOUNT as orderAmount,
        CREATED as orderDate
    FROM
        raw.stripe.payment
)
SELECT * FROM P