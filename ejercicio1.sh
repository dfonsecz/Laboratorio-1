#!/bin/bash

# Funciones

get_permissions_verbose() {
    local permissions=$1 # Configura variable 

    # Funcion para interpretar los permisos como read, write, execute o unknown
    interpret_permission() {
        case "$1" in
            "r")
                echo "Read"
                ;;
            "w")
                echo "Write"
                ;;
            "x")
                echo "Execute"
                ;;
            *)
                echo "Unknown"
                ;;
        esac
    }

    # Funcion para imprimir los permisos
    print_permission() {
    local specific_permission=$1
    
    # Imprime las versiones interpretadas de los permisos
    for (( i=0; i<${#specific_permission}; i++ )); do
        permission=${specific_permission:$i:1}
        result="$(interpret_permission "$permission")"
        if [ "$result" != "Unknown" ]; then
            echo "- $result"
        fi
    done
}

    # Imprimir permisos para cada tipo

    # Imprime caracter 1-3 del string
    user_permissions=${permissions:1:3}
    echo "User permissions:"
    print_permission "$user_permissions"

    # Imprime caracter 4-6 del string
    group_permissions=${permissions:4:3}
    echo "Group permissions:"
    print_permission "$group_permissions"

    # Imprime caracter 7-9 del string
    other_permissions=${permissions:7:3}
    echo "Other user permissions:"
    print_permission "$other_permissions"
}

# Codigo principal

file=$1

# Verificar si el archivo existe o no
if [ $# -ne 1 ]; then
    echo "Uso: $0 archivo"
    exit 1
fi

# Ejecutar si el archivo no existe
if [ ! -e "$file" ]; then
    echo "Error. El archivo especificado no existe."
    exit 1

# Ejecutar si el archivo existe
else
    # Verifica permisos del archivo
    permissions="$(stat -c "%A" "$file")"

    # Llamar a la funcion get_permissions
    get_permissions_verbose "$permissions"

    exit 0
fi
