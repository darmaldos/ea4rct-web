---
layout: post
published: true
title: Estación Metereológica - Resumen Software creado hasta la fecha
date: 2020-08-05  # La fecha va con la forma YYYY-MM-DD
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
image: /blog/2020-09-05/1.png
---

Desde que [propusimos la creación de una estación meteorológica](2020-02-03-propuesta-automatizacion-noaa), a inicios de este curso académico 2019/2020, se han desarrollado muchas cosas que intentaremos resumir en este post. Nos centraremos solo en la parte software. Contaremos un poco el desarrollo del proyecto y pondremos las referencias a los repositorios con el código fuente de cada parte del proyecto.

La [propuesta del proyecto original]((2020-02-03-propuesta-automatizacion-noaa)) era el desarrollo de un sistema de telecomunicaciones automático para el seguimiento, recepción y descodificación de señales emitidas por satélites meteorológicos en VHF. Se incluyen las etapas de diseño, simulación, prueba y construcción de elementos básicos que conforman los sistemas de radiocomunicación, tales como antena, filtro, amplificador e inyector de DC.

Todos los repositorios de este proyecto se pueden encontrar en esta organización <https://git.radio.clubs.etsit.upm.es/Meteor-automated>

---

### AutomatedRotorTacker

Para la realización de este proyecto vamos a hacer uso de la estación de satélites que cuenta con Antenas Yagi UHF/VHF con dipolos cruzados con preamplificador y rotor. Pero aquí nos encontramos con el primer problema, la razón por la que hicimos [AutomatedRotorTacker](https://git.radio.clubs.etsit.upm.es/Meteor-automated/AutomatedRotorTacker). La interfaz de los rotores no cuenta con conexión serie al ordenador, con lo que **tuvimos que crear nuestra propia interfaz** para poder mover los rotores automáticamente. Esto nos lleva a la primera parte del proyecto, a la creación de [AutomatedRotorTacker](https://git.radio.clubs.etsit.upm.es/Meteor-automated/AutomatedRotorTacker).

El funcionamiento del programa lo explicamos en el siguiente post - [Automatización del tracking de satélites en rotores analógicos con Arduino](https://radio.clubs.etsit.upm.es/blog/2019-11-26-tracking-satelites-rotores-arduino/). Cojo algunos extractos del post original:

> La verdadera complejidad del proyecto consiste en la comunicación entre el software de tracking de satélites (GPredict en nuestro caso) y el arduino en sí.

> Para facilitar la comunicación entre ambos, usaremos una librería llamada Hamlib, la cual permite obtener los datos relativos a la posición del satélite en tiempo real y enviar dicha información a través de un puerto serie (nuestro programa debe encargarse de calcular cuánto debe rotarse la antena y en qué dirección a partir de estos datos). Como GPredict incluye soporte nativo para esta librería a través de puertos TCP, nos debemos ocupar del protocolo de conexión Hamlib-Arduino.

El código lo podéis encontrar en [este repositorio](https://git.radio.clubs.etsit.upm.es/Meteor-automated/AutomatedRotorTacker).

![](/blog/2019-11-26/2.jpg)

### ControlAntenas_Android

Para poder controlar la posición de las Antenas Yagi UHF/VHF Pablo(EA4HFV) diseño una aplicación Android. El código de la aplicación, y los binarios para poder instalarla, lo podreis encontrar en [este repositorio](https://git.radio.clubs.etsit.upm.es/Meteor-automated/ControlAntenas_Android).

El funcionamiento de la aplicación y de los protocolos que la hace funcionar está mas detalladamente explicada en este post -  [Control de la estación de satélites desde dispositivos Android](https://radio.clubs.etsit.upm.es/blog/2020-03-29-control-de-la-estaci%C3%B3n-de-sat%C3%A9lites-desde-dispositivos-android/).

> La aplicación desarrollada consta de 3 apartados: un socket TCP para la comunicación con el rotor, un sistema de predicción de los próximos satélites meteorológicos que se van a recibir desde el RadioClub (a fin de que el usuario no intente mover la antena durante el paso de un satélite entorpeciendo su recepción) y una pestaña de ajustes que nos permite modificar la dirección IP y puerto del servidor al que nos conectamos.

![](/blog/2020-03-29/1.jpeg)

### Control remoto de la estación de satélites del RadioClub E.I.T.

Después de poder controlar los rotores en remoto, nos toca configurar la radio. El hardware que usamos es el *Airspy HF+ Discovery* conectado a la antena de VHF, y el software que usaremos para hacer esto posible es [AirSpy](https://airspy.com/directory/#).

Dejaremos una referencia a post donde explicamos esta parte más detalladamente - [Control remoto de la estación de satélites del RadioClub E.I.T.](https://radio.clubs.etsit.upm.es/blog/2020-03-17-control-remoto-de-la-estaci%C3%B3n-de-sat%C3%A9lites-del-radioclub/)

> Para conectar el SDR a internet y poder utilizarlo de forma remote, disponemos de dos opciones: hacerlo mediante rtl_tcp o desplegando un servidor spyserver. Optamos por la segunda opción, ya que ésta no es más que una optimización de la primera que requiere de menos ancho de banda para funcionar corectamente y ofrece un mayor número de opciones de personalización. La instalación es muy sencilla, existen multitud de tutoriales disponibles online.

### wx-ground-station | Automatización recepción de satélites meteorológicos en remoto desde Linux

Después del todo el trabajo anterior, queda orquestar todos los elementos para poder hacer un sistema de recepción automático. Para ello se creó [wx-ground-station](https://git.radio.clubs.etsit.upm.es/Meteor-automated/wx-ground-station), un programa escrito en shell que cálcula la órbita del satélite, programa el control de las antenas y la radio, graba el pase, demodula, decodifica, y finalmente, sube los datos para poder verlos desde la web.

![](/blog/2020-04-18/3.jpg)

El funcionamiento del programa la podréis encontrar en el post que subimos anteriormente de [Automatización recepción de satélites meteorológicos en remoto desde Linux](https://radio.clubs.etsit.upm.es/blog/2020-04-18-automatizacion-satelites-linux/).

El repositorio del proyecto lo encontrareis en <https://git.radio.clubs.etsit.upm.es/Meteor-automated/wx-ground-station>.

En realidad el proyecto se basa en más herramientas para poder funcionar. Algunas de ellas creadas por nosotros, que serían [python-predict](https://git.radio.clubs.etsit.upm.es/Meteor-automated/python-predict) y [rotor](https://git.radio.clubs.etsit.upm.es/Meteor-automated/rotor).

#### python-predict

[python-predict](https://git.radio.clubs.etsit.upm.es/Meteor-automated/python-predict) es una alternativa a [Predict](https://www.qsl.net/kd2bd/predict.html) escrita en python. Se trata de un propagador de órbita de satélites basado en la librería [orbit_predictor](https://github.com/satellogic/orbit-predictor).

La motivación de crear nuestro propio propagador se debe a que el antiguo [Predict](https://www.qsl.net/kd2bd/predict.html), escrito en los 90's, da la lectura con mucho error. Esto luego repercute en hacer recepciones erroneas. Por este motivo tuvimos que reescribir el programa original en Python. El resultado es bastante bueno 😄.

La entrada del programa es el TLE del satélite que queremos calcular la órbita y la salida son las horas por las que será visible en nuestra posición. La salida está basada en la del programa [Predict](https://www.qsl.net/kd2bd/predict.html).

```bash
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

El código del programa lo podréis encontrar en - [python-predict](https://git.radio.clubs.etsit.upm.es/Meteor-automated/python-predict).

#### rotor

[rotor](https://git.radio.clubs.etsit.upm.es/Meteor-automated/rotor) es un programa escrito en Rust para el control de antena en tiempo real basado [rotctld](http://manpages.ubuntu.com/manpages/xenial/man8/rotctld.8.html) y [libgpredict](https://github.com/cubehub/libgpredict).

Su funcionamiento sería el siguiente:

```bash
$ rotor --tlefile <TLEFILE> --telename <TLENAME> --location <LOCATION> --server <ROTCTLD_ENDPOINT> --port <ROTCTLD_PORT>
```

A la entrada del programa especificas el TLE del satélite que estás observando, la localización donde estás, y la dirección del servidor [rotctld](http://manpages.ubuntu.com/manpages/xenial/man8/rotctld.8.html) para mover las antenas. Cuando es satélite esté en línea de visión, empezará a mover automáticamente las antenas con la información obtenida de [libgpredict](https://github.com/cubehub/libgpredict).

Adicionalmente el programa hace un pipe del audio a la entrada y lo pone en la salida. Esto es para poder utilizarlo con un pipe y hacer la recepción de un satélite de la siguiente forma (ejemplo):

```bash
$ ss_client iq -r ${SERVER} -q ${PORT} -f ${FREQ} -s ${SAMPLERATE} |
rotor --tlefile ${TLE_FILE} --tlename "${SAT}" --location lat=${RX_LAT},lon=${RX_LON},alt=${RX_ALT} --server ${ROTCTLD_SERVER} --port ${ROTCTLD_PORT} |
doppler track -s ${SAMPLERATE} -i i16 --tlefile ${TLE_FILE} --tlename "${SAT}" --location lat=${RX_LAT},lon=${RX_LON},alt=${RX_ALT} --frequency ${FREQ} |
demod --samplerate ${SAMPLERATE} --intype i16 --outtype i16 --bandwidth ${BANDWIDTH} fm --deviation ${DEVIATION} |
sox -t raw -e signed-integer -r ${SAMPLERATE} -b 16 -c 1 -V1 - ${AUDIO_FILE} rate ${OUTPUTSAMPLERATE}
```

El código del programa lo podréis encontrar en - [rotor](https://git.radio.clubs.etsit.upm.es/Meteor-automated/rotor).

### Satellite-Archive

Y ya finalmente tenemos [Satellite-Archive](https://git.radio.clubs.etsit.upm.es/Meteor-automated/Satellite-Archive), un visualizador open source de observaciones de satélites escrita en PHP y Javascript. La web desplegada con nuestras observaciones de este proyecto la podréis encontrar en <https://archive.ea4rct.org/>. Os recomendamos mucho que echéis un vistazo por nuestras observaciones para que veáis el resultado final de este proyecto del que nos sentimos muy orgullosos 😁.

Con el objetivo de hacer todas nuestros resultados los más público posibles, desarrollamos [Satellite-Archive](https://git.radio.clubs.etsit.upm.es/Meteor-automated/Satellite-Archive). Así de esta forma cualquier persona podrá indagar en nuestras observaciones y saber en el tiempo en su zona con total transparencia. Con el desarrollo de esta herramienta nos dimos cuenta que hay muy pocas herramientas para compartir recepciones de satélites públicamente.

Es muy importante compartir las recepciones de satélites porque ayudan a mucha gente. De primeras el radioaficionado obtiene más visibilidad. Luego, cualquier usuario puede ver con total transparencia la observaciones de estos satélites en bruto. Y ya por último, los operadores de satélites reciben información súper importante de su satélite desde infinidad de estaciones repartidas por el globo.

Creemos que haber creado la herramienta [Satellite-Archive](https://git.radio.clubs.etsit.upm.es/Meteor-automated/Satellite-Archive) es muy importante. Nos ha servido a nosotros a compartir nuestras observaciones, y esperemos que les sea de utilidad a más gente interesada en comunicaciones satelitales por todo el mundo.

En la aplicación podrás filtrar por fechas, por diferentes satélites y por estaciones de recepción. Puedes ver las observaciones, con su gráfico polar del pase, los metadatos, el TLE utilizado, etc. Se trata de una herramienta muy completa que ayudará mucho en la comunidad radioaficionada en satélites para compartir las observaciones de satélites.

![](/blog/2020-04-18/4.gif)

No sólo se trata de un visualizador, sino que también cuenta con un servicio FTP propio escrito en Docker donde se guardan las observaciones y de una base datos con la información de las imágenes. El proyecto cuenta con integración continua para deploys automáticos. En el repositorio del proyecto encontrarás en la carpeta `.deploy` con el despliegue de todas las herramientas involucradas.

El código del Satélite-Archive lo podréis encontrar en - [Satellite-Archive](https://git.radio.clubs.etsit.upm.es/Meteor-automated/Satellite-Archive).

---

## Conclusión

Este proyecto no está terminado, pero después de crear tantas herramientas alrededor de él teníamos la necesidad de crear un post explicando todo nuestro trabajo.

Todo el código referenciado anteriormente lo podréis encontrar en <https://git.radio.clubs.etsit.upm.es/Meteor-automated>.

Los repositorios de software creados alrededor de este proyecto son los siguientes:

* [ControlAntenas_Android](https://git.radio.clubs.etsit.upm.es/Meteor-automated/ControlAntenas_Android) - Aplicación Android para el control remoto de antenas
* [AutomatedRotorTacker](https://git.radio.clubs.etsit.upm.es/Meteor-automated/AutomatedRotorTacker) - Interfaz en arduino para crear la conexión serie entre ordenador y rotor
* [wx-ground-station](https://git.radio.clubs.etsit.upm.es/Meteor-automated/wx-ground-station) - Automatización de recepción de satélites en bash
* [rotor](https://git.radio.clubs.etsit.upm.es/Meteor-automated/rotor) - Control de antena en tiempo real basado [rotctld](http://manpages.ubuntu.com/manpages/xenial/man8/rotctld.8.html) y [libgpredict](https://github.com/cubehub/libgpredict)
* [python-predict](https://git.radio.clubs.etsit.upm.es/Meteor-automated/python-predict) - Alternativa a [Predict](https://www.qsl.net/kd2bd/predict.html) escrita en python
* [Satellite-Archive](https://git.radio.clubs.etsit.upm.es/Meteor-automated/Satellite-Archive) - Visualizador open source de observaciones de satélites escrita en PHP y Javascript

acien101@debian:~$ EXIT