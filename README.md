### Universidad de Costa Rica
#### IE0117 Programación Bajo Plataformas Abiertas
---
# Laboratorio 1
## Introducción
## Implementación
### Scripting y Permisos

#### Interpretar permisos
Como primera parte del procedimiento, se creó un script de bash llamado `ejercicio1.sh`. Este script recibe como parámetro el nombre de un archivo. Al ejecutarse, verifica la existencia del archivo que recibió como parámetro. De ser lo contrario, se presenta un código de error al usuario.

Una vez confirmada la existencia del archivo, se ejecuta lo siguiente:
1. Se obtienen los permisos del archivo, y se almacenan dentro de una variable como un string.
2. Una vez obtenidos los permisos, ejecuta una función llamada `get_permissions_verbose`. Esta recibe como parámetro el string de permisos del archivo. Se encarga de:
> - Guardar los permisos en tres variables diferentes, para distinguir los de usuario, grupo y otros.
> - Interpretar estas variables como permisos read, write, execute o unknown.
> - Imprimir para usuario, grupo y otros, todos los permisos pertinentes identificados.

#### Limitar permisos
Adicionalmente, se creó otro archivo con el nombre de `ejercicio2.sh`. La finalidad principal de este archivo es de limitar los permisos de ejecución de otro archivo.

### Bash scripting
## Resultados
### Interpretar permisos

Al ejecutar el archivo `ejercicio1.sh`, ingresando como parámetro un nombre de archivo cualquiera como `test.txt`, se muestra un mensaje de error que indica que ese archivo no existe. Se verifica con el comando `$ ls` que dentro de la carpeta actual no existe ningún archivo con el nombre proporcionado. Sin embargo, existe un archivo con el nombre `prueba.txt`.

Se repite el procedimiento, pero esta vez ingresando como parámetro el archivo `prueba.txt`, que en teoría sí existe en la carpeta. Al ejecutar el archivo, se muestra una lista de permisos, que corresponden a los del archivo ingresado como parámetro. Para confirmar que estén correctos, se ejecuta el comando `$ ls -l` en la terminal. Esto muestra los permisos de todos los archivos dentro de la carpeta y permite confirmar que coinciden con los resultados de la interpretación.

![ejercicio1.sh](images/1.png)

### Limitar permisos

Para esta segunda parte, primero se comprobó que no existe un usuario llamado **_johnny_**, con el comando `$ id johnny`. Una vez hecho esto, se ejecutó el archivo `ejercicio2.sh`, utilizando como parámetros el usuario `johnny` y el grupo `familia`. En la figura es posible observar que, al no existir un usuario ni un grupo con esos nombres, el sistema los crea.

Al reingresar el comando `$ id johnny`, se observa que ahora sí aparece que existe un usuario con ese nombre. Además, es parte del grupo `familia`.

![ejercicio2.sh](images/2.png)

## Conclusiones y recomendaciones
## Referencias
