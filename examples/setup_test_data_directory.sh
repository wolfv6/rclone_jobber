#!/usr/bin/env sh

########################## License ########################################
# setup_test_data_directory.sh by Wolfram Volpi is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
# Based on a work at https://github.com/wolfv6/rclone_jobber.
# Permissions beyond the scope of this license may be available at https://github.com/wolfv6/rclone_jobber/issues.
###########################################################################

# setup ~/rclone_test_data directory for rclone_jobber.sh
#########################################################

#delete and recreate rclone_test_data
rm -r ~/rclone_test_data
mkdir ~/rclone_test_data

mkdir ~/rclone_test_data/direc_empty

mkdir ~/rclone_test_data/direc0
touch ~/rclone_test_data/direc0/f0

mkdir ~/rclone_test_data/direc1
touch ~/rclone_test_data/direc1/f1

mkdir ~/rclone_test_data/direc1/direc1a
touch ~/rclone_test_data/direc1/direc1a/f1a

mkdir ~/rclone_test_data/direc1/direc1b
touch ~/rclone_test_data/direc1/direc1b/f1b

#files and directory names ending in "_exc"
mkdir ~/rclone_test_data/direc1/direc1c_exc
touch ~/rclone_test_data/direc1/direc1c_exc/f1c

touch ~/rclone_test_data/direc1/f2_exc
touch ~/rclone_test_data/direc1/f3_exc.txt
touch ~/rclone_test_data/direc1/f4_excy
touch ~/rclone_test_data/direc1/f5_exc.not.txt
touch ~/rclone_test_data/direc1/f6.bak

#hidden directories and files
touch ~/rclone_test_data/.bashrc
touch ~/rclone_test_data/direc1/.hidden
touch ~/rclone_test_data/direc1/.thingrc
mkdir ~/rclone_test_data/direc1/.hide
touch ~/rclone_test_data/direc1/.hide/f8
mkdir ~/rclone_test_data/direc1/.git
touch ~/rclone_test_data/direc1/.git/f7

#display test_data directory
tree -a ~/rclone_test_data
