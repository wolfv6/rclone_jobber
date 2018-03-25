#!/bin/sh

rclone_wolf="/home/wolfv/Documents/pc_maintenance/backup_systems/rclone_wolf"

source="/home/wolfv/Documents/pc_maintenance"
dest="onedrive:recovery_plan"
move_old_files_to="dated_directory"
options="--filter-from=${rclone_wolf}/filter_rules_recovery_plan --checksum"
monitoring_URL="https://monitor.io/12345678-1234-1234-1234-1234567890ab"

${rclone_wolf}/rclone_jobber.sh "$source" "$dest" "$move_old_data_to" "$options" "$(basename $0)" "$monitoring_URL"
