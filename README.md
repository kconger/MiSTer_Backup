# MiSTer Backup Script

Setup
-------
Add the following entry to your 'downloader.ini' then run 'update_all.sh'
```
[mister-backup_files]
db_url = https://raw.githubusercontent.com/kconger/MiSTer_Backup/master/mister-backupdb.json
```

Run mister-backup.sh to create the initial INI file.
```
mister-backup.sh
```

Change your backup destination in 'Scripts/mister-backup.ini', it currently defaults to '/media/usb0/backup/'
```
BACKUP_DESTINATION="/media/usb0/backup/"
```

Usage
-------
Backup
-------
On your MiSTer run the following command to create a backup. The first one may take a bit depending on what is on your SD card, later runs will be incremental.
```
mister-backup.sh
```

Restore
-------
On your MiSTer run the following command to restore your backup.
```
mister-restore.sh
```