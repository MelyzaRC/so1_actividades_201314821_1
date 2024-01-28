### Actividad 1

# Tipos de *kernel*

> El ***kernel*** es el corazón del sistema operativo, es un mediador entre el *software* y el *hardware*, gestiona los recursos y los distribuye de la mejor manera, además, administra la memoria de los procesos y programas en ejecución. En pocas palabras, **es el responsable del funcionamiento de la máquina**.
>
> 
> <img src="https://upload.wikimedia.org/wikipedia/commons/e/eb/Kernel.png" alt="drawing" width="250">


- ## Tipos de ***kernel*** y sus diferencias

| Tipo                               | Diferencias   |
| ------------------------------------ | --------- |
|**Kernel monolítico** <br/><br/><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Kernel-monolithic.svg/1200px-Kernel-monolithic.svg.png" alt="drawing" width="150"><br/><br/>|Es un *kernel* de gran tamaño que se encarga de todas las tareas, por si mismo realiza la gestión de memoria y de los procesos, de la comunicación entre procesos y proporciona funciones de soporte de drivers y hardware.|
|**Microkernel** <br/><br/><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Kernel-microkernel.svg/400px-Kernel-microkernel.svg.png" alt="drawing" width="150"><br/><br/>| Está diseñado con un tamaño reducido, esto de manera intencional con el propósito de que si falla no se paralice todo el sistema. Está compuesto por varios módulos para que pueda asumir las mismas tareas y funciones que un *kernel* grande.|
|**Kernel híbrido**<br/><br/> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Kernel-hybrid.svg/220px-Kernel-hybrid.svg.png" alt="drawing" width="150"><br/><br/>| Es una combinación entre los dos tipos anteriores, si bien es un *kernel* grande, está modularizado e incluye código adicional en el núcleo que pemite ejecutar funciones más rápido.|

- ## User mode vs. ***kernel*** mode

### Modo usuario
En este modo se podrán ejecutar únicamente las instrucciones restringidas de las aplicaciones. Dichas instrucciones representan un subconjunto del total ofrecido por el procesador. 
### Modo *kernel*
Este es el modo en el que se ejecuta el núcleo del sistema operativo. Este modo es capaz de ejecutar todas las instrucciones del procesador y los recursos del sistema. Esto implica que incluye también las instrucciones del modo usuario. 

La diferencia entre ambos modos radica en el nivel de privilegio que poseen. Cuando se está en **modo usuario** no se tienen muchos privilegios, lo cual indica que no se tiene acceso directo a todos los recursos del sistema y del hardware, por el contrario cuando se encuentra en **modo *kernel*** se tienen más privilegios, lo cual puede significar que un fallo puede bloquear todo el sistema operativo. 
> **¿Cómo se realiza la transición de modo usuario a modo *kernel*?**
>
> Esta transición se realiza a través de instrucciones del procesador tales como **INT** (interrupciones por software) o **SYSCALL** (llamadas al sistema).
<br/>
<br/>
<img src="https://linuxemb.wikidot.com/local--resized-images/tesis-c2/monolitico.png/medium.jpg" alt="drawing" width="500">

- ## Interruption vs. trap
  
| Interruption                              | Trap  |
| ------------------------------------ | --------- |
|Una interrupciòn en una señal recibida por el procesador, esta señal le indica que debe interrumpir lo que està ejecutando actualmente y realizar una acciòn determinada para despuès reanudar el proceso que fue detenido. <br/>Las interrupciones son generadas por los dispositivos periféricos a travès de una lìnea ùnica denominada **IRQ** por sus siglas en inglès ***interrupt request***.<br/> Un ejemplo serìa pulsar una tecla o mover el ratòn. |Un trap es una interrupción generada por el software causada por un error o por un requerimiento de usuario. | 

<img src="https://image.slideserve.com/884515/fundamentos-de-software-de-e-s3-l.jpg" alt="drawing" width="150">

  


