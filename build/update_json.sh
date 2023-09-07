#!/bin/bash
#https://github.com/MiSTer-devel/Downloader_MiSTer/blob/main/docs/custom-databases.md

SCRIPT_MD5=$(md5sum ../mister-backup.sh | awk '{print $1}')
SCRIPT_SIZE=$(ls -o ../mister-backup.sh | awk '{print $4}')
INI_MD5=$(md5sum ../mister-backup.ini | awk '{print $1}')
INI_SIZE=$(ls -o ../mister-backup.ini | awk '{print $4}')
DATE=$(gdate +%s -r ../mister-backup.sh)
cp mister-backupdb.json-empty mister-backupdb.json
gsed -i 's/"hash": "XXX"/"hash": "'${SCRIPT_MD5}'"/' mister-backupdb.json
gsed -i 's/"size": XXX/"size": '${SCRIPT_SIZE}'/' mister-backupdb.json
gsed -i 's/"hash": "YYY"/"hash": "'${INI_MD5}'"/' mister-backupdb.json
gsed -i 's/"size": YYY/"size": '${INI_SIZE}'/' mister-backupdb.json
gsed -i 's/"timestamp": XXX/"timestamp": '${DATE}'/' mister-backupdb.json
mv mister-backupdb.json ../
