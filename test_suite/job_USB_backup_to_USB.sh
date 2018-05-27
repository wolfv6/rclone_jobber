#!/bin/sh

source="$HOME/test_rclone_data"
dest="$USB/test_rclone_backup"
move_old_files_to="dated_files"
options="--checksum"

../rclone_jobber.sh "$source" "$dest" "$move_old_files_to" "$options" "$(basename $0)"
