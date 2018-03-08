#!/bin/bash

############## setup directories #############

#delete and recreate test_rclone_data
rm -r ~/test_rclone_data
mkdir ~/test_rclone_data

mkdir ~/test_rclone_data/direc0
touch ~/test_rclone_data/direc0/f0

mkdir ~/test_rclone_data/direc1
touch ~/test_rclone_data/direc1/f1

mkdir ~/test_rclone_data/direc1/direc1a
touch ~/test_rclone_data/direc1/direc1a/f1a

mkdir ~/test_rclone_data/direc1/direc1b
touch ~/test_rclone_data/direc1/direc1b/f1b

#delete and recreate test_rclone_backup
rm -r ~/test_rclone_backup
mkdir ~/test_rclone_backup

################## call jobs #####################

printf "backup before first back up (should be empty):\n"
tree ~/test_rclone_backup

#backup
./job_dir_backup_to_dated_directory.sh

printf "\nbackup after first back up:\n"
tree ~/test_rclone_backup

#delete top directory
rm -r ~/test_rclone_data/direc0

#delete sub-directory
rm -r ~/test_rclone_data/direc1/direc1b

printf "\ndata after deleting direc0 and direc1b:\n"
tree ~/test_rclone_data

#backup
./job_dir_backup_to_dated_directory.sh

printf "\nbackup after deleting direc0 and direc1b, and backing up again:\n"
tree ~/test_rclone_backup

#restore deleted directory
./job_dir_restore_from_dated_directory.sh

printf "\ndata after restoring dated direc1b:\n"
tree ~/test_rclone_data
