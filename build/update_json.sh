#!/bin/bash
#https://github.com/MiSTer-devel/Downloader_MiSTer/blob/main/docs/custom-databases.md

BACKUP_SCRIPT_MD5=$(md5sum ../mister-backup.sh | awk '{print $1}')
BACKUP_SCRIPT_SIZE=$(ls -o ../mister-backup.sh | awk '{print $4}')
RESTORE_SCRIPT_MD5=$(md5sum ../mister-restore.sh | awk '{print $1}')
RESTORE_SCRIPT_SIZE=$(ls -o ../mister-restore.sh | awk '{print $4}')
INI_MD5=$(md5sum ../mister-backup.ini | awk '{print $1}')
INI_SIZE=$(ls -o ../mister-backup.ini | awk '{print $4}')
DATE=$(gdate +%s)
cp mister-backupdb.json-empty mister-backupdb.json
gsed -i 's/"hash": "XXX"/"hash": "'${BACKUP_SCRIPT_MD5}'"/' mister-backupdb.json
gsed -i 's/"size": XXX/"size": '${BACKUP_SCRIPT_SIZE}'/' mister-backupdb.json
gsed -i 's/"hash": "YYY"/"hash": "'${RESTORE_SCRIPT_MD5}'"/' mister-backupdb.json
gsed -i 's/"size": YYY/"size": '${RESTORE_SCRIPT_SIZE}'/' mister-backupdb.json
gsed -i 's/"hash": "ZZZ"/"hash": "'${INI_MD5}'"/' mister-backupdb.json
gsed -i 's/"size": ZZZ/"size": '${INI_SIZE}'/' mister-backupdb.json
gsed -i 's/"timestamp": XXX/"timestamp": '${DATE}'/' mister-backupdb.json
mv mister-backupdb.json ../
