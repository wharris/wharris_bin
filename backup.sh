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
growlnotify -n Backup -m "Backup started $STARTED" Backup
/usr/bin/rsync --exclude '*.avi' --exclude '*.mov' --exclude '*.mpg' --exclude "/tmp" --exclude ".Trash" --exclude "*.vmdk" -azE --delete --ignore-errors --rsh=ssh $HOME "$BACKUP_PATH"
ENDED=`date`
growlnotify -s -n Backup -m "Backup ended $ENDED" Backup
echo Ended $ENDED) > $BACKUP_LOG

