#!/usr/bin/env sh

############## setup directories #############

#delete and recreate rclone_test_data
rm -r ~/rclone_test_data
mkdir ~/rclone_test_data

touch ~/rclone_test_data/f

mkdir ~/rclone_test_data/direc0
touch ~/rclone_test_data/direc0/f0

#delete and recreate test_rclone_backup
rm -r $usb/test_rclone_backup
mkdir $usb/test_rclone_backup

################## call jobs #####################

printf "*** backup (should be empty) ***\n"
tree $usb/test_rclone_backup

printf "\n*** performing backup from null string (should have pop-up ERROR: job_check_null_source.sh aborted) ***\n"
./job_check_null_source.sh

printf "\n*** backup (should be empty) ***\n"
tree $usb/test_rclone_backup

printf "\n*** performing backup to null string (should have pop-up ERROR: job_check_null_source.sh aborted) ***\n"
./job_check_null_dest.sh

printf "\n*** backup (should be empty) ***\n"
tree $usb/test_rclone_backup

printf "\n*** deleting data directory ***\n"
rm -r ~/rclone_test_data
mkdir ~/rclone_test_data

printf "*** performing backup from empty source (should have pop-up ERROR: job_check_null_source.sh aborted) ***\n"
./job_check_empty_source.sh

printf "\n*** backup (should be empty) ***\n"
tree $usb/test_rclone_backup
