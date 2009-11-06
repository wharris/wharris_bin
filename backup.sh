#!/bin/sh

# backup.sh - backup home directory.
# Copyright (C) 2008  Will Harris
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

STARTED=`date`
mkdir -p $HOME/log
(echo Started $STARTED
/usr/local/bin/growlnotify -n Backup -m "Backup started $STARTED" Backup 2>/dev/null >/dev/null
/usr/bin/rsync --exclude '*.avi' \
               --exclude '*.mov' \
               --exclude '*.mpg' \
               --exclude "/tmp" \
               --exclude ".Trash" \
               --exclude "*.vmdk" \
               -azE \
               --delete \
               --ignore-errors \
               --rsh=ssh \
               $HOME \
               "$BACKUP_PATH"
ENDED=`date`
echo Ended $ENDED) > $BACKUP_LOG 2> $BACKUP_ERR
if [[ -s $BACKUP_ERR ]]
then /usr/local/bin/growlnotify -s -n 'Backup Error' -m "`head -n1 $BACKUP_ERR`" Backup Error
else /usr/local/bin/growlnotify -s -n Backup -m "`head -n1 $BACKUP_LOG`" Backup
fi

