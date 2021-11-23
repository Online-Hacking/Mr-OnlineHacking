echo ""
                           printf "\e[31m[\e[32m★\e[31m]\e[32m This Cloud Desktop VNC Server RDP \e[m "
                           echo ""
                           sudo apt install -y tightvncserver -y
			   sudo apt update -y
			   printf "\e[1;31m[\e[0m\e[1;92mSUMAN\e[0m\e[1;31m] \e[0m\e[1;37;41m Setup Server \e[0m   "  
			   echo -e
			   sudo apt install docker
                           echo ""
			   clear
			   echo ""
			   echo ""
	 clear
	 bash RDP/LOGO/suman.sh
	 echo ""
			   echo ""
			   echo ""
			   echo -e
			   printf "\e[31m[\e[32m★\e[31m]\e[32m This Cloud Server is Ready \e[m "
			   echo""
			   echo -e
			   printf '\e[91m Start Server and Click Link :- \e[97m https://localhost:8080 \e[0m '
			   echo ""
			   echo -e
                           read -p $'\e[1;40m\e[31m[\e[32m*\e[31m]\e[32m Start VNC Server \e[1;91m (Y/N) : \e[0m' option
                           echo""
                           echo""
                           echo""

                           if [[ $option == *'Y'* ]]; then
                           docker run -p 8080:80 dorowu/ubuntu-desktop-lxde-vnc
                           fi
                           if [[ $option == *'y'* ]]; then
                           docker run -p 8080:80 dorowu/ubuntu-desktop-lxde-vnc
                           fi
			   echo -e " "
			   echo " "     
			   echo ""
			   echo
			   echo ""
			   echo -e
                           read -p $'\e[1;40m\e[31m[\e[32m*\e[31m]\e[32m Stop Server \e[1;91m (Y/N) : \e[0m' option
                           echo""
                           echo""
			   if [[ $option == *'Y'* ]]; then
                           exit
                           fi
                           if [[ $option == *'y'* ]]; then
                           exit
                           fi 
