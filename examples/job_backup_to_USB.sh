#!/bin/sh

################################### license ##################################
# job_backup_to_USB.sh calls rclone_jobber to perform a backup to USB.
# Written in 2018 by Wolfram Volpi, contact at https://github.com/wolfv6/rclone_jobber/issues.
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide.
# This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see http://creativecommons.org/publicdomain/zero/1.0/.
# rclone_jobber is not affiliated with rclone.
##############################################################################

#replace {$rclone_jobber}, ${HOME} and ${USB} with paths on your system
rclone_jobber=${rclone_jobber} #path to rclone_jobber directory

source="${HOME}/test_rclone_data"
dest="${USB}/test_rclone_backup"
move_old_files_to="dated_files"
options="--filter-from=${rclone_jobber}/examples/filter_rules --checksum"
monitoring_URL=""

${rclone_jobber}/rclone_jobber.sh "$source" "$dest" "$move_old_files_to" "$options" "$(basename $0)" "$monitoring_URL"

#display test directories (comment these if calling from job scheduler)
tree -a $source
tree -a $dest
