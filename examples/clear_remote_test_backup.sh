#!/bin/sh

# clear remote test backup for rclone_jobber.sh
# substitute ${remote} with your remote test backup path
###############################################

#delete test backup
rclone purge ${remote}:

#verify empty, should say "Failed to ls: directory not found"
rclone ls ${remote}:
