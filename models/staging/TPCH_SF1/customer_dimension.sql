{{config(materialized='view') }}

with customer_dimension as (

select * from {{ source('staging', 'CUSTOMER')}}

),

nation as (

select * from {{ source('staging', 'NATION')}}

),

final AS (

    SELECT
        C_CUSTKEY as id,
        C_NAME as name,
        C_ADDRESS as address,
        LOWER(nation.N_NAME) AS nation,
        REPLACE(C_PHONE, '-','') as phone_number,
        C_ACCTBAL as account_balance,
        LOWER(C_MKTSEGMENT) as market,
        C_COMMENT as comment
        FROM customer_dimension JOIN nation ON nation.N_NATIONKEY = customer_dimension.C_NATIONKEY
)

SELECT * FROM final