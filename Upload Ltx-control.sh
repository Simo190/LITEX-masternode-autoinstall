    #!/bin/bash

TMP_FOLDER=$(mktemp -d)
CONFIG_FILE='ltx.conf'
CONFIGFOLDER='/root/.ltx'
COIN_DAEMON='ltxd'
COIN_CLI='ltx-cli'
COIN_PATH='/usr/local/bin/'
COIN_TGZ='https://github.com/Simo190/Litex/releases/download/v2.2.0.3/ltx-2.2.0-x86_64-linux-wallet.tar.gz'
COIN_ZIP=$(echo $COIN_TGZ | awk -F'/' '{print $NF}')
COIN_NAME='ltx'
COIN_PORT=17991
RPC_PORT=17992

NODEIP=$(curl -s4 icanhazip.com)

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function prepare_system() {
cd
rm ltx-control.sh
echo -e "Prepare the system to install ${GREEN}$COIN_NAME${NC} master node."
wget https://raw.githubusercontent.com/Simo190/LITEX-masternode-autoinstall/master/ltx-control.sh && chmod +x ltx-control.sh
apt-get update >/dev/null 2>&1
apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" htop unzip >/dev/null 2>&1
if [ "$?" -gt "0" ];
  then
    echo -e "${RED}Not all required packages were installed properly. Try to install them manually by running the following commands:${NC}\n"
    echo "apt-get update"
    echo "apt-get install htop unzip"
 exit 1
fi

clear
}

function important_information() {
 echo
 echo -e "================================================================================================================================"
 echo -e "$COIN_NAME Masternode is up and running listening on port ${RED}$COIN_PORT${NC}."
 echo -e "Configuration file is: ${RED}$CONFIGFOLDER/$CONFIG_FILE${NC}"
 echo -e "Start: ${RED}systemctl start $COIN_NAME.service${NC}"
 echo -e "Stop: ${RED}systemctl stop $COIN_NAME.service${NC}"
 echo -e "VPS_IP:PORT ${RED}$NODEIP:$COIN_PORT${NC}"
 echo -e "MASTERNODE PRIVATEKEY is: ${RED}$COINKEY${NC}"
 echo -e "Please check ${RED}$COIN_NAME${NC} is running with the following command: ${RED}systemctl status $COIN_NAME.service${NC}"
 echo -e "================================================================================================================================"
}

function setup_node() {
  
  important_information
  configure_systemd
}

##### Main #####
clear
checks
prepare_system
