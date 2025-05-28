# Kali Rocker Cuántico en QEMU

Bienvenidos a la dimensión de la ciberseguridad amplificada por átomos rebeldes y ondas cuánticas del rock. Este proyecto instala y lanza **Kali Linux personalizado** estilo "Kali Rocker Cuántico" sobre **QEMU/KVM**, con poderosas herramientas, terminal con estética custom, y un entorno para el hacker elegante, loco y analítico.

---

## 🌐 Requisitos previos

### En tu host (Linux Mint o similar):

* QEMU y KVM
* curl, git, wget
* 8GB+ de RAM recomendado

### Instalar QEMU/KVM:

```bash
sudo apt update && sudo apt install -y qemu-kvm libvirt-daemon-system virtinst bridge-utils
```

---

## 🌟 Paso 1: Descargar ISO verificada

```bash
mkdir -p ~/KVMs/ISOs && cd ~/KVMs/ISOs
wget https://cdimage.kali.org/kali-2025.1/kali-linux-2025.1c-installer-amd64.iso
wget https://cdimage.kali.org/kali-2025.1/SHA256SUMS
sha256sum -c SHA256SUMS | grep kali-linux-2025.1c-installer-amd64.iso
```

Debe decir:

```
kali-linux-2025.1c-installer-amd64.iso: La suma coincide
```

---

## 🧵 Paso 2: Crear disco para la VM

```bash
mkdir -p ~/KVMs/KaliRockerCuantico
qemu-img create -f qcow2 ~/KVMs/KaliRockerCuantico/kali-rocker.qcow2 40G
```

---

## 🚀 Paso 3: Instalar Kali desde QEMU

### Script listo para lanzar:

Crea el archivo `kali_qemu_installer.sh`:

```bash
nano ~/KVMs/kali_qemu_installer.sh
```

Pegá esto:

```bash
#!/bin/bash
qemu-system-x86_64 \
  -m 4096 \
  -smp 2 \
  -enable-kvm \
  -cpu host \
  -boot d \
  -cdrom ~/KVMs/ISOs/kali-linux-2025.1c-installer-amd64.iso \
  -drive file=~/KVMs/KaliRockerCuantico/kali-rocker.qcow2,format=qcow2 \
  -net nic -net user \
  -name "Kali Rocker Cuántico" \
  -vga virtio
```

Dale permisos de ejecución:

```bash
chmod +x ~/KVMs/kali_qemu_installer.sh
```

Y corré:

```bash
./KVMs/kali_qemu_installer.sh
```

---

## 🎧 Paso 4: Post-Instalación

Dentro del nuevo Kali:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y zsh git curl mpv
chsh -s $(which zsh)
```

Cloná el entorno visual cuántico:

```bash
git clone https://github.com/tinchous/kali-rocker-cuantico.git
cd kali-rocker-cuantico
./kali_rocker.sh
```

---

## 🔗 Conectá con el Proyecto

Este README es parte del proyecto **ProfePersonal - PEO**, donde la educación, la ciencia cuántica y el rock se fusionan para cambiar el mundo.

GitHub del autor: [https://github.com/tinchous](https://github.com/tinchous)

---

## ⚡ Contacto y Soporte

Para dudas, contribuciones o solo charlar sobre átomos y distorsiones, escribime a: **[tino@cuantico.rock](mailto:tino@cuantico.rock)** (ficticio por ahora, pero suena tremendo).

---

## 🎤 Keep rocking, keep hacking! 🎸

