---
layout: post
published: true
title: "Propuesta de proyecto: Recepción de telemetría del satélite NOAA 19"
date: 2019-01-31
author: "Fran Acién"
tags: [
  "Radioafición",
  "Propuesta",
  "NOAA 19"
]
categorias: [
  "Radioafición"
]
---

Para este nuevo cuatrimestre se va a intentar hacer 2 proyectos relacionados con radio: La recepción de las ondas de Júpiter (por Marta Donate), y la recepción de telemetría del satélite NOAA 19. Este artículo será un repaso de algunos conceptos importantes de cara a realizar este proyecto. Con lo que, **si alguien está interesado en ayudar tendrá que leer y comprender los siguiente puntos**. Empezamos.

> Algunas de las cosas que se van a explicar, y otras tantas, están en el post de [Diapositivas de "Introducción a la Radioafición y a la recepción de telemetría de satélites de radioaficonado"](/blog/2018-8-8-diapositivas-charla-radio/). Por lo que se recomienda que se le heche un vistazo antes de esto.


**Objetivo**

Sencillo. Recibir la información meteorológica que envia un satélite llamado NOAA 19 desde el espacio (órbita baja).

[Un ejemplo de lo que queremos hacer](https://www.youtube.com/watch?v=OARj5wguj6M&t=826s)

**¿Cómo?**

Necesitaremos de una antena con algo de directividad, un receptor de radio (posiblemente un SDR), tener claro por donde está el satélite, recibir la señal, decodificarla, y... vualá, tenemos una imagen desde el espacio.

**¿Por qué mola?**

¡Porque estamos recibiendo una imagen en *tiempo real* desde el espacio!

## Vocabulario

* **Telemetría**. Información que **baja desde** el satélite.

* **Telecomando**. Comando que **sube hacia** el satélite.

* **Transpondedor**. Emisor/Receptor que está en un satélite. En un satélite, cada transpondedor se utiliza para una cosa distinta, por ejemplo uno para emitir imagenes, otra para emitir telemetría, otra para recibir telecomandos, etc.

## NOAA 19

El NOAA 19 es un satélite meteorológico lanzado por la NASA en 2009 que tiene  **5 transpondedores**.

El que a nosotros nos interesa es el **emisor de SSTV** que está en 137.100 MHZ. Pues este transpondedore está emitiendo imagenes en SSTV.

## ¿Qué es el SSTV?

El SSTV es la Televisión de barrido lento. Un método para transmitir imágenes por radio. A cada tono se le asigna un color, y va transmitiendo pixel a pixel el color que tiene. [Un ejemplo](https://es.wikipedia.org/wiki/Archivo:SSTV_sunset_audio.ogg).

Normalmente hay unas frecuencias para SSTV en todas las bandas de radioaficionado. Uno de los más usados es en 144.500 Mhz

## ¿Dónde está el satélite?

Este satélite dará algunos pases (de 3 a 4) por el cielo de Madrid durante un día. **Un pase** es cuando un satélite entra por un horizonte y sale por el otro, esto suele durar desde 5 minutos (si tiene muy poca elevación) o 15 minutos (si tiene mucha elevación).

Para tener una buena **recepción de la información** lo importante es que tenga mucha elevanción, contra más cerca de 90º mejor. Esto es, que estará justo justo encima de nosotros. Justo cuando está entrando en el horizonte, cuando el satélite tiene poca elevación, habrá mucha atenuación debido a las interferencias. Notaremos que la señal tendrá más calidad conforme tenga más elevación.

Para saber dónde está el satélite vamos a utilizar los llamados TLE's. Un **TLE** es una ecuación que describe la trayectoria del satélite. En la página de [celestrak](https://celestrak.com/) está la mayoría de los TLE's.

**Cuidado con esto, porque los TLE's tiene caducidad. Cada semana hay que actualizarlos con celestrak porque pierden precisión**

Una vez se tiene el TLE hay que **propagar** la trayectoria del satélite. Le vas dando valores a la *ecuación matemática* para saber su posición, por ejemplo dentro de 4 días 3 horas 2 minutos y 3 segundos.

Para encontrar el TLE de nuestro satélite, el NOAA 19, vamos [aquí][1]. En este momento, tiene el siguiente TLE:

```
NOAA 19 [+]             
1 33591U 09005A   19028.56922739  .00000030  00000-0  41282-4 0  9992
2 33591  99.1683  16.3632 0014795  56.4507 303.8075 14.12331295513997
```

Para propagar la ecuación se puede hacer de muchas formas. Por ejemplo [este paquete de node][2] sirve para propagar la ecuación. En cualquier lenguaje hay un paquete para hacer esto, o sino puedes hacerlo tu mismo (aunque mejor coge un paquete).

En la práctica, en vez de mancharnos tanto las manos, utilizaremos el programa **Gpredrict**. Es uno de los programas más usados para este tipo de tareas. **Gpredict** es un trackeador de satélites, donde tiene dentro todos los TLE's y puedes ver en tiempo real por donde va cada uno.

![Imagen del programa](/blog/2019-01-28/gpredict.png)

Para saber los próximos pases de nuestro satélite le damos a ver su información y en pasadas futuras. Cómo he dicho antes, nos fijaremos en un pase que tenga mucha elevación. Por ejemplo, voy a coger uno con 52º:

![Próximos pases](/blog/2019-01-28/proximos_pases.png)
![Diagrama](/blog/2019-01-28/polar.png)

El **diagrama polar** describe hacia dónde deberías de dirigir las antenas para recibir la telemetría del satélite. Con estos datos, y sincronizados con un reloj seríamos capaces de recibir la imagen del NOAA.

**En una misión real** se coge un TLE y se desarrolla un software para que propage el TLE, y cuando haga un pase, se comunica con los rotores de antenas y las mueve automáticamente.

> En en club de radio tenemos rotores de antenas, aunque creo que están un poco rotos >.< En GranaSAT, el lab con el que me llevo bien de Granada, si que tenemos todo puesto a punto para que el ordenador se comunique por serie con la radio y con el control de rotores, y justo cuando pasa un satélite hace el pase de forma automática.

En nuestro experimento **no utilizaremos rotores**, sino moveremos las antenas de forma manual. Puede parece una chapuza pero... ... ... bueno, sí, es una chapuza. Pero ahora los rotores de antenas e incluso las antenas no están listas para hacer esto -.-

## La antena

Cómo hemos dicho antes, el satélite NOAA 19 emite SSTV en 137.100 MHZ. Con lo que **necesitaremos una antena para estas frecuencias**. Además, al ser una señal que viene desde tan lejos y con poca potencia, necesitaremos poder recibir la máxima señal, esto es, que necesitaremos una antena con **mucha directividad**.

Cada antena tiene unas propiedades distintas que dependen de sus dimensiones, y su geometría. La frecuencia de trabajo de una antena está relacionada con la longitud de la antena.

Resumiendo, necesitamos una antena con las siguientes características:

1. Que trabaje con 137.100 MHz
2. Que sea directiva

Juán nos dibujó hace tiempo algunas antenas con sus diferentes características. Para que veais algunos ejemplos:

![Ejemplos de antenas](/blog/2018-08-08/antenas-sats.jpg)

La idea inicial es que elijamos una antena y la construyamos en una sesión de bricolaje (no es dificil).

## El receptor de radio

Es importante que nuestro receptor de radio tenga las características correctas para nuestra misión. Necesitaremos tener un receptor de radio que trabaje en nuestra banda de frecuencias y que tenga el ancho de banda correcto.

* Cómo hemos dicho antes, **recibiremos la señal de SSTV en torno a 137.100 MHz**, ya que por el efecto doppler (el satélite va a toda ostia) la frecuencia se modificará un poco.

* SSTV normalmente sólo utiliza un máximo de 3 kHz de ancho de banda.

En el radio tenemos un receptor de radio especializado en satélites, la ICOM 9500, que es una radio muy buena que nos donó alguien de aeronautica. Pero... **tiene un problema**, ICOM 9500 no puede recibir frecuencias de 137.100 MHZ porque está **cerrada en banda**.

Cuando una radio está **cerrada en banda** quiere decir que no puede acceder a bandas que no son de radioaficionado. **¿Por qué?**, para no meternos en lios. De hecho, si la policia te pilla con una radio **abierta en banda** te puede multar. Una radio abierta en banda es peligrosa porque tienes la libertad de meter ruido a la banda de la policia, de los aviones, etc.

En cambio, tenemos otro "receptor" de radio. **Un SDR de Funcube**.

## ¿Qué es un SDR?

Los SDR son super útiles para hacer radio y otras muchísimas cosas, y cuestan muuuuy poco dinero. Es por esto que en los últimos años están super de moda.

![SDR](/blog/2019-01-28/sdr.jpg)

La historia de los SDR's es graciosa. Porque en realidad son aparatos que estaban diseñados como TDT para el ordenador. Pero cuando alguien descubrión que si hackeabas el software se podía utilizar como receptor de radio, pues revolucionó el mundo de la radioafición. Además, son cacharros capaces de recibir un margen de frecuencias super grande (150KHz a 250Mhz y 410Mhz a 1900Mhz). Y todo esto por menos de 5€ (los más baratos).

Los SDR son super útiles porque se ve en la pantalla un waterfall de la banda de frecuencias en la que estás. En una radio convencional tendriamos que movernos frecuancia a frecuencia para ver si están emitiendo. Pero en un SDR vemos de forma visual en qué frecuencias está emitiendo. Esto se hace porque va cogiendo "cachitos" de todas las frecuencias y ve donde se está recibiendo más potencia.

![Web SDR](/blog/2019-01-28/web-sdr.gif)

Para utilizar un SDR se puede hacer de muchas formas, incluso en páginas web dejan utilizar SDR's **los webSDR's**. Pero nosotros **vamos a utilizar el programa Gqrx**. Es un programa de software libre para poder utilizar los SDR's.

[Gqrx](http://gqrx.dk/)

![gqrx](/blog/2019-01-28/gqrx.jpg)

Y con todo eso deberiamos de poder recibir la señal del NOAA 19.

## Resumen

Los pasos del proyecto serían:

1. Buscar una antena que cumpla nuestras especificaciones.
2. Construir la antena.
3. Probarla con un SDR (por ejemplo).
4. Ver cuando sería el próximo pase del NOAA 19 con una elevación aceptable.
5. Preparar todo para la recepción. Antenas en la dirección correcta, la frecuencia correcta (cuidado con el efecto doppler), el **Gqrx** a punto, sincronizados con un reloj y brujula en mano.
6. Con la recepción grabada, tendriamos que decodificar el **SSTV** y nos debería de dar la imagen que queremos.

**Si te quieres unir al proyecto, háblame y te tendré en cuenta. Por lo pronto habrá una sesión para pensar que antena vamos a construir, y luego construirla.**

## Referencias

https://db.satnogs.org/satellite/33591/

https://en.wikipedia.org/wiki/NOAA-19

[1]: https://celestrak.com/NORAD/elements/noaa.txt
[2]: https://github.com/shashwatak/satellite-js
