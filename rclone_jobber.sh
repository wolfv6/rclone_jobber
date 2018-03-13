#!/bin/bash
#rclone_jobber.sh version 1.1
#Tutorial, backup-job examples, and source code at https://github.com/wolfv6/rclone_jobber

################################### license ##################################
# rclone_jobber.sh is a script that calls rclone sync to perform a backup.
# Written in 2018 by Wolfram Volpi, contact at https://github.com/wolfv6/rclone_jobber/issues
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide.
# This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see http://creativecommons.org/publicdomain/zero/1.0/.
# rclone_jobber is not affiliated with rclone.

################################# parameters #################################
source="$1"            #the directory to back up
dest="$2"              #destination=$dest/last_snapshot
move_old_files_to="$3" #move_old_files_to is one of: "dated_directory", "dated_files", ""
options="$4"           #rclone options like "--filter-from=filter_patterns --checksum --dry-run"
                       #do not put these in options: --backup-dir, --suffix, --log-file, --log-level
job_name="$5"          #job_name="$(basename $0)"
monitoring_URL="$6"    #cron monitoring service URL to send email if cron or other errors prevented back up

################################ set variables ###############################
#$new is the directory name of the current snapshot (the name "last_snapshot" makes more sense in the future)
#$timestamp is time that old file was moved out of new (not time file was copied from source)
new="last_snapshot"
timestamp="$(date +%F_%T)"
#timestamp="$(date +%F_%H%M%S)" #time w/o colons if thumb drive is FAT format, which does not allow colons in file name

path="$(realpath $0)"      #log file in same directory as this script
log_file="${path%.*}.log"  #replace this file's extension with "log"

#set rclone log_level for desired amount of information in log entries  https://rclone.org/docs/#log-level-level
#log_level="DEBUG"  # outputs lots of debug info - useful for bug reports and really finding out what rclone is doing
log_level="INFO"   # outputs information about each transfer and prints stats once a minute
#log_level="NOTICE" # outputs warnings and significant events, which is very little when things are working normally
#log_level="ERROR"  # outputs only error messages

################################## functions #################################
print_message()
{
    label="$1"
    msg="$2"
    message="${label}: $job_name $msg"

    echo "$message"
    echo "$(date +%F_%T) $message" >> "$log_file"
    warning_icon="/usr/share/icons/Adwaita/32x32/emblems/emblem-synchronizing.png"
    #notify-send is a popup notification on most Linux desktops
    notify-send --urgency critical --icon "$warning_icon" "$message"
}

################################# range checks ################################
if [ -z "$source" ]; then
    print_message "ERROR" "aborted because source is empty string."
    exit 1
fi

if [ -z "$dest" ]; then
    print_message "ERROR" "aborted because dest is empty string."
    exit 1
fi

#if source has no directories
#using rclone lsd because it produces a smaller output than rclone ls
#if your source has not directories, use rclone ls
#rclone 1.40 will have lsf
if ! test "$(rclone lsd $source)"; then
    print_message "ERROR" "aborted because source is empty."
    exit 1
fi

#if job is already running (maybe previous run didn't finish)
if pidof -o $PPID -x "$job_name"; then
    print_message "WARNING" "aborted because it is already running."
    exit 1
fi

############################### move_old_files_to #############################
#deleted or changed files are removed or moved, depending on value of move_old_files_to variable
#default move_old_files_to="" is deleted or changed files are removed
#--backup-dir is a rclone option that moves deleted or changed files
if [ "$move_old_files_to" == "dated_directory" ]; then
    #move deleted or changed files to $timestamp directory
    backup_dir="--backup-dir=$dest/$timestamp"
elif [ "$move_old_files_to" == "dated_files" ]; then
    #move deleted or changed files to old directory, and append _$timestamp to file name
    backup_dir="--backup-dir=$dest/old_files --suffix=_$timestamp"
elif [ "$move_old_files_to" != "" ]; then
    print_message "WARNING" "Parameter move_old_files_to=$move_old_files_to, but should be dated_directory or dated_files.\
  Moving old data to dated_directory."
    backup_dir="--backup-dir=$dest/$timestamp"
fi

################################### back up ##################################
cmd="rclone sync $source $dest/$new $backup_dir --log-file=$log_file --log-level=$log_level $options"

message="$timestamp $job_name command: $cmd"
echo "Back up in progress $message"
echo "$message" >> "$log_file"

$cmd
exit_code=$?

############################ confirmation and logging ########################
if [ "$exit_code" -eq 0 ]; then            #if no errors
    confirmation="$(date +%F_%T) completed $job_name"
    echo "$confirmation"
    if [ "$log_level" != "INFO" ]; then     #if rclone log_level not already giving enough information
        echo "$confirmation" >> "$log_file"
        echo "" >> "$log_file"
        exit 0
    fi
    wget $monitoring_URL -O /dev/null
else
    print_message "ERROR" "failed.  rclone exit_code=$exit_code"
    echo "" >> "$log_file"
    exit 1
fi
