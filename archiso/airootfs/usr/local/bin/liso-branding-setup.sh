#!/bin/bash
# liso-branding-setup.sh
# Baixa o logo/wallpaper do repositório (raw URL da branch fix/calamares-welcome)
# e coloca em /usr/share/backgrounds/liso_wallpaper.png.
# Executar no primeiro boot para que o arquivo exista no ambiente live/instalado.

set -e
TARGET_DIR="/usr/share/backgrounds"
TARGET_FILE="$TARGET_DIR/liso_wallpaper.png"
RAW_URL="https://raw.githubusercontent.com/Bielpronumine/CachyOS-Live-ISO/fix/calamares-welcome/liso_logo.png"

# Se já existe, nada a fazer
if [ -f "$TARGET_FILE" ]; then
  exit 0
fi

# Certifica diretório
mkdir -p "$TARGET_DIR" || true

# Tenta baixar com curl, se não, com wget
if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$RAW_URL" -o "$TARGET_FILE" || true
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$TARGET_FILE" "$RAW_URL" || true
fi

# permissões seguras
if [ -f "$TARGET_FILE" ]; then
  chmod 644 "$TARGET_FILE" || true
fi

exit 0
