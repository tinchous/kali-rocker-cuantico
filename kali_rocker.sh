#!/bin/bash

# =========================================
#   KALI ROCKER CUÁNTICO INSTALLER 🤘🧠⚡
# =========================================
# Autor: Tino + Onit
# Descripción: Automatiza la personalización de Kali Linux
# con una estética visual hacker-rockera-cósmica 💀🎸

# Mensaje de bienvenida
clear
figlet "KALI ROCKER" | lolcat
sleep 1
echo "🔥 Iniciando personalización Cuántica Rockera..."
sleep 1

# Actualización del sistema
sudo apt update && sudo apt full-upgrade -y

# Herramientas visuales y útiles
sudo apt install -y neofetch lolcat figlet cmatrix htop ncdu mpv xwinwrap mpg123 zsh git curl fonts-powerline xfce4-terminal

# ZSH + Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🎸 Instalando Oh-My-Zsh..."
  chsh -s $(which zsh)
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Tema Powerlevel10k para ZSH
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
  sed -i 's/ZSH_THEME=.*/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/' ~/.zshrc
fi

# ASCII banner personalizado en .zshrc
if ! grep -q 'figlet "TINO ROCKER"' ~/.zshrc; then
  echo "figlet \"TINO ROCKER\" | lolcat" >> ~/.zshrc
  echo "neofetch" >> ~/.zshrc
fi

# Auto-reproducción de MP3 al inicio (colocar rockon.mp3 en ~/Música)
mkdir -p ~/.config/autostart
cat << EOF > ~/.config/autostart/rockon.desktop
[Desktop Entry]
Type=Application
Exec=mpg123 --loop -1 /home/\$USER/Música/rockon.mp3
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Rock On Startup
EOF

# Fin del script
echo "✅ ¡Kali Rocker Cuántico instalado! Reiniciá o cerrá sesión para activar la música y los efectos."
echo "🎸 ¡Larga vida al Rock Cuántico! 🧠"

