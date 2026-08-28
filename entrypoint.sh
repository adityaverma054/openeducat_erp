#!/bin/bash
set -e

if [ -n "$DATABASE_URL" ]; then
    DB_USER=$(echo "$DATABASE_URL" | sed -r 's#postgres(ql)?://([^:]+):([^@]+)@([^:]+):([0-9]+)/(.*)#\2#')
    DB_PASSWORD=$(echo "$DATABASE_URL" | sed -r 's#postgres(ql)?://([^:]+):([^@]+)@([^:]+):([0-9]+)/(.*)#\3#')
    DB_HOST=$(echo "$DATABASE_URL" | sed -r 's#postgres(ql)?://([^:]+):([^@]+)@([^:]+):([0-9]+)/(.*)#\4#')
    DB_PORT=$(echo "$DATABASE_URL" | sed -r 's#postgres(ql)?://([^:]+):([^@]+)@([^:]+):([0-9]+)/(.*)#\5#')
    DB_NAME=$(echo "$DATABASE_URL" | sed -r 's#postgres(ql)?://([^:]+):([^@]+)@([^:]+):([0-9]+)/(.*)#\6#')
else
    DB_HOST="${PGHOST:-db}"
    DB_PORT="${PGPORT:-5432}"
    DB_USER="${PGUSER:-odoo}"
    DB_PASSWORD="${PGPASSWORD:-odoo}"
    DB_NAME="${PGDATABASE:-odoo}"
fi

exec python3 /usr/bin/odoo \
    --db_host="$DB_HOST" \
    --db_port="$DB_PORT" \
    --db_user="$DB_USER" \
    --db_password="$DB_PASSWORD" \
    --database="$DB_NAME" \
    --http-port="${PORT:-10000}"
