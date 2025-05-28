#!/bin/bash
# kali_qemu_installer.sh
# 🧠 Script by Tino y su Project Manager Cuántico 🚀
# Crea una VM de Kali Linux en QEMU con configuración Rockera Cuántica

set -e

# 🎯 Variables
ISO_URL="https://cdimage.kali.org/current/kali-linux-2025.1c-installer-amd64.iso"
ISO_DIR="$HOME/KVMs/ISOs"
DISK_DIR="$HOME/KVMs/Disks"
DISK_NAME="kali_rocker_cuantico.qcow2"
DISK_SIZE="40G"
VM_RAM="4096"
VM_CPU="2"

# 🚀 Crear directorios si no existen
mkdir -p "$ISO_DIR"
mkdir -p "$DISK_DIR"

# 📥 Descargar ISO de Kali si no está
ISO_PATH="$ISO_DIR/$(basename $ISO_URL)"
if [ ! -f "$ISO_PATH" ]; then
    echo "📦 Descargando ISO de Kali Linux..."
    wget "$ISO_URL" -P "$ISO_DIR"
else
    echo "✅ ISO ya existe en $ISO_PATH"
fi

# 💽 Crear disco virtual si no existe
DISK_PATH="$DISK_DIR/$DISK_NAME"
if [ ! -f "$DISK_PATH" ]; then
    echo "💿 Creando disco virtual QEMU de $DISK_SIZE..."
    qemu-img create -f qcow2 "$DISK_PATH" "$DISK_SIZE"
else
    echo "✅ Disco virtual ya existe en $DISK_PATH"
fi

# 🔥 Lanzar instalación de Kali Rocker Cuántico
echo "🚀 Iniciando instalación de Kali Rocker Cuántico..."
qemu-system-x86_64 \
    -enable-kvm \
    -m "$VM_RAM" \
    -cpu host \
    -smp "$VM_CPU" \
    -boot d \
    -cdrom "$ISO_PATH" \
    -drive file="$DISK_PATH",format=qcow2 \
    -net nic -net user \
    -display default,show-cursor=on \
    -name "Kali Rocker Cuántico"

# 🎸 ¡Listo para la instalación manual! Sigue el asistente en pantalla.

# 💡 Tips post-instalación:
# - Una vez instalado, podés lanzar la VM sin la ISO:
#   qemu-system-x86_64 -enable-kvm -m 4096 -cpu host -smp 2 -drive file=$DISK_PATH,format=qcow2 -net nic -net user -name "Kali Rocker Cuántico"

# 🤘 Rockea con tu Kali personalizado luego del primer boot

