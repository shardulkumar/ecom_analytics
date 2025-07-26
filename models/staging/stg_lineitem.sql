{{
    config (
        materialized = 'view'
    )
}}
SELECT
      l_orderkey AS order_id
    , l_partkey AS part_id
    , l_quantity AS order_quantity
    , l_extendedprice * l_quantity AS line_total
FROM {{ source('raw', 'LINEITEM') }}
WHERE l_orderkey IS NOT NULL
