---
layout: post
published: true
title: Práctica 4 - Física 2 Banco de óptica
date: 2018-05-15
tags: [
  "Apuntes",
  "Física II",
  "Óptica",
  "Soluciones",
  "Practicas"
]
categories: [
  "Apuntes",
  "Física II"
]
---

Esta práctica consistirá en el manejo de las lentes del banco de óptica, para ver como afectan las lentes convergentes y divergentes al paso de la luz. El banco óptico está compuesto de una lente convergente y otra divergente, que moveremos a traves del soporte en el que hay un emisor de luz.

<img src="/blog/2018-5-15/lentes_diferentes.jpg" width="49%">
<img src="/blog/2018-5-15/lentes_emisor.jpg" width="49%">
<img src="/blog/2018-5-15/lentes_normal.jpg" width="99%">

### Fundamento teórico - Parte 1

La imagen de un objeto a través de una lente delgada, verifica la siguiente relación:

$$

\frac{1}{f'} = \frac{1}{s'} + \frac{1}{s}

$$

En donde:
* \\(s\\) es la distancia objeto (distancia entre el objeto y la lente)
* \\(s'\\) es la distancia imagen (distancia entre la imagen y la lente)
* \\(f'\\) es la distancia focal de la lente. Se define también la potencia de la lente como \\(\frac{1}{f'}\\)


<img src="/blog/2018-5-15/lente_convergente.png" width="49%">
<img src="/blog/2018-5-15/lente_divergente.png" width="49%">


### Realización de la práctica - Parte 1 - Lente convergente

Desplazando la lente convergente a través del soporte se nos pide:
* Si colocamos la **lente convergente** entre la luz y la pantalla, ¿cuántas posiciones de la lente hay para que la imagen en la pantalla sea nítida?
* En este caso ¿qué relación hay entre los tamaños de la imagen para dichas posiciones?
* ¿Qué distancia entre objeto y pantalla sería la adecuada para tener el mínimo error en la medida de la distancia focal de la lente?
* Calcula la potencia de la lente convergente con su error.

#### Posiciones para las que es nítida la imagen con la lente convergente

El procedimiento seguido es poner la lente convergente en el soporte y movernos en el hasta encontrar una imagen nítida. Hemos encontrado 2, uno en 22.6 cm y otro en 68.5 cm. De una forma más gráfica seria:

 ![Posición de las lentes](/blog/2018-5-15/lentes_a.png)

La **imagen objeto se trata** de una flecha de 2.6 cm.

En la primera posición dónde se puede ver la imagen nítida, la imagen proyectada (con forma de flecha) mide 7.6 cm, es decir \\(M_L = \frac{7.6}{2.6} = 2.92\\)

En la segunda posición dónde se puede ver la imagen nítida, la imagen proyectada mide 0.9 cm, es decir \\(M_L = \frac{0.9}{2.6} = 0.35\\)

#### Qué posición sería la mejor para tener el menor error posible

