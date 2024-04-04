# Actividad 7

# Completely Fair Scheduler (CFS) de Linux

> **Planificador**
> 
> Es el componente del sistema operativo encargado de la planificación. La
necesidad de algoritmos de planificación surgió con la aparición de sistemas
operativos multi tareas. CFS (Completely Fair Scheduler) es el planificador de tareas predeterminado en el kernel de Linux desde la versión 2.6.23. Su objetivo principal es asignar los recursos del procesador de manera justa y equitativa entre los diferentes procesos en ejecución en el sistema.

## Caracteristicas 

- CFS busca mantener el balance (equidad) en el tiempo de procesador
que se asignan a los procesos. Cada proceso debe recibir un tiempo
equitativo. CFS implementa un modelo de "proceso justo" en el que cada proceso obtiene una parte equitativa del tiempo de CPU disponible. Esto significa que ningún proceso debería ser favorecido injustamente sobre otros en términos de tiempo de CPU.
- CFS utiliza el concepto de "tiempo de ejecución virtual" para determinar qué proceso se ejecutará a continuación. Cada proceso tiene un tiempo de ejecución virtual que representa cuánto tiempo ha estado esperando en la cola de espera de CPU. Cuanto menor sea el tiempo de ejecución virtual de un proceso, más prioridad tendrá para ejecutarse.
- Cuando un proceso esta “fuera de balance”, se le asigna tiempo de
ejecución en el procesador.
- CFS intenta distribuir la carga de trabajo de manera equitativa entre los núcleos del procesador. Utiliza un algoritmo de equilibrio de carga dinámico para asegurarse de que los procesos se distribuyan de manera uniforme en todos los núcleos disponibles.
- Para determinar el balance, CFS mantiene la cantidad de tiempo que
se le ha asignado a un proceso en lo que llaman “Virtual Runtime”.
- CFS utiliza una colas basadas en el tiempo.
- El proceso con menor “Virtual Runtime” es el más próximo a ser
ejecutado.
- CFS mantiene un árbol “rojo-negro” ordenado por tiempo.
- En cada paso del planificador, CFS selecciona el proceso con el menor tiempo de ejecución virtual para ejecutarlo a continuación. Esto se hace para garantizar que los procesos obtengan una cantidad justa de tiempo de CPU en función de su historial de ejecución.
- CFS ajusta dinámicamente las prioridades de los procesos en función de su comportamiento de ejecución. Los procesos que utilizan menos tiempo de CPU recibirán una prioridad más alta, mientras que los procesos que utilizan más tiempo de CPU recibirán una prioridad más baja.


## Arquitectura CSF

- CFS mantiene un árbol “rojo-negro” ordenado por tiempo.
- Un árbol RB está balanceado
- El sub árbol con claves menores a n se encuentra a la izquierda.
- El sub árbol con claves mayores a n se encuentra a la derecha.
- La profundidad de 2 nodos cualquiera no difiere en más de 1.
- Los sub árboles son balanceados también.
- La búsqueda es O(log n)
- El nodo más a la izquierda tiene la clave más pequeña. Eso quiere
decir que es el nodo con el menor “virtual runtime”. Es decir, es el
nodo que representa al proceso que más necesita ejecutarse
- El nodo de más a la derecha tiene la clave más grande (mayor virtual
runtime). Es el proceso que menos necesita ejecución.
Entonces, CFS selecciona el nodo más a la izquierda para ser
despachado.
- El nodo se elimina del árbol. Si no ha terminado, se inserta de nuevo
con un nuevo valor de virtual runtime.

<img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgsF4pRvwrI486lYBvkS1YYrgyDbpaIvIGSdL3hoyvcIxzvfeSdPiY-Ug6UuUNiUM5LP_4uxtDc_J8iCmyrup1mNYujwnGYLUU29p8NWhWt5GjaSxs3KOMgOrV_2akEyMNwxQ3_L_Wgqunm/s1600/rbtree.png" alt="drawing" width="700">

- Los arboles “rojo-negro” son auto-balanceables. Ningún camino es, a lo
sumo, el doble en tamaño que cualquier otro.
- Las operaciones en el árbol ocurren en tiempo O(log(n)), donde n es
el número de nodos del árbol. De esta manera se pueden ejecutar las
operaciones de inserción y eliminación de procesos de manera rápida y
eficiente.


<img src="https://img2020.cnblogs.com/blog/1117305/202101/1117305-20210128004653247-411997349.png" alt="drawing" width="700">

## Funcionamiento 
El planificador de Linux ejecuta varios métodos para cumplir su función,
entre los principales están:

- scheduler_tick()
- try_to_wake_up()
- recalc_task_prio()
- load_balance()
- schedule()

## Rutina schedule()

Es el método más importante del planificador. Este método es el
responsable de elegir el próximo proceso a ser ejecutado.
Es ejecutado cuando:

- Un proceso cede voluntariamente el CPU.
- Un proceso espera por una señal para dormir.
- Un proceso agota su tiempo de ejecución.
- Otros casos

## Kernel de Linux
  Se encuentra en el directorio de los códigos fuentes del kernel, en el
directorio /usr/src/linux/kernel/sched/. Algunos de los archivos principales
son:

- **sched.c :** Contiene el código del planificador genérico. Las políticas de
gestión están implementadas en otros archivos.
- **sched_fair.c :** Contiene el código del planificador CFS y provee las
politicas de planificación para los procesos “Interactive” y “Batch”.
- **sched_rt.c :** Provee las políticas usadas para los procesos “Real
Time”.
