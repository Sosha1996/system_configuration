#!/bin/bash
clear

## Show Message

    echo -e 'Downloading, Installing and Configuring your system after Ubuntu Installation.\n'


## System Update and Upgrade

    # Update
    sudo apt update
    
    # Upgrade
    sudo apt full-upgrade -y


## Tor Config

    # Download and Run Scprit Traktor
    wget https://github.com/ubuntu-ir/traktor/archive/master.zip -O traktor.zip
    unzip traktor.zip && cd traktor-master
    ./traktor.sh
    cd

    echo 'UseBridges 1
Bridge obfs4 IP Address:45255 343D4A6E517B63A989667861E551077121A1C1BC cert=K7X5jz2GKVygFWcQJ44B9dM54UQ+ZZ0NFrG6aWrMfiHU/lq55HxDtGw5benQ6EBa9i30Qg iat-mode=0
ClientTransportPlugin obfs4 exec /usr/bin/obfs4proxy' | sudo tee /etc/tor/torrc > /dev/null
sudo systemctl restart tor.service
sudo service polipo restart


## Config System

    # Config Guest Session
    echo "allow-guest=false" | sudo tee -a /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf > /dev/null

    # Show My Name In Menu Bar
    gsettings set com.canonical.indicator.session show-real-name-on-panel true

    # Download and Change My Avatar
     echo "[com.ubuntu.touch.AccountsService.Sound]
SilentMode=false
IncomingCallSound='/usr/share/sounds/ubuntu/ringtones/Ubuntu.ogg'
IncomingMessageSound='/usr/share/sounds/ubuntu/notifications/Xylo.ogg'

[com.canonical.indicator.sound.AccountsService]
PlayerName=''
Timestamp=0
Title=''
Artist=''
Album=''
ArtUrl=''
PlayerIcon=<('themed', <['application-default-icon', 'application-default', 'application']>)>

[com.ubuntu.AccountsService.Sound]
Volume=0.4641571044921875

[InputSource0]
xkb=us

[User]
XSession=ubuntu
Icon=/var/lib/AccountsService/icons/sosha
SystemAccount=false'" | sudo tee /var/lib/AccountsService/users/sosha > /dev/null

    wget https://dl.soshaw.net/sosha
    sudo mv sosha /var/lib/AccountsService/icons/

    # Change Language and Install Package
    sudo apt install libreoffice-help-en-gb thunderbird-locale-en-gb libreoffice-l10n-en-gb hyphen-en-ca hunspell-en-gb libreoffice-l10n-en-za hunspell-en-za mythes-en-au gimp-help-en hunspell-en-ca hunspell-en-au hyphen-en-gb fonts-sil-scheherazade -y
    sudo apt install language-pack-fa language-pack-fa-base language-pack-gnome-fa language-pack-gnome-fa-base firefox-locale-fa fonts-farsiweb libreoffice-l10n-fa libreoffice-l10n-fa myspell-fa -y


## Fonts

    # Download Fonts and Font Config
    wget https://soshaw.net/IRANSans.ttf
    wget https://dl.soshaw.net/.fonts.conf

    # Fonts Config
    mkdir ~/.fonts
    mv IRANSans.ttf .fonts  

