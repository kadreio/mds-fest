{{ config(materialized='view') }}

-- This is an example staging model
-- Replace with your actual source data queries
select 
    1 as id,
    'example' as name,
    current_localtimestamp() as created_at
    