{{ config(materialized='view') }}

select * from {{ source('duckdb', 'warehouse') }}