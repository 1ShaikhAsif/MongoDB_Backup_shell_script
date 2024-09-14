#!/bin/bash

# This script will create dircetories/folders for every backups everything else is same

# Adjust variables
MONGO_URI="mongodb://<username>:<password>@<cluster-url>/<dbname>"
BACKUP_PATH="/path/to/backup/folder"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FOLDER="$BACKUP_PATH/mongo_backup_$DATE"


mkdir -p $BACKUP_FOLDER

mongodump --uri="$MONGO_URI" --out=$BACKUP_FOLDER

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FOLDER"
else
    echo "Backup failed!"
    exit 1
fi

# Delete backups older than 7 days
find $BACKUP_PATH -type d -mtime +7 -exec rm -r {} \;
