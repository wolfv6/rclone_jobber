#!/bin/bash
#restore old version of f1 to it's original location

#source and destination paths
source="${USB}/test_rclone_backup/old_files/direc1/f1_*"
dest="${HOME}/test_rclone_data/direc1"

#restore file
rclone copy $source $dest
