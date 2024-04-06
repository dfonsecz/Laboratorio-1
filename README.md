### Universidad de Costa Rica
#### IE0117 Programación Bajo Plataformas Abiertas
---
# Laboratorio 1
## Introducción
## Implementación
### Scripting y Permisos

#### Interpretar permisos
Como primera parte del procedimiento, se creó un script de bash llamado `ejercicio1.sh`. Este script recibe como parámetro el nombre de un archivo. Al ejecutarse, verifica la existencia del archivo que recibió como parámetro. De ser lo contrario, se presenta un código de error al usuario.
#### Limitar permisos
### Bash scripting
## Resultados
### Interpretar permisos

Al ejecutar el archivo `ejercicio1.sh`, ingresando como parámetro un nombre de archivo cualquiera como `test.txt`, se muestra un mensaje de error que indica que ese archivo no existe. Se verifica con el comando `$ ls` que dentro de la carpeta actual no existe ningún archivo con el nombre proporcionado. Sin embargo, existe un archivo con el nombre `prueba.txt`.

Se repite el procedimiento, pero esta vez ingresando como parámetro el archivo `prueba.txt`, que en teoría sí existe en la carpeta. Al ejecutar el archivo, se muestra una lista de permisos, que corresponden a los del archivo ingresado como parámetro. Para confirmar que estén correctos, se ejecuta el comando `$ ls -l` en la terminal. Esto muestra los permisos de todos los archivos dentro de la carpeta y permite confirmar que coinciden con los resultados de la interpretación.
![alt text](images/1.png)
## Conclusiones y recomendaciones
## Referencias
