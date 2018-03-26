#!/bin/sh

############## setup directories #############

#delete and recreate test_rclone_data
rm -r ~/test_rclone_data
mkdir ~/test_rclone_data

touch ~/test_rclone_data/f

mkdir ~/test_rclone_data/direc0
touch ~/test_rclone_data/direc0/f0

#delete and recreate test_rclone_backup
rm -r ${USB}/test_rclone_backup
mkdir ${USB}/test_rclone_backup

################## call jobs #####################

printf "backup before first back up (should be empty):\n"
tree ${USB}/test_rclone_backup

#back up
./job_check_null_source.sh
printf "\nbackup after null source (should be empty):\n"
tree ${USB}/test_rclone_backup

#back up
./job_check_null_dest.sh
printf "\nbackup after null dest (should be empty):\n"
tree ${USB}/test_rclone_backup

#empty ~/test_rclone_data directory
rm -r ~/test_rclone_data
mkdir ~/test_rclone_data

#back up
./job_check_empty_source.sh
printf "\nbackup after empty source (should be empty):\n"
tree ${USB}/test_rclone_backup
