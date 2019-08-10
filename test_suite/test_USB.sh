#!/usr/bin/env sh

############## setup directories #############

#delete and recreate rclone_test_data
rm -r ~/rclone_test_data
mkdir ~/rclone_test_data

mkdir ~/rclone_test_data/direc0
touch ~/rclone_test_data/direc0/f0

mkdir ~/rclone_test_data/direc1
printf "original" > ~/rclone_test_data/direc1/f1

mkdir ~/rclone_test_data/direc1/direc1a
touch ~/rclone_test_data/direc1/direc1a/f1a

mkdir ~/rclone_test_data/direc1/direc1b
touch ~/rclone_test_data/direc1/direc1b/f1b

#delete and recreate test_rclone_backup
rm -r $usb/test_rclone_backup
mkdir $usb/test_rclone_backup

################## call jobs #####################

printf "*** backup (should be empty) ***\n"
tree $usb/test_rclone_backup

printf "\n*** performing first backup ***\n"
./job_USB_backup_to_USB.sh

printf "\n*** editing f1 file ***\n"
printf "edited" > ~/rclone_test_data/direc1/f1

printf "*** data directory ***\n"
tree $HOME/rclone_test_data

printf "\n*** performing second backup ***\n"
./job_USB_backup_to_USB.sh

printf "\n*** backup (f1_<timestamp> should be in old_files) ***\n"
tree $usb/test_rclone_backup

printf "\n*** restoring old f1 ***\n"
./job_USB_restore_from_USB.sh

printf "*** data directory (f1_<timestamp> and f1 should be in direc1) ***\n"
tree $HOME/rclone_test_data
