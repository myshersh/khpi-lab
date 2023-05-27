#!/bin/bash
docker-compose exec --env PGPASSWORD=password --interactive --tty postgres_db psql --username="school-user" --dbname="school" $@
