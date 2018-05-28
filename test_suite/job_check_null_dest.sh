#!/usr/bin/env sh

source="$HOME/test_rclone_data"
dest=""
move_old_files_to="dated_files"
monitoring_URL="https://hchk.io/c74b2d3c-dfb9-4cdb-b81a-872618dfd0b8"

../rclone_jobber.sh "$source" "$dest" "$move_old_files_to" "$options" "$(basename $0)" "$monitoring_URL"
