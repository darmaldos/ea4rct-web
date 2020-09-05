---
layout: post
published: true
title: Automatización del tracking de satélites en rotores analógicos con Arduino
date: 2019-11-26  # La fecha va con la forma YYYY-MM-DD
tags: [
  "proyectos",
  "satélites",
  "tracking",
  "rotor",
  "arduino"
]
categorias: [
  "Radioafición",
  "WX Ground Station"
]
author: Pablo Álvarez
image: /blog/2019-11-26/2.jpg
---

Este año, desde el Radioclub EIT, tenemos como proyecto general indagar un poco en las comunicaciones vía satélite. Un buen punto de partida para ello es la recepción de satélites tanto destinados a comunicaciones entre radioaficionados como a suministrar información de caracter meteorológico o incluso la misma ISS (Estación Espacial Internacional).

Todos estos sistemas satelitales tienen un elemento en común: describen órbitas LEO (Low Earth Orbit, entre 400Km y 800Km de altitud). Es por ello que, para recibir la señal que emiten, se vuelve imprescindible el uso de un sistema de seguimiento, para asegurar un buen apuntamiento de la antena y que así la zona de mayor ganancia de ésta esté siempre enfocada hacia el punto en el cielo donde se encuentra el satélite emitiendo.

Actualmente disponemos en el club de una estación destinada a la recepción de este tipo de satélites. El problema que presenta es que, debido a su antigüedad, el tracking de los satélites debe realizarse manualmente (accionando a mano unas palancas para controlar el movimiento del rotor). Nuestro objetivo es, por tanto, ser capaces de automatizar este seguimiento, mediante una interfaz rotor-PC, para que el rotor se pueda orientar de forma autónoma según los datos suministrados por un programa especializado como pueda ser GPredict u Orbitron.

## Hardware
El hardware necesario para realizar el montaje será:

+ Arduino UNO R3
+ Módulo cuádruple de Relés
+ Conector DIN de 8 pines

Nuestras controladoras de rotores, al igual que la mayoría de controladoras con más de 10/15 años, presentan en su parte trasera un conector DIN hembra de 8 pines. Este pin ofrece la posibilidad tanto de controlar el rotor de forma externa como de leer información acerca de en qué dirección se encuentra apuntando la antena en ese instante:

![](/blog/2019-11-26/1.png)

Mediante un arduino, leeremos los datos analógicos de los pines 6 y 1 (apuntamiento en los ejes de elevación y acimut), y, mediante la placa de relés, controlaremos el movimiento del rotor. Esto se puede programar de forma muy sencilla mediante las funciones analogRead() y digitalWrite().

## Software

La verdadera complejidad del proyecto consiste en la comunicación entre el software de tracking de satélites (GPredict en nuestro caso) y el arduino en sí.

Para facilitar la comunicación entre ambos, usaremos una librería llamada [Hamlib](https://hamlib.github.io/), la cual permite obtener los datos relativos a la posición del satélite en tiempo real y enviar dicha información a través de un puerto serie (nuestro programa debe encargarse de calcular cuánto debe rotarse la antena y en qué dirección a partir de estos datos). Como GPredict incluye soporte nativo para esta librería a través de puertos TCP, nos debemos ocupar del protocolo de conexión Hamlib-Arduino.

Hamlib es compatible con una variedad muy amplia de protocolos usados por rotores modernos de diferentes marcas:

```
Rig #  Mfg                    Model                   Version         Status
     1  Hamlib                 Dummy                   0.2             Beta
     2  Hamlib                 NET rotctl              0.3             Beta
   201  Hamlib                 EasycommI               0.4             Beta
   202  Hamlib                 EasycommII              0.4             Beta
   204  Hamlib                 EasycommIII             0.4             Alpha
   301  XQ2FOD                 Fodtrack                0.2             Stable
   401  Idiom Press            Rotor-EZ                2010-02-14      Beta
   402  Idiom Press            RotorCard               2010-02-14      Untested
   403  Hy-Gain                DCU-1/DCU-1X            2010-08-23      Untested
   404  DF9GR                  ERC                     2010-08-23b     Alpha
   405  Green Heron            RT-21                   2014-09-14      Alpha
   501  SARtek                 SARtek-1                0.2             Untested
   601  Yaesu                  GS-232A                 0.3             Beta
   602  Yaesu/Kenpro           GS-232                  0.1             Beta
   603  Yaesu                  GS-232B                 0.2             Beta
   604  F1TE                   GS232/F1TE Tracker      0.1             Beta
   701  WA6UFQ                 PcRotor                 0.1             Untested
   801  Heathkit               HD 1780 Intellirotor    0.1             Beta
   901  SPID                   Rot2Prog                1.0             Stable
   902  SPID                   Rot1Prog                1.0             Stable
  1001  M2                     RC2800                  0.1.1           Beta
  1101  EA4TX                  ARS RCI AZ&EL           0.1             Beta
  1102  EA4TX                  ARS RCI AZ              0.1             Beta
  1201  AMSAT                  IF-100                  0.1             Untested
  1301  LA7LKA                 ts7400                  0.1             Beta
  1401  Celestron              NexStar                 0.1             Untested
  1501  DG9OAA                 Ether6 (via ethernet)   0.1             Beta
  1601  CNCTRK                 CNCTRK                  0.1             Untested
```

En nuestro caso, optamos por utilizar el protocolo Easycomm II. La lista completa de comandos que componen este protocolo es la [siguiente:](https://github.com/Hamlib/Hamlib/blob/master/easycomm/easycomm.txt)

```

Command		Meaning			Perameters
-------		-------			----------

AZ		Azimuth             number - 1 decimal place [deg]
EL		Elevation           number - 1 decimal place [deg]
UP		Uplink freq         in Hertz
DN		Downlink freq		in Hertz
DM		Downlink Mode       ascii, eg SSB, FM
UM		Uplink Mode         ascii, eg SSB, FM
DR		Downlink Radio      number
UR		Uplink Radio        number
ML		Move Left
MR		Move Right
MU		Move Up
MD		Move Down
SA		Stop azimuth moving
SE		Stop elevation moving
AO		AOS
LO		LOS
OP		Set output          number
IP		Read an input       number
AN		Read analogue input number
ST		Set time            YY:MM:DD:HH:MM:SS
VE		Request Version
```

Ya que sólo pretendemos controlar un rotor y no una radio también, los únicos comandos a implementar serán AZ, EL. Para ello, nuestro programa contará con un buffer donde se van almacenando los caracteres recibidos por puerto serie, para identificar si alguna de las cadenas de caracteres recibidas se corresponde con AZ o EL y obtener el número enviado inmediatmente después.

Una vez reconocido dicho valor y estando éste almacenado en una variable, se realiza una lectura del peurto analógico para obtener la posición hacia la que se encuentra apuntando la antena en ese instante, se compara con los datos recibidos, y se activan los relés si es necesario (se incluye un pequeño rango de error debido a las fluctuaciones de las medidas del puerto analógico).

## Resultado

El código completo puede obtenerse en el siguiente enlace:

https://git.radio.clubs.etsit.upm.es/Pablo/AutomatedRotorTacker

Algunas fotos del sistema funcionando:

![](/blog/2019-11-26/2.jpg)
![](/blog/2019-11-26/3.jpg)
![](/blog/2019-11-26/4.jpg)
