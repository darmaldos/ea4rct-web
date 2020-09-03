---
layout: post
published: true
title: Recepción de WeatherFAX mediante SDR
date: 2019-12-09  # La fecha va con la forma YYYY-MM-DD
tags: [
  "proyectos",
  "fax",
  "hf",
  "sdr",
  "radio",
  "radioafición"
]
categorias: [
  "Proyecto",
  "Radioafición"
]
author: Pablo Álvarez
image: /blog/2019-12-09/2.jpg
---

A raíz de las rebajas del pasado viernes, y con vista a futuros proyectos relacionados con comunicaciones satelitales en banda VHF, decidimos adquirir desde el radioclub un SDR Airspy HF+ Discovery. Dicha radio es capaz de recibir señales desde ULF (500Hz) hasta VHF (260MHz).

Ya que con el anterior SDR con el que contábamos no podíamos explotar la banda de HF (sólo subría hasta los 26MHz), decidimos realizar un pequeño proyecto de prueba del Airspy que cubriera esta zona de frecuencias. Es por ello que elegimos probar a recibir señales de WeatherFAX.

El WeatherFAX consiste en un parte meteorológico enviado mediante una señal de fax. Su principal destinatario son embarcaciones pesqueras o mercantes sitiadas en alta mar o realizando trayectos transoceánicos. Como su alcance debe ser prácticamente global (se emite en unas pocas estaciones costeras y se recibe desde el otro extremo del planeta), esta señal se transmite en HF (generalmente en las bandas de 20m y 40m) y utiliza propagación mediante ondas de tierra. En Europa, las principales estaciones costeras que emiten WeFAX son
la de Hamburgo (Alemania) y la de Northwood (Inglaterra). En nuestro caso, nos centramos en recibirelos fax de la estación inglesa por proximidad. Usaremos la antena de HF Yagi A3S de la que disponemos en el RadioClub.


## Software utilizado

En nuestro caso, y ya que sólo se trataba de una prueba puntual, el software utilizado fue:

+ SDRsharp (Control del SDR)

+ VCable (tubería de audio)

+ FLdigi (decodificación del weatherfax)


## Configuración


Debido a las opciones de automatización que incluye por defecto FLdigi, resulta extremadamente sencillo configurar la estación receptora para que guarde los fax recibidos en archivos .png de forma automática según se reciben.

En primer lugar, se configura el SDR. Para ello, basta abrir el programa SDRSharp y seleccionar la frecuencia a la que emite la estación costera. Cabe destacar que el tipo de modulación es USB (BLS), así que a la frecuencia anunciada por la estación debemos restarle 1,9KHz. Además, los WeatherFAX no se emiten de forma continua, sino que existen cietos horarios de emisión asociados a cada estación. Se pueden consultar desde el siguiente [enlace](https://www.google.com/url?sa=t&source=web&rct=j&url=https://www.nws.noaa.gov/os/marine/rfax.pdf&ved=2ahUKEwiR9Oahv6jmAhWP2BQKHZg-ByUQFjAAegQIARAC&usg=AOvVaw3fdJ9rrQb4-ctYOJyKXv5C). Es importante seleccionar como salida de audio de SDRsharp el puerto virtual VCable Input, para que FLdigi pueda recibir la señal. Se recomienda también subir el volumen de salida al máximo.

Una vez configurado el SDR, abrimos FLdigi. En la pestaña _Op Mode_, seleccionamos _WEFAX-IOC576_. Desactivamos la opción de la esquina inferior derecha señalada como AFC y esperamos a recibir una señal de wefax. Una vez se esté recibiendo esa señal, se verán una o dos líneas amarillas (o rojas, si la señal es fuerte) en la cascada. Movemos las tres líneas rojas verticales a modo de cursor de forma que la línea de la derecha coimcida con el centro de la cascada amarilla derecha (la más amplia). Esto indica a FLdigi en qué zona del espectro se ecuentra la señal transmitida en USB para demodularla. Tras ello, se empezará a ver la imagen recibida en la parte superior de la pantalla.

En caso de que la imagen se encuentre torcida o descentrada, simplemente debemos jugar con los ajustes _align_ y _slant_ hasta corregir que se mire como queremos.

Un ejemplo de los ajustes utilizados se puede ver en la siguiente captura de pantalla:

![](/blog/2019-12-09/1.png)




## Resultados obtenidos

Las siguientes imágenes fueron recibidas durante los días 7, 8 y 9 de diciembre, procedentes de la estación de Northwood:


**Niveles de hielo** ![Niveles de hielo](/blog/2019-12-09/2.jpg)


**Mapa de vientos** ![Mapa de vientos](/blog/2019-12-09/3.jpg)



**Mapa de vientos** ![Mapa de vientos](/blog/2019-12-09/3.jpg)



**Mapa de vientos** ![Mapa de vientos](/blog/2019-12-09/4.jpg)
