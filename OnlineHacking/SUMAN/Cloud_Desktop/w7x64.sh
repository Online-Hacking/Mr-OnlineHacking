echo ""
printf "\e[100;330m[\e[10m **** ]\e[1;40m\e[10m OnlineHacking :\e[1;32m Join Telegram Channel \e[1;33m @OnlineHacking  !\e[0m"
sleep 4
echo ""
clear
echo ""
echo "Download windows files"
echo ""

echo ""
clear
wget -O ng.sh https://github.com/OnlineHacKing/Cloud_Linux_RDP/raw/main/ngrok.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh


function goto
{
    label=$1
    cd 
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | 
          grep -v ':$')
    eval "$cmd"
    exit
}

: ngrok
clear
echo ""
echo -e "\e[92m 
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
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------  \e[1;91m\e[0m'
echo -e $'\e[1;96m\e[0m\e[1;77m\e[0m\e[1;96m\e[0m\e[1;91m  !!        Requirement Ngrok Token       !!\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ----------------------------------------- \e[1;91m\e[0m'
echo ""
echo""
echo -e "\e[31m[\e[32m*\e[31m]\e[93m Go to : \e[97m https://dashboard.ngrok.com/get-started/your-authtoken \e[m "
echo ""
echo -e "\e[31m[\e[32m*\e[31m]\e[93m Sign up & get ngrok authtoken \e[m "
echo ""
read -p $'\e[31m[\e[32m*\e[31m]\e[93m Paste Ngrok Authtoken: \e[96m [Ex. 2cEG2LcBt**********WK5Ntc ] : \e[0m' CRP
echo ""
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3388 &>/dev/null &
./ngrok tcp 3388 &>/dev/null &

curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'

echo ""
echo -e "\e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m Installing The Download Cloud Linux RDP Tool Debian - Windows 10 Theme Desktop Environmen \e[0m"
echo ""
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   -----------------------------------------------  \e[1;91m\e[0m'
echo -e $'\e[1;96m\e[0m\e[1;77m\e[0m\e[1;96m\e[0m\e[1;93m  !!      Download Ubuntu Windows 10 Theme        !!\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ------------------------------------------------ \e[1;91m\e[0m'
echo ""
echo -e "\e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m \e[95m Onine Hacking \e[0m"
echo ""
sleep 1
qemu-system-x86_64 -hda w7x64.img -m 8G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic > /dev/null 2>&1
sleep 43200
