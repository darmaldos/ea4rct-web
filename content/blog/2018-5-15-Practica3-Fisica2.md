---
layout: post
published: true
title: Práctica 3 - Física 2 Velocidad del sonido
date: 2018-05-15
tags: [
  "Apuntes",
  "Física II",
  "Velocidad del sonido",
  "Soluciones",
  "Practicas",
  "Primero"
]
categorias: [
  "Apuntes",
  "Física II"
]
---
Esta práctica consistirá en medir la velocidad del sonido en el aire con un tubo de Kundt, micrófono y altavoz, generador de una frecuencia variable, y un oscilocopio.

<img src="/blog/2018-5-15/osciloscopio_generador_senal.jpg" width="49%">
<img src="/blog/2018-5-15/todo_practica_3.jpg" width="49%">
<img src="/blog/2018-5-15/mic_altavoz.jpg" width="99%">

### Fundamento teórico
Con el generador de señal, le vamos a pasar una señal sinusoidal al altavoz, que enviará un onda armónicoa, \\(y_1\\), de frecuencia \\(f\\), que se desplazará en el sentido positivo del eje x. Dicha onda tendrá la forma:

$$
y_1 = A \cdot \sin(\omega t - k x)
$$

Donde:

* \\(k = \frac{2\pi}{\lambda}\\): Número de onda
* \\(\omega = \frac{2\pi}{T}\\): frecuencia angular
* \\(v_{prop} = \lambda \cdot f\\): velocidad de propagación. Con \\(f = 1/T\\)


Esta onda se desplazará en sentido positivo del eje x, hasta el pistón que hará que se choque generando otra onda armónica \\(y_2\\) de la misma frecuencia \\(f\\), que se desplazará en sentido negativo del eje x, con la misma velocidad de propagación \\(v_{prop}\\). Su expresión matemática será:

$$
y_2 = A \cdot \sin(\omega t + k x)
$$

Y la superposición de ambas será:

$$
y = y_1 + y_2 = 2A \cos(kx) \sin(\omega t)
$$

Que corresponde a una onda estacionaria. Su amplitud será, por tanto, de \\(2A \cos(kx)\\), que hará que en algunos puntos para todo t sea \\(y = 0\\), que denominaremos **nodos**. Y donde sea máxima, es decir, en \\(\cos(kx) = 1\\), los denominaremos **antinodos**.

