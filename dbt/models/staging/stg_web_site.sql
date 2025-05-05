{{ config(materialized='view') }}

select * from {{ source('duckdb', 'web_site') }}