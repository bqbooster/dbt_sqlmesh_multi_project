# dbt sqlmesh multi project

This project is POC to combine dbt with SQLMesh to create a multi project dbt setup.

## Setup

1. Clone the repo
2. Install with peotry: `pip install -r requirements.txt`
3. Copy .env.sample to .env: `cp .env.sample .env`
4. Update the .env file with your configuration
5. Export the .env file: `export $(cat .env | xargs)`
6. Run SQLMesh: `sqlmesh plan`
