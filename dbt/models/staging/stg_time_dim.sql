{{ config(materialized='view') }}

select * from {{ source('duckdb', 'time_dim') }}