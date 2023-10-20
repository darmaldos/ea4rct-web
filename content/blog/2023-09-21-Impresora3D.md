---
layout: post
published: true
title: Donación impresora 3D por Cesar EA4HFF.
date: 2023-09-21 # La fecha va con la forma YYYY-MM-DD
tags: [
  "Donación",
  "Impresora3D"
]
categorias: [
  "Donaciones",
  "Impresora3D"
]
author: Rubén Sanz Sánchez EA1FRA
image: /donaciones/impresora3D/impresora2.jpg
---

## Equipos Donados

Cesar EA4HFF, nos ha donado una impresora 3D Creality 3D Cr-30. Con un rollo de PLA sin abrir, y los rodamientos respectivos para poder imprimir piezas más grandes. Dado que nos encontramos ante una impresora 3D de eje z infinito, que posee una cinta transportadora.

## Agradecimientos

Es una herramienta que nos permitirá poder hacer bastantes piezas para nuestros proyectos, tanto del club como de nuestros miembros. Permitiendonos que cada vez sean mas completos y dinámicos. Esta ha sido colocado en el club, además de calibrada y limpiada para su puesta en marcha.

Se plantea en un futuro cercano, instalarla con la raspberrypi con el fin de poder ser controlada de manera remota.

## Precauciones

El sistema utilizado, para poder exportar los G-codes, para que la impresora pueda hacer las piezas, es el CrealityBelt, una modificación del Cura para poder trabajar con uno de los ejes infinitos. He de decir que por defecto cuando este programa termina una pieza se queda apoyado encima de la cremallera, lo que hace que pueda dejar alguna marca o incluso quemarla. Es por ello que es necesario quitar la linea de control que baja el extrusor una vez terminado y subirla unos mm. En nuestro caso concreto el código utilizado en la parte end-code es el siguiente:

G1 Y15 G92 E0 ; Set Extruder to zero G1 E-6 ; Retract 6mm G92 Z0 ; Set Belt to zero G1 Z15 ; Move Belt 15mm before starting up the next product G92 Z0 ; Set Belt to zero again

;˄˄˄˄˄˄˄˄˄˄˄˄˄˄˄˄ - copy up to here / paste codes just above here - ˄˄˄˄˄˄˄˄˄˄˄˄˄˄˄˄

G1 Y15 M104 S0 ; Extruder heater off M140 S0 ; Heated bed heater off M106 S0 ; Part cooling fan off M106 P1 S0 ; Rear fan off G92 Z0 G1 Z10 F1000 G28 X0 F2000 G1 Z20 F1000 G1 X170 F2000 M18 ; Disable all stepper motors

Ruben Sanz Sanchez EA1FRA

## Imagenes
<img src="/donaciones/impresora3D/impresora2.jpg" width="500" height="700">
<img src="/donaciones/impresora3D/impresora1.jpg" width="500" height="700">
<img src="/donaciones/impresora3D/impresora3.jpg" width="500" height="700">
<img src="/donaciones/impresora3D/impresora4.jpg" width="500" height="700">

