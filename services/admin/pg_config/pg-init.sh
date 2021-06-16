#!/usr/bin/env bash

set -e

echo "Copy custom postgresql.conf to $PGDATA"
cp /etc/postgresql.conf $PGDATA

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"
echo "PGUSER=$PGUSER"
export psql=( psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --no-password )
echo "psql=${psql}"

# We may load data here with psql!
