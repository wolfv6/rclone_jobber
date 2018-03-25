#!/bin/sh

# clear remote test backup for rclone_jobber.sh
# replace ${remote} with your remote test backup
###############################################
remote=${remote}

#delete test backup
rclone purge ${remote}:

#display empty test backup
rclone ls ${remote}:
