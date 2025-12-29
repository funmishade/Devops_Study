# PostgreSQL Backup to Cloudflare R2

## Project Overview

This project automates **PostgreSQL database backups** to a **Cloudflare R2 bucket** every 12 hours, with **logging and email notifications** for monitoring and disaster recovery readiness.

Features include:

- Dockerized PostgreSQL container
- Automated backup script
- Cloudflare R2 integration
- Logging for backup and upload
- Email notifications using `mailutils`
- Optional restore workflow

---

## Prerequisites

1. **WSL (Windows Subsystem for Linux)** or any Linux system.
2. **Docker** installed and running.
3. PostgreSQL running in a Docker container (`pg-backup`).
4. **Cloudflare R2 bucket** created and accessible via AWS S3-compatible API.
5. **AWS CLI installed** with a named profile (`r2`) for Cloudflare R2 access.
6. **Mailutils installed** for email notifications:

```bash
sudo apt update
sudo apt install mailutils -y
Environment variables configured:

bash
Copy code
export DB_USER=myuser
export DB_PASSWORD=myStrongPass123
export DB_NAME=testdb
export R2_BUCKET=backup-dbpostgre
export NOTIFY_EMAIL=2244deborah@gmail.com
Docker Setup
Run PostgreSQL container:

bash
Copy code
docker run -d \
  --name pg-backup \
  -e POSTGRES_USER=myuser \
  -e POSTGRES_PASSWORD=myStrongPass123 \
  -e POSTGRES_DB=testdb \
  -p 5432:5432 \
  postgres:15.3
Verify container is running:

bash
Copy code
docker ps
Backup Script
File: backup_postgres_r2.sh

Key Features:

Backup PostgreSQL using pg_dump.

Compress backup into .sql.gz.

Upload backup to Cloudflare R2 using AWS CLI.

Logging in /home/funmi/backup_postgres_r2.log.

Email notifications on success/failure.

Optional cleanup of local backup.

Make executable & run:

bash
Copy code
chmod +x backup_postgres_r2.sh
./backup_postgres_r2.sh
Cron Job Automation
Edit crontab:

bash
Copy code
crontab -e
Add line to run every 12 hours:

cron
Copy code
0 */12 * * * /home/funmi/backup_postgres_r2.sh
Logging
Log file: /home/funmi/backup_postgres_r2.log

Logs include start time, backup success/failure, upload success/failure, finish time.

Example:

bash
Copy code
===== Backup started at 2025-12-27 23:06 =====
Backing up database 'testdb' from container 'pg-backup'...
Database backup successful: /tmp/testdb_2025-12-27_23-06.sql.gz
Uploading /tmp/testdb_2025-12-27_23-06.sql.gz to Cloudflare R2 bucket 'backup-dbpostgre'...
Upload to R2 successful
Backup finished at 2025-12-27 23:07
Email Notifications
Recipient: 2244deborah@gmail.com

Sent on:

Backup failure

Upload failure

Successful backup

Example:

Failure: "Database backup FAILED for testdb at 2025-12-27 23:06"

Success: "Backup completed successfully for testdb at 2025-12-27 23:07"

Cloudflare R2 Integration
Upload backup:

bash
Copy code
aws s3 cp /tmp/testdb_2025-12-27_23-06.sql.gz s3://backup-dbpostgre/ \
    --endpoint-url https://bda79d88b7dcbe9776bd7247e5c7784f.r2.cloudflarestorage.com \
    --profile r2
Stores backups offsite for disaster recovery.

Disaster Recovery
Regular snapshots of your database

Offsite storage (Cloudflare R2)

Email alerts for failures

Optional restore script for recovery

Optional Enhancements
Restore Script: Download latest backup from R2 and restore PostgreSQL.

Slack Notifications: Team alerts for success/failure.

Backup Rotation: Keep last N backups to save storage.

Incremental Backups: Reduce storage usage for large databases.

Monitoring Dashboard: Track backup trends over time.

References / Tools Used
PostgreSQL Documentation

Docker Documentation

AWS CLI Documentation

Cloudflare R2 Documentation

mailutils

cron for scheduling jobs

Project Outcome
Fully automated PostgreSQL backup workflow to Cloudflare R2.

Logging and email notifications for monitoring.

Disaster recovery-ready setup for your database.

Cron automation ensures backups every 12 hours without manual intervention.

```**


# PostgreSQL Backup to Cloudflare R2

## Project Overview
This project automates **PostgreSQL database backups** to **Cloudflare R2** every **12 hours**, with **logging** and **email notifications** for disaster recovery.

It demonstrates **real-world DevOps practices**, including automation, offsite backups, monitoring, and restore workflows.

---

## Key Features
- Dockerized PostgreSQL container
- Automated backup script
- Cloudflare R2 integration
- Logging for backup and upload
- Email notifications using mailutils
- Restore workflow for disaster recovery

---

## Prerequisites
- WSL (Windows Subsystem for Linux) or Linux
- Docker installed and running
- PostgreSQL in a Docker container (`pg-backup`)
- Cloudflare R2 bucket with AWS S3-compatible API access
- AWS CLI installed with a named profile (`r2`) for Cloudflare R2
- `mailutils` installed for email notifications:

```bash
sudo apt update
sudo apt install mailutils -y
Set environment variables:

bash
Copy code
export DB_USER=myuser
export DB_PASSWORD=myStrongPass123
export DB_NAME=testdb
export R2_BUCKET=backup-dbpostgre
export NOTIFY_EMAIL=2244deborah@gmail.com
Docker Setup
Run PostgreSQL in a container:

bash
Copy code
docker run -d \
  --name pg-backup \
  -e POSTGRES_USER=myuser \
  -e POSTGRES_PASSWORD=myStrongPass123 \
  -e POSTGRES_DB=testdb \
  -p 5432:5432 \
  postgres:15.3
Verify the container is running:

bash
Copy code
docker ps
Backup Script
File: backup_postgres_r2.sh

Steps:

Dumps the PostgreSQL database from Docker

Compresses the backup into .sql.gz

Uploads backup to Cloudflare R2 using AWS CLI

Logs actions in /home/funmi/backup_postgres_r2.log

Sends email notifications for success/failure

Removes local backup after upload

Make script executable and run:

bash
Copy code
chmod +x backup_postgres_r2.sh
./backup_postgres_r2.sh
Cron Job Automation
Run backups automatically every 12 hours:

bash
Copy code
crontab -e
Add the following line:

cron
Copy code
0 */12 * * * /home/funmi/backup_postgres_r2.sh
Logging
Log file: /home/funmi/backup_postgres_r2.log

Logs include:

Backup start time

Backup success/failure

Upload success/failure

Finish time

Example log:

text
Copy code
===== Backup started at 2025-12-27 23:06 =====
Database backup successful: /tmp/testdb_2025-12-27_23-06.sql.gz
Upload to R2 successful
Backup finished at 2025-12-27 23:07
Email Notifications
Recipient: 2244deborah@gmail.com

Sent on: Backup failure, Upload failure, Successful backup

Example messages:

Failure: "Database backup FAILED for testdb at 2025-12-27 23:06"

Success: "Backup completed successfully for testdb at 2025-12-27 23:07"

Cloudflare R2 Integration
Upload backup using S3-compatible API:

bash
Copy code
aws s3 cp /tmp/testdb_2025-12-27_23-06.sql.gz s3://backup-dbpostgre/ \
  --endpoint-url https://bda79d88b7dcbe9776bd7247e5c7784f.r2.cloudflarestorage.com \
  --profile r2
Restore Script
Downloads the latest backup from Cloudflare R2

Restores it into PostgreSQL Docker container

Completes the disaster recovery workflow

Disaster Recovery Strategy
Regular automated backups

Offsite storage (Cloudflare R2)

Monitoring via logs and email alerts

Tested restore process

Optional Enhancements
Slack notifications for teams

Backup retention policy (keep last N backups)

Encrypted backups

Monitoring dashboards

Incremental backups for large databases

Tools & Technologies
PostgreSQL

Docker

Bash scripting

AWS CLI

Cloudflare R2

Cron

mailutils

Project Outcome
Reliable, automated PostgreSQL backups

Secure offsite storage

Logging and email notifications

Restore-ready disaster recovery workflow

Cron automation ensures backups every 12 hours