{{ config(materialized='view') }}

select * from {{ source('duckdb', 'inventory') }}