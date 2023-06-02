FROM postgres:15
COPY init-avni-db.sh /docker-entrypoint-initdb.d/0_init-avni-db.sh
COPY avni_db_backup*.sql.gz /docker-entrypoint-initdb.d/1_avni_db_backup.sql.gz