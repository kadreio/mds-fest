{{ config(materialized='view') }}

select * from {{ source('duckdb', 'customer_demographics') }}