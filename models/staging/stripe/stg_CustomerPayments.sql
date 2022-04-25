with CP AS
(

    SELECT
        O.CUSTOMER_ID,
        sum(P.ORDERAMOUNT) as totalAmountperCustomer
        
    FROM
         {{ ref('fct_orders') }} AS O
    LEFT OUTER JOIN
         {{ ref('stg_payments') }} AS P
        ON
            O.ORDER_ID = P.ORDERID
    WHERE
        P.PAYMENTSTATUS = 'success'
)
    SELECT * FROM CP         
    GROUP BY
        O.CUSTOMER_ID        