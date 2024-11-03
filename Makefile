.DEFAULT_GOAL := sqlmesh

plan:
	sqlmesh -p ./dbt_project -p ./sqlmesh_project plan

test:
	sqlmesh -p ./dbt_project -p ./sqlmesh_project test

ui:
	sqlmesh -p ./dbt_project -p ./sqlmesh_project ui

sqlmesh:
	sqlmesh -p ./dbt_project -p ./sqlmesh_project $(filter-out $@,$(MAKECMDGOALS))

env:
	export $(cat .env | xargs)

# Prevent make from interpreting the arguments as make targets
%:
    @: