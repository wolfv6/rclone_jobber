#!/bin/sh

# deletes USB test backup directory; rclone_jobber.sh can create a new one as needed
# substitute $usb with your USB path
############################################

#delete test backup
rm -r $usb/test_rclone_backup
