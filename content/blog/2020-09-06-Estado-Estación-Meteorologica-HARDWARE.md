---
layout: post
published: true
title: Estación Metereológica - Resumen del Hardware diseñado hasta la fecha
date: 2020-09-06  # La fecha va con la forma YYYY-MM-DD
tags: [
  "proyectos",
  "antenas",
  "satélites"
]
categorias: [
  "proyectos",
  "SDR",
  "WX Ground Station"
]
image: /blog/2020-09-06/1.jpg
---

Desde que se aprobó el desarrollo de la estación de satélites meteorológicos en banda VHF como proyecto principal del RadioClub para el año 2020, un gran número de socios ha estado involucrado en el diseño de todos los equipos de hardware necesarios. Gracias a su labor, ha sido posible acercarnos al objetivo principal del proyecto: una estación funcional diseñada íntegramente por estudiantes del club. Si bien es cierto que todavía no nos ha sido posible llevar a la práctica los planos obtenidos debido a la situadión de pandemia en que se encuentra actualmente nuestro país, el uso de software de simulación nos ayuda a cercionarnos de que nos encontramos en el buen camino.

Los principales elementos de hardware de los que constará la estación serán los siguiente:

### Antena

Como ya se comentó en una entrada anterior de esta misma web, la antena será una Yagi Uda de polarización circular (RHCP). Para ello, construiremos un array de dos Yagis de polariazción lineal, estando una de ellas rotada 90º con respecto a la otra en el eje de propagación y conectadas mediante una línea de retardo de $\lambda/4$.

Previamente al diseño de la antena en sí, fue necesario enumerar las limitaciones con las que contaremos de cara a su construcción. Por un lado, sería conveniente que el mástil de la Yagi no fuera extremadamente largo, dada su fragilidad, dificultad de montaje y falta de espacio en el rotor. Además, los elementos deberán ser ligeros y de un diámetro relativamente pequeño (no superior a los 12mm), ya que, al ser estructuras metálicas, un grosor mayor conllevaría un peso excesivo, disminuyendo así la consistencia global de la antena. Finalmente, interesaría conseguir una impedancia final de 50Ohm a su entrada, para conseguir adaptación de impedancias con el coaxial del que disponemos en el club (RG-213).

Dado que estamos trabajando con longitudes de onda de al rededor de 2,20m, nos decantamos por un diseño de 5 elementos (reflector, dipolo y tres directores), con una longitud del mástil de 2m. En lo referido a los elementos, éstos serán varillas metálicas de 6mm de grosor.

Con respecto a la impedancia de 50Ohm, decidimos que lo mejor sería conseguir un aimpedancia nominal de 25Ohm en cada Yagi individual (horizontal y vertical). Mediante la conexión de dos cables coaxiales de 50Ohm en paralelo (25Ohm) y una longitud eléctrica de $\lambda/4$ entre ambas yaguis, conseguiríamos el retardo de fase de 90º necesario para la obtención de polarización circular. Asimismo, en el punto de unión entre la linea desfasadora y la segunda Yagui, tendríamos una impedancia de 12,5Ohm (dos líneas de 25Ohm en paralelo). Conectando en este punto otra línea de dos coaxiales de 50Ohm en paralelo y longitud eléctrica $\lambda/4$, conseguiríamos una impedancia final de 50Ohm en el extremo suelto del cable.

![](/blog/2020-09-06/9.jpg)

$$Z = \frac{Z_o^2}{Z_l} = \frac{25^2}{12.5} = 50\Omega$$

