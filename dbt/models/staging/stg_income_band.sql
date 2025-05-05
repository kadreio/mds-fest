{{ config(materialized='view') }}

select * from {{ source('duckdb', 'income_band') }}