#!/usr/bin/env sh

################################### license ##################################
# job_restore_last_snapshot.sh restores last_snapshot to home, with "_last_snapshot" appended to user name
# Written in 2018 by Wolfram Volpi, contact at https://github.com/wolfv6/rclone_jobber/issues.
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide.
# This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see http://creativecommons.org/publicdomain/zero/1.0/.
# rclone_jobber is not affiliated with rclone.
##############################################################################

#this script uses these user-defined environment variables: remote

#uncomment the source variable to restore data from:
source="$usb/test_rclone_backup/last_snapshot"
#source="${remote}:last_snapshot"

destination="$HOME/last_snapshot"

cmd="rclone copy $source $destination"

echo "$cmd"
echo ">>>>>>>>>>>>>>> Run the above rclone command? (y) <<<<<<<<<<<<<<<<< "
read -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    eval $cmd  #restore last_snapshot
fi
