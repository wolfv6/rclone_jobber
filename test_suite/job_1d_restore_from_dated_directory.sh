#!/bin/sh
#restore direc1 directory to it's original location

#source and destination paths
echo ">>>>>>>>>>>>>>>>>>> Enter time stamp of direc1b to restore <<<<<<<<<<<<<<<<<<<<"
read old
source="onedrive_test_rclone_backup_crypt:$old/direc1/direc1b"
dest="${HOME}/test_rclone_data/direc1/direc1b_$old"

printf "\n*** restoring directory direc1b ***\n"
rclone copy $source $dest

#################### output for testing ################
printf "*** data directory ***\n"
tree ~/test_rclone_data

f1b="${HOME}/test_rclone_data/direc1/direc1b_$old/f1b"
echo "contents of $f1b: $(cat $f1b)"
