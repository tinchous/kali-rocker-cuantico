#!/bin/bash

echo -e "\n🚀 Iniciando la instalación del Kali Rocker Cuántico...\n"

echo "🔧 Creando estructura de carpetas necesarias..."
mkdir -p ~/kali-rocker-cuantico/extras
mkdir -p ~/.config/autostart

echo "📦 Instalando dependencias necesarias..."
sudo apt update
sudo apt install -y zsh git mpv lolcat figlet

echo "🤘 Instalando Oh-My-Zsh y Powerlevel10k..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
sed -i 's|ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

echo "🎨 Agregando banner de bienvenida..."
echo 'figlet "Kali Rocker Cuántico" | lolcat' >> ~/.zshrc

echo "🎵 Buscando música para fondo..."
MP3=~/kali-rocker-cuantico/extras/rockon.mp3
if [ -f "$MP3" ]; then
  echo "mpv --loop $MP3 &" >> ~/.zshrc
else
  echo "⚠ No se encontró rockon.mp3, saltando reproducción automática."
fi

echo "🖼️ Instalando lanzador de escritorio..."
cat <<EOF > ~/kali-rocker.desktop
[Desktop Entry]
Name=Kali Rocker Cuántico
Comment=Lanzador temático de Kali
Exec=zsh
Icon=utilities-terminal
Terminal=true
Type=Application
Categories=Utility;
EOF

chmod +x ~/kali-rocker.desktop
cp ~/kali-rocker.desktop ~/.config/autostart/

echo -e "\n✅ ¡Kali Rocker Cuántico instalado! Reiniciá sesión para rockear 🤘"

