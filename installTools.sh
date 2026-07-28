#!/bin/sh


#Update
printf "Executing apt upgrade...\n"
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

#Open VM Tools
printf "Installing Open VM Tools...\n"
sudo apt install -y open-vm-tools open-vm-tools-desktop

#git
printf "Installing git...\n"
sudo apt install -y git

#htop
printf "Installing htop...\n"
sudo apt install -y htop

#Neovim
printf "Installing Neovim...\n"
sudo apt install -y neovim

#ripgrep
printf "Installing ripgrep...\n"
sudo apt install -y ripgrep

#curl
printf "Installing curl...\n"
sudo apt install -y curl

#opencode
printf "Installing OpenCode...\n"
curl -fsSL https://opencode.ai/install | bash

#vscodium
printf "Installing VSCodium...\n"
mkdir /home/user/tmp
cd /home/user/tmp
sudo wget https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg -O /usr/share/keyrings/vscodium-archive-keyring.asc
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.asc ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update
sudo apt install -y codium

#SQLiteBroser
printf "Installing SQLiteBrowser...\n"
sudo apt install -y sqlitebrowser

#plistutil
printf "Installing PlistUtils...\n"
sudo apt install -y libplist-utils

#python venv + pip
printf "Installing venv...\n"
printf "Installing pip...\n"
sudo apt install -y python3-venv python3-pip python3-dev  

#mvt
printf "Installing MVT...\n"
mkdir /home/user/py-venvs
cd /home/user/py-venvs
python3 -m venv mvt
. mvt/bin/activate
pip install mvt
mvt-ios download-iocs
mvt-android download-iocs
deactivate

#aleapp
printf "Installing ALEAPP...\n"
cd /home/user/py-venvs
python3 -m venv aleapp
. aleapp/bin/activate
cd aleapp
git clone https://github.com/abrignoni/ALEAPP.git
cd ALEAPP
pip install --upgrade pip
pip install -r requirements.txt
deactivate

#ileapp
printf "Installing ilEAPP...\n"
cd /home/user/py-venvs
python3 -m venv ileapp
. ileapp/bin/activate
cd ileapp
git clone https://github.com/abrignoni/iLEAPP.git 
cd iLEAPP
pip install --upgrade pip
pip install -r requirements.txt
deactivate

# Sysdiagnose Analysis Framework (SAF)
printf "Installing Sysdiagnose Analysis Framework...\n"
cd /home/user/py-venvs
python3 -m venv SAF
. SAF/bin/activate
cd SAF
git clone https://github.com/EC-DIGIT-CSIRC/sysdiagnose.git
cd sysdiagnose
pip install --upgrade pip
pip install .
deactivate

# FSEventsParser
printf "Installing FSEventsParser...\n"
cd /home/user/py-venvs
python3 -m venv FSEventsParser
. FSEventsParser/bin/activate
cd FSEventsParser
git clone https://github.com/dlcowen/FSEventsParser.git
cd FSEventsParser
pip install --upgrade pip
deactivate

# libimobiledevice
printf "Installing libimobiledevice...\n"
sudo apt install -y git build-essential autoconf automake libtool libtool-bin pkg-config cmake libplist-dev libusbmuxd-dev libssl-dev libcurl4-openssl-dev libzip-deb
mkdir /home/user/tmp
cd /home/user/tmp
git clone https://github.com/libimobiledevice/libtatsu.git
cd libtatsu
./autogen.sh
make -j$(nproc)
sudo make install
sudo ldconfig
cd ..

git clone https://github.com/libimobiledevice/libimobiledevice-glue.git
cd libimobiledevice-glue
./autogen.sh
make -j$(nproc)
sudo make install
sudo ldconfig
cd ..

git clone https://github.com/libimobiledevice/libimobiledevice.git
cd libimobiledevice
./autogen.sh
make -j$(nproc)
sudo make install
sudo ldconfig


#plaso log2timeline
printf "Installing log2timeline...\n"
sudo apt install -y build-essential libffi-dev libssl-dev libbz2-dev liblzma-dev zlib1g-dev libsqlite3-dev libyaml-dev libxml2-dev libxslt1-dev libfuse-dev git pkg-config autoconf automake libtool
cd /home/user/py-venvs
python3 -m venv plaso
. plaso/bin/activate
pip install --upgrade pip setuptools wheel
pip install plaso
deactivate

#ipsw
printf "Installing IPSW...\n"
mkdir /home/user/tmp
cd /home/user/tmp
wget https://github.com/blacktop/ipsw/releases/latest/download/ipsw_$(curl -s https://api.github.com/repos/blacktop/ipsw/releases/latest | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4 | tr -d 'v')_linux_x86_64.tar.gz
tar -xzf ipsw_*.tar.gz
sudo mv ipsw /usr/local/bin/

#MacOS Unified Logs for Linux
printf "Installing MacOS Unified Logs for Linux...\n"
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
