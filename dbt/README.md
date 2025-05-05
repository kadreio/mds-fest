# DuckDB DBT Project

This is a sample DBT project set up to work with DuckDB.

## Project Structure

```
├── README.md               # Project documentation
├── dbt_project.yml         # Project configuration
├── profiles.yml            # Connection configuration
├── models/                 # Model definitions
│   ├── marts/              # Business-level models
│   │   ├── mart_example.sql
│   │   └── schema.yml
│   └── staging/            # Raw data transformations
│       ├── stg_example.sql
│       └── schema.yml
├── macros/                 # Reusable SQL macros
│   └── example_macro.sql
├── seeds/                  # CSV data files
│   └── example_seed.csv
├── analyses/               # Ad-hoc analytical queries
└── tests/                  # Custom data tests
```

## Getting Started

To run this project:

1. Navigate to the project directory
   ```
   cd /workspaces/mds-fest/dbt
   ```

2. Run the models
   ```
   dbt run --profiles-dir .
   ```

3. Run the tests
   ```
   dbt test --profiles-dir .
   ```

4. Load seed data
   ```
   dbt seed --profiles-dir .
   ```

## Notes

- We're using a local DuckDB file at `/workspaces/mds-fest/duckdb.duckdb`
- Make sure no other processes are accessing the DuckDB file when running dbt commands to avoid lock conflicts