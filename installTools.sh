#!/bin/sh

#Open VM Tools
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
sudo apt install -y open-vm-tools open-vm-tools-desktop

#git
sudo apt install -y git

#htop
sudo apt install -y htop

#Neovim
sudo apt install -y neovim

#ripgrep
sudo apt install -y ripgrep

#curl
sudo apt install -y curl

#opencode
curl -fsSL https://opencode.ai/install | bash

#vscodium
mkdir /home/user/tmp
cd /home/user/tmp
sudo wget https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg -O /usr/share/keyrings/vscodium-archive-keyring.asc
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.asc ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update
sudo apt install -y codium

#SQLiteBroser
sudo apt install -y sqlitebrowser

#plistutil
sudo apt install -y libplist-utils

#python venv + pip
sudo apt install -y python3.13-venv python3-pip python3-dev  

#mvt
mkdir /home/user/py-venvs
cd /home/user/py-venvs
python3 -m venv mvt
source mvt/bin/activate
pip install mvt
mvt-ios download-iocs
mvt-android download-iocs
deactivate

#aleapp
cd /home/user/py-venvs
python3 -m venv aleapp
source aleapp/bin/activate
cd aleapp
git clone https://github.com/abrignoni/ALEAPP.git
cd ALEAPP
pip install --upgrade pip
pip install -r requirements.txt
deactivate

#ileapp
cd /home/user/py-venvs
python3 -m venv ileapp
source ileapp/bin/activate
cd ileapp
git clone https://github.com/abrignoni/iLEAPP.git 
cd iLEAPP
pip install --upgrade pip
pip install -r requirements.txt
deactivate

# Sysdiagnose Analysis Framework (SAF)
cd /home/user/py-venvs
python3 -m venv SAF
source SAF/bin/activate
cd SAF
git clone https://github.com/EC-DIGIT-CSIRC/sysdiagnose.git
cd sysdiagnose
pip install --upgrade pip
pip install .
deactivate

# FSEventsParser
cd /home/user/py-venvs
python3 -m venv FSEventsParser
source FSEventsParser/bin/activate
cd FSEventsParser
git clone https://github.com/dlcowen/FSEventsParser.git
cd FSEventsParser
pip install --upgrade pip
pip install -r requirements.txt
deactivate

# libimobiledevice
sudo apt install -y build-essential pkg-config checkinstall git autoconf automake libtool-bin libplist-dev libusbmuxd-dev libimobiledevice-glue-dev libssl-dev usbmuxd
mkdir /home/user/tmp
cd /home/user/tmp
git clone https://github.com/libimobiledevice/libimobiledevice.git
cd libimobiledevice
./autogen.sh
make -j$(nproc)
sudo make install
sudo ldconfig


#plaso log2timeline
sudo apt install -y build-essential libffi-dev libssl-dev libbz2-dev liblzma-dev zlib1g-dev libsqlite3-dev libyaml-dev libxml2-dev libxslt1-dev libfuse-dev git
cd /home/user/py-venvs
python -m venv plaso
source plaso/bin/activate
pip install --upgrade pip setuptools wheel
pip install plaso
deactivate

#ipsw
mkdir /home/user/tmp
cd /home/user/tmp
wget https://github.com/blacktop/ipsw/releases/latest/download/ipsw_$(curl -s https://api.github.com/repos/blacktop/ipsw/releases/latest | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4 | tr -d 'v')_linux_x86_64.tar.gz
tar -xzf ipsw_*.tar.gz
sudo mv ipsw /usr/local/bin/

#MacOS Unified Logs for Linux
sudo apt install -y cargo
cd /home/user/tmp
git clone https://github.com/mandiant/macos-UnifiedLogs
cd macos-UnifiedLogs/examples/unifiedlog_iterator/
cargo build --release
sudo cp ../target/release/unifiedlog_iterator /usr/local/bin/




#TODO:
#- [ ] Jadx
#- [ ] Android studio
#- [ ] Adb
