#!/bin/bash

# -----------------------
# Configuration via Environment Variables
# -----------------------
# Set these in WSL before running the script:
# export DB_USER=myuser
# export DB_PASSWORD=myStrongPass123
# export DB_NAME=mydatabase
# export R2_BUCKET=backup-dbpostgre

CONTAINER_NAME="pg-backup"
BACKUP_DIR="/tmp"
R2_ENDPOINT="https://bda79d88b7dcbe9776bd7247e5c7784f.r2.cloudflarestorage.com"
R2_PROFILE="r2"  # Named AWS CLI profile for your R2 User API token

# Check required environment variables
if [ -z "$DB_USER" ] || [ -z "$DB_PASSWORD" ] || [ -z "$DB_NAME" ] || [ -z "$R2_BUCKET" ]; then
    echo "Error: One or more environment variables (DB_USER, DB_PASSWORD, DB_NAME, R2_BUCKET) are not set."
    exit 1
fi

# -----------------------
# Create timestamped backup filename
# -----------------------
TIMESTAMP=$(date +%F_%H-%M)
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_$TIMESTAMP.sql.gz"

# -----------------------
# Backup Database from Docker container
# -----------------------
echo "Backing up database '$DB_NAME' from container '$CONTAINER_NAME'..."
docker exec -e PGPASSWORD=$DB_PASSWORD $CONTAINER_NAME pg_dump -U $DB_USER $DB_NAME | gzip > $BACKUP_FILE

if [ $? -ne 0 ]; then
    echo "Error: Database backup failed!"
    exit 1
fi

# -----------------------
# Upload Backup to Cloudflare R2
# -----------------------
echo "Uploading $BACKUP_FILE to Cloudflare R2 bucket '$R2_BUCKET'..."
aws s3 cp $BACKUP_FILE s3://$R2_BUCKET/ \
    --endpoint-url $R2_ENDPOINT \
    --profile $R2_PROFILE

if [ $? -ne 0 ]; then
    echo "Error: Upload to R2 failed!"
    exit 1
fi

# -----------------------
# Optional: Remove local backup
# -----------------------
rm $BACKUP_FILE

echo "Backup completed successfully and uploaded to R2!"

# -----------------------
PostgreSQL Backup Script Summary

Purpose: Automatically backup a PostgreSQL database from a Docker container and upload it to Cloudflare R2.

Steps:

Check required environment variables (DB credentials, bucket name).

Create a timestamped backup file.

Export the database from the Docker container and compress it (.gz).

Upload the backup to Cloudflare R2 using AWS CLI.

Delete the local backup to save disk space.

Print success or error messages.

Key Features: Automation, compressed backups, offsite storage, error handling.


# End of Script-------

