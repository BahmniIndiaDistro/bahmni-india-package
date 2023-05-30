#!/bin/bash
psql -U postgres -d postgres -c "create user openchs with password 'password' createrole"
psql -U postgres -d postgres -c 'create database openchs with owner openchs'
psql -U postgres -d openchs -c 'create extension if not exists "uuid-ossp"'
psql -U postgres -d openchs -c 'create extension if not exists "ltree"'
psql -U postgres -d openchs -c 'create extension if not exists "hstore"'