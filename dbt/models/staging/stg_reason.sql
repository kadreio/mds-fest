{{ config(materialized='view') }}

select * from {{ source('duckdb', 'reason') }}