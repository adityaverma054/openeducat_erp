#!/bin/bash
set -e

# If Render provides DATABASE_URL, parse it automatically
if [ -n "$DATABASE_URL" ]; then
    export DB_HOST=$(echo "$DATABASE_URL" | sed -r 's#postgres(ql)?://([^:]+):([^@]+)@([^:]+):([0-9]+)/(.*)#\4#')
    export DB_PORT=$(echo "$DATABASE_URL" | sed -r 's#postgres(ql)?://([^:]+):([^@]+)@([^:]+):([0-9]+)/(.*)#\5#')
    export DB_USER=$(echo "$DATABASE_URL" | sed -r 's#postgres(ql)?://([^:]+):([^@]+)@([^:]+):([0-9]+)/(.*)#\2#')
    export PGPASSWORD=$(echo "$DATABASE_URL" | sed -r 's#postgres(ql)?://([^:]+):([^@]+)@([^:]+):([0-9]+)/(.*)#\3#')
    export DB_NAME=$(echo "$DATABASE_URL" | sed -r 's#postgres(ql)?://([^:]+):([^@]+)@([^:]+):([0-9]+)/(.*)#\6#')
fi

exec python3 /usr/bin/odoo \
    --db_host="${DB_HOST:-localhost}" \
    --db_port="${DB_PORT:-5432}" \
    --db_user="${DB_USER:-odoo}" \
    --database="${DB_NAME:-postgres}" \
    --db_sslmode="require" \
    --http-port="${PORT:-10000}"
