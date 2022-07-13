{% snapshot orders_snapshot %}

{{
    config(
      target_database='DBT_TRAINING_MR',
      target_schema='STAGE',
      unique_key='O_ORDERKEY',
      strategy='timestamp',
      updated_at='LAST_UPDATED_DATE',
    )
}}

{{
    config(
      target_database='DBT_TRAINING_MR',
      target_schema='STAGE',
      unique_key='O_ORDERKEY',
      strategy='check',
      check_cols=['O_ORDERKEY', 'O_CUSTKEY', 'O_ORDERSTATUS', 'O_TOTALPRICE', 'O_ORDERDATE', 'O_ORDERPRIORITY', 'O_CLERK', 'O_SHIPPRIORITY', 'O_COMMENT'],
    )
}}

select * from {{source('STAGE','ORDERS')}}

{% endsnapshot %}