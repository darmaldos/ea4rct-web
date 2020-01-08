---
layout: post
published: true
title: "Construcción de antena casera para la recepción de imágenes SSTV emitidas por la ISS"
date: 2020-01-08  # La fecha va con la forma YYYY-MM-DD
tags: [
  "Proyectos",
  "FAX",
  "HF",
  "SDR",
  "ISS",
  "DIY",
  "Radioaficion"
]
categorias: [
  "Antenas",
  "Sstv",
  "Radioafición"
]
author: "Pablo Álvarez"
---

# Construcción de antena casera para la recepción de imágenes SSTV emitidas por la ISS


Hace menos de una semana que el [blog oficial](http://ariss-sstv.blogspot.com/?m=1) de ARISS (Amateur Radio of the International Space Station) anunció que, tanto con motivo de rememorar al astronauta Alexei Leonov como para celebrar la navidad, encenderían el transpondedor de SSTV entre los días 28 de diciembre y 1 de enero. Son fechas muy complicadas, ya que, no solo la gran mayoría de estudiantes miembros del RadioClub nos encontramos fuera de Madrid para pasar las fiestas, sino que, además, la universidad permanece cerrada durante estos días, por lo que nos es imposible acceder a club y hacer uso de nuestros equipos de radioafición.

Sin embargo, parte de la gracia de recibir este tipo de señales reside el la posibilidad de hacerlo sin utilizar material (antenas, filtros, amplificadores, receptores, etc.) profesional. Es por ello que Pablo M., uno de los miembros del club, se animó a intentar recibir algún paso de la ISS utilizando material de andar por casa. A final de esta entrada podéis encontrar los resultados que obtuvo.

## Hardware

Como se comentó anteriormente, debido al poco plazo de preparación y a la escasez de material específico para la recepción de radio, parte del sistema receptor utilizado se puede construir de forma casera con utensilios domésticos y en apenas un par de horas.

#### Material necesario:

+ SDR (Airspy HF+ Discovery en nuestro caso aunque sirve cualqueira)
+ Coaxial con conector SMA normal macho (usamos RG58 ya que era lo que tenía en casa, cualquier longitud)
+ Mástil/palo de longitud 1m o superior (palo de escoba en nuestro caso)
+ Precinto
+ Trozo de cable (unos 15cm) de 1mm de grosor
+ Cinta métrica (3m, sobre 1cm de grosor)
+ Ordenador portátil

En caso de no disponer en casa, todo el material se puede obtener por unos 30 euros fácilmente.



#### Diseño de la antena:

Nuestra antena receptora será una Yagi-Uda de 3 elementos sintonizada a 145MHz, basada en el [diseño de WB2HOL](http://theleggios.net/wb2hol/projects/rdf/tape_bm.htm). Este tipo de anteas son algo directivas (tendrá una buena relación alante/atrás pero un ancho de haz elevado, superior a unos 65º en el plano E y 100º en el plano H), por lo que, a la hora de usarlas, necesitaremos realizar un tracking manual del satélite. Además, al tener esta antena polarización lineal (al igual que la correspondiente al transpondedor de la ISS), existe la posibilidad de que se produzca un desacoplo de polarizaciones y, con ello, unas pérdidas de señal muy elevadas. Debido a la rotación de Faraday, por la cual la polarización del campo eléctrico varía aleatoriamente al atravesar las distintas capas de la atmósfera, no es posible predecir la dirección de polarización con la que llegará la señal, por lo que se deberá determinar a base de prueba y error (rotando la antena) a lo largo del paso del satélite.

El elemento activo se trata de un dipolo de λ/2, así que necesitaremos utilizar un adaptador de impedancias para conseguir una ROE adecuada a la frecuencia de trabajo. En nuestro caso, usaremos un adaptador del tipo horquilla (_hairpin_ en inglés), el cual no es más que un trozo de cable de pequeño grosor (al rededor de 1mm) colocado en forma de U invertida cortocircuitando los elementos del dipolo. Esto añade una inductancia a la antena, compensado los efectos capacitivos de la yagi y mejorando su ROE hasta alcanzar valores inferiores a 2.


Las medidas son las siguientes:

| Medida    | mm|
| --------- | :-----------: |
| Long. Reflector   | 1051 |
| Long. Dipolo (cada pata) | 490 |
| Long. Director    | 892 |
| Dist. Reflectos-Dipolo | 203 |
| Dist. Dipolo-Director | 318 |

Imagen con medidas en pulgadas:

![](/blog/2020-01-08/1.png)

Como mástil usaremos cualquier palo o barra de material no metálico y ligero, para que sea más sencillo seguir la ISS manualmente. Los elementos transversales se pueden fijar con cinta, precinto, cola de silicona, grapas o cualquier otro sistema que asegure su correcta fijación.

Una vez conformada la estructura de la antena, debemos soldar el cable coaxial al dipolo. Simplemente soldaremos el conector SMA en uno de sis extremos, y pelaremos el otro para conectar cada extremo a una pata del dipolo. Aunque sea sencillo soldar en la cinta métrica, conviene lijarla antes de realizar la soldadura y reforzar la unión con cinta aislante.

Por último, debemos conectar el adaptardor de impedancias. Para ello, tomamos el cable correspondiente y lo recortamos a una longitud de aproximadamente 12cm. Soldamos cada extremo a una pata del dipolo en el mismo lugar en que conectamos el dipolo y el coaxial. Es importante que este cable mantena la forma de U indicada en la figura, ya que otras formas pueden hacer variar su inductancia/capacitancia y provocar efectos no deseados (aumento de la ROE). Lo fijaremos con cinta al mástil.

Este debe ser el resultado final una vez fijados todos los elementos y soldado los correspondientes cables:

![](/blog/2020-01-08/2.jpg)



#### Montaje del sistema completo:

Una vez tenemos una antena en condiciones, simplemente conectaremos el coaxial a la entrada de nuestro SDR y éste a nuestro ordenador.

Podemos probar la antena intentando captar tanto emisoras de radiodifusión (se deben poder recibir aún encontrándose fuera del ancho de banda de la antena) como emisiones de radioaficionados. Cabe destacar que, aunque nos estemos centrando en recibir a la ISS, esta antena se puede utilizar con cualquier satélite en banda de radioaficionados.

En nuestro caso, así fue como quedó el sistema final completo:

![](/blog/2020-01-08/3.jpg)


## Software

El software necesario para la recepción de SSTV es muy sencillo. En nuestro caso, y ya que estamos en Windows, usaremos SDRSharp para la demodulación de la señal (12.7KHz de ancho de banda, modulación NarrowFM) y redirigiremos la salida de audio correspondiente a la señal ya demodulada a la entrada del descodificador de SSTV, que será RX-SSTV. En este último programa, seleccionaremos como modo de recepción el PD-120. No es necesario pulsar el botón de RX, la captura comenzará automáticamente en cuanto se detecte una imagen.

Durante la recepción, el espectro de la señal deberá tener la siguiente forma:

![](/blog/2020-01-08/4.jpg)

Y la imagen se irá viendo según se recibe en el RX-SSTV:

![](/blog/2020-01-08/5.png)

Opcionalmente y con el fin de mejorar la calidad de la imagen final, es recomendable conectar un programa de tracking de satélites (Orbitron en nuestro caso, pero se pueden usar otros como GPredict) para automatizar la corrección del efecto Doppler:

![](/blog/2020-01-08/6.jpg)



## Resultados

Estas son las imágenes recibidas durante los pasos que conseguimos captar:

#### Imágenes guapas

![](/blog/2020-01-08/7.jpg)
Imagen 1/15

![](/blog/2020-01-08/8.jpg)
Imagen 3/15


![](/blog/2020-01-08/9.jpg)
Imagen 8/15


![](/blog/2020-01-08/10.jpg)
Imagen 11/15


![](/blog/2020-01-08/11.jpg)
Imagen 12/15


![](/blog/2020-01-08/12.jpg)
Imagen 12/15 (mejor calidad)




#### Imágenes incompletas (AOS o LOS durante la trnasmisión)


![](/blog/2020-01-08/13.jpg)


![](/blog/2020-01-08/14.jpg)


![](/blog/2020-01-08/15.jpg)


![](/blog/2020-01-08/16.jpg)


![](/blog/2020-01-08/17.jpg)




#### Pruebas de recepción indoor (a través de paredes)

![](/blog/2020-01-08/18.jpg)


![](/blog/2020-01-08/19.jpg)


![](/blog/2020-01-08/20.jpg)


#### Certificado conmemorativo

![](/blog/2020-01-08/21.jpg)



## Conclusión

El rendimiento de la antena casera superó con creces las expectativas, permitiendo recibir datos con elevaciones de tan solo 1º y alcanzando valores de SNR superiores a los 50dB. Esto demuestra que cualquier aficionado con materiales caseros puede construirse el equipamiento necesario para comunicarse por radio con la Estación Espacial Internacional.

Esperamos que para el próximo evento de ARISS podamos disponer de nuestras instalaciones para así involucrar a una mayor cantidad de socio en la recepción de estas imágenes.

![](/blog/2020-01-08/22.jpg)



_mamado@EA4HFV_