La pregunda de en qué posición sería la mejor para tener el menor error posible se puede ver con el error que tiene la potencia de la lente \\(\frac{1}{f'}\\)


$$

\frac{1}{f'} = \frac{1}{s'} + \frac{1}{s}

\\

\Delta \frac{1}{f'} = \Bigg \lvert \frac{\delta \frac{1}{f'}}{\delta s'} \Bigg \lvert \Delta s' + \Bigg \lvert \frac{\delta \frac{1}{f'}}{\delta s} \Bigg \lvert \Delta s = \frac{1}{s'^2} \Delta s' + \frac{1}{s^2} \Delta s

$$


Es decir, que el error depende de lo anterior, por lo que se minimiza el error con una mayor distancia. Entonces, la respuesta será que tendremos menor error en la segunda posición.

#### Calcula la potencia de la lente convergente con su error

**En la primera posición de la imagen nítida**:

$$

s = 22.6 \cdot 10^{-2} \ m \qquad s' = 91.4 - 22.6 = 68.8 \cdot 10^{-2} \ m

\\

P = \frac{1}{f'}= \frac{1}{68.8 \cdot 10^{-2}} + \frac{1}{22.6 \cdot 10^{-2}} = 5.87 \ dioptrías

$$

**En la segunda posición de la imagen nítida**:

$$

s = 68.5 \cdot 10^{-2} \ m \qquad s' = 91.4 - 68.5 = 22.9 \cdot 10^{-2} \ m

\\

P = \frac{1}{f'}= \frac{1}{22.9 \cdot 10^{-2}} + \frac{1}{68.5 \cdot 10^{-2}} = 5.83 \ dioptrías

$$

Que los resultados sean iguales es bastante bueno, pues esto significa que lo estamos haciendo bien porque en ningún momento hemos cambiado la lente, con lo que la potencia en las dos posiciones tiene que ser la misma.

El error de la medida la hemos expresado antes. El error de nuestra regla es de \\(\pm 0.001 \ m\\). Para la **primera posición** tenemos un error de:

$$

\Delta \frac{1}{f'} = \Bigg \lvert \frac{\delta \frac{1}{f'}}{\delta s'} \Bigg \lvert \Delta s' + \Bigg \lvert \frac{\delta \frac{1}{f'}}{\delta s} \Bigg \lvert \Delta s = \frac{1}{s'^2} \Delta s' + \frac{1}{s^2} \Delta s

\\

= \frac{1}{(68.8 \cdot 10^{-2})^2} 0.001 + \frac{1}{(22.6 \cdot 10^{-2})^2} 0.001 = 0.02 \ dioptrías

\\

\Rightarrow P = \frac{1}{f'}= \frac{1}{68.8 \cdot 10^{-2}} + \frac{1}{22.6 \cdot 10^{-2}} = 5.87 \pm 0.02 \ dioptrías

$$

Por tanto, el error **para la segunda posición** será de:

$$

\Delta \frac{1}{f'} = \frac{1}{(22.9 \cdot 10^{-2})^2} 0.001 + \frac{1}{(68.5 \cdot 10^{-2})^2} 0.001 = 0.02 \ dioptrías

\\

\Rightarrow P = \frac{1}{f'}= \frac{1}{22.9 \cdot 10^{-2}} + \frac{1}{68.5 \cdot 10^{-2}} = 5.83 \pm 0.02 \ dioptrías

$$

### Fundamento teórico - Parte 2

Una lente divergente no forma una imagen real, sino una virtual. Para poder ver la imagen real es necesario combinarla con una convergente, según se muestra en el esquema:

![Imagen cogida de la práctica](/blog/2018-5-15/lentes_suma_lentes.png)

Teniendo en cuenta las expresiones:

$$

D_1 = \frac{1}{s'_ {1}} + \frac{1}{s_ {1}}; \qquad -s_2 = s'_ 1 - d; \qquad D_2 = \frac{1}{s'_ {2}} + \frac{1}{s_ {2}}

$$

Donde \\(D_1\\) es la potencia calculada en el apartado anterior para la lente convergente y \\(D_2\\) es la potencia de la lente divergente.

Llamando \\(A = 1/s_1\\) y \\(B = 1/s'_ 2\\)

La potencia de la lente divergente se puede calcular mediante la expresión siguiente:

$$

D_2 = B - \frac{D_1 - A}{1 - d(D_1 - A)}

$$

### Realización de la práctica - Parte 2 - Lente divergente

En esta parte se pide:
* Encontrar tres posciones diferentes para la pantalla y las dos lentes, de manera que forme una imaagen nítida en la pantalla.
* Escoger de entre las tres posiciones anteriores una y calcular a partir de ella la potencia de la lente divergente así como su error.

#### Posiciones para las que es nítida la imagen con la lente divergente

El procedimiento seguido es igual que con el de la lente convergente, pero con dos lentes. Por lo tanto tendremos algo parecido a esto:

![](/blog/2018-5-15/lentes_divergente.png)

Moviendo las lentes hemos encontrado las siguientes posiciones donde la imagen es nítida:

| | \\(s_1 \ \\) [m]| \\(d \ \\) [m]| \\(s'_2 \ \\) [m]|
|---|---|---|---|
| #0 | \\(0.272 \pm 0.001\\) | \\(0.253 \pm 0.001\\) | \\(0.389 \pm 0.001\\) |
| #1 | \\(0.465 \pm 0.001\\) | \\(0.17 \pm 0.001\\) | \\(0.279 \pm 0.001\\) |
| #2 | \\(0.655 \pm 0.001\\) | \\(0.068 \pm 0.001\\) | \\(0.191 \pm 0.001\\) |

#### Determinar la potencia de una lente divergente con su error

Para hacer esta parte vamos a coger la primera posición, es decir:

$$

s_1 = 0.272 \pm 0.001 \ m; \qquad s'_ 2 = 0.389 \pm 0.001 \ m; \qquad d = 0.253 \pm 0.001 \ m

$$

De la parte anterior, sabemos que la potencia de la lente será \\(D_1 = 5.87 \pm 0.02\\) dioptrías. Entonces podemos determinar \\(s'_ 1\\):

$$

5.87 = \frac{1}{s'_ 1} + \frac{1}{0.272} \Rightarrow s'_ 1 = 0,454 \ m

$$

Con todo lo anterior ya podremos determinar A y B, y también la potencia de la lente divergente:

$$

A = \frac{1}{s_1} = \frac{1}{0.272} = 3.67 \ m^{-1} \qquad B = \frac{1}{s'_ 2} = \frac{1}{0.389} = 2.57 \ m^{-1}


\\

D_2 = B - \frac{D_1 - A}{1 - d(D_1 - A)} = 2.57 - \frac{5.87 - 3.67}{1 - 0.253(5.87 - 3.67)} = -2.43 \ dioptrías

$$

Para calcular su error será:

$$

\Delta D_2 = \Bigg \lvert \frac{\delta D_2}{\delta B} \Bigg \lvert \Delta B + \Bigg \lvert \frac{\delta D_2}{\delta D_1} \Bigg \lvert \Delta D_1 + \Bigg \lvert \frac{\delta D_2}{\delta A} \Bigg \lvert \Delta A + \Bigg \lvert \frac{\delta D_2}{\delta d} \Bigg \lvert \Delta d = 0.033 \ dioptrías

\\

\Rightarrow D_2 = -2.43 \pm 0.033 \ dioptrías

$$

Los resultados obtenidos son totalmente razonables. Como por ejemplo que la lente divergente tenga potencia negativa, pues es cómo debería de ser. Los valores de los errores son muy bajos, eso también nos da una idea de que vamos en buen camino.

amil101@debian:~$ EXIT

### Bibliografía
* [https://commons.wikimedia.org/wiki/File:Focal-length-a.png](https://commons.wikimedia.org/wiki/File:Focal-length-a.png)
* [https://commons.wikimedia.org/wiki/File:Focal-length-b.png](https://commons.wikimedia.org/wiki/File:Focal-length-b.png)
