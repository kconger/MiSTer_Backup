# MiSTer Backup Script

Setup
-------
Add the following entry to your 'downloader.ini' then run 'update_all.sh'
```
[mister-backup_files]
db_url = https://raw.githubusercontent.com/kconger/MiSTer_Backup/master/mister-backupdb.json
```

Run mister-backup.sh on mister-clone.sh to create the initial INI file.
```
mister-backup.sh
```

Change your backup destination in 'Scripts/mister-backup.ini', it currently defaults to '/media/usb0/backup/'
```
BACKUP_DESTINATION="/media/usb0/backup/"
```

Usage
-------
Clone MiSTer SD
-------
On your MiSTer run the following command to create a clone of your MiSTer SD card. This will take awhile, a 32GB card takes just under an hour.
```
mister-clone.sh
```

Backup
-------
On your MiSTer run the following command to create a backup of your /media/fat/ folder. The first one may take a bit depending on what is on your SD card, later runs will be incremental.
```
mister-backup.sh
```

Restore
-------
On your MiSTer run the following command to restore your /media/fat/ backup.
```
mister-restore.sh
```