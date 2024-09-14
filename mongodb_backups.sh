#!/bin/bash


MONGO_URI="your mongodb uri"
BACKUP_PATH="/home/ubuntu/daily-bd-backups"    #Adjust path
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="mongo_backup_$DATE"
BACKUP_FILE="$BACKUP_PATH/$BACKUP_NAME.gz"


mkdir -p $BACKUP_PATH


mongodump --uri="$MONGO_URI" --archive=$BACKUP_FILE --gzip

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi


find $BACKUP_PATH -type f -mtime +7 -name "*.gz" -exec rm {} \;


