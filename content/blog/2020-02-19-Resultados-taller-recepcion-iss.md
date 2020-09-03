---
layout: post
published: true
title: "Resultados del taller de recepción de la ISS mediante SSTV"
date: 2020-02-19  # La fecha va con la forma YYYY-MM-DD
tags: [
  "proyectos",
  "FAX",
  "HF",
  "SDR",
  "ISS",
  "sstv"
]
categorias: [
  "Actividades",
  "Radioafición",
  "Sstv"
]
author: Pablo Álvarez
image: /blog/2020-02-19/6.jpg
---

El 30 y 31 de enero organizamos un taller abierto en el RadioClub en el que enseñamos a los asistentes los principios de la comunicación por SSTV, el uso de SDR y el tracking de satélites LEO para poder recibir las imágenes emitidas por la ISS de forma no profesional.

En esta entrada resumiremos tanto lo explicado durante el taller como la experiencia de los asistentes

## Recepción de la ISS

#### Hardware

El material que necesitaremos para una recepción básica de la ISS será:

- **SDR**. Sirve cualquier modelo, incluso los receptores de TV para PC. (15€)
- **Antena** Como la diseñada en la [anterior entrada de nuestra web](https://radio.clubs.etsit.upm.es/blog/2020-01-08-recepcion-iss-sstv/) (7€)
- **Alargador USB** (5€)

En total este proyecto se puede realizar con menos de 30€ de presupuesto, lo que lo hace ideal para iniciarse en las comunicaciones satelitales y la radioafición.

#### Software

Los principales programas necesarios para la realización del proyecto son:

- **Programa de tracking de satélites**. Debe ser capaz de conectarse con el software controlador del SDR para realizar la compensación del efecto Doppler. En nuestro taller utilizamoos [Orbitron](http://www.stoff.pl/downloads.php) para Windows, pero existen alternativas compatibles tanto con Windows como con Linux como [GPredict](http://gpredict.oz9aec.net/download.php).

- **Receptor de SDR**. Prácticamente cualquier programa capaz de demodular una señal FM proveniente de un SDR valdría. En el taller se usó [SDR#](https://airspy.com/download) (para Windows), pero, de nuevo, es posible utilizar [gqrx](http://gqrx.dk/download) en linux (es open source).

- **Tubería de audio**. Conectará la salida del audio demodulado del programa controlador del SDR al descodificador de SSTV. De nuevo, cualquier programa genérico sirve. En nuestro caso, hicimos uso de [VBCable](https://www.vb-audio.com/Cable/) (Windows).

- **Descodificador de SSTV**. Para Windows, se puede utilizar [RX-SSTV](http://users.belgacom.net/hamradio/rxsstv.htm), capaz de detectar automaticamente el formato de codificación SSTV y con función de autoguardado de imágenes. Existen alternativas como [MMSSTV](https://hamsoft.ca/pages/mmsstv.php), compatible tanto con Windows como ocn Linux.

Existen multitud de tutoriales en internet sobre cómo configurar correctamente estos programas. Ya que no tiene una gran dificultad, no lo detallaremos en esta entrada.

## Resultados del taller

El taller se organizó el dos días (jueves y viernes). El primero se recibió la señal mediante la antena de VHF de la que disponemos en el RadioClub (parte de la estación de satélites motorizada con la que contamos), mientras que el segudo día se utilizó una antena Yagi de cinta métrica, idéntica a la ya mostrada en entradas anteriores de nuestro blog. Si bien los resultados fueron mucho mejores cuando utilizamos la estación de satélites, en ambos casos el taller discurrió de forma satisfactoria y los asistentes se llevaron una idea clara del funcionamiento de SSTV y del uso de SDR.

Estas son algunas de las fotografías recibidas:

Y estos somos nosotros durante la realización del taller:

## Conclusión

A pesar de la poca antelación con la que ARISS avisa de las emisiones de SSTV, fuimos capaces de organizar un taller al que acudió una veintena de personas, y donde se impartieron de forma clasa y sencilla los principios de este tipo de comunicaciones y los pasos a seguir para recibir y descodificar las señales provenientes de la ISS.

## Fotillos de la actividad desarrollada en los dos dias

![](/blog/2020-02-19/1.jpg)

![](/blog/2020-02-19/2.jpg)

![](/blog/2020-02-19/3.jpg)

![](/blog/2020-02-19/4.jpg)

![](/blog/2020-02-19/5.jpg)

![](/blog/2020-02-19/6.jpg)

![](/blog/2020-02-19/7.jpg)

![](/blog/2020-02-19/8.jpg)

![](/blog/2020-02-19/9.jpg)

![](/blog/2020-02-19/10.jpg)

![](/blog/2020-02-19/11.jpg)

![](/blog/2020-02-19/12.jpg)

![](/blog/2020-02-19/13.jpeg)

![](/blog/2020-02-19/14.jpeg)

*~mamado@EA4HFV*
