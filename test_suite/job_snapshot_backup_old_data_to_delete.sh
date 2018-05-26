#!/bin/sh

source="${HOME}/test_rclone_data"
dest="${HOME}/test_rclone_backup"
options="--filter-from=filter_rules"

../rclone_jobber.sh "$source" "$dest" "$move_old_files_to" "$options" "$(basename $0)"
