# MiSTer Backup Script

Add the following entry to your downloader.ini then run update_all.sh

 [mister-backup_files]
 db_url = https://raw.githubusercontent.com/kconger/MiSTer_Backup/master/mister-backupdb.json

Change your backup destination in 'mister-backup.ini', it currently defaults to 'media/usb0/backups/'

 BACKUP_DESTINATION="/media/usb0/backup/"

On your MiSTer run the following command to create a backup. The first one may take a bit depending on what is on your SD card, later runs will be incremental.

 mister-backup.sh
