#!/bin/sh
STARTED=`date`
mkdir -p /Users/will/log
(echo Started $STARTED
/usr/bin/rsync --exclude '*.avi' --exclude '*.mov' --exclude '*.mpg' --exclude "/tmp" --exclude ".Trash" --exclude "*.vmdk" -azE --delete --ignore-errors --rsh=ssh /Users/will/ "greatlibrary.dyndns.org:/Volumes/External\ HD/rsync_backup/fawkes/Users/will/"
ENDED=`date`
echo Ended $ENDED) > /Users/will/log/backup.log

