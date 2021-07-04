---
layout: post
published: true
title: "Diseño de Filtro Paso Banda para la recepción de satélites meteorológicos y banda de 2m"
date: 2021-01-19  # La fecha va con la forma YYYY-MM-DD
tags: [
 "radioaficion",
 "satelites",
 "filtro"
]
categorias: [
 "radioaficion",
 "satelites",
 "filtro"
]
image: /blog/2021-01-19/PCBDelante.png
---

Desde el RadioClub, seguimos publicando toda la información relativa a nuestros proyectos de recepción de satélites meteorológicos. En esta ocasión, presentamos el diseño de un filtro paso banda cuya banda de paso abarca desde las frecuencias utilizadas por satélites meteorológicos hasta la banda de radioaficionados de 2m.

![](/blog/2021-01-19/PCBDelante.png)

## Cadena receptora

Retomando donde lo dejamos en la entrada anterior, contamos ya con una antena direccional sintonizada a la frecuencia de emisión de los satélites que nos interesan acoplada a un sistema de tracking automatizado. Sin embargo, es necesario añadir ciertos elementos a nuestro sistema a fin de conseguir el rendimiento óptimo. Si conectáramos el SDR directamente a la antena, es probable que fuéramos capaces de recibir la señal buscada con suficiente potencia para ser capaz de descodificarla y obtener unas primeras imágenes. No obstante, existirán dos principales factores que producirán una grave degradación de la SNR a la entrada del desmodulador:

