#!/bin/bash

# version 0.1.0
# depend on zenity

title="PPA Uploader"

config_file=$HOME/.config/ppa-uploader/config


##############################################################################
#	FUNCTIONS
##############################################################################

main_window()
{
action=$(zenity --list \
				--height=205 \
				--title="$title" \
				--text "Choose action" \
				--column "Action" \
				Settings... Upload... Exit)
}

settings_window()
{
if user_ppa=$(zenity --entry \
		--title="$title" \
		--text="Set user name and name of your PPA in format: 
 USER/ppa" \
		--entry-text="$(cat $config_file)")
then
	echo $user_ppa > $config_file || create_config
fi
}

create_config()
{
mkdir  $HOME/.config/ppa-uploader
echo $user_ppa > $config_file
}

upload_file()
{
user_ppa="$(cat $config_file)"
if [ "$user_ppa" = "" ]
then
	error_window
else
	if path_file=$(zenity --file-selection \
					--filename="$HOME/" \
					--title="$title" \
					--file-filter="source.changes | *source.changes")
	then
		# Print the part of string after last "/"
		file_name=$(echo "${path_file##*/}")
		if zenity --question \
					--title="$title" \
					--text="Do you want to upload $file_name to $user_ppa?" \
					--default-cancel
		then
			command_upload="dput ppa:$user_ppa $path_file"
			log="$(eval $command_upload)"
			zenity --info \
					--text="$log" \
					--title="$title" \
		else
			:
		fi
	else
		:
	fi
fi
}

error_window()
{
zenity --warning \
		--text="Set user name and name of PPA in Settings first." \
		--title="$title"
}

##############################################################################
#	PROGRAM
##############################################################################

run=1
while [ "$run" = 1 ]
do

main_window

if [ $action = "Upload..." ]
then
	upload_file
elif [ $action = "Settings..." ]
then
	settings_window
else
	run=0
fi

done
