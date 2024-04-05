#!/bin/bash

name=$1
group=$2

echo "$name $group"

# Verificar si existe el usuario indicado

# Si existe, lo notifica pero continua con la ejecucion
if grep -q "$name" /etc/passwd; then
    echo "The user $name already exists."
#
# Si no existe todavia, crea el usuario
else
    sudo adduser $name
fi

# Verificar si existe el grupo indicado

# Si existe, lo notifica pero continua con la ejecucion
if grep -q "$group" /etc/group; then
    echo "The group $group already exists."
#
# Si no existe todavia, crea el grupo
else
    sudo addgroup "$group"
fi

# Agrega el usuario default al grupo proporcionado
default_user=$(whoami)
sudo usermod -aG "$group" "$default_user"

# Agrega el usuario proporcionado al grupo proporcionado
sudo usermod -aG "$group" "$name"

# Agrega permisos de ejecucion
sudo chown :$group ejercicio1.sh # Asignar propiedad del archivo al grupo
sudo chmod g+x ejercicio1.sh # Asignar permiso de ejecucion al grupo
sudo chmod o-x ejercicio1.sh # Quitar permiso de ejecucion a otros