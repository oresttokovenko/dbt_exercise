{{config(materialized='view') }}

with orders_facts as (

select * from {{ source('staging', 'ORDERS')}}

),

final AS (

    SELECT
        O_ORDERKEY as id,
        O_CUSTKEY as cust_id,
        O_ORDERSTATUS as order_status,
        O_TOTALPRICE as total_price,
        O_ORDERDATE as order_date,
        O_CLERK as clerk,
        O_SHIPPRIORITY as ship_prioriy
    FROM orders_facts
)

SELECT * FROM final