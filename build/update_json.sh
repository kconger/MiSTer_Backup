#!/bin/bash
#https://github.com/MiSTer-devel/Downloader_MiSTer/blob/main/docs/custom-databases.md

MD5=$(md5sum ../mister-backup.sh | awk '{print $1}')
SIZE=$(ls -o ../mister-backup.sh | awk '{print $4}')
DATE=$(gdate +%s -r ../mister-backup.sh)
cp mister-backupdb.json-empty mister-backupdb.json
gsed -i 's/"hash": "XXX"/"hash": "'${MD5}'"/' mister-backupdb.json
gsed -i 's/"size": XXX/"size": '${SIZE}'/' mister-backupdb.json
gsed -i 's/"timestamp": XXX/"timestamp": '${DATE}'/' mister-backupdb.json
mv mister-backupdb.json ../
