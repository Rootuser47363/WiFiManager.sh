#!/bin/bash

# Función para mostrar los perfiles de red WiFi existentes
function mostrar_perfiles {
    echo "Perfiles de red WiFi existentes:"
    for archivoConfig in /etc/wpa_supplicant/*.conf; do
        nombreRed=$(grep -oP 'ssid="\K[^"]+' "$archivoConfig")
        nivelSenal=$(iwlist scan | grep -A 5 "$nombreRed" | grep "Signal level" | awk '{print $4}')
        seguridad=$(grep -oP 'psk="\K[^"]+' "$archivoConfig")
        
        echo "- Nombre: $nombreRed"
        echo "  Nivel de señal: $nivelSenal"
        echo "  Seguridad: $seguridad"
    done
}

echo "¿Qué acción deseas realizar?"
echo "1. Agregar una nueva red WiFi"
echo "2. Mostrar perfiles de red WiFi existentes"
echo "3. Salir"

read -p "Ingrese el número de la acción: " opcion

case $opcion in
    1)
        # Código para agregar una nueva red WiFi
        ;;
    2)
        mostrar_perfiles
        read -p "Presiona Enter para continuar..."
        ;;
    3)
        echo "Saliendo del script."
        ;;
    *)
        echo "Opción inválida."
        ;;
esac
