#!/bin/sh

############## setup directories #############

#delete and recreate test_rclone_data
rm -r ~/test_rclone_data
mkdir ~/test_rclone_data

mkdir ~/test_rclone_data/direc0
touch ~/test_rclone_data/direc0/f0

mkdir ~/test_rclone_data/direc1
printf "original" > ~/test_rclone_data/direc1/f1

mkdir ~/test_rclone_data/direc1/direc1a
touch ~/test_rclone_data/direc1/direc1a/f1a

mkdir ~/test_rclone_data/direc1/direc1b
touch ~/test_rclone_data/direc1/direc1b/f1b

#delete and recreate test_rclone_backup
rm -r ${USB}/test_rclone_backup
mkdir ${USB}/test_rclone_backup

################## call jobs #####################

printf "*** backup (should be empty) ***\n"
tree ${USB}/test_rclone_backup

printf "\n*** performing first backup ***\n"
./job_USB_backup_to_USB.sh

printf "\n*** editing f1 file ***\n"
printf "edited" > ~/test_rclone_data/direc1/f1

printf "*** data directory ***\n"
tree ${HOME}/test_rclone_data

printf "\n*** performing second backup ***\n"
./job_USB_backup_to_USB.sh

printf "\n*** backup (f1_<timestamp> should be in old_files) ***\n"
tree ${USB}/test_rclone_backup

printf "\n*** restoring old f1 ***\n"
./job_USB_restore_from_USB.sh

printf "*** data directory (f1_<timestamp> and f1 should be in direc1) ***\n"
tree ${HOME}/test_rclone_data
