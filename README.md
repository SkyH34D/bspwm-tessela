# bspwm-tessela

🎯 **Propósito**  
Este script está diseñado para usarse en entornos con el window manager [bspwm](https://github.com/baskerville/bspwm), donde la gestión de ventanas sigue un esquema de partición binaria.

🔧 **¿Qué hace?**  
`tessela.sh` automatiza el posicionamiento de nuevas terminales (o cualquier ventana) siguiendo un patrón 2x2 simétrico y ordenado. Su uso está pensado para ejecutarse mediante un atajo de teclado (por ejemplo, `super + Return`) con [`sxhkd`](https://github.com/baskerville/sxhkd).

📐 **Comportamiento esperado**:

1. Primer terminal: ocupa toda la pantalla  
2. Segunda terminal: se divide verticalmente (a la derecha de la primera)  
3. Tercera terminal: se divide horizontalmente la terminal de la derecha  
4. Cuarta terminal: se divide horizontalmente la terminal de la izquierda  
5. Quinta terminal en adelante: continúa con la división recursiva habitual de bspwm

🖥 **Ejemplo visual (disposición final con 4 terminales):**

```
┌────────────┬────────────┐
│     1      │     2      │
│     ─────  │     ─────  │
│     4      │     3      │
└────────────┴────────────┘
```

⚙️ **Uso**

1. Asegúrate de que el script sea ejecutable:
   ```bash
   chmod +x tessela.sh
   ```

2. Modifica tu archivo `sxhkdrc` para que `super + Return` ejecute este script:
   ```bash
   super + Return
       /ruta/completa/a/tessela.sh
   ```

3. Recarga `sxhkd` para aplicar los cambios:
   ```bash
   pkill -USR1 -x sxhkd
   ```

4. Puedes editar dentro del script el terminal que desees usar:
   ```bash
   TERMINAL="alacritty"  # o kitty, urxvt, gnome-terminal, etc.
   ```

📦 **Requisitos**  
- bspwm  
- sxhkd  
- Un emulador de terminal instalado (`alacritty`, `kitty`, `xterm`, etc.)

---

❗ **Eliminar el cuadro amarillo (feedback visual)**

Cuando el script crea una nueva ventana en una dirección específica, `bspwm` muestra por defecto un “cuadro amarillo” indicando la preselección del espacio. Esto es visualmente innecesario si ya sabes cómo se va a dividir el layout, y puede resultar molesto.

Puedes desactivarlo añadiendo esta línea en tu archivo `~/.config/bspwm/bspwmrc`:

```bash
bspc config presel_feedback false
```

Luego reinicia BSPWM, o ejecuta el comando directamente en una terminal para aplicarlo al instante:

```bash
bspc config presel_feedback false
```

Esto eliminará completamente el indicador visual, sin afectar el comportamiento funcional del script.

