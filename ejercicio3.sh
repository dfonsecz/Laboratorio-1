#!/bin/bash

# Funciones

main () {
    get_help

    read -p "Ingrese las opciones que desea utilizar: " option

    check_option $option
}

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

check_option () {
    local opt OPTIND OPTARG
    m=false
    d=false

    while getopts "hm:d:" opt; do
        case ${opt} in
            h)
            get_help
            ;;
            m)
            m=true
            mode="$OPTARG"
            ;;
            d)
            d=true
            date="$OPTARG"
            ;;
            \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
            :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
        esac
        done
    shift $((OPTIND - 1))

    cd system_logs

    if [ "$m" == "true" ] && [ "$d" == "false" ]; then
        for file in *.log; do
            cat "$file" >> merged_file.log
        done
        cat merged_file.log | grep ERROR | grep "$mode"| awk '{print "Fecha:", $1, "\nHora del error:", $2, "\nDescripcion del error: ", substr($0, index($0, $5))}' > error_logs.txt
        rm merged_file.log
    elif [ "$m" == "true" ] && [ "$d" == "true" ]; then
        for file in *.log; do
            cat "$file" >> merged_file.log
        done
        cat merged_file.log | grep ERROR | grep "$mode" | grep "$date" | awk '{print "Fecha:", $1, "\nHora del error:", $2, "\nDescripcion del error: ", substr($0, index($0, $5))}' > error_logs.txt
        rm merged_file.log
    elif [ "$m" == "false" ] && [ "$d" == "true" ]; then
        cat log_"$date".log | grep ERROR | awk '{print "Fecha:", $1, "\nHora del error:", $2, "\nDescripcion del error: ", substr($0, index($0, $5))}' > error_logs.txt
    fi
}

main