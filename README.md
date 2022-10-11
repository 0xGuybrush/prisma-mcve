# Prisma Seed fails on CI 

_(Minimal, Complete, Verifiable Example)_

## Steps to reproduce

### Set-Up

Create a `.env` file with the following database URL:

```bash
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/prisma_test?schema=public"
```

### Run locally (works)

```bash
yarn install
yarn prisma migrate reset
```
<img width="620" alt="Screenshot 2022-10-11 at 13 46 27" src="https://user-images.githubusercontent.com/457630/195094463-dfad48d9-f0a5-4452-b1a4-750693bf53a2.png">

Check your database — verify that a `public.users` table has been created and the sample user from the seeds file has been inserted:

### Run on Github Actions (fails)

Migrations get run correctly so it seems like Prisma can connect to Postgres, but the seed command fails:

```
yarn run v1.22.19
$ /home/runner/work/prisma-mcve/prisma-mcve/node_modules/.bin/prisma migrate reset --force
Prisma schema loaded from prisma/schema.prisma
Datasource "db": PostgreSQL database "test", schema "public" at "localhost:5432"

Applying migration `20221011092111_init`

Database reset successful

The following migration(s) have been applied:

migrations/
  └─ 20221011092111_init/
    └─ migration.sql

Running generate... (Use --skip-generate to skip the generators)
Running generate... - Prisma Client
✔ Generated Prisma Client (4.4.0 | library) to ./node_modules/@prisma/client in 
72ms

Running seed command `sh prisma/seed.sh` ...
+ psql -d prisma_test -U postgres -e
psql: error: connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: No such file or directory
	Is the server running locally and accepting connections on that socket?

An error occured while running the seed command:
Error: Command failed with exit code 2: sh prisma/seed.sh
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
Error: Process completed with exit code 1.
```
