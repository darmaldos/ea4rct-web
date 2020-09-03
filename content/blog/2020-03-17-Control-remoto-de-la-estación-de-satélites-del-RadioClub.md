---
layout:  post
author: Pablo Álvarez
published: true
title: "Control remoto de la estación de satélites del RadioClub E.I.T."
date: 2020-03-17  # La fecha va con la forma YYYY-MM-DD
tags: [
  proyectos,
  antenas,
  satélites,
  SDR
]
categorias: [
  proyectos,
  SDR
]
image: /blog/2020-03-17/6.jpg
---

# Control remoto de la estación de satélites del RadioClub E.I.T.

Este último mes en el RadioClub estuvimos trabajando en conseguir controlar parte de nuestros equipos a través de internet, para poder hacer uso de ellos sin necesidad de encontrarse físicamente en el Club. En un principio, la idea era automatizar la estación de satélites de cara al proyecto propuesto para este año (una [estación automatizada para satélites meteorológicos en VHF](https://ea4rct.org/blog/2020-02-03-propuesta-automatizacion-noaa/)). Sin embargo, debido al cierre de las universidades que estamos viviendo, este proyecto se ha vuelto imprescindible de cara a poder seguir disfrutando de la radiafición mediante satélites sin salir de casa.


## Configuración del sistema

Actualmente, contamos con dos dispositivos conectados a Internet: el rotor de la estación de satélites y el SDR (un Airspy HF+ Discovery conectado a la antena de VHF de la estación).

#### Rotor

Para conectar el rotor de las antenas (un Yaesu G-5500 analógico), el primer paso es conseguir controlarlo desde un ordenador. Para ello, utilizaremos el controlador que diseñamos [a comienzos de curso](https://ea4rct.org/blog/2019-11-26-tracking-satelites-rotores-arduino/). 

Una vez comos capaces de mover las antenas a través de comandos serie, instalamos en nuestro servidor la librería [Hamlib](http://hamlib.sourceforge.net/manuals/1.2.15/index.html). Ésta cuenta con multitud de utilidades para controlar tanto radios como rotores por USB o puerto serie. 

En nuestro caso, utilizaremos la herramienta *rotctld*, la cual nos permite crear un servidor que recibe comandos a través de la red y con ellos controlar el rotor. Es compatible con multitud de protocolos, pero en nuestro caso utilizaremos Easycomm II, ya que nuestro programa de Arduino fue diseñado para trabajar con él. 

Una vez ejecutemos el comando *rotctld*, ya podremos configurar el rotor desde GPredict. Para ello, añadiremos un nuevo rotor desde el apartado Edit -> Preferences -> Interfaces -> Rotators

![](/blog/2020-03-17/1.jpg)

Tras esto, ya debería funcionar correctamente. 


#### SDR

Para conectar el SDR a internet y poder utilizarlo de forma remote, disponemos de dos opciones: hacerlo mediante rtl_tcp o desplegando un servidor spyserver. Optamos por la segunda opción, ya que ésta no es más que una optimización de la primera que requiere de menos ancho de banda para funcionar corectamente y ofrece un mayor número de opciones de personalización. La instalación es muy sencilla, existen multitud de [tutoriales](https://www.rtl-sdr.com/rtl-sdr-tutorial-setting-up-and-using-the-spyserver-remote-streaming-server-with-an-rtl-sdr/) disponibles online. 

Una vez instalado, editamos el archivo spyserver.config según nuestros gustos (añadida descripción y coordenadas, fijado número máximo de clientes, bajado el número de fps de la fft, etc.). Para comprobar que funciona correctamente, podemos acceder a la web de [Airspy](https://airspy.com/directory/#), y comprobar que aparece nuestro SDR en el mapa.

![](/blog/2020-03-17/2.jpg)


## Pruebas realizadas. 

Lo primero que hicimos fue intentar acceder tanto al SDR como al rotor desde la propia red local. Una vez comprobamos que todo funcionaba correctamente, abrimos los puertos correspondientes (5555 y 4533) para poder acceder a ellos de forma remota a través de Internet.

Tras ajustar algunos detalles y corregir ciertos errores, esta mañana conseguimos trackear y recibir un paso del Meteor M2 y otro del NOAA 18 a distancia:


![](/blog/2020-03-17/3.jpg)
Paso del NOAA 18

![](/blog/2020-03-17/4.jpg)
Paso del Meteor M2


Estos fueron los resultados obtenidos:

![](/blog/2020-03-17/5.jpg)
Imaxen do NOAA 18

![](/blog/2020-03-17/6.jpg)
Imaxen do Meteor M2


## Automatización.

Actualmente estamos intentando automatizar el proceso de recepción de este tipo de satélites. Por el momento, utilizamos software compatible con Windows (Orbitron + SDR# para el SDR, GPredict para el rotor y WXtoImg para la decidificación), pero esperamos tener un cliente automatizado funcional basado en linux próximamente.

Tras 24h funcionando ininterrumpidamente tanto el rotor como el SDR, estas son algunas de las imágenes captadas:

![](/blog/2020-03-17/7.jpg)

![](/blog/2020-03-17/8.jpg)

![](/blog/2020-03-17/9.jpg)

![](/blog/2020-03-17/10.jpg)

![](/blog/2020-03-17/11.jpg)

![](/blog/2020-03-17/12.jpg)



## Conclusión.

El hecho de poder trabajar con nuestra estación de forma remota nos ofrece mucha versatilidad a la hora de realizar comunicaciones satelitales, ya que, de no ser por ello, y al encontrarse la universidad cerrada indefinidamente, nos sería imposible hacer uso de cualquiera de nuestros equipos durante un largo periodo de tiempo. 

Además, gracias a ello podemos trabajar en la automatización de la recepción de satélites meteorológicos, avanzando así en el proyecto propuesto para este curso.

*~mamado@ea4rct*
