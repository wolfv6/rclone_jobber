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
printf "text" > ~/test_rclone_data/direc1/direc1b/f1b

#delete test_rclone_backup
rclone purge onedrive_test_rclone_backup_crypt:

################## call jobs #####################

printf "backup before first back up (should be: directory not found):\n"
rclone ls onedrive_test_rclone_backup_crypt:

#backup
./job_1d_backup_to_dated_directory.sh

printf "\nbackup after first back up:\n"
rclone ls onedrive_test_rclone_backup_crypt:

#delete top directory
rm -r ~/test_rclone_data/direc0

#delete sub-directory
rm -r ~/test_rclone_data/direc1/direc1b

printf "\ndata after deleting direc0 and direc1b:\n"
tree ~/test_rclone_data

#backup
./job_1d_backup_to_dated_directory.sh

printf "\nbackup after deleting direc0 and direc1b, and backing up again:\n"
rclone ls onedrive_test_rclone_backup_crypt:

#restore deleted directory
./job_1d_restore_from_dated_directory.sh

#output for testing is at end of job_1d_restore_from_dated_directory.sh
