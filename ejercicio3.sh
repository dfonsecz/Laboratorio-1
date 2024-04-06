#!/bin/bash

# Funciones

# 
main () {
    get_help

    read -p "Ingrese las opciones que desea utilizar: " option

    check_option $option
}

# Imprimir menú de ayuda
get_help () {
    echo " "
    echo "Uso: ejercicio3.sh"
    echo " "
    echo "-h:           Menu de ayuda"
    echo "-m MODE:      Modo de funcionamiento del informe"
    echo "-d DATE:      Fecha"
    echo " "
    echo "Ejemplo de uso: ./ejercicio3.sh -h -m servidor_web -d 2024-03-01 "
    echo " "
}

# Revisar opciones
check_option () {
    local opt OPTIND OPTARG
    # Condiciones seteadas para identificar si se señaló un modo o fecha
    m=false
    d=false

    # Toma decisiones dependiendo de si aparencen las opciones -h, -m o -d
    while getopts "hm:d:" opt; do
        case ${opt} in
            h)
            get_help # Llama a la función de imprimir el menú de ayuda
            ;;
            m)
            m=true # Cambia condición a verdadero si se especifica el modo
            mode="$OPTARG" # Guarda el argumento para la opción -m
            ;;
            d)
            d=true # Cambia condición a verdadero si se especifica la fecha
            date="$OPTARG" # Guarda el argumento para la opción -d
            ;;
        esac
        done
    shift $((OPTIND - 1))

    cd system_logs

    # Condiciones para output file 'error_logs.txt'

    # Si se especifica modo pero no fecha
    # Se filtra por modo
    if [ "$m" == "true" ] && [ "$d" == "false" ]; then
        for file in *.log; do
            cat "$file" >> merged_file.log
        done
        cat merged_file.log | grep ERROR | grep "$mode"| awk '{print "Fecha:", $1, "\nHora del error:", $2, "\nDescripcion del error: ", substr($0, index($0, $5))}' > error_logs.txt
        rm merged_file.log

    # Si se especifica modo y fecha
    # Se filtra por modo y fecha
    elif [ "$m" == "true" ] && [ "$d" == "true" ]; then
        for file in *.log; do
            cat "$file" >> merged_file.log
        done
        cat merged_file.log | grep ERROR | grep "$mode" | grep "$date" | awk '{print "Fecha:", $1, "\nHora del error:", $2, "\nDescripcion del error: ", substr($0, index($0, $5))}' > error_logs.txt
        rm merged_file.log

    # Si se especifica fecha pero no modo
    # Se filtra por fecha
    elif [ "$m" == "false" ] && [ "$d" == "true" ]; then
        cat log_"$date".log | grep ERROR | awk '{print "Fecha:", $1, "\nHora del error:", $2, "\nDescripcion del error: ", substr($0, index($0, $5))}' > error_logs.txt
    fi
}

# Llama a la función principal
main
