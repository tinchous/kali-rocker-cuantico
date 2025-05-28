#!/bin/bash
echo "🎸 Lanzando Kali Rocker Cuántico..."
qemu-system-x86_64 \
  -m 4096 \
  -smp 4 \
  -enable-kvm \
  -drive file=~/KVMs/Disks/kali-rocker.qcow2,format=qcow2 \
  -vga virtio \
  -display default,show-cursor=on \
  -net nic -net user \
  -name "Kali Rocker Cuántico"

