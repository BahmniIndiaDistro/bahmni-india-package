FROM mysql:5.6

# Copy configuration_checksums & DB Backup
COPY configuration_checksums  /configuration_checksums
COPY openmrs_backup*.sql.gz /docker-entrypoint-initdb.d/