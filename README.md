# LITEX

Shell script to install a [LITEX Masternode](https://ltxcoin.info) on a Linux server running Ubuntu 16.04. Use it on your own risk.

This script install the LITEX cold wallet on your VPS, update Ubuntu, creates a service for the wallet and configures the firewall.

## Windows wallet

1. Launch your local wallet
2. Go to debug console (Tools - Debug Console) and enter the following command:

> `masternode genkey` *save the result (masternode_privkey)*

3. Enter the following command: 

> `getaccountaddress 0` *you will get new Masternode wallet address.*

4. Send 10000 LTX to Masternode wallet address.
5. Enter the following command: 

> `masternode outputs` output_txid

6. Open your masternode.conf file (Tools - Open Masternode Configuration file) and add the following line (port=17991):

> `MN_ALIAS VPS_IP:port masternode_privkey output_txid output_index`

## VPS

```
wget https://github.com/Simo190/LITEX-masternode-autoinstall/blob/master/litex-setup.sh && bash litex-setup.sh
```

## Local wallet

1. Reopen you local wallet
2. Go to Debug Console and run your masternode:

> `startmasternode alias 0 <MN_ALIAS>` *You should see something like this: { "alias" : "MN1", "result" : "successful" }*

## Usage control script:

```
./ltx-control.sh -[argument]

-a start LITEX service
-b stop LITEX service
-c status LITEX service
-d checks the autostart of the LITEX service when the server is starting
-e masternode sync status
-f masternode status
-h help - usage for this script
-k firewall status
-l show ltx.conf
-m show firewall log
```