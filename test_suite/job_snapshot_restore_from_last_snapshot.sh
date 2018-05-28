#!/usr/bin/env sh
#restore direc1 directory to it's original location

#source and destination paths
source="$HOME/test_rclone_backup/last_snapshot/direc1/direc1b"
dest="$HOME/test_rclone_data/direc1/direc1b_last_snapshot"

#restore directory
rclone copy $source $dest
