{{ config(
    schema= 'PUBLISH'
    ,database = 'DBT_TRAINING_MR'
    ,materialized= 'table'
)}}

select
    O_CUSTKEY
   ,O_ORDERKEY
   ,L_LINENUMBER
   ,L_EXTENDEDPRICE
   ,O_ORDERSTATUS
   ,O_TOTALPRICE
   ,O_ORDERDATE
   ,L_QUANTITY
   ,L_DISCOUNT
   ,L_TAX
   ,L_RETURNFLAG
   ,L_LINESTATUS
   ,L_RECEIPTDATE
from {{ source('STAGE', 'ORDERS') }} o
    -- "DBT_TRAINING_MR"."STAGE"."ORDERS" o 
    left join {{ source('STAGE', 'LINEITEM') }} l
    -- "DBT_TRAINING_MR"."STAGE"."LINEITEM" l
        on o.o_orderkey = l.l_orderkey
ORDER BY
    O_ORDERKEY,L_LINENUMBER
