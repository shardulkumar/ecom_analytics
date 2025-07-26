{{
    config (
        materialized = 'view'
    )
}}
SELECT
      c_custkey AS customer_id
    , TRIM(UPPER(c_name)) AS customer_name
    , c_mktsegment AS market_segment
    , c_nationkey AS nation_id
FROM {{ source('raw', 'CUSTOMER') }}
WHERE c_custkey IS NOT NULL
