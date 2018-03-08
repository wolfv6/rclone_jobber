#!/bin/bash

# deletes USB test backup directory; rclone_jobber.sh can create a new one as needed
# replace ${USB} with your USB path
############################################
USB=${USB}

#delete and recreate test backup
rm -r ${USB}/test_rclone_backup
