#!/bin/bash
psql -U postgres -d postgres -c "create user ${AVNI_DB_USERNAME} with password '${AVNI_DB_PASSWORD}' createrole"
psql -U postgres -d postgres -c "create database ${AVNI_DB_NAME} with owner ${AVNI_DB_USERNAME}"
psql -U postgres -d openchs -c 'create extension if not exists "uuid-ossp"'
psql -U postgres -d openchs -c 'create extension if not exists "ltree"'
psql -U postgres -d openchs -c 'create extension if not exists "hstore"'