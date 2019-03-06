---
layout: post
published: true
title: Taller de pedales
date: 2019-03-06
tags: [
  "Electrónica",
  "Música"
]
categorias: [
  "Instrumentación"
]
---

 




## Planteamiento

Pasos del proyecto:

1. Encontrar un circuito con un efecto de nuestro interés, que se adapte a nuestras necesidades. Que sea simple de analizar, crear, etc.
2. Analizar el circuito.
3. Fabricación del circuito en una protoboard.
4. Creación de la PCB con Altium. Y creación de la caja de nuestra pedalera para imprimirla en una impresora 3D.
5. Ensamblar el producto final.

En esta primera sesión se abordaron los primeros 3 puntos. Se crearon dos grupos, unos encargados de la simulación del circuito con LTSpice, y el otro grupo de la fabricación del prototipo. Al final de la sesión se compararon los resultados de los diferentes grupos.


## Introducción y background del efecto Overdrive:

Los pedales eléctricos son dispositivos electrónicos que tienen como objetivo alterar el sonido, proveniente normalmente de instrumentos eléctricos como la guitarra eléctrica, el bajo o los sintetizadores. También existen pedales para fuentes acústicas como la voz. Para favorecer su uso y no obligar a los músicos a utilizar las manos, se suelen situar en el suelo, pudiendo activarlo o modificarlo por medio del pie, de ahí el nombre de “pedal”. 

El pedal que hemos estudiado es el Overdrive. Este efecto nació en los años 50 de la mano de guitarristas de blues y rock. Consiguieron este efecto al poner los amplificadores de válvulas de baja fidelidad al volumen máximo. La señal excedía la capacidad de las válvulas y la onda se veía deformada. 

En la siguiente imagen podemos ver el esquemático que hemos usado para construir el pedal:

![Esquemático](/blog/2019-03-06/esquematico.jpeg)


A continuación, se explicará más detalladamente lo que hizo cada grupo.


## Simulación del pedal: 
*Implicados: Santiago Maldonado Hernández, Alejandro Ramos Martín, Juan Ruiz Ortega, Ignacio López Delgado*

Nos basamos en los esquemáticos mostrados anteriormente, tanto para la compra de componentes como para el montaje y simulación del prototipo. Para esta primera simulación empleamos el programa LTSpice, de uso gratuito, el cual tiene un funcionamiento sencillo y variedad de dispositivos para integrar en la simulación. Cabe destacar que hemos utilizado ciertos componentes, como el transistor npn y los diodos (ideales: tensión de codo 0V), que no necesariamente se corresponden con los modelos adquiridos para el montaje, pero que sirven como una buena referencia para el seguimiento y estudio del funcionamiento correcto del circuito.

A continuación, se presentan dos imágenes: Un  el esquemático generado con LTSpice para este primer módulo, sobre el cual pasamos a analizar sus subsistemas y su funcionalidad.


![Esquemático LTspice] (/blog/2019-03-06/sq_LTSpice.jpg)


1. El módulo recuadrado en rojo consiste en un filtro paso alto pasivo, es decir, en una estructura R-C conectada a dos diodos situados en antiparalelo (con polaridades opuestas).

2. El módulo recuadrado en verde consiste en un filtro paso bajo pasivo, de nuevo una estructura R-C y dos LEDs con la misma conexión que los diodos del paso alto.
La función de los diodos en ambos submódulos es limitar en tensión a la señal de entrada, teniendo que superar su tensión de codo para que los diodos conduzcan corriente. Como ya hemos mencionado, esta tensión es nula en nuestra simulación para hacerla más sencilla, pero en un caso real sería mayor que cero (un valor típico es 0.6V). El motivo por el que en el paso bajo se utilizan LEDs es únicamente a modo de prueba para comprobar que está circulando corriente por el módulo, alternándose la iluminación de ambos en caso de que así sea.

