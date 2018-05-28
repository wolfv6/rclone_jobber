#!/usr/bin/env sh
#restore direc1 directory to it's original location

#source and destination paths
echo "\n>>>>>>>>>>>>>> Enter time stamp of direc1b to restore <<<<<<<<<<<<<<<<<"
read old
source="$HOME/test_rclone_backup/$old/direc1/direc1b"
dest="$HOME/test_rclone_data/direc1/direc1b_$old"

printf "\n*** restoring deleted directory direc1b ***\n"
rclone copy $source $dest
