#!/bin/bash
python3 /usr/bin/odoo \
    --db_host="dpg-cuv3s5btq21c73edp9qg-a.oregon-postgres.render.com" \
    --db_port="5432" \
    --db_user="openeducat_db_user" \
    --db_password="APNA_DATABASE_PASSWORD_YAHAN_DALO" \
    --database="openeducat_db" \
    --http-port="${PORT:-10000}"
