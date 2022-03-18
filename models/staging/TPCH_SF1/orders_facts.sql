{{config(materialized='table') }}

select * from {{ source('staging', 'ORDERS')}}
limit 100

-- identifiers
    -- cast(O_ORDERKEY as integer) as id,
    -- cast(O_CUSTKEY as integer) as cust_id,