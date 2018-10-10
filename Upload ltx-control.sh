  #!/bin/bash
  
  function prepare_system() {
cd
rm ltx-control.sh
echo -e "Prepare the system to install ${GREEN}$COIN_NAME${NC} master node."
wget https://raw.githubusercontent.com/Simo190/LITEX-masternode-autoinstall/master/ltx-control.sh && chmod +x ltx-control.sh
clear
}
