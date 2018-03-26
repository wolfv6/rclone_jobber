#!/bin/sh

source="${HOME}/test_rclone_data"
dest="onedrive_test_rclone_backup_crypt:"
move_old_files_to="typo"       #should give pop-up warning and default to "dated_directory"
options="--checksum"

../rclone_jobber.sh "$source" "$dest" "$move_old_files_to" "$options" "$(basename $0)"
