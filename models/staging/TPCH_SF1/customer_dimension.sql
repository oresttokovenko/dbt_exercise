{{config(materialized='table') }}

with customer_dimension as (

select * from {{ source('staging', 'CUSTOMER')}}

),

final AS (

    SELECT
        C_CUSTKEY AS id,
        C_NAME AS cust_name
    FROM customer_dimension
)

SELECT * FROM final