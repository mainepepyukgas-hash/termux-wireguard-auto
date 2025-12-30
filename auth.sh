#!/data/data/com.termux/files/usr/bin/bash

AUTH_FILE="$HOME/.wg_auth"

if [ ! -f "$AUTH_FILE" ]; then
  echo "[!] Auth belum diset. Jalankan install.sh dulu."
  exit 1
fi

read -p "Username: " USER
read -s -p "Password: " PASS
echo

INPUT_HASH=$(echo -n "$USER:$PASS" | sha256sum | awk '{print $1}')
SAVED_HASH=$(cat "$AUTH_FILE")

if [ "$INPUT_HASH" != "$SAVED_HASH" ]; then
  echo "[✗] Username atau password salah"
  exit 1
fi