- **Elevado factor de ruido del sistema** Si bien nuestro SDR (un Airspy HF+ Discovery) se caracteriza por contar con una figura de ruido relativamente baja (en torno a 3dB), añadiendo a este valor la contribución al ruido generada en la bajada de cable coaxial, observarmos cómo la potencia de ruido total a la entrada del desmodulador es especialmente elevada. Tomando una atenuación del cable de 3,2dB (8dB/100m según la [hoja de datos](https://www.fscglobal.com/sites/admin/plugins/elfinder/files/fsglobal/Datasheets/390213H.pdf) del fabricante), y asumiendo que éste se encuentra a la temperatura de referencia (lo que equivale a que su factor de ruido sea igual a su atenuación), podríamos aplicar la fórmula de Friis para obtener una figura de ruido global de 6,2dB:

<div>
$$
f_{tot}=f_{cable}+a_{cable}(f_{SDR} -1)\approx 6.2\text{dB}
$$
</div>

- **Presencia de señales de elevada potencia en frecuencias próximas.** Los satélites a recibir emiten en frecuencias extremadamente cercanas a la banda reservada para radiodifusión FM (88MHz - 108MHz). La elevada potencia con que emiten estas estaciones de radio puede producir tanto saturación del amplificador de señal situado a la entrada del SDR como del desmodulador en sí.

Como solución al primer problema, se propone la introducción de un preamplificador de bajo nivel de ruido (LNA por sus siglas en inglés). El uso de un preamplificador de tan sólo 18dB de ganancia y 0,6dB de figura de ruido conseguiría mejorar sustancialmente el factor de ruido del sistema completo:

<div>
$$
f_{tot}=f_{LNA}+\frac{1}{g_{LNA}}(f_{cable} -1)+\frac{a_{cable}}{g_{LNA}}(f_{SDR} -1) \approx 0.78\text{dB}
$$
</div>

En lo referido al segundo inconveniente, éste podría ser solucionado de forma sencilla mendiante la inclusión de un filtro de RF. Si bien un mero filtro banda eliminada conseguiría hacer frente a la saturación causada por la radiodifusión FM, se optó por el diseño de un filtro paso banda. Un filtro de este estilo cuya banda de paso fuera capaz de abarcar tanto el rango de frecuencias usado por satélites meteorológicos como la banda de 2m de radioaficionados ofrecería un amplio rechazo a todo tipo de posibles señales interferentes independientemente de su localización en el espectro.

Una vez más, cabe señalar que todos los ficheros relacionados con el diseño de este filtro (ADS, KiCAD, Gerber...) se encuentran disponibles en su [correspondiente repositorio de GiTea](https://github.com/WX-Ground-Station-RadioClub-E-I-T/filtro-2m-noaa).

## Especificaciones del filtro


|      **PARAMETRO**     |    **VALOR**   |
|:----------------------:|:--------------:|
|Tipo | Tchebyshev|
|Impedancia entrada/salida | 50 Ohm|
|Frecuencia de corte inferior (3dB) | 125MHz|
|Frecuencia de corte superior (3dB) | 150MHz|
|Pérdidas de inserción | 1dB máx.|
|S11 en banda de paso | -15dB máx.|
|Rechazo banda radiodifusión FM | 45dB (min)|
|Rechazo banda radiodifusión TV | 50dB (min)|

## Diseño

El diseño del filtro se efectuó mediante el uso de la herramienta Advanced Design System (ADS). Los ficheron generados se encuentran disponibles en el [repositorio del proyecto](https://github.com/WX-Ground-Station-RadioClub-E-I-T/filtro-2m-noaa).

Posteriormente, se procedió al diseño de una PCB con su consecuente trazado de gerbers. Tanto los archivos de proyecto como los gerbers se encuentran también públicos.

El diseño final del filtro se muestra en el siguiente esquemático:

![](/blog/2021-01-19/KicadSch.png)

Los componentes necesarios para su construcción son:


| Componente | Valor | Métrica |
|:----------:|:-----:|:-------:|
|     C1     |  10pF |   0805  |
|     C2     | 2,7pF |   0805  |
|     C3     | 2,2pF |   0603  |
|     C4     |  10pF |   0805  |
|     C5     | 1,5pF |   0603  |
|     C6     |  10pF |   0805  |
|     C7     | 2,2pF |   0603  |
|     C8     | 2,7pF |   0805  |
|     C9     |  10pF |   0805  |
|     L1     | 100nH |   0603  |
|     L2     | 100nH |   0603  |
|     L3     | 100nH |   0603  |
|     L4     | 100nH |   0603  |
|     L5     | 100nH |   0603  |
| Conectores |  SMA  |    -    |


Asimismo, es necesario fabricar la correspondiente placa de circuito impreso. Dada la sencillez del diseño y el tamaño de las pistas utilizadas, es posible fabricarla de forma casera mediante atacado de ácido en una PCB virgen de doble cara. No obstante, en nuestro caso optamos por enviar los planos a una empresa, recibiendo las piezas fabricadas con calidad profesional. Independientemente del método utilizado, resulta de vital importancia realizar una elección adecuada del substrato. La línea de transmisión utilizada en nuestro caso se adapta a un dieléctro FR4 de permitividad 4,4 y grosor 1,565mm (1,6mm).

En las siguientes imágenes se muestran las capas superior e inferior de la placa una vez rematada la etapa de rutado.

Capa superior:

![](/blog/2021-01-19/F.Cu.png)

Capa inferior:

![](/blog/2021-01-19/B.Cu.png)

## Resultados de las simulaciones

Por último, añadimos los resultados con la respuesta en frecuencia teórica del filtro. Una vez más, estas gráficas fueron obtenidas mediante el uso del software ADS.

**Parámetros S**

![](/blog/2021-01-19/S.jpeg)


**S11 (Carta Smith)**

![](/blog/2021-01-19/smith.jpeg)

Como se puede observar, la respuesta en frecuencia resulta idónea para trabajar la banda de frecuencias en que se desarrollan nuestros proyectos.

## Conclusiones

El filtro mostrado, en conjunto con el LNA comprado, ayudarán a mejorar en gran medida la calidad de nuestro sistema receptor de satélites, al rebajar tanto el nivel de ruido global como la potencia de posibles interferencias a la entrada del desmodulador. Esperamos poder recuperar el acceso a las instalaciones del Club en breve para poder finalizar su construcción y caracterización.

![](/blog/2021-01-19/PCBdetras.png)


_mamado@EA1FID_
