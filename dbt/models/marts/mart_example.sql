{{ config(materialized='table') }}

-- This is an example mart model that builds upon staging models
-- Replace with your actual transformations
select 
    id,
    name,
    created_at,
    upper(name) as name_upper
from {{ ref('stg_example') }}