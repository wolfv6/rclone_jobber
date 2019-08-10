#!/usr/bin/env sh

############## setup directories #############

#delete and recreate rclone_test_data
rm -r ~/rclone_test_data
mkdir ~/rclone_test_data

mkdir ~/rclone_test_data/direc0
touch ~/rclone_test_data/direc0/f0

mkdir ~/rclone_test_data/direc1
touch ~/rclone_test_data/direc1/f1

mkdir ~/rclone_test_data/direc1/direc1a
touch ~/rclone_test_data/direc1/direc1a/f1a

mkdir ~/rclone_test_data/direc1/direc1b
touch ~/rclone_test_data/direc1/direc1b/f1b

#delete and recreate test_rclone_backup
rm -r ~/test_rclone_backup
mkdir ~/test_rclone_backup

################## call jobs #####################

printf "\n*** backup (should be empty) ***\n"
tree ~/test_rclone_backup

printf "\n*** performing first backup (should have pop-up WARNING: Parameter move_old_files_to=typo) ***\n"
./job_dir_backup_to_dated_directory.sh

printf "\n*** backup ***\n"
tree ~/test_rclone_backup

printf "\n*** deleting top directory direc0 ***\n"
rm -r ~/rclone_test_data/direc0

printf "*** deleting sub-directory direc1b ***\n"
rm -r ~/rclone_test_data/direc1/direc1b

printf "*** data directory (should be missing direc0 and direc1b) ***\n"
tree ~/rclone_test_data

printf "\n*** performing second backup (should have pop-up WARNING: Parameter move_old_files_to=typo) ***\n"
./job_dir_backup_to_dated_directory.sh

printf "\n*** backup (direc0 and direc1b should be moved to dated directory) ***\n"
tree ~/test_rclone_backup

#prompts for date_time of direc1b
./job_dir_restore_from_dated_directory.sh

printf "*** data directory (should have restored directory direc1b_<timestamp>) ***\n"
tree ~/rclone_test_data
