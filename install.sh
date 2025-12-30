#!/data/data/com.termux/files/usr/bin/bash
clear
echo "=== TERMUX WIREGUARD AUTO SETUP ==="

pkg update -y && pkg upgrade -y
pkg install -y wireguard-tools curl nano git

# Anti IPv6 leak
mkdir -p $PREFIX/etc
grep -q "precedence ::ffff:0:0/96  100" $PREFIX/etc/gai.conf 2>/dev/null || \
echo "precedence ::ffff:0:0/96  100" >> $PREFIX/etc/gai.conf

# WireGuard dir
mkdir -p $HOME/wg
cd $HOME/wg

# Generate client key
wg genkey | tee client_private.key | wg pubkey > client_public.key

echo
echo "=== CLIENT PUBLIC KEY ==="
cat client_public.key
echo "KIRIM KEY INI KE VPS"
echo

# Copy config example
cp ../termux-wireguard-auto/wg/wg0.conf.example ./wg0.conf

# Set username & password
echo -n "123:wanz" | sha256sum | awk '{print $1}' > $HOME/.wg_auth
chmod 600 $HOME/.wg_auth
echo "[✓] Username & password diset (username: 123 / password: wanz)"

chmod +x ../*.sh
echo "INSTALL SELESAI"
