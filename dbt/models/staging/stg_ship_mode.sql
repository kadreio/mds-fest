{{ config(materialized='view') }}

select * from {{ source('duckdb', 'ship_mode') }}