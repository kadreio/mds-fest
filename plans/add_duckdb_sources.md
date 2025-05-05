task_name: add_duckdb_sources

# Add DuckDB Database Tables as DBT Sources

## Overview

The project currently has a DuckDB database (`/workspaces/mds-fest/duckdb.duckdb`) containing 24 tables that appear to be part of a retail data model (likely TPC-DS). We need to configure all these tables as sources in our DBT project to enable proper transformation and modeling. 

The tables represent different aspects of retail operations including customers, sales, returns, products, and store information. By adding these as DBT sources, we'll be able to build a structured data transformation pipeline with proper documentation and testing.

## Implementation Tasks

### 1. Project Setup
- [ ] Create a new git branch from main named `add_duckdb_sources`
- [ ] Create a new sources YAML file at `dbt/models/sources/duckdb_sources.yml`
- [ ] Create a directory structure for staging models based on logical domains

### 2. Source Configuration 
- [ ] Define a single source named 'duckdb' in the sources YAML file
- [ ] Configure the source with appropriate metadata (database, schema, loader, description)
- [ ] Add all 24 tables to the source definition with descriptions:
  - [ ] call_center
  - [ ] catalog_page
  - [ ] catalog_returns
  - [ ] catalog_sales
  - [ ] customer
  - [ ] customer_address
  - [ ] customer_demographics
  - [ ] date_dim
  - [ ] household_demographics
  - [ ] income_band
  - [ ] inventory
  - [ ] item
  - [ ] promotion
  - [ ] reason
  - [ ] ship_mode
  - [ ] store
  - [ ] store_returns
  - [ ] store_sales
  - [ ] time_dim
  - [ ] warehouse
  - [ ] web_page
  - [ ] web_returns
  - [ ] web_sales
  - [ ] web_site

### 3. Column Documentation
- [ ] Document primary keys and important columns for each table
- [ ] Add column descriptions for key business fields
- [ ] Define appropriate data tests for critical columns (uniqueness, not null, etc.)

### 4. Create Basic Staging Models
- [ ] Create staging models that reference the source tables:
  - [ ] stg_call_center.sql
  - [ ] stg_catalog_page.sql
  - [ ] stg_catalog_returns.sql 
  - [ ] stg_catalog_sales.sql
  - [ ] stg_customer.sql
  - [ ] stg_customer_address.sql
  - [ ] stg_customer_demographics.sql
  - [ ] stg_date_dim.sql
  - [ ] stg_household_demographics.sql
  - [ ] stg_income_band.sql
  - [ ] stg_inventory.sql
  - [ ] stg_item.sql
  - [ ] stg_promotion.sql
  - [ ] stg_reason.sql
  - [ ] stg_ship_mode.sql
  - [ ] stg_store.sql
  - [ ] stg_store_returns.sql
  - [ ] stg_store_sales.sql
  - [ ] stg_time_dim.sql
  - [ ] stg_warehouse.sql
  - [ ] stg_web_page.sql
  - [ ] stg_web_returns.sql
  - [ ] stg_web_sales.sql
  - [ ] stg_web_site.sql

### 5. Testing & Documentation
- [ ] Update schema.yml files with appropriate tests for staging models
- [ ] Run and verify all DBT models compile successfully
- [ ] Test source freshness configuration if applicable
- [ ] Document table relationships and foreign keys

### 6. Code Review & Finalization
- [ ] Run `dbt compile` to verify all models are valid
- [ ] Run `dbt docs generate` to create documentation
- [ ] Review generated documentation for completeness
- [ ] Create pull request for review

## Open Questions

1. Should we organize staging models by functional area (sales, customers, products) or keep them flat?
2. What data quality tests should we implement across all tables?
3. Are there any specific naming conventions to follow for the staging models?
4. Should we implement any source freshness tests, and if so, what frequency?
5. Are there specific tables that should be prioritized for more detailed documentation?
6. Is there a need to implement any data masking or sensitive data handling?
7. Do we need to set up any incremental loading strategies for these sources?
8. Is there documentation available about the relationships between these tables (ERD)?
9. Are there any known data quality issues in the source data that need to be addressed?
10. Should we implement column-level lineage tracking?