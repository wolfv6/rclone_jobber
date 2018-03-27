#!/bin/sh

# clear remote test backup for rclone_jobber.sh
# replace ${remote} with your remote test backup
###############################################
remote=${remote}

#delete test backup
rclone purge ${remote}:

#verify empty, should say "Failed to ls: directory not found"
rclone ls ${remote}:
