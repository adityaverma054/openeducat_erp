#!/bin/bash
set -e

export PGPASSWORD="EWBXt5VbG57XDppAqGrrnSV8JVecaZOh"

exec python3 /usr/bin/odoo \
    --db_host="dpg-da8ukrajnfac73c4mmsg-a.oregon-postgres.render.com" \
    --db_port="5432" \
    --db_user="openeducat_db_user" \
    --database="openeducat_db" \
    --db_sslmode="require" \
    --http-port="${PORT:-10000}"
