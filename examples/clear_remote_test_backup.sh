#!/usr/bin/env sh

# clears remote test backup for rclone_jobber.sh
# this script uses these user-defined environment variables: remote
###############################################

#delete test backup
rclone purge ${remote}:

#verify empty, should say "Failed to ls: directory not found"
rclone ls ${remote}:
