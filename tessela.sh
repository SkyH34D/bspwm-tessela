#!/bin/bash

# Cuenta cuántas ventanas hay ya en el escritorio
count=$(bspc query -N -n .local.window | wc -l)

case $count in
    0)
        # Primera ventana: no se hace nada
        ;;
    1)
        # Segunda: dividir a la derecha
        bspc node -p east
        ;;
    2)
        # Tercera: dividir abajo de la segunda (derecha)
        bspc node -f east
        bspc node -p south
        ;;
    3)
        # Cuarta: dividir abajo de la primera (izquierda)
        bspc node -f west
        bspc node -p south
        ;;
esac

# Lanza la terminal
~/.local/kitty.app/bin/kitty
