#!/bin/bash
set -e

export PGPASSWORD="rj3lNB5fGAiu87WDUHAn99UhkF8yIKPI"

exec python3 /usr/bin/odoo \
    --db_host="dpg-da8v950n74is73e9i6tg-a" \
    --db_port="5432" \
    --db_user="openeducat_db_v2_user" \
    --database="openeducat_db_v2" \
    --db_sslmode="require" \
    -i base \
    --http-port="${PORT:-10000}"