## Install App via APT

    # Install Unity Tweak Tool
    sudo apt install unity-tweak-tool -y

    # Add PPA Numix and Install Numix
    sudo add-apt-repository ppa:numix/ppa -y
    sudo apt update
    sudo apt install numix-gtk-theme numix-icon-theme-circle -y

    # install Arc Theme
    sudo apt install arc-theme -y

    # Add PPA Pulp and Install Paper Theme
    sudo add-apt-repository ppa:snwh/pulp -y
    sudo apt update
    sudo apt install paper-icon-theme paper-gtk-theme paper-cursor-theme -y

    # Install and Add PPA My Weather Indicator
    sudo add-apt-repository ppa:atareao/atareao -y
    sudo apt update
    sudo apt install my-weather-indicator -y

    # Install Indiactor Multiload
    sudo apt install indicator-multiload -y

    # Install Gimp
    sudo apt install gimp -y

    # Install VLC
    sudo apt install vlc -y
    
    # Install Chermuim
    sudo apt install chromium-browser -y

    # Install Vim
    sudo apt install vim -y

    # Install Git
    sudo apt install git -y

    # Install Filezilla
    sudo apt install filezilla -y

    # Install Shutter
    sudo apt install shutter -y

    # Install VirtualBox
    sudo apt install virtualbox -y

    # Install Kazam
    sudo apt install kazam -y

    # Install Mplayer
    sudo apt install mplayer -y

    # Install Speedtest
    sudo apt install speedtest-cli -y

    # Install Virt Manager
    sudo apt install virt-manager -y

    # Install Htop
    sudo apt install htop -y

    # Install Gparted
    sudo apt install gparted -y
    
    # Install Kodi
    sudo apt install kodi -y
    
    # Install Mlterm
    sudo apt install mlterm -y
    
    
## Config Vim
	
    # Download Files
    wget https://dl.soshaw.net/vim.zip

    # Move and Extract
    unzip vim.zip


## Install App and Download		

    # Telegram	

        # Download Telegram
        wget https://updates.tdesktop.com/tlinux/tsetup.0.10.19.tar.xz
	
    	# Extract
        mv tsetup.0.10.19.tar.xz ~/Downloads/ 
        cd ~/Downloads/
        tar xf tsetup.0.10.19.tar.xz 
        cd

    # Teamspeak

        # Download Teamspeak
        wget http://dl.4players.de/ts/releases/3.0.19.4/TeamSpeak3-Client-linux_amd64-3.0.19.4.run

        # Install
        chmod +x TeamSpeak3-Client-linux_amd64-3.0.19.4.run
        ./TeamSpeak3-Client-linux_amd64-3.0.19.4.run
        sudo mv TeamSpeak3-Client-linux_amd64 /opt/
        /opt/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh
        echo '[Desktop Entry]
Name=TeamSpeak 3
Comment=TeamSpeak 3 VoIP Communicator
Exec=/opt/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh
Terminal=false
Type=Application
Categories=Network;Application;
Icon=/opt/TeamSpeak3-Client-linux_amd64/styles/default/logo-128x128.png' | sudo tee ~/.local/share/applications/TeamSpeak3.desktop > /dev/null
	
	# SoundBoard
	wget https://frie.se/ts3sb/soundboard-1.0b5-linux-amd64.ts3_plugin
	unzip soundboard-1.0b5-linux-amd64.ts3_plugin
	sudo mv package.ini /opt/TeamSpeak3-Client-linux_amd64/plugins
	sudo mv plugins/bass/ /opt/TeamSpeak3-Client-linux_amd64/plugins
	sudo mv plugins/libsoundboard_plugin.so /opt/TeamSpeak3-Client-linux_amd64/plugins
	
    # Lightworks
    
	# Download
	cd ~/Downloads/
	wget http://downloads.lwks.com/lwks-12.6.0-amd64.deb
	
    # Kodi Plugin
    
    	# Download
	wget https://codeload.github.com/danialbehzadi/plugin.video.persianiptv/zip/master
	cd
	
    # Steam

        # Install Steam
        sudo apt install steam -y
	

## Remove
sudo rm -rf ~/vim.zip
sudo rm -rf ~/traktor.zip
sudo rm -rf ~/traktor-master/
sudo rm -rf ~/TeamSpeak3-Client-linux_amd64-3.0.19.4.run
sudo rm -rf ~/Downloads/tsetup.0.10.19.tar.xz
sudo rm -rf ~/soundboard-1.0b5-linux-amd64.ts3_plugin


## Restart System
notify-send 'Reboot Incoming...'
echo 'Reboot Incoming...'
sleep 10
reboot
