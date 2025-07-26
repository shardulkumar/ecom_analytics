{{
    config (
          materialized = 'view'
    )
}}

select
      ord.o_orderkey as order_id
    , ord.o_custkey as customer_id
    , coalesce(cust.c_name, 'UNKNOWN') as customer_name
    , ord.o_orderdate::date as order_date
    , ord.o_totalprice as total_amount
from {{ source('raw', 'ORDERS') }} ord
left join {{ source('raw', 'CUSTOMER') }} cust
on ord.o_custkey = cust.c_custkey