Una vez aclarados estos aspectos, se procedió al diseño de cada una de las yagis individualmente. Para ello, se hizo uso de las suits de Matlab [Optimization Toolbox](https://www.mathworks.com/products/optimization.html), [Antenna Toolbox](https://www.mathworks.com/products/antenna.html?s_tid=srchtitle) y [Phased Array Toolbox](https://www.mathworks.com/products/phased-array.html?s_tid=srchtitle). El proceso de diseño se basó en la optimización de una antena Yagi genérica con respecto a las características de ganancia, impedancia (parámetro S11) y ratio delante-atrás buscados. Para más detalle sobre el proceso de diseño, se recomienda seguir el [ejemplo](https://www.mathworks.com/help/gads/surrogate-optimization-antenna-design.html) publicado en la web de Matlab.

Con el fin de asegurar la viabilidad del array de ambas yagis con los valores obtenidos en el anterior paso, diseñamos un script de Matlab capaz de obtener los parámetros teóricos de un array desfasado de dos yaguis según los resultados obtenidos en la anterior ejecución. El código está disponible en el [repositorio de GiTea](https://git.radio.clubs.etsit.upm.es/) del radioclub.

Una vez obtenida en Matlab una antena que cumpliera los requerimientos del proyecto, se procedió a realizar diversas simulaciones de ésta mediante el software CST Studio. Estos fueron los resultados obtenidos:

Diagrama de radiación en 3D:
![](/blog/2020-09-06/1.jpg)

Corte con el eje $\theta = 90º$ (polares):
![](/blog/2020-09-06/2.jpg)

Corte con el eje $\theta = 90º$ (cartesianas):
![](/blog/2020-09-06/3.jpg)

Parámetro $S_{11}$:
![](/blog/2020-09-06/4.jpg)

### Filtro

El filtro a diseñar será del tipo paso banda, con una banda de paso suficientemente grande para dejar pasar tanto la banda de frecuencias correspondiente a satélites meteorológicos como la asociada a la banda de 2m de radioaficionados, pero suficientemente estrecha para ofrecer un buen rechazo ante señales de radiodifusión FM. 

El diseño del filtro se hizo gracias a software específico para esta tarea. Sin ir más lejos, Matlab cuenta con una potente [Filter Toolbox](https://es.mathworks.com/products/rftoolbox.html) con multitud de herramientas para este fin. Asimismo, existen  [alternativas online](https://rf-tools.com/lc-filter/) muy últiles como alternativas a Matlab.

![](/blog/2020-09-06/5.jpg)

Una vez encontrado un filtro que aparentemente se adapta a las necesidades anteriormente expuestas, basta simularlo para comprobar si, efectivamente, se comporta de la forma esperada y se puede proceder a su fabricación. Para ello, se hizo uso del software [LTSpice](https://www.analog.com/en/design-center/design-tools-and-calculators/ltspice-simulator.html) de Analog Devices. Una vez más, el archivo correspondiente tanto al esquemático del circuito como a los resultados de la simulación puede encontrarse en nuestro [repositorio de GiTea](https://git.radio.clubs.etsit.upm.es/):

![](/blog/2020-09-06/7.jpg)

![](/blog/2020-09-06/6.jpg)


Por último, es necesario diseñar la PCB donde soldaremos los componentes del filtro. Para ello, se utilizó la alternativa de software libre [KiCAD](https://kicad-pcb.org/). Es importante destacar el uso de un alínea de transmisión tipo microstrip para minimizar las pérdidas. Si bien en este post no describiremos en detalle el proceso de diseño de PCBs, contemplamos la realización de un taller formativo sobre este tema para el próximo curso. 

El aspecto final que tendrán nuestras placas será el siguiente:

![](/blog/2020-09-06/10.png)


### Inyector de CC

Por último, pero no por ello menos importante, será necesario añadir un inyector de CC (también conocido por su nombre en inglés Bias Tee o Via en T) para alimentar el LNA. El diseño de este componente es extremadamente sencillo en comparación con los anteriores, ya que éste consta sólo de un condensador a modo de bloqueo de continua (para proteger el receptor) y una inductancia a modo de bloqueo o choque de RF (para proteger la fuente de CC). 

![](/blog/2020-09-06/8.png)

Con el fin de conseguir deteriorar lo menos posible la señal recibida, deberemos tener en cuenta:

$$\frac{1}{2\pi f C} << Z_0$$

Y

$$2\pi f L >> Z_0$$

Démonos cuenta que existen multitud de valores de $C$ y $L$ que satisfacen las anteriores inecuaciones. Se opta por elegir $C=100nF$ y $L=10uH$.

## Conclusión

La gran mayoría del hardware utilizado es tanto de diseño como de fabricación propia. Si bien es una lástima que, dadas las circunstancias en que nos encontramos, no nos sea posible comenzar a construir ninguno de los elementos de hardware, el proceso de diseño fue lo suficientemente exhaustivo para asegurar buenos resultados. Además, el hecho de poder acompañar estos resultados con simulaciones que corroboren su veracidad demuestran la viabilidad del proyecto en sí.

~mamado@EA1FID
