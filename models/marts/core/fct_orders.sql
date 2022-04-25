  SELECT
      ORDER_ID,
      CUSTOMER_ID,
      ORDERAMOUNT
  FROM
      "ANALYTICS"."DBT_SWOOD"."STG_ORDERS" AS O
  LEFT OUTER JOIN
      "ANALYTICS"."DBT_SWOOD"."STG_PAYMENTS" AS P
      ON
          O.ORDER_ID = P.ORDERID