---
layout: post
published: true
title: Automatización recepción de satélites meteorológicos en remoto desde Linux
date: 2020-04-18  # La fecha va con la forma YYYY-MM-DD
tags: [
  "proyectos",
  "antenas",
  "satélites",
  "SDR"
]
categorias: [
  "proyectos",
  "SDR",
  "WX Ground Station"
]
image: /blog/2020-04-18/3.jpg
---


Este post forma parte del proyecto [Estación automática para la recepción de satélites meteorológicos en VHF](https://radio.clubs.etsit.upm.es/blog/2020-02-03-propuesta-automatizacion-noaa/). Parte del proyecto consiste en automatizar la recepción de satélites en Linux, en este post te explicaremos como lo hemos hecho.

El código del proyecto se encuentra en [Meteor-automated/wx-ground-station](https://github.com/WX-Ground-Station-RadioClub-E-I-T/wx-ground-station). En este artículo iremos explicando detalladamente paso por paso cómo funciona el programa.

## Objetivo

Por las circunstancias en las que estamos ahora no podemos estar presencialmente operando nuestra estación de satélites en el RadioClub EIT. En este momento tenemos la recepción automatizada para **NOAA** y **Meteor-M 2**, pero este post nos centraremos en el **NOAA**. Por este motivo hemos tenido que hacer la automatización de recepción de satélites en remoto usando [spyserver](https://airspy.com/quickstart/) y [rotctld](http://manpages.ubuntu.com/manpages/trusty/man8/rotctld.8.html) que ya explicamos en este [post](https://radio.clubs.etsit.upm.es/blog/2020-03-17-control-remoto-de-la-estaci%C3%B3n-de-sat%C3%A9lites-del-radioclub/).

El objetivo del proyecto consiste en recibir, demodular, decodificar y subir la información a la web de los satélites meteorológicos que pasan por el cielo de nuestra estación. En el RadioClub E.I.T contamos con unas antenas de VHF/UHF con rotores de Azimuth y Elevación que se pueden controlar por TCP usando [rotctld](http://manpages.ubuntu.com/manpages/trusty/man8/rotctld.8.html). Contamos con el SDR [Airspy hf+ discovery](https://airspy.com/airspy-hf-discovery/) conectado a la antena y que podemos controlar por remoto con [spyserver](https://airspy.com/quickstart/).


![](/blog/2020-04-18/1.jpg)

Esto nos hace que mover las antenas y controlar el SDR se haga conectandonos a un puerto TCP. Por este motivo, el proyecto se puede testear con cualquier SDR que utilice spyserver, aunque no estemos presencialmente, o no sea nuestro incluso. En este link podemos ver algunos SDR's que podemos [utilizar remotamente](https://airspy.com/directory/#).

![FOTO SPYSERVER](/blog/2020-04-18/2.jpg)

Utilizaremos GNU/Linux en todo el proceso porque es más amigable para automatizar cosas y porque haremos todo sin interfaz gráfica. Utilizaremos únicamente herramientas libres.

La automatización será de la siguiente forma:

* Cálculo de órbita del satélite.
* Cuando vaya a pasar el satélite nos tenemos que conectar a nuestra estación y empezar a grabar. Todo esto moviendo las antenas y corrigiendo el efecto doppler.
* Decodificar la señal
* Subir los datos a internet

## Cálculo de órbita

Incialmente tendremos que calcular cuándo va a pasar el satélite por nuestra estación. Para ello hemos utilizado la librería [orbit-predictor](https://github.com/satellogic/orbit-predictor) de Satellogic. Es una librería en python bastante fácil de usar.

Hemos creado un script en python que cálcula cúando va a pasar el satélite y nos da diferente información. Lo podreis encontrar [aquí](https://github.com/WX-Ground-Station-RadioClub-E-I-T/python-predict).

```
$ python predict.py --location 40.452591 -3.7286226 666 weather.tle
09:36 04/18/20 1587202574 68 944 16.28 188.26 NOAA_18-20200418-093613 28654 NOAA 18
10:02 04/18/20 1587204152 20 800 357.70 236.08 METEOR-M_2-20200418-100231 40069 METEOR-M 2
11:17 04/18/20 1587208655 18 794 357.21 241.12 NOAA_18-20200418-111734 28654 NOAA 18
15:58 04/18/20 1587225522 19 809 120.10 1.82 NOAA_19-20200418-155841 33591 NOAA 19
17:37 04/18/20 1587231461 65 948 172.71 343.15 NOAA_19-20200418-173740 33591 NOAA 19
18:06 04/18/20 1587233188 12 696 108.15 8.36 METEOR-M_2-20200418-180627 40069 METEOR-M 2
19:03 04/18/20 1587236627 66 906 172.54 343.90 NOAA_15-20200418-190346 25338 NOAA 15
19:23 04/18/20 1587237811 17 778 117.43 3.34 NOAA_18-20200418-192330 28654 NOAA 18
19:43 04/18/20 1587239034 86 924 163.24 347.90 METEOR-M_2-20200418-194353 40069 METEOR-M 2
20:47 04/18/20 1587242837 6 565 234.79 313.83 NOAA_15-20200418-204716 25338 NOAA 15
21:02 04/18/20 1587243736 70 936 170.78 344.10 NOAA_18-20200418-210215 28654 NOAA 18
21:26 04/18/20 1587245189 12 709 220.47 322.82 METEOR-M_2-20200418-212628 40069 METEOR-M 2
22:46 04/18/20 1587249989 8 617 231.42 315.96 NOAA_18-20200418-224628 28654 NOAA 18
```

Con esta información programaremos los comandos para conectarlos a la estación en la hora que va a comenzar el pase.

El script lo hemos intentado hacer como el programa [predict](https://www.qsl.net/kd2bd/predict.html). Hemos optado por crear nuestro propio script porque predict da cálculos de órbita muy erroneos :disappointed: .

Podeis ver cómo hemos integrado esto en nuestro programa para calcular la órbita y programar la recepción. El código de esta parte se encuentra [aquí](https://github.com/WX-Ground-Station-RadioClub-E-I-T/wx-ground-station/blob/master/schedule_all.sh).


## Grabación del pase

Cuando pasa un satélite tendremos que conectarnos al SDR, mover las antenas, corregir el efecto doppler, demodular y grabarlo en un fichero wav.

Todo esto lo haremos con diferentes programas que están en github.

Nosotros hemos hecho uso de diferentes programas conectandolos entre sí con los pipes de Linux. Peeeeero, estoy seguro de que se podría hacer de una forma más elegante utilizando **GNURadio**. Más adelante perfeccionaremos la técnica utilizando GNURadio, pero por ahora así es como lo tenemos y nos funciona *decentemente*.

### Conectarnos al SDR por TCP y grabar el IQ

El primer programa que usaremos será [spyserver_client](https://github.com/miweber67/spyserver_client), un cliente de spyserver por linea de comandos. Tendremos que especificar el host, puerto, samplerate, frecuencia y nos devolverá por la salida del programa el IQ recibido.

```
$ ss_client iq -r ${SERVER} -q ${PORT} -f ${FREQ} -s ${SAMPLERATE} >> test.iq
```

### Mover las antenas

Conforme está pasando el satélite tendremos que ir moviendo las antenas de forma precisa hacia donde está el satélite. Para hacer esto he escrito un programa en Rust usando la librería [libgpredict](https://github.com/cubehub/libgpredict).

El programa se puede encontrar [aquí](https://github.com/WX-Ground-Station-RadioClub-E-I-T/rotor). Tendremos que especificar el host, el puerto, el tle, el satélite y nos irá moviendo las antenas cuando la elevación sea positiva.

El programa hace un pipe de audio de la entrada a la salida, por lo que se podría utilizar al mismo tiempo que estamos recibiendo de la siguiente manera:

```
$ ss_client iq -r ${SERVER} -q ${PORT} -f ${FREQ} -s ${SAMPLERATE} |
rotor --tlefile ${TLE_FILE} --tlename "${SAT}" --location lat=${RX_LAT},lon=${RX_LON},alt=${RX_ALT} --server ${ROTCTLD_SERVER} --port ${ROTCTLD_PORT} > output.iq
```

### Corregir el efecto doppler

La velocidad del satélite nos irá modificando la señal del satélite y tendremos que ir corrigiendola. Para ello vamos a utilizar el programa [doppler](https://github.com/cubehub/doppler).

Le especificaremos el host, el puerto, el tle, la frecuancia, y el satélite. Y el programa nos irá corrigiendo la señal que le pasamos por stdin a stdout.

Prodriamos recibir, mover las antenas y corregir el doppler simultaneamente así:

```
$ ss_client iq -r ${SERVER} -q ${PORT} -f ${FREQ} -s ${SAMPLERATE} |
rotor --tlefile ${TLE_FILE} --tlename "${SAT}" --location lat=${RX_LAT},lon=${RX_LON},alt=${RX_ALT} --server ${ROTCTLD_SERVER} --port ${ROTCTLD_PORT} |
doppler track -s ${SAMPLERATE} -i i16 --tlefile ${TLE_FILE} --tlename "${SAT}" --location lat=${RX_LAT},lon=${RX_LON},alt=${RX_ALT} --frequency ${FREQ}
```

### Demodular la señal en FM para el caso del NOAA

Cuando recibimos los satélites meteorológicos NOAA tendremos que demodular en FM. Para ello vamos a utilizar la herramienta [demod](https://github.com/cubehub/demod).

En este programa le especificamos cómo es la señal de entrada, cómo queremos que nos demodule FM y nos lo dará la señal demodulada a la salida. Del mismo modo que los anteriores se puede utilizar un pipe poniendole la señal en crudo en stdin y nos la dará demodulada en stdout.

De esta forma podriamos recibir, mover las antenas, corregir el doppler y demodular FM así:

```
$ ss_client iq -r ${SERVER} -q ${PORT} -f ${FREQ} -s ${SAMPLERATE} |
rotor --tlefile ${TLE_FILE} --tlename "${SAT}" --location lat=${RX_LAT},lon=${RX_LON},alt=${RX_ALT} --server ${ROTCTLD_SERVER} --port ${ROTCTLD_PORT} |
doppler track -s ${SAMPLERATE} -i i16 --tlefile ${TLE_FILE} --tlename "${SAT}" --location lat=${RX_LAT},lon=${RX_LON},alt=${RX_ALT} --frequency ${FREQ} |
demod --samplerate ${SAMPLERATE} --intype i16 --outtype i16 --bandwidth ${BANDWIDTH} fm --deviation ${DEVIATION}
```

### Convertir el IQ a WAV

El comando anterior nos dará fichero en IQ. Lo último que tendriamos que hacer es convertirlo a WAV para luego decodificar la señal.

Para convertir de IQ a WAV usaremores **sox**. Una herramienta para convertir audio en Linux.

Por último, nuestro pipe recibirá, moverá las antenas, corregirá el doppler, demodulará la señal FM y nos escribirá el WAV así:

```
$ ss_client iq -r ${SERVER} -q ${PORT} -f ${FREQ} -s ${SAMPLERATE} |
rotor --tlefile ${TLE_FILE} --tlename "${SAT}" --location lat=${RX_LAT},lon=${RX_LON},alt=${RX_ALT} --server ${ROTCTLD_SERVER} --port ${ROTCTLD_PORT} |
doppler track -s ${SAMPLERATE} -i i16 --tlefile ${TLE_FILE} --tlename "${SAT}" --location lat=${RX_LAT},lon=${RX_LON},alt=${RX_ALT} --frequency ${FREQ} |
demod --samplerate ${SAMPLERATE} --intype i16 --outtype i16 --bandwidth ${BANDWIDTH} fm --deviation ${DEVIATION} |
sox -t raw -e signed-integer -r ${SAMPLERATE} -b 16 -c 1 -V1 - ${AUDIO_FILE} rate ${OUTPUTSAMPLERATE}
```


Todo lo explicado anteriormente se integra en nuestro programa en [este fichero](https://github.com/WX-Ground-Station-RadioClub-E-I-T/wx-ground-station/blob/master/receive_satellite.sh).

## Decodificación de la señal

En este post nos centraremos en decodificar las señales de NOAA en Linux.

Para ellos hemos utilizado la herramienta [wxtoimg](https://wxtoimgrestored.xyz/) que nos permite decodificar la señal del NOAA por línea de comandos.

La usaremos de la siguiente forma:

```
$ wxmap -T "${SAT}" -M ${MAX_ELEV} -H $TLE_FILE -b 0 -p 0 -l 0 -o $PassStart ${MAP_FILE}

$ wxtoimg -m ${MAP_FILE} -f ${SAMPLERATE} -e ZA $AUDIO_FILE ${IMAGE_DIR}/${FILEKEY}-ZA.png
```

La parte de decodificación la hemos integrado en nuestro proyecto en [este fichero](https://github.com/WX-Ground-Station-RadioClub-E-I-T/wx-ground-station/blob/master/decode_satellite.sh).

## Subir los resultados

Ya por último nos queda subir a la web nuestras recepciones. Esto no lo voy a explicar porque hay infinidad de formas. Nosotros hemos optado por subir un tweet usando [IFTTT](https://ifttt.com/), subir los datos a un FTP y meter alguna información en una base de datos MySQL.

De esta forma nuestro bot de twitter queda así de chulo:

![](/blog/2020-04-18/3.jpg)

Y también hemos creado una web para poder ver las diferentes recepciones y ver toda la información del pase. Estos días haremos un post explicando esta parte porque nos parece muy interesante. Se puede encontrar en <https://archive.ea4rct.org>

![](/blog/2020-04-18/4.gif)
