# Kali Rocker Cuántico 🤘💀🎶

> **¡Personalizá tu Kali Linux como un verdadero Hacker Cósmico Rockero!**

![Banner](extras/banner.png)

---

## ⚙️ ¿Qué hace este script?
Este script instala una estética única, poderosa y visualmente explosiva sobre Kali Linux:

🎩 Oh-My-Zsh + tema `powerlevel10k`  
🎸 Banner cuántico "TINO ROCKER" en terminal  
🧠 Efectos visuales: `lolcat`, `figlet`, `neofetch`, `cmatrix`, etc.  
🎶 Música rockera que se reproduce automáticamente al iniciar sesión  
🎨 Preparado para fondos animados si querés llevarlo al extremo

---

## 🚀 Instalación

```bash
sudo apt update && sudo apt install -y git

# Cloná el repo
cd ~
git clone https://github.com/tinchous/kali-rocker-cuantico.git
cd kali-rocker-cuantico

# Hacé ejecutable e instalá
chmod +x kali_rocker.sh
./kali_rocker.sh
```

---

## 🎶 Rock On Startup
Colocá el archivo `rockon.mp3` dentro de la carpeta `~/Música/`, o usá el que viene en la carpeta `/extras`.

🎧 El script configura que suene automáticamente al iniciar sesión, usando `mpg123`.

---

## 🖼️ Fondo animado (opcional)
Podés usar herramientas como:
- [`xwinwrap + mpv`](https://github.com/ujjwal96/xwinwrap) para fondos animados
- [`Komorebi`](https://github.com/cheesecakeufo/komorebi) para wallpapers en movimiento

⚠️ Requiere más recursos. Recomendado para uso en máquina física.

---

## 📂 Estructura del Repo

```
kali_rocker.sh        # Script principal de instalación
README.md             # Este archivo épico
extras/
├── banner.png        # Imagen del banner
└── rockon.mp3        # MP3 para reproducir al iniciar sesión
```

---

## ✨ Créditos y Licencia
Creado con toda la locura y amor por [@tinchous](https://github.com/tinchous) + Onit 🧠⚡

Este repo está bajo la licencia [MIT](LICENSE), hacé lo que quieras con él, pero siempre con buena onda y mucho rock.

---

## 🤘 ¡LARGA VIDA AL ROCK CUÁNTICO!

> _“No hay hacking sin estilo, ni consola sin música.”_

[![Rock Logo](extras/rockon.gif)](https://github.com/tinchous/kali-rocker-cuantico)

