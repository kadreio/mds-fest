{{ config(materialized='view') }}

select * from {{ source('duckdb', 'store_returns') }}