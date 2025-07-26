{{
    config (
          materialized = 'view'
    )
}}

select
      ord.o_orderkey as order_id
    , ord.o_custkey as customer_id
    , cust.c_name as customer_name
    , ord.o_orderdate::date as order_date
    , ord.o_totalprice
from {{ source('raw', 'ORDERS') }} ord
left join {{ source('raw', 'CUSTOMER') }} cust
on ord.o_custkey = cust.c_custkey
