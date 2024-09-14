# This Bash script for MongoDB Database backups.

This repository provides a simple script for backing up a MongoDB database, designed to run periodically via cron. The script creates backups of your MongoDB database and stores them in a specified directory with a timestamp.




```bash
sudo crontab -e
```

## Add a new cron job to run the backup script at your desired interval. For example, to run the backup every day at 12:00 AM, add the following line: 

```bash 
0 0 * * * /path/to/mongodb_backups.sh >> /var/log/mongodb_backup.log 2>&1

```
