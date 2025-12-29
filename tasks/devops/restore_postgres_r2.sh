#!/bin/bash

# -----------------------
# Configuration via Environment Variables
# -----------------------
# Set these before running the script:
# export DB_USER=myuser
# export DB_PASSWORD=myStrongPass123
# export DB_NAME=mydatabase
# export R2_BUCKET=backup-dbpostgre

CONTAINER_NAME="pg-backup"
RESTORE_DIR="/tmp"
R2_ENDPOINT="https://bda79d88b7dcbe9776bd7247e5c7784f.r2.cloudflarestorage.com"
R2_PROFILE="r2"

# Check required environment variables
if [ -z "$DB_USER" ] || [ -z "$DB_PASSWORD" ] || [ -z "$DB_NAME" ] || [ -z "$R2_BUCKET" ]; then
    echo "Error: One or more environment variables (DB_USER, DB_PASSWORD, DB_NAME, R2_BUCKET) are not set."
    exit 1
fi

# -----------------------
# Get latest backup file from R2
# -----------------------
echo "Finding the latest backup in bucket '$R2_BUCKET'..."
LATEST_FILE=$(aws s3 ls s3://$R2_BUCKET/ --endpoint-url $R2_ENDPOINT --profile $R2_PROFILE | sort | tail -n 1 | awk '{print $4}')

if [ -z "$LATEST_FILE" ]; then
    echo "Error: No backups found in R2 bucket."
    exit 1
fi

echo "Latest backup found: $LATEST_FILE"

# -----------------------
# Download latest backup
# -----------------------
LOCAL_FILE="$RESTORE_DIR/$LATEST_FILE"
echo "Downloading $LATEST_FILE to $LOCAL_FILE..."
aws s3 cp s3://$R2_BUCKET/$LATEST_FILE $LOCAL_FILE --endpoint-url $R2_ENDPOINT --profile $R2_PROFILE

if [ $? -ne 0 ]; then
    echo "Error: Failed to download backup."
    exit 1
fi

# -----------------------
# Restore PostgreSQL database in Docker container
# -----------------------
echo "Restoring database '$DB_NAME' in container '$CONTAINER_NAME'..."
gunzip -c $LOCAL_FILE | docker exec -i -e PGPASSWORD=$DB_PASSWORD $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME

if [ $? -ne 0 ]; then
    echo "Error: Database restore failed!"
    exit 1
fi

# -----------------------
# Optional: Remove local backup after restore
# -----------------------
rm $LOCAL_FILE

echo "Database restored successfully from $LATEST_FILE!"

#  -----------------------
PostgreSQL Restore Script Summary

Purpose: Restore a PostgreSQL database in a Docker container using the latest backup stored in Cloudflare R2.

Steps:

Check required environment variables (DB credentials and bucket name).

Find the most recent backup file in the Cloudflare R2 bucket.

Download the latest backup to the local system.

Decompress the backup file and restore it into the PostgreSQL Docker container.

Remove the local backup file after restore.

Print success or error messages.

Key Features: Automated restore, latest-backup selection, compressed file handling, Docker-based recovery, error handling.
# -----------------------