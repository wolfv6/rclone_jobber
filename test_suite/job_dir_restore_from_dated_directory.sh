#!/bin/sh
#restore direc1 directory to it's original location

#source and destination paths
echo "Enter date_time of direc1b to restore:"
read old
source="${HOME}/test_rclone_backup/$old/direc1/direc1b"
dest="${HOME}/test_rclone_data/direc1/direc1b_$old"

#restore directory
rclone copy $source $dest
