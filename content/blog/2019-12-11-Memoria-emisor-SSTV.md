---
layout: post
published: true
title: Memoria Final Proyecto 2019 - Emisor SSTV con Arduino
date: 2019-12-11  # La fecha va con la forma YYYY-MM-DD
tags: [
  "Proyecto",
  "Arduino",
  "Sstv",
  "Radioaficion"
]
categorias: [
  "Sstv",
  "Proyecto",
  "Radioafición"
]
---

# Memoria Proyecto SSTV

## Planteamiento inicial del proyecto

La actividad que se propone realizar es la creación de un dispositivo portable que envie imagenes en tiempo real moduladas en *BLU* (Banda Lateral Única) con la codificación SSTV.

En la imagen emitida en la banda de radioaficionados VHF deberá de incorporar información de quién está emitiendo y los valores de los distintos sensores.


La transmisión se deberá de realizar con la suficiente potencia y las especificaciones del protocolo SSTV para que sea posible su recepción desde tierra.

## Organización y desarrollo

Para la realización de este proyecto se ha divido el diferentes partes. Cada participante se hacía responsable de su tarea. Las diferentes tareas son las siguientes:
1. Elección de la plataforma de desarrollo.
1. Creación del codificador de SSTV.
2. Codificación del middleware del síntesis de audio.
4. Codificación del middleware para la recepción de imagenes con arduino.
6. Decodificador de la imagen JPG.
7. Interconexión y programación de todos los sistemas.

### Elección de la plataforma de desarrollo

La principal requisito es utilizar un microcontrolador tipo Arduino, frente a un mini-pc con Linux. La principal razón es que queremos tener control total de la emisión creando todos los elementos desde la base.

De los diferentes microcontroladores del mercado necesitamos uno lo suficientemente capaz de decodificar una imagen y guardar todos los pixeles en RAM. Esto ya nos limita bastante las posibilidades, pues la gran mayoria de microcontroladores de la familia arduino se quedan fuera.

Otro requisito es que tiene que contar con 2 conexiones UART para la comunicación con la cámara, y el GPS.

Por estos motivos **el micro utilizado ha sido el Arduino DUE**. Aunque para versiones futuras se podría utilizar el ESP32.

### Codificador SSTV Scottie 1

Se ha optado por elegir el codificador SSTV Scottie 1 porque es robusto y rápido para enviar imágenes a color en banda estrecha. **Se ha creado un codificador libre** con las especificaciones del protocolo SSTV Scottie 1[^protocolo_SSTV].

