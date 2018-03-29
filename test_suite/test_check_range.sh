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

printf "*** backup (should be empty) ***\n"
tree ${USB}/test_rclone_backup

printf "\n*** performing backup from null string (should have pop-up ERROR: job_check_null_source.sh aborted) ***\n"
./job_check_null_source.sh

printf "\n*** backup (should be empty) ***\n"
tree ${USB}/test_rclone_backup

printf "\n*** performing backup to null string (should have pop-up ERROR: job_check_null_source.sh aborted) ***\n"
./job_check_null_dest.sh

printf "\n*** backup (should be empty) ***\n"
tree ${USB}/test_rclone_backup

printf "\n*** deleting data directory ***\n"
rm -r ~/test_rclone_data
mkdir ~/test_rclone_data

printf "*** performing backup from empty source (should have pop-up ERROR: job_check_null_source.sh aborted) ***\n"
./job_check_empty_source.sh

printf "\n*** backup (should be empty) ***\n"
tree ${USB}/test_rclone_backup
