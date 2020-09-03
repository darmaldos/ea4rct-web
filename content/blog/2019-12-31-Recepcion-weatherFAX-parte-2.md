---
layout: post
published: true
title: "Recepción de WeatherFAX mediante SDR - Parte 2: Mejoras y resultados finales"
date: 2019-12-31  # La fecha va con la forma YYYY-MM-DD
tags: [
  "Proyectos",
  "FAX",
  "HF",
  "SDR",
  "WeatherFAX",
  "WeFAX",
  "RTL SDR",
  "Airspy HF+ discovery"
]
categorias: [
  "Proyecto",
  "Radioafición"
]
author: Pablo Álvarez
image: /blog/2019-12-31/13.jpg
---

Hace menos de un mes publicamos una entrada en la web acerca de la recepción de FAX meteorológicos con un SDR Airspy HF+ discovery y una antena de HF. Viendo el éxito obtenido a la hora de recibir nuestros primeros WeFAX, decidimos probar distintas configuraciones con el finde optimizar la recepción de las imágenes.

## Mejoras realizadas

### Cambio de estación emisora

En primer lugar, optamos por centrarnos en recibir las señales provenientes de la estación de Pinneberg (cercano a Hamburgo, Alemania) frente a las que estábamos recibiendo originadas en Northwood (cercano a Londres, Inglaterra). Si bien ambas estaciones emiten en frecuencias muy similares (7880KHz Pinneberg y 8040KHz Northwood), la estación alemana lo hace con el doble de potencia (20kW frente a 10kW), por lo que, realizando los cálculos correspondientes, obtenemos que, de forma teórica, recibiremos más potencia a pesar del aumento de distancia (1800Km vs 1300Km).


![](/blog/2019-12-31/1.jpg)

Para realizar el cambio basta orientar la antena en la nueva dirección y sintonizar la frecuencia correspondiente. Cabe destacar que distintas estaciones tienen horarios diferentes, por lo que es necesario informarse de las horas a las que la nueva estación se encontrará emitiendo.

### Modo de reducción de ruido

También optamos por probar la opción de reducción de ruido incluida en el programa FLDigi, la cual, si bien no hace milagros, ayudó en la recepción de ciertas imágenes donde por fading e interferencias la SNR disminuía ligeramente.

![](/blog/2019-12-31/2.png)


### Sustitución del SDR por una emisora analógica


Si bien el rendimiendo del SDR era suficientemente bueno para lo que buscábamos, tenemos pensado darle nuevos usos, por lo que necesitamos un sustituto a la hora de recibir estas imágenes.

Probamos a sustituir el SDR por la radio HF de la que disponemos en el RadioClub: una Kenwood TS-870.  Para ello, conectamos físicamente la salida de audio secundaria de la radio (situada en el panel trasero) con la entrada de línea (o micrófono en su ausencia) del ordenador. Para indicarle a FLDigi que debe tomar como entrada de audio la salida de la radio, basta seleccionar esta opción dentro del menú Configure > Sound Card:

![](/blog/2019-12-31/3.png)


## Resultados

Tras estas mejoras conseguimos obtener imágenes de mucha mayor calidad, como las que se muestran a continuación:

### Presión y viento

![](/blog/2019-12-31/4.jpg)

### Polo Norte

![](/blog/2019-12-31/5.jpg)

### Humedad en el Polo

![](/blog/2019-12-31/6.jpg)

### Mapa de presiones en Europa

![](/blog/2019-12-31/7.jpg)

### Mapa de tormentas

![](/blog/2019-12-31/8.jpg)


### Viento en el Atlántico norte

![](/blog/2019-12-31/9.jpg)

### Temperatura marítima en el Mar del Norte

![](/blog/2019-12-31/10.jpg)

### Temperatura en el océano

![](/blog/2019-12-31/11.jpg)

### Mapa de hielo

![](/blog/2019-12-31/12.jpg)

### Hielo e icebergs en Groenlandia

![](/blog/2019-12-31/13.jpg)

### Horario de transmisión de FAX

![](/blog/2019-12-31/14.jpg)


## Conclusión

Gracias a la alta potencia a la que se emiten los WeFAX y la directividad de la antena de HF con la que contamos en el radioclub, nos es posible recibir partes meteorológicos por fax de buena calidad con facilidad. No descartamos automatizar la recepción y publicación de estas imágenes como proyecto futuro.


_mamado@EA4HFV_
