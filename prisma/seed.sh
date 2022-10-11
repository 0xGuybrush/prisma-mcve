#!/bin/sh

set -ex
psql -h localhost -p 5432 -d test -U postgres --no-password -e < ./prisma/seed.sql
