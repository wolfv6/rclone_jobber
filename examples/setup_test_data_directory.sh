#!/bin/bash

########################## License ########################################
# setup_test_data_directory.sh by Wolfram Volpi is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
# Based on a work at https://github.com/wolfv6/rclone_jobber.
# Permissions beyond the scope of this license may be available at https://github.com/wolfv6/rclone_jobber/issues.
###########################################################################

# setup ~/test_rclone_data directory for rclone_jobber.sh
#########################################################

#delete and recreate test_rclone_data
rm -r ~/test_rclone_data
mkdir ~/test_rclone_data

mkdir ~/test_rclone_data/direc_empty

mkdir ~/test_rclone_data/direc0
touch ~/test_rclone_data/direc0/f0

mkdir ~/test_rclone_data/direc1
touch ~/test_rclone_data/direc1/f1

mkdir ~/test_rclone_data/direc1/direc1a
touch ~/test_rclone_data/direc1/direc1a/f1a

mkdir ~/test_rclone_data/direc1/direc1b
touch ~/test_rclone_data/direc1/direc1b/f1b

#files and directory names ending in "_exc"
mkdir ~/test_rclone_data/direc1/direc1c_exc
touch ~/test_rclone_data/direc1/direc1c_exc/f1c

touch ~/test_rclone_data/direc1/f2_exc
touch ~/test_rclone_data/direc1/f3_exc.txt
touch ~/test_rclone_data/direc1/f4_excy
touch ~/test_rclone_data/direc1/f5_exc.not.txt
touch ~/test_rclone_data/direc1/f6.bak

#hidden directories and files
touch ~/test_rclone_data/.bashrc
touch ~/test_rclone_data/direc1/.hidden
touch ~/test_rclone_data/direc1/.thingrc
mkdir ~/test_rclone_data/direc1/.hide
touch ~/test_rclone_data/direc1/.hide/f8
mkdir ~/test_rclone_data/direc1/.git
touch ~/test_rclone_data/direc1/.git/f7

#display test data directory
tree -a ~/test_rclone_data
