#!/bin/bash
docker-compose exec --env PGPASSWORD=password --interactive --tty postgres_db psql --username="suser" --dbname="school" $@
