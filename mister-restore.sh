#!/bin/bash
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# You can download the latest version of this script from:
# https://github.com/kconger/MiSTer_Backup


freset="\e[0m\033[0m"
fblue="\e[1;34m"
fgreen="\e[1;32m"
fred="\e[1;31m"
fyellow="\e[1;33m"

echo -e "${fyellow}MiSTer Backup Restore Script${freset}";

. /media/fat/Scripts/mister-backup.ini

# Update the script if neccessary
if [ -z "$BACKUP_DESTINATION" ]; then 
	rsync -av --delete --progress "${BACKUP_DESTINATION}/fat/*" /media/fat/
else
	echo -e "${fred}BACKUP_DESTINATION not set in mister-backup.ini${freset}"
fi

echo -e "${fgreen}MiSTer SD restored from: ${BACKUP_DESTINATION}${freset}";

exit 0
