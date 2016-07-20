--author Martin Ceresa
--## title Introducción a GDB
--date today
                                                                                     ____________________
                                                                                    < Introducción a GDB >
                                                                                     --------------------
                                                                                            \   ^__^
                                                                                             \  (oo)\_______
                                                                                                (__)\       )\/\
                                                                                                    ||----w |
                                                                                                    ||     ||

--newpage GDB
--heading Que es GDB?
--boldon
GDB es el depurador de proyectos de GNU (GNU Project Debugger).
--boldoff
Y nos permite observar que es lo que pasa durante de la ejecución de los programas.
Particularmente es muy útil para:
    * Insertar puntos de parada durante la ejecución.
    * Permite examinar que pasó durante la ejecución de un programa.
    * Modificar los valores de la memoria, y experimentar sobre el comportamiento de tus programas.

Para mas información:
--ulon
https://www.gnu.org/software/gdb/
--uloff

--newpage expvars
--heading Observando Variables
--beginoutput
#include <stdio.h>

int main(void){
    int e1,e2,e3;

    printf("e1: %d, e2: %d, e3: %d\n",e1,e2,e3);
    return 0;
}
--endoutput
---
--beginshelloutput
$gcc -o ej1 ejemplo1.c
$% ./ej1
e1: 32767, e2: 0, e3: 0
--endshelloutput

--newpage expvars2
--heading Ovservando Variables
--beginoutput
...
int main(void){
    int e1,e2,e3;
    // muchas variables

    // mucho código

    return 0;
}
--endoutput
--boldon
¿cómo hacemos para observar los valores de las variables?
--boldoff
---
--beginshelloutput
$ gcc -g -o ej1 ejemplo1.c
$ gdb ej1
--endshelloutput

--newpage aprendidos
--heading Que aprendimos
Utilizar gdb:

* gcc -g -o foo foo.c
* gdb foo --args arg1 arg2 .... argn

Dentro de gdb:

* run: para dar comienzo a la ejecución
* list [LINENUM | FILE:LINENUM | FUNCTION | FILE:FUNCTION]: para observar el código de fuente al rededor de dicha linea o función.
* break [LINENUM | FILE:LINENUM | FUNCTION | FILE:FUNCTION]: poner un punto de parada durante la ejecución.
* print EXP: nos muestra el valor resultante de dicha <EXP>
* continue : nos permite continuar con la ejecución de nuestro programa, hasta el próximo punto de parada.
* help : que nos permite acceder a la ayuda de gdb
* delete NUM : elimina un el punto de parada numero NUM

--newpage segundaparte
--heading Eso no es todo!

Más comandos útiles:
* bt: nos muestra el stack de llamadas.
* frame args: nos permite seleccionar el 'stack frame' que estamos examinando.
* step : ejecutar paso por paso el siguiente comando.
* next : ejecutar el siguiente comando.
* info : muestra información general.
* info registers : muestra información de los registros.
