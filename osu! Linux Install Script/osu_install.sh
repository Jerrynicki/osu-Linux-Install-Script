#!/bin/sh

rm -rf $HOME/osu_wine
rm -rf $HOME/osu_dir
rm -rf $HOME/osu_installer_temp

mkdir $HOME/osu_installer_temp
cp template_replace.py $HOME/osu_installer_temp/template_replace.py
cp osu\!.desktop.template $HOME/osu_installer_temp/osu\!.desktop.template

env WINEPREFIX=$HOME/osu_wine WINEARCH=win32 wineboot

cd $HOME/osu_wine
wget -O "installer.exe" "https://m1.ppy.sh/r/osu!install.exe"
wget -O "osu_logo.png" "https://upload.wikimedia.org/wikipedia/commons/d/d3/Osu%21Logo_%282015%29.png"

cd $HOME/osu_installer_temp
wget -O "discord-rpc.dll" "https://m1.ppy.sh/r/discord-rpc.dll/f_250e4d35ed51ac293527865ca2080c2b"
python3 template_replace.py $USER
chmod +x osu\!.desktop
mv osu\!.desktop $HOME/osu\!.desktop

mkdir $HOME/osu_wine/drive_c/users/$USER/Local\ Settings/Application\ Data/osu\!
ln -s  $HOME/osu_wine/drive_c/users/$USER/Local\ Settings/Application\ Data/osu\! $HOME/osu_dir

cp $HOME/osu_installer_temp/discord-rpc.dll $HOME/osu_wine/drive_c/users/$USER/Local\ Settings/Application\ Data/osu\!/discord-rpc.dll

cd $HOME
rm -rf $HOME/osu_installer_temp

env WINEPREFIX=$HOME/osu_wine WINEARCH=win32 winetricks dotnet40
env WINEPREFIX=$HOME/osu_wine WINEARCH=win32 winetricks corefonts
env WINEPREFIX=$HOME/osu_wine WINEARCH=win32 wine $HOME/osu_wine/installer.exe