3. A la salida y uniendo ambos módulos hay conectado un potenciómetro, el cual controla la cantidad de potencia entregada por un filtro u otro. Esto lo hace mediante un nivel que regula la resistencia de salida a cada uno de los subsistemas, pasando mayor nivel de corriente a aquel que tenga una resistencia de salida de menor valor. En esencia, lo que conseguimos con esto es agudizar o agravar la señal de sonido filtrando sus componentes de baja o alta frecuencia respectivamente. Este dispositivo se ha representado en el esquemático mediante dos resistencias y un nivel en el centro, consiguiendo distintos efectos dependiendo del valor dado a las mismas (su total debe ser 10 kΩ, ver recuadro morado).

4. La salida del sistema se mide en bornes de un potenciómetro de 100 kΩ unido al anterior. La funcionalidad de este es muy sencilla de entender; simplemente regula el nivel de audio de la señal de salida.

5. Finalmente, el módulo recuadrado en marrón funcionaría como un distorsionador de la señal de audio. Este tiene como entradas la señal de sonido, que hemos representado como una nota LA – señal sinusoidal de frecuencia 440 Hz y amplitud 0.3 V, y la alimentación del circuito (+9V). La distorsión generada por este subsistema crea diferentes efectos de sonido, y depende del valor de saturación del transistor y el nivel de amplificación de la señal de audio. Cuando el nivel de esta supera el valor de saturación, los máximos de la señal quedan recortados y de esta manera se generan los efectos de distorsión buscados. La señal distorsionada pasará a continuación a los módulos de filtrado 1 y 2.

A continuación, se muestran dos capturas obtenidas mediante LTSpice en el circuito, en las que se representan la señal de entrada (en verde) y de salida (en morado) del módulo completo. Se puede observar como la onda de salida está saturada, consiguiendo resultados acertados. 


![figura2](/blog/2019-03-06/figura2.jpg)



![figura3](/blog/2019-03-06/figura3.jpg)


## Montaje del circuito en una Protoboard

*Implicados: Francisco Acién Pérez, Nacho Sardinero Meirás, Pablo López Querol*

Para ver el comportamiento del circuito en la realidad, lo montamos en un protoboard.

Decidimos montarlo en una protoboard, en vez de soldarlo directamente a una PCB, por si el esquemático necesitaba alguna modificación.

Echando un vistazo a los componentes de circuito, son componentes muy comunes. Todos ellos son fácil de conseguir. En nuestro caso, tuvimos que reemplazar el transistor `2N3904` por el transistor `2N4124`, que tiene unas características similares al utilizado en el circuito.

El resultado del montaje fue el siguiente:

![Resultado](/blog/2019-03-06/resultado.jpg)

El **siguiente paso** era **analizarlo con el osciloscopio**. Para ello alimentamos el circuito con **+9 V**, y generamos una señal, con el generador de señales, similar a la de una guitarra eléctrica.

La **salida de una guitarra eléctrica** va desde los *100 mV* a los *300 mV*. Así que generamos una señal de *200mV*, con una frecuencia de *500 Hz*, a la entrada del circuito y vemos la salida.

La **señal a la entrada**:

![Señal a la entrada](/blog/2019-03-06/entrada.jpeg)

La **señal a la salida**:

![Señal a la salida](/blog/2019-03-06/salida.jpeg)

Como vemos la salida del circuito se aproxima al de un efecto Overdrive.

**Pero tiene un problema el circuito**, nos ha añadido un offset de  aproximadamente **1 V** a la salida del circuito. Haciendo un estudio rápido, llegamos a la conclusión de que el culpable de este **problema son los diodos**.

En nuestro circuito, utilizamos 4 diodos, 2 LEDS, y 2 diodos `1N4148`. Pero entre ellos tienen **diferentes tensiones de codo**. Por este motivo a la salida nos encontramos un Offset.

**Para solucionarlo**, podemos crear un **filtro RC paso alto**, que elimine dicha contiua, o incluso cambiar los LEDS por diodos normales. En nuestro caso, cambiamos los LEDS por diodos `1N4148`, y el resultado es el mismo, pero sin la continua.

También, **se perciben interferencias en algunas frecuencias**, pero esto se debe a que el circuito lo tenemos montado en una protoboard. Cuando se monte el ciruito en su PCB con la caja, esas inteferencias desaparecerán.

## Conclusión

El circuito funciona como se esperaba. Hace su función de Overdrive perfectamente.

![Analizando con el osciloscopio1](/blog/2019-03-06/analizando1.jpg)