![Ejemplo de onda estacionaria](https://upload.wikimedia.org/wikipedia/commons/7/7d/Standing_wave_2.gif)

De esta forma, **en los nodos se satisface la condición** \\(\cos(kx) = 0\\), es decir:

$$
kx = (2n + 1) \cdot \frac{\pi}{2} \Rightarrow x_n = (2n + 1) \cdot \frac{   \lambda}{4}
$$

Por tanto **la distancia entre dos nodos consecutivos será** de \\(\frac{\lambda}{2}\\).

### Realización de la práctica

Desplazando la posición del pistón, localizaremos la posición de los distintos nodos con la ayuda del micrófono conectado al osciloscopio. Se nos pide determinar:

* Determinar el error en la medida de las posiciones de los máximos
* Decidir cuál es la mejor estrategia para estimar el error en la medida de la longitud de la onda:
    1. hacer estadística entre todas las posiciones encontradas para los nodos o
    2. utilizar la medida más precisa y acotar el error mediante propagación de errores.
* Estimar la frecuencia mínima con la que se puede medir.
* Realizar un gráfico de velocidades frente a frecuencias.
* Calcular las velocidades y determinar si son constantes dentro del error de medida.

#### Error en la medida

El método seguido es poner el **generador de señal a** \\(f = 1 \ KHz\\), y mover el pistón hasta encontrar un nodo. El **primer nodo** que hemos encontrado está entre 19.5cm y 20cm, entre esos dos valores en el osciloscipio **no notamos ninguna diferencia**. Por lo tanto, el error de medida será de \\(\Delta 0.5 cm\\).

En un experimento más riguroso, se tendría que calcular le error a partir de los errores de los aparatos de medida. En este caso, estamos utilizando un micrófono para recibir la señal que sale a través de un altavoz. Al ser estos aparatos de medida tan *analógicos* no es fácil determinar con certeza su error.

Así pues, en el caso anterior, tenemos un **nodo** en 20 \\(\pm\\) 0.5 cm, que realmente estará en 19.5 \\(\pm\\) 0.25 cm

#### Estrategia errores

A la hora de coger datos, es más eficaz tomar una única medida que sea precisa, que muchas que sean imprecisas. Por ejmplo, al calcular la frecuencia de oscilación de un pendulo simple es mejor hacer una única medida observando el pendulo con algunas oscilaciones, que medir una única oscilación 20 veces diferentes.

La respuesta están en los mínimos cuadrados que sería el segundo caso (midiendo una oscilación muchas veces), y en la propagación de errores que sería la primera (medir una que sea muy fiable). Es más preciso es la propagación de errores porque los errores están más controlados, en el otro los vas arrastrando y encuentras su regresión lineal.

Por lo tanto, es más eficaz hacer una única medida que sea muy precisa y acotar su error.

#### Estimar la frecuencia mínima con la que se puede medir

Esto es sencillo de calcular teniendo en cuenta la teoría antes explicada.

Los nodos están dispuestos de tal forma que **dos nodos consecutivos** estarán a \\(\frac{\lambda}{2}\\) uno del otro. Nuestro tubo de Kundt tiene una longitud de 80 cm, que es lo que nos determina cual será la longitud máxima de la onda, y la velocidad del sonido es una constante:

$$
\frac{\lambda}{2} = 80 \cdot 10^{-2} \Rightarrow \lambda = 1.6 \ m
\\
v_{prop} = \lambda \cdot f = 350 \ m/s
\\
\Rightarrow f = \frac{350}{1.6} = 218.75 \ Hz
$$

#### Gráfico de velocidad frente a frecuencias

El procedimiento seguido es el siguiente:
1. Ponemos el generador de señal, conectado al altavoz, y ponemos una determinada frecuencia.
2. Moviendo el pistón determinamos su longitud de onda encontrando dos nodos consecutivos.
3. Determinamos la velocidad de propagación, que se rige por la fórmula: \\(v_{prop} = \lambda \cdot f\\)

Hemos empezado desde los 500 Hz hasta los 3.25 KHz. Tomando una lectura cada 250 Hz, es decir un total de 12 lecturas.

El error absoluto de la frecuencia es de \\(\pm 10 Hz\\).

La gráfica es la siguiente:

<iframe width="901" height="557" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTNwF4kzAXnAwEvjqRkxm4zaQgSL80eN-TfmkdTs600N32dvHrDpIwrzBpodE5zs8ThsXtswaQQkJzj/pubchart?oid=612993568&amp;format=interactive"></iframe>

Los resultados nos salen que la frecuencia están centradas en 350 m/s. Que es lo que nos esperabamos, pues es la constante de la velocidad del sonido en el aire.

El error de la medida será:

<div>
$$
v_{prop} = \lambda \cdot f
\\
\Delta v_{prop} = \bigg \lvert \frac{\delta v_{prop}}{\delta \lambda} \bigg \lvert \Delta \lambda + \bigg \lvert \frac{\delta v_{prop}}{\delta f} \bigg \lvert \Delta f
\Rightarrow \Delta v_{prop} = f \cdot \Delta \lambda + \lambda \cdot \Delta f
$$
</div>

Siendo

$$
\Delta f = 10 \ Hz \qquad \Delta \lambda = 0.5 \cdot 10^{-2}
$$

Por tanto, el error no es mismo para todas las medidas, porque para frecuencias más altas, el error será considerable. De este modo, **vamos a ver si todas las velocidades están dentro del valor real de la velocidad del sonido**.

| \\(v_{prop} \ \\) [m/s] | \\(\lambda \ \\) [cm] | \\(f \ \\) [Hz] | \\(\Delta v_{prop} \ \\) [m/s]|
|---|---|---|---|
|352.5|70.5|500|\\(\pm\\)9.55|
|348|46.4|750|\\(\pm\\)8.39|
|350|35|1000|\\(\pm\\)8.5|
|352.5|28.3|1250|\\(\pm\\)9.07|
|351|23.4|1500|\\(\pm\\)9.84|
|350|20|1750|\\(\pm\\)10.75|
|356|17.8|2000|\\(\pm\\)11.78|
|342|15.2|2250|\\(\pm\\)12.77|
|350|14|2500|\\(\pm\\)13.9|
|346.5|12.6|2750|\\(\pm\\)15.01|
|348|11.6|3000|\\(\pm\\)16.16|
|344.5|10.6|3250|\\(\pm\\)17.31|

Viendo los resultados, todos ellos contemplan el valor 350 m/s entre sus límites. Estos es una muy buena señal, porque nuestro valores experimentales se ciñen a la teoría.

amil101@debian:~$ EXIT

### Bibliografía
* [https://commons.wikimedia.org/wiki/File:Standing_wave_2.gif](https://commons.wikimedia.org/wiki/File:Standing_wave_2.gif)
