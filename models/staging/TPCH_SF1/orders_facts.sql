{{config(materialized='table') }}

with orders_facts as (

select * from {{ source('staging', 'ORDERS')}}

),

final AS (

    SELECT
        O_ORDERKEY AS id,
        O_CUSTKEY AS cust_id
    FROM orders_facts
)

SELECT * FROM final