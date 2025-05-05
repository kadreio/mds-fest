{{ config(materialized='view') }}

select * from {{ source('duckdb', 'household_demographics') }}