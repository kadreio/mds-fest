{{ config(materialized='view') }}

select * from {{ source('duckdb', 'catalog_page') }}