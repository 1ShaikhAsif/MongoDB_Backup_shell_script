# This Bash script for MongoDB Database backups.

This repository provides a simple script for backing up a MongoDB database, designed to run periodically via cron. The script creates backups of your MongoDB database and stores them in a specified directory with a timestamp.




```bash
sudo crontab -e
```

## Usage

```bash 
0 0 * * * /path/to/mongodb_backups.sh >> /var/log/mongodb_backup.log 2>&1

```
