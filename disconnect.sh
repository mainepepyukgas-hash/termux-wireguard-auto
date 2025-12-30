#!/data/data/com.termux/files/usr/bin/bash
bash auth.sh || exit 1
cd $HOME/wg
wg-quick down ./wg0.conf
