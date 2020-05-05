#!/usr/bin/env sh

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

printf "*** backup (should be: directory not found) ***\n"
rclone ls onedrive_test_rclone_backup_crypt:

printf "\n*** performing first backup (should have pop-up WARNING: job_1d_backup_to_dated_directory.sh) ***\n"
./job_1d_backup_to_dated_directory.sh

printf "\n*** backup ***\n"
rclone ls onedrive_test_rclone_backup_crypt:

printf "\n*** data directory ***\n"
tree ~/test_rclone_data

printf "\n*** deleting top directory direc0 ***\n"
rm -r ~/test_rclone_data/direc0

printf "*** deleting sub-directory direc1b ***\n"
rm -r ~/test_rclone_data/direc1/direc1b

printf "*** data directory (should be missing direc0 and direc1b) ***\n"
tree ~/test_rclone_data

printf "\n*** performing second backup (should have pop-up WARNING: job_1d_backup_to_dated_directory.sh) ***\n"
./job_1d_backup_to_dated_directory.sh

printf "\n*** backup (f0 and f1b should be moved to dated directory) ***\n"
rclone ls onedrive_test_rclone_backup_crypt:

#prompt for deleted direc1b timestamp, restore, and output data directory
./job_1d_restore_from_dated_directory.sh
