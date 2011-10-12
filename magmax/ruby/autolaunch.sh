#!/bin/sh
##
## autolaunch.sh
## 
## Made by miguel
## Login   <miguel@tormenta>
## 
## Started on  Mon Jan 31 06:39:33 2011 miguel
## Last update Mon Jan 31 06:39:33 2011 miguel
##
	cmd=$*

	while [ 1 ]; do
		$cmd
		retval=$?

		echo DONE:$retval

		if type notify-send > /dev/null; then
			if [ $retval -eq 0 ]; then
				icon='gtk-yes'
			else
				icon='gtk-no'
			fi
			notify-send -t 2000 -i $icon "fexec: $retval" "$ $cmd"
		fi
		inotifywait -qr -e MODIFY . @*~ @.* @*.pyc|| break
		clear
		sync
		sleep 0.5
	done

