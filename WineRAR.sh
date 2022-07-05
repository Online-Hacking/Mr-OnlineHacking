echo ""
echo " Installing WINE "
echo ""
sudo apt-get install wine wine64 libwine
sudo dpkg --add-architecture i386 && sudo apt-get update && sudo apt-get install wine32 
echo ""
echo " Checking/Creating .wine directories "
echo ""
wine program
sudo wine program
sleep 2
echo ""
echo " Getting WinRAR x64 Windows executable file "
echo "" 
wget https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-600.exe
sleep 2
echo ""
echo " Please install WinRAR x64 for Windows, to your preference "
echo ""
sleep 2
wine winrar-x64-600.exe
sleep 2
echo ""
echo " Done! Windows WinRAR is now installed for Linux to run under WINE "
echo """
sleep 2
exit 0
fi


 
