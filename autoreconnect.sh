#!/data/data/com.termux/files/usr/bin/bash
bash auth.sh || exit 1

VPN_CONF="$HOME/wg/wg0.conf"
INTERVAL=10

echo "[*] Auto‑Reconnect VPN aktif"

while true; do
  if wg show wg0 >/dev/null 2>&1; then
    sleep $INTERVAL
  else
    echo "[!] VPN mati → reconnect..."
    wg-quick up "$VPN_CONF"
    sleep 5
  fi
done
