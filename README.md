### Universidad de Costa Rica
#### IE0117 Programación Bajo Plataformas Abiertas
B93070 Daniela Fonseca Zumbado
---
# Laboratorio 1
## Introducción
## Implementación
### Scripting y Permisos

#### 1 - Interpretar permisos
Como primera parte del procedimiento, se creó un script de bash llamado `ejercicio1.sh`. Este script recibe como parámetro el nombre de un archivo. Al ejecutarse, verifica la existencia del archivo que recibió como parámetro. De ser lo contrario, se presenta un código de error al usuario.

Una vez confirmada la existencia del archivo, se ejecuta lo siguiente:
1. Se obtienen los permisos del archivo, y se almacenan dentro de una variable como un string.
2. Una vez obtenidos los permisos, ejecuta una función llamada `get_permissions_verbose`. Esta recibe como parámetro el string de permisos del archivo. Se encarga de:
> - Guardar los permisos en tres variables diferentes, para distinguir los de usuario, grupo y otros.
> - Interpretar estas variables como permisos read, write, execute o unknown.
> - Imprimir para usuario, grupo y otros, todos los permisos pertinentes identificados.

#### 2 - Limitar permisos
Adicionalmente, se creó otro archivo con el nombre de `ejercicio2.sh`. La finalidad principal de este archivo es de limitar los permisos de ejecución de otro archivo. Este archivo tiene las siguientes funciones:
1. Recibe dos strings, uno con un nombre de usuario y otro con un nombre de un grupo.
2. Intenta crear un nuevo usuario con el nombre proporcionado. En caso de que ya exista, informa de esto, pero continúa con el procedimiento.
3. Intenta crear un nuevo grupo con el nombre proporcionado. En caso de que ya exista, también informa de esto, pero continúa con el procedimiento.
4. Agrega el usuario al grupo ingresados. Adicionalmente, agrega al usuario default al grupo ingresado.
5. Asigna permisos de ejecución al script `ejercicio1.sh` para todos los miembros del grupo ingresado.

### 3 - Bash scripting

## Resultados

### 1 - Interpretar permisos

Al ejecutar el archivo `ejercicio1.sh`, ingresando como parámetro un nombre de archivo cualquiera como `test.txt`, se muestra un mensaje de error que indica que ese archivo no existe. Se verifica con el comando `$ ls` que dentro de la carpeta actual no existe ningún archivo con el nombre proporcionado. Sin embargo, existe un archivo con el nombre `prueba.txt`.

Se repite el procedimiento, pero esta vez ingresando como parámetro el archivo `prueba.txt`, que en teoría sí existe en la carpeta. Al ejecutar el archivo, se muestra una lista de permisos, que corresponden a los del archivo ingresado como parámetro. Para confirmar que estén correctos, se ejecuta el comando `$ ls -l` en la terminal. Esto muestra los permisos de todos los archivos dentro de la carpeta y permite confirmar que coinciden con los resultados de la interpretación.

![ejercicio1.sh](images/1.png)

### 2 - Limitar permisos

Para esta segunda parte, primero se comprobó que no existe un usuario llamado **_johnny_**, con el comando `$ id johnny`. Una vez hecho esto, se ejecutó el archivo `ejercicio2.sh`, utilizando como parámetros el usuario `johnny` y el grupo `familia`. En la figura es posible observar que, al no existir un usuario ni un grupo con esos nombres, el sistema los crea.

Al reingresar el comando `$ id johnny`, se observa que ahora sí aparece que existe un usuario con ese nombre. Además, es parte del grupo `familia`.

Adicionalmente, al ejecutar el mismo comando con el usuario `$ id danny`, el cual es mi usuario, se comprueba que también pasé a formar parte del grupo `familia`.

![ejercicio2.sh](images/2.png)

Si se ejecuta de nuevo el archivo con los mismos parámetros, se observa que se imprimen mensajes de advertencia de que tanto el usuario como el grupo ya existen. Sin embargo, de igual manera se ejecuta el resto del código, puesto que el sistema solicita la contraseña de `sudo` del usuario default.

Finalmente, para comprobar que se asignaron los permisos correctamente, se ejecuta el comando `$ ls -l`. Esto muestra que el grupo `familia` tiene permiso de ejecución para el archivo `ejercicio1.sh`.

![ejercicio2.sh](images/3.png)

## Conclusiones y recomendaciones
## Referencias
