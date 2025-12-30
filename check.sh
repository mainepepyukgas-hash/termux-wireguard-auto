#!/data/data/com.termux/files/usr/bin/bash
echo "IP Sekarang:"
curl -s ifconfig.me
echo
echo "Detail:"
curl -s ipinfo.io
