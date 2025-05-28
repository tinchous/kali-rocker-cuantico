#!/bin/bash

# ╔════════════════════════════════════════╗
# ║   KALI ROCKER CUÁNTICO - by Tinchous   ║
# ║      Tuneá tu Kali con puro Rock!      ║
# ╚════════════════════════════════════════╝

echo "🔥 Iniciando la personalización Kali Rocker Cuántico..."

# 1. ACTUALIZAMOS EL SISTEMA
echo "🛠️  Actualizando paquetes..."
sudo apt update && sudo apt upgrade -y

# 2. INSTALAMOS HERRAMIENTAS ESENCIALES
echo "🔧 Instalando herramientas esenciales..."
sudo apt install -y zsh git curl wget lolcat figlet neofetch cmatrix mpg123

# 3. CAMBIAMOS LA SHELL POR DEFECTO A ZSH
echo "💻 Cambiando shell por defecto a ZSH (puede pedir contraseña)..."
chsh -s $(which zsh)

# 4. INSTALAMOS OH-MY-ZSH
echo "🎩 Instalando Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 5. INSTALAMOS POWERLEVEL10K (tema visual zarpado)
echo "✨ Instalando tema Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
sed -i 's|ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

# 6. AGREGAMOS BANNER PERSONALIZADO Y EFECTOS EN TERMINAL
echo "🎨 Personalizando la terminal..."

cat << 'EOF' >> ~/.zshrc

# 🔥 ESTILO ROCKER AL INICIAR TERMINAL
clear
figlet "TINO ROCKER" | lolcat
neofetch --ascii_distro Kali

# 🎶 Reproducir MP3 al iniciar (si existe el archivo)
if [ -f "$HOME/Música/rockon.mp3" ]; then
  mpg123 "$HOME/Música/rockon.mp3" &
fi

# 💊 Extra: efectos visuales locos opcionales
# cmatrix -b -C cyan &

EOF

# 7. CREAMOS DIRECTORIO PARA LA MÚSICA SI NO EXISTE
mkdir -p "$HOME/Música"

echo "🎶 Colocá tu archivo MP3 en ~/Música/ con el nombre 'rockon.mp3'"
echo "   (o descargalo desde la carpeta /extras del repositorio) 🎧"

# 8. FIN
echo -e "\n✅ ¡Listo! Cerrá y abrí tu terminal para ver el cambio."
echo "🤘 LARGA VIDA AL ROCK CUÁNTICO"

# OPCIONAL: REINICIAR LA SHELL AUTOMÁTICAMENTE
exec zsh

