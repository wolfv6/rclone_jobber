#!/bin/bash

############## setup test directories #############

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

mkdir ~/test_rclone_data/direc1/direc1c
touch ~/test_rclone_data/direc1/direc1c/f1c

#files and directory names ending in "_exc"
touch ~/test_rclone_data/direc1/f1_exc
touch ~/test_rclone_data/direc1/f2_exc.txt
touch ~/test_rclone_data/direc1/f3_excy
touch ~/test_rclone_data/direc1/f4_exc.not.txt
mkdir ~/test_rclone_data/direc1/direc5_exc
touch ~/test_rclone_data/direc1/direc5_exc/f5
touch ~/test_rclone_data/direc1/f6.bak

touch ~/test_rclone_data/direc1/.hidden
touch ~/test_rclone_data/direc1/.bashrc
touch ~/test_rclone_data/direc1/.#lock.sh

#delete and recreate test_rclone_backup
rm -r ~/test_rclone_backup
mkdir ~/test_rclone_backup

################## call jobs #####################

printf "data, with _exc files to be excluded from backup:\n"
tree -a ~/test_rclone_data

printf "backup before first back up (should be empty):\n"
tree -a ~/test_rclone_backup

#backup
./job_snapshot_backup_old_data_to_delete.sh

printf "\nbackup after first back up (file names ending in _exe should be excluded):\n"
tree -a ~/test_rclone_backup

#remove direc1b
rm -r ~/test_rclone_data/direc1/direc1b

#backup
./job_snapshot_backup_old_data_to_delete.sh

printf "\nbackup after removing direc1b and back up again (direc1b should be missing):\n"
tree -a ~/test_rclone_backup

#restore direc1 from last snapshot
./job_snapshot_restore_from_last_snapshot.sh

printf "\ndata after attempted restore (direc1b should be missing):\n"
tree -a ~/test_rclone_data