La explicación del codificador se encuentra en la [web del RadioClub](https://radio.clubs.etsit.upm.es/blog/2019-08-10-sstv-scottie1-encoder/) y el codificador completo se encuentra en el trabajo final expuesto más tarde.

### Codificación del middleware del síntesis de audio

Para sintetizar el audio del codificador SSTV se ha utilizado el Sintetizador digital AD9850[^sinte] con el uso de la librería para arduino *AD9850*[^libreria_sinte] de F4GOJ.

### Codificación del middleware para la recepción de imagenes con arduino

Para tomar la imagen de la Cámara TTL de Adafruit[^camara_adafruit] se ha utilizado la librería de Adafruit *Adafruit-VC0706-Serial-Camera-Library*[^libreria_adafruit].

### Decodificador de la imagen JPG

Para emitir la imagen en SSTV, primero se tiene que decodificar y conseguir en hexadecimal el contenido de la imagen. Para hacer esto, hemos usado la libreria *JPEGDecoder*[^jpeg_decod_library] de Bodmer.


### Interconexión y programación de todos los sistemas

El esquemático final del proyecto es el siguiente:

![](/blog/2019-12-11/1.png)


![](/blog/2019-12-11/2.jpg)


El código completo se puede encontrar en el [repositorio git del RadioClub](https://git.radio.clubs.etsit.upm.es/SSTV-Encoder/SSTV-arduino-scottie1).

## Grado de consecución de los objetivos

Debido al bajo presupuesto hemos tenido que limitar el número de transpondedores a 1, siendo solo un transmisor de SSTV, y no uno de SSTV y APRS cómo se propuso inicialmente.

Las pruebas que hemos hecho para comprobar el funcionamiento del emisor SSTV ha sido emitir la imagen con el Baofeng UV-5R desde el RadioClub. Y desde las antenas de satélites del club recibir la señal y decodificarla con el decodificador *QSSTV*[^qsstv].

Los resultados son los siguientes:

![](/blog/2019-12-11/3.png)

![](/blog/2019-12-11/4.png)

## Lugar y fechas de realización, número de participantes

El lugar de realización del proyecto ha sido el RadioClub E.I.T.

El número de participantes implicados han sido 6 participantes, todos ellos socios del RadioClub E.I.T.

Se espera en el futuro participar con este proyecto en el lanzamiento de la sonda *SERVET* impulsado por la Universidad de Zaragoza.

## Justificación  de  los  gastos

Los equipos comprados han sido los siguientes:

* **Cámara JPEG TTL de Adafruit 397[^camara_adafruit]**: La cámara con la que se tomarán las imagenes del cielo, y que posteriormente se transmitan por SSTV.
* **GPS Adafruit GPS MTK3339[^gps_adafruit]**: El módulo que tome la información de posición para enviarla por APRS.
* **Sensor inercial AltIMU-10 v5[^sensor_inercial]**: Sensor de giroscopio/acelerómetro, magnetómetro y barómetro, para transmitir los datos por APRS.

El desembolso para la realización del proyecto ha sido el siguiente:

| Producto | Precio | Cantidad |
|---|---|---|
| Cámara JPEG TTL | 45.86€ | 1 |
| Adafruit GPS MTK3339 v3 | 53.00€ | 1 |
| Sensor inercial AltIMU-10 v5 | 26.5€ | 1 |
| **TOTAL** | **125.36€** | |


## Incidencia en el ámbito universitario

Este proyecto es positivo para la gente del club porque hemos conseguido dominar los aspectos de la Radioafición que más nos interesan, entendiendo cada uno de los componentes que lo crean.

Además, que el proyecto sea libre es muy bueno para la comunidad de Radioafición/electrónica porque hace que el proyecto sea replicable. Esto da pie a desarrollos de TFG's basados en nuestro trabajo.

Este proyecto ayudará a los alumnos del Curso de Picosatélites y Servicio de Radioaficionados por Satélite, organizado por el RadioClub E.I.T, a entender las comunicaciones espaciales. Supondrá muy beneficiario para los alumnos de dicho curso, de este y los años próximos.

## Conclusiones y aspectos de mejora

Ha sido un proyecto transversal en el que se han tocado todas las ramas estudiadas en nuestro grado universitario de Telecomunicaciones. El resultado final ha sido muy bueno, creando un prototipo funcional.

Los aspectos de mejora son: las dimensiones de la imagen son bajas, la calidad no es muy buena y se ve muy afectada por el ruido.

Para lineas futuras se plantea crear una PCB con todos los componentes, crear una carcasa para proteger el prototipo y enviar la posición GPS con un transpondedor APRS para poder lanzarlo en un globo metereológico.



## Difusión realizada

Todo el proyecto es software libre, y cualquier persona puede ver nuestro trabajo. Además se han creado algunos posts en el [blog del Radio](https://radio.clubs.etsit.upm.es/) explicando el funcionamiento de las diferentes las partes.

Se tiene intención de participar en concursos universitarios, presentar el experimento para enviarlo en una sonda con la Universidad de Zaragoza, y también crear un artículo en la revista especializada *URE* explicado el proyecto.


[^qsstv]: QSSTV [Fuente](http://users.telenet.be/on4qz/)
[^jpeg_decod_library]: Bodmer. JPEGDecoder. [Fuente](https://github.com/Bodmer/JPEGDecoder)
[^libreria_adafruit]: Adafruit. Adafruit-VC0706-Serial-Camera-Library. [Fuente](https://github.com/adafruit/Adafruit-VC0706-Serial-Camera-Library)
[^libreria_sinte]: F4GOJ. Arduino serial library for AD9850. [Fuente](https://github.com/F4GOJ/AD9850)
[^protocolo_SSTV]:Silicon Pixels. (2000, 20 mayo). Proposal for SSTV Mode Specifications. Recuperado 6 agosto, 2019, de http://www.barberdsp.com/downloads/Dayton%20Paper.pdf
[^camara_adafruit]: Cámara con módulo CMOS VGA de OmniVision de alta calidad con soporte de compresión JPEG. [Fuente](https://tienda.bricogeek.com/sensores/292-camara-jpeg-ttl.html?gclid=Cj0KCQjwjpjkBRDRARIsAKv-0O15hxOqcnCRYisbMLxY1D8BLXdRtmZFyVFV0_483MWxWe7eef1MMlkaAt1MEALw_wcB)
[^gps_adafruit]: Pequeño GPS con chip MTK3339 de 10Hz y 66 canales.
[^sensor_inercial]: Sensor que cuenta con giroscopio/acelerómetro LSM6DS33, un magnetómetro  LIS3MDL y un barómetro LPS25H. [Fuente](https://tienda.bricogeek.com/medicion-inercial-imu/884-sensor-inercial-altimu-10-v5.html?search_query=sensor+inercial&results=7)
[^sinte]: Sintetizador AD9850 de Analog Devices que utiliza una avanzada tecnología DDS unida con un convertidor D/A interno, de alta velocidad y alto rendimiento, y un comparador para formar un sintetizador de frecuencia completa, programable digitalmente y función de generador de reloj. [Fuente](https://www.digikey.es/es/product-highlight/a/analog-devices/ad9850-cmos-complete-direct-digital-synthesizer)
