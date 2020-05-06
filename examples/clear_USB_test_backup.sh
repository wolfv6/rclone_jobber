#!/usr/bin/env sh

# deletes USB test backup directory; rclone_jobber.sh can create a new one as needed
# this script uses these user-defined environment variables: usb
############################################

#delete test backup
rm -r $usb/test_rclone_backup
