#!/usr/bin/env sh

############## setup test directories #############

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

mkdir ~/rclone_test_data/direc1/direc1c
touch ~/rclone_test_data/direc1/direc1c/f1c

#files and directory names ending in "_exc"
touch ~/rclone_test_data/direc1/f1_exc
touch ~/rclone_test_data/direc1/f2_exc.txt
touch ~/rclone_test_data/direc1/f3_excy
touch ~/rclone_test_data/direc1/f4_exc.not.txt
mkdir ~/rclone_test_data/direc1/direc5_exc
touch ~/rclone_test_data/direc1/direc5_exc/f5
touch ~/rclone_test_data/direc1/f6.bak

touch ~/rclone_test_data/direc1/.hidden
touch ~/rclone_test_data/direc1/.bashrc
touch ~/rclone_test_data/direc1/.#lock.sh

#delete and recreate test_rclone_backup
rm -r ~/test_rclone_backup
mkdir ~/test_rclone_backup

################## call jobs #####################

printf "\n*** data directory, with _exc files to be excluded from backup ***\n"
tree -a ~/rclone_test_data

printf "\n*** backup (should be empty) ***\n"
tree -a ~/test_rclone_backup

printf "\n*** performing first backup ***\n"
./job_snapshot_backup_old_data_to_delete.sh

printf "\n*** backup (file names ending in _exc should be excluded) ***\n"
tree -a ~/test_rclone_backup

printf "\n*** removing direc1b ***\n"
rm -r ~/rclone_test_data/direc1/direc1b

printf "*** performing second backup ***\n"
./job_snapshot_backup_old_data_to_delete.sh

printf "\n*** backup (direc1b should be missing) ***\n"
tree -a ~/test_rclone_backup

printf "\n*** attempting to restore direc1 from last snapshot ***\n"
./job_snapshot_restore_from_last_snapshot.sh

printf "\n*** data directory (direc1b should be missing) ***\n"
tree -a ~/rclone_test_data

