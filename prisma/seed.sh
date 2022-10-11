#!/bin/sh

set -ex
psql -d prisma_test -U postgres -e < ./prisma/seed.sql
