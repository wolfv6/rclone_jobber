#!/bin/bash

#define backup arguments at top of job file
source="${HOME}/test_rclone_data"
dest="${HOME}/test_rclone_backup"
move_old_files_to="typo"       #should give pop-up warning and move old data to dated_directory

../rclone_jobber.sh "$source" "$dest" "$move_old_files_to" "$options" "$(basename $0)"
