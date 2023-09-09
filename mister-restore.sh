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

REPOSITORY_URL="https://raw.githubusercontent.com/kconger/MiSTer_Backup/"
REPO_BRANCH="master"

NODEBUG="-q -o /dev/null"

echo -e "${fyellow}MiSTer Backup Restore Script${freset}";

check4error() {
  case "${1}" in
    0) ;;
    1) echo -e "${fyellow}wget: ${fred}Generic error code.${freset}" ;;
    2) echo -e "${fyellow}wget: ${fred}Parse error---for instance, when parsing command-line options, the .wgetrc or .netrc..." ;;
    3) echo -e "${fyellow}wget: ${fred}File I/O error.${freset}" ;;
    4) echo -e "${fyellow}wget: ${fred}Network failure.${freset}" ;;
    5) echo -e "${fyellow}wget: ${fred}SSL verification failure.${freset}" ;;
    6) echo -e "${fyellow}wget: ${fred}Username/password authentication failure.${freset}" ;;
    7) echo -e "${fyellow}wget: ${fred}Protocol errors.${freset}" ;;
    8) echo -e "${fyellow}wget: ${fred}Server issued an error response.${freset}" ;;
    *) echo -e "${fred}Unexpected and uncatched error.${freset}" ;;
  esac
  ! [ "${1}" = "0" ] && exit "${1}"
}

# Update the script if neccessary
wget ${NODEBUG} --no-cache "${REPOSITORY_URL}${REPO_BRANCH}/mister-restore.sh" -O /tmp/mister-restore.sh
check4error "${?}"
cmp -s /tmp/mister-restore.sh /media/fat/Scripts/mister-restore.sh
if [ "${?}" -gt "0" ] && [ -s /tmp/mister-restore.sh ]; then
    echo -e "${fyellow}Script Updated ${fmagenta}${PICNAME}${freset}"
    mv -f /tmp/mister-restore.sh /media/fat/Scripts/mister-restore.sh
    exec /media/fat/Scripts/mister-restore.sh
    exit 255
else
    rm /tmp/mister-restore.sh
fi

# Check for INI file download if neccessary
if [ -e /media/fat/Scripts/mister-backup.ini ]; then
	. /media/fat/Scripts/mister-backup.ini
else
	wget ${NODEBUG} --no-cache "${REPOSITORY_URL}${REPO_BRANCH}/mister-backup.ini" -O /tmp/mister-backup.ini
	check4error "${?}"
	mv /tmp/mister-backup.ini /media/fat/Scripts/mister-backup.ini
	. /media/fat/Scripts/mister-backup.ini
	echo -e "${fyellow}Missing mister-backup.ini installed with default backup location of: ${BACKUP_DESTINATION}${fmagenta}${PICNAME}${freset}"
	exit 0
fi

# Run restore
if [ -z "$BACKUP_DESTINATION" ]; then 
	read -p "Restore MiSTer from: ${BACKUP_DESTINATION}? [y/N] " answer
	if [[ $answer =~ ^[Yy]$ ]]; then
		rsync -avh --delete --progress "${BACKUP_DESTINATION}/fat/" /media/fat/
	else
		echo -e "${fred}Restore Canceled${freset}"
	fi
else
	echo -e "${fred}BACKUP_DESTINATION not set in mister-backup.ini${freset}"
fi

echo -e "${fgreen}MiSTer SD restored from: ${BACKUP_DESTINATION}${freset}";

exit 0
