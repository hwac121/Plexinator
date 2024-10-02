#!/bin/bash -i

#================================================================================================
#                                         DETAILS
#================================================================================================

# TITLE: Boot Splash
# AUTHOR: RJ Levesque, Jr. - Majik Cat Security
# DATE: May 4, 2020
# GITHUB: https://github.com/hwac121


#================================================================================================
#                                   CHECK IF ROOT OR EXIT
#================================================================================================

if [ "$EUID" -ne 0 ]
  then echo "root/sudo needed to run this script." 
  exit
fi

#================================================================================================
#                                         VARIABLES
#================================================================================================

clear
Splash(){
	echo " "
	echo -e "\e[37m======================================================================================\e[0m";
	sleep .50
	echo -e "\e[37m=\e[0m                                  \e[33m*****************\e[0m                                 \e[37m=\e[0m";
	sleep .50
	echo -e "\e[37m=\e[0m                             \e[33m******\e[0m   \e[91mPlexinator\e[0m  \e[33m******\e[0m                            \e[37m=\e[0m";
	sleep .50
	echo -e "\e[37m=\e[0m                                  \e[33m*****************\e[0m                                 \e[37m=\e[0m";
	sleep .50
	echo -e "\e[37m=                                         by                                         =\e[0m";
	sleep .50
	echo -e "\e[37m=\e[0m                                    \e[34mRJ Levesque Jr\e[0m                                  \e[37m=\e[0m";
	sleep .50
	echo -e "\e[37m=\e[0m                           \e[36mHave control over Plex on LINUX\e[0m                          \e[37m=\e[0m";
	sleep .50
	echo -e "\e[37m======================================================================================\e[0m";
	echo " "
	echo " "
	sleep .50
}

Setup(){
	echo "Installing Plexinator to make it accessable from any terminal" 
	echo "window."
	sleep 1
	echo "When installation is complete you may type 'Plex' or 'plex' in" 
	echo "any terminal window."
	echo " "
	sleep 1
	cp Plexinator.sh /usr/bin/Plex
	cp Plexinator.sh /usr/bin/plex
	chmod +x manager.sh
	sleep 1
	echo "Installation is complete!"
	echo "You must have Plex Media Server installed to your LINUX system in"
	echo "for this script to work properly. This is only a helper script for"
	echo "the Plex Media Server available at https://www.plex.tv/"
	sleep 5
	echo "GOODBYE!"
	sleep 1 
}

Start_Plex(){
	service plexmediaserver start
}

Restart_Plex(){
    service plexmediaserver restart
}

Status_Plex(){
    service plexmediaserver status
}

Stop_Plex(){
    service plexmediaserver stop
}

#================================================================================================
#                                       SELECTION MENU
#================================================================================================
options=("Start Plex Media Server" "Restart Plex Media Server" "Plex Media Server Status" "Stop Plex Media Server" "Credits" "First Time Setup" "Quit Plexinator")

PS3="Choose what action to take or select menu item #7 to Quit: "

while [ "$menu" != 1 ]; do
Splash
sleep 0.50
	select opt in "${options[@]}"; do
    	case $opt in 
	      "Start Plex Media Server")
		clear
		Start_Plex
		sleep 1
		echo "Plex Media Server has been started."
		sleep 4
		clear
        break
	;;
	      "Restart Plex Media Server")
		clear
		Restart_Plex
		sleep 1
		echo "Plex Media Server has been restarted."
		sleep 4
		clear
        break
	;;
	      "Plex Media Server Status")
		clear	
		echo "Just type 'q' to quit the next screen when you are done viewing it."
		sleep 3
		Status_Plex
		clear
        break
	;;
              "Stop Plex Media Server") 
                clear   
                Stop_Plex
                sleep 1
                echo "Plex Media Server has been stopped."
                sleep 4   
                clear
        break
        ;;
	      "Credits")
		clear
		Splash
		echo -e " "
		echo -e "Developed by RJ Levesque, Jr."
		sleep .5
		echo -e "Written: May of 2020"
		sleep .5
		echo -e " "
		echo -e "Web URL: http://majikcat.ddns.net"
		sleep .5
		echo -e "GitHub: https://github.com/hwac121"
		sleep .5
		echo -e "eMail: hwac121@protonmail.com"
		sleep .5 
		echo -e " "
		echo "Get your Plex Media Server at https://www.plex.tv/"
		sleep 5
		clear
	break
	;;
              "First Time Setup")
                clear
                Setup
                sleep 1
                cp Plexinator.sh /usr/bin/plex
                cp Plexinator.sh /usr/bin/Plex
                chmod +x /usr/bin/Plex
                chmod +x /usr/bin/plex
                echo "Plexinator is now setup."
                sleep 1   
                echo "Type 'plex' or 'Plex' in any terminal as user not"
                echo "root/sudo to run the application."
                sleep 4
                clear
	break
	;;
	      "Quit Plexinator")
		clear
		echo -e " "
		echo -e "\e[31mThank you for using Plexinator by RJ Levesque, Jr. - 2020\e[0m"
		sleep 1
		echo -e "\e[32mMajik Cat Security - Visit me on YouTube\e[0m"
		sleep 2
		echo " "
		echo -e "\e[34mSign up for your Plex Pass at https://www.plex.tv/\e[0m"
		menu=1
		sleep 4
		clear
	break
	;;
		* )
		echo -e "$REPLY is an invalid option"
	break
	;;
    	esac
	done
done

exit 0

