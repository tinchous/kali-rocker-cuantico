#!/bin/bash
# kali_rocker.sh
# Script para convertir tu Kali Linux en Kali Rocker Cuántico 🤘💀🎶
# Creado por Tino y Onit - 2025
# ----------------------------------------

# Variables
REPO_DIR="$HOME/kali-rocker-cuantico"
EXTRAS_DIR="$REPO_DIR/extras"
MP3_PATH="$EXTRAS_DIR/rockon.mp3"
BANNER_PATH="$EXTRAS_DIR/banner.png"

echo -e "\n🚀 Iniciando la instalación del Kali Rocker Cuántico...\n"

# Crear estructura de carpetas si no existe
echo "🔧 Creando estructura de carpetas necesarias..."
mkdir -p "$EXTRAS_DIR"

# Comprobamos dependencias y las instalamos si faltan
echo "📦 Instalando dependencias necesarias..."
sudo apt update
sudo apt install -y git zsh mpg123 figlet lolcat neofetch cmatrix

# Instalar Oh-My-Zsh si no está instalado
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🌟 Instalando Oh-My-Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ Oh-My-Zsh ya está instalado."
fi

# Instalar powerlevel10k theme para zsh
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "🌈 Instalando tema powerlevel10k para Zsh..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
else
  echo "✅ Tema powerlevel10k ya instalado."
fi

# Cambiar el tema ZSH en .zshrc
echo "⚙️ Configurando powerlevel10k como tema de Zsh..."
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$HOME/.zshrc"

# Mostrar banner épico en terminal al abrir
echo "🎨 Configurando banner de bienvenida en terminal..."
BANNER_SCRIPT="$HOME/.bashrc_banner.sh"

cat > "$BANNER_SCRIPT" << EOF
#!/bin/bash
figlet -f slant "TINO ROCKER CUANTICO" | lolcat
neofetch
cmatrix -b -s -u 5 -C green -x 40 -y 20 -n 8 -w 60 -T 20 -c 12 &
EOF

chmod +x "$BANNER_SCRIPT"

# Agregar ejecución del banner en el .bashrc y .zshrc si no está ya
if ! grep -q ".bashrc_banner.sh" "$HOME/.bashrc"; then
  echo "source $BANNER_SCRIPT" >> "$HOME/.bashrc"
fi
if ! grep -q ".bashrc_banner.sh" "$HOME/.zshrc"; then
  echo "source $BANNER_SCRIPT" >> "$HOME/.zshrc"
fi

# Reproducir música rockera automáticamente (mpg123)
if [ -f "$MP3_PATH" ]; then
  echo "🎵 Configurando reproducción automática de rockon.mp3..."
  # Evitar múltiples instancias
  if ! pgrep -f "mpg123 $MP3_PATH" > /dev/null; then
    nohup mpg123 "$MP3_PATH" > /dev/null 2>&1 &
  fi
else
  echo "⚠️ Archivo $MP3_PATH no encontrado. No se podrá reproducir la música automáticamente."
fi

echo -e "\n🤘 Kali Rocker Cuántico instalado con éxito! Reiniciá la sesión para disfrutarlo.\n"

