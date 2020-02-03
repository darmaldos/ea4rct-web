---
layout: post
published: true
title: Propuesta de proyecto - Estación automática para la recepción de satélites meteorológicos en VHF
date: 2020-02-03  # La fecha va con la forma YYYY-MM-DD
tags: [
  "automatización estación meteorológica VHF",
  "VHF",
  "Proyecto",
  "Radioafición"
]
categorias: [
  "Radioafición",
  "Antenas",
  "Proyecto"
]
---

## Abstract

Se propone el desarrollo de un sistema de telecomunicaciones automático para el seguimiento, recepción y descodificación de señales emitidas por satélites meteorológicos en VHF como proyecto para el curso 2019-2020. En el se incluyen las etapas de diseño, simulación, prueba y construcción de elementos básicos que conforman los sistemas de radiocomunicación, tales como antena, filtro, amplificador e inyector de DC. Se usará un SDR para el muestreo y digitalización de la señal obtenida, estando este conectado a un servidor, de forma que se pueda demodular y decodificar la señal remotamente. Las imágenes recibidas se publicarán para estar accesibles al público general, y se usarán para el seguimiento de femómenos medioambientales y meteorológicos.


## Origen y fundamento

Gran parte de los socios del RadioClub E.I.T. somos estudiantes de Inteniería de Telecomunicaciones que nos encontramos en nuestros últimos años de grado o carrera. Surgió un día por tanto la iniciativa de realizar un proyecto que involucrara a un gran número de personas y que nos sirviera para ver una utilizad práctica a todo lo aprendido durante estos últimos años. Además, el hecho de desarrollar de forma independiente un proyecto de radiocomunicaciones desde cero se podría plantear como un reto a nosotros mismos de cara a nuestro futuro como ingenieros.

Tras barajar diversas opciones, se concluyó que existe un interés general entre los miembros del Club por las comunicaciones Tierra-Espacio, tanto satelitales como con sondas u otro tipo de artefactos. Contamos además con tres socios becados en la Agencia Espacial Europea, junto con otros afiliados becados en proyectos de investigación relacionados con radiocomunicaciones en satélites, por lo que sería ideal encontrar un proyecto relacionado con esta temática.

Buscando datos acerca de los distintos tipos de satélites que existen, la información que envían y sus sistemas de comunicaciones, descubrimos los satélites meteorológicos en VHF. Tras buscar más información acerca de ellos, se decidió que podría resultar un proyecto interesante y, a su vez, dentro de nuestro alcance. Fue entonces cuando se acordó desarrollar una estación especializada para la recepción de este tipo de satélites.

## Objetivos

* Comprender de forma detallada el funcionamiento de las comunicaciones satelitales para satélites en órbita LEO, con especial énfasis en los problemas que éstas presentan y posibles soluciones.
* Estudiar la viabilidad de un proyecto y comparar posteriormente los valores teóricos esperados con los obtenidos experimentalmente.
* Aplicar de forma prática gran parte de los conocimientos aprendidos durante la carrera mediante el desarrollo un sistema de comunicaciones completo.
* Ofrecer de forma pública un servicio de imaginería a través de satélite gratuito y actualizado.
* Analizar la situación meteorológica y medioambiental actual y su evolución a lo largo del tiempo.
* Mejorar las relaciones entre los miembros del RadioClub y fomentar el compañerismo y trabajo en equipo.


## Destinatarios

La realización del proyecto se llevará a cabo íntegramente por estudiantes socios del RadioClub E.I.T. De este modo, se les ofrece la oportunidad de poner en práctica los conocimientos aprendidos a lo largo de la carrera al desarrollar desde cero un sistema de radiocomunicaciones satelital.

Sin embargo, uno de los objetivos de la actividad es poder ofrecer acceso libre a la información recolectada por estos satélites. Al automatizar todo el proceso de demodulación, descodificación y subida a internet de las imágenes, éstas pasarían a estar a disposición del público general. De este modo, cualquier persona podría acceder a nuestra web para obtener en directo la imagen emitida por el satélite a su paso. Además, se imprimirán y mostrarán periódicamente aquellas imágenes que consideremos más llamativas para dar a conocer el proyecto y, de este modo, conseguir que el resto de alumnos de la Escuela se interesen por la actividad.

## Organización interna

Los miembros del Radioclub E.I.T. han manifestado un especial interés en este proyecto, previéndose una gran participación. Es por ello que se precisará de una estructura funcional compuesta por un coordinador (Pablo Álvarez Domínguez) y los siguientes equipos de trabajo:

* **Equipo de antena**: encargado del diseño, simulación, construcción, sintonización y ensamblado de la antena Yagi-Uda. Estará dirigido por Alberto Rojo Valencia.

* **Equipo de filtro**: encargado del diseño y simulación del filtro. Además, se encargará del diseño de una PCB para su implementación, de la soldadura de los componentes y de la posterior prueba y medida del filtro construido. Lo coordinará Alejandro Ramos Martín

* **Equipo de transmisión**: encargado de elegir la longitud del coaxial, su localización, conectores a utilizar y diseño y construcción del inyector de Corriente Continua. El encargado de este grupo será Pablo López Querol.

* **Equipo de software**: encargado de configurar el tracker de satélites, la Raspberry Pi y su servidor, el demodulador de la señal y el descodificador de imágenes. Su responsable será Francisco José Acién Pérez.

## Lugar de realización

Durante el desarrollo del proyecto, la mayor parte del trabajo tendrá lugar en el propio RadioClub.

La construcción de la antena, la soldadura de las distintas PCBs necesarias y la programación del sistema de software se realizarán íntegramente en el aula de la que disponemos, donde contamos con instrumentación especializada para este tipo de tareas. La prueba de la antena y filtro se realizará en la terraza de la ETSIT, para lo cual se solicitarán los permisos oportunos.

Una vez se haya comprobado el correcto comportamiento del sistema global, se ensamblará de forma definitiva la antena al rotor del que disponemos en dicha terraza y se instalará, también de forma definitiva, el servidor asociado al SDR. Una vez se encuentre todo funcionando, las imágenes se descodificarán de forma automática desde el RadioClub y serán accesibles globalmente.

## Cronograma

![](/blog/2020-02-03/crono.jpg)

## Participación, recursos y medios

A comienzos de cuatrimestre se realizó una jornada inicial de introducción donde se expusieron tanto aspectos básicos sobre la organización y desarrollo del proyecto como información sobre el funcionamiento de los satélites y sus sistemas de comunicaciones. A raíz de este evento, se realizó un recuento de socios dispuestos a participar de forma activa en el proyecto. Actualmente contamos con un equipo de trabajo de 27 personas, lo que supone una mayoría de socios con interés en la realización de la actividad.

Con respecto a la instrumentación necesaria, cabe destacar que, ya que este proyecto se basa principalmente en el diseño y construcción de equipos de radiocomunicaciones, nos será posible aprovechar gran parte del material (generadores de funciones, fuentes de ruido, osciloscopios, medidores de ROE...) del que ya se dispone en el club.

## Presupuesto de gastos

El coste total del proyeto asciende a la cantidad de trescientos sesenta (360€), el cual se desglosa en la siguiente tabla:

| Concepto | Coste |
|---|---|
|Mástil|10|
|Elementos activos/pasivos|20|
|Tornilleria|5|
|Impresión en 3D| Club |
|Componentes|20|
|PCB|10|
| SPF5189 LNA | 15 |
|COAXIAL| Club|
|Airspy HF+ Discovery|240|
|Raspberry Pi 4B| 40|
|Ordenador| Club |
| Software | Gratuito |
|||
|**TOTAL**| 360€|



## Presupuesto de ingresos

La principal fuente de ingresos del Radioclub E.I.T. son las cuotas anuales de los socios. Debido a gastos periódicos como el mantenimiento de los equipos de radio, seguro de antenas, gestión de equipos telemáticos, costes de DNS, etc, no contamos efectivo suficiente para cubrir el coste total del proyecto.

Con el fin de obtener la financiación necesaria, se lanzará una campaña de crowdfunding desde Ulule (web reconocida y con gran fama a nivel europeo). En caso de recaudar los fondos necesarios, nos comprometemos a publicar de forma abierta y mediante software y hardware libre todos los archivos (gerbers, programas, scripts, diseños para impresión en 3D, etc.) necesarios para la realización de un proyecto idéntico al nuestro, de forma que cualquier persona pueda construir una estación receptora de este tipo de satélites sin necesidad de diseñarla partiendo de cero.

También buscaremos otras fuentes de financiación alternativas, como la publicación de los resultados del proyecto en revistas especializadas de radioaficionados. De todos modos, y ya que estas fuentes de financiación difícilmente cubrirán gran parte del coste final del proyecto, dependemos en gran medida de que la ayuda económica que proporciona la UPM alcance o se aproximen al coste total.

## Seguimiento, evaluación y difusión del proyecto

Al igual que ocurrió en proyectos anteriores, las principales plataformas a través de las cuales realizar el seguimiento del proyecto serán el [servidor gitea del Radioclub E.I.T.](https://git.radio.clubs.etsit.upm.es) y la [páginal web del Club](https://radio.clubs.etsit.upm.es).

Por un lado, tanto los diagramas de bloques, como diseños de piezas en 3D, esquemáticos y gerbers de PCBs, hojas de datos con cálculos y demás documentación técnica se subirá de forma progresiva al servidor de gitea a medida que se vaya desarrollando el proyecto. Por otro, se realizarán entradas en la web del Radioclub con detalles y fotografías según se vayan completando las distintas etapas y bloques que conforman el sistema.

Se podrá seguir la campaña de crowdfunding desde el perfil del RadioClub E.I.T. de Ulule.

Se realizará además una Memoria Final una vez se concluya el proyecto, donde se detallarán procedimientos seguidos, problemas surgidos en el desarrollo del proyecto con sus soluciones, conclusiones, posibles mejoras futuras, justificación de los gastos, etc.

## Anexo 1: Descripción detallada del sistema

El objetivo principal de la actividad es la obtención de imágenes emitidas por satélites meteorológicos en la banda de 137MHz, para su posterior publicación y análisis, permitiendo realizar un seguimiento de diversos fenómenos medioambientales. Entre estos satélites se encuentran los estadounidenses NOAA 15, 18 y 19 (protocolo APT) y los rusos Meteor MN2 y el recientemente lanzado MN2-2 (protocolo LRT). Este tipo de satélites viaja trazando una órbita polar baja (LEO) al rededor de la Tierra, por lo que realizan pasos sobre el cielo de Madrid entre 2 y 3 veces al día. Ya que su función principal es la recolección de datos de la superficie terrestre, cuentan con diversos sensores incorporados orientados hacia nuestro planeta. Nuestra misión es obtener los datos correspondientes a los receptores de longitudes de onda en los rangos visible e infrarrojo, y, a partir de ellos, reconstruir una imagen de la corteza terrestre en el instante del paso del mismo. Todo el proceso estará completamente automatizado.

Las imágenes recibidas se subirán a un servidor web público, con el fin de que sean accesibles al público general y, concretamente, al resto del alumnado y personal de la Escuela.  A partir de ellas se piensa realizar un seguimiento de distintos fenómenos tanto meteorológicos (temperatura terrestre, seguimiento de incendios, aparición de trombas y huracanes en el Océano Atlántico, predicciones meteorológicas a corto plazo, etc.) como medioambientales (seguimiento de las zonas de vegetación en el centro de Europa, niveles de hielo en zonas del norte del continente, evolución de los desiertos y zonas áridas del norte de África, etc.)

Los satélites con los que trabajaremos se encuentran a más de 800Km de altitud y emiten con una potencia cercana a los 5W (37dBm). Debido a las enormes pérdidas que conlleva atravesar la atmósfera a esa frecuencia (sobre todo durante pasos de baja elevación), a nuestra estación sólo llegará una porción mínima de la potencia emitida. Si a esto se le suma la enorme cantidad de interferencias electromagnéticas (RFI) de Madrid (mayor aún al encontrarse en la ETSIT), resulta crucial que el sistema de recepción de la señal esté diseñado con la máxima precisión para poder maximizar la SNR a la entrada del SDR. Por ello, el sistema propuesto para este proyecto se basará en el siguiente esquema de bloques:

* **Antena**: Se optará por una antena Yagi-Uda de polarización circular montada en el rotor del que ya dispone el Radioclub E.I.T. (actualmente existen dos antenas montadas en este rotor, pero en sus especificaciones se indica la capacidad de albergar un máximo de 4 antenas). El hecho de desarrollar una antena direccional mejorará significativamente la SNR a su salida, ya que no sólo la mayor ganancia de la antena en la dirección del satélite ayudará a obtener una mejor recepción de la señal, sino que, además, la menor ganancia en otras direcciones ayudará a reducir el nivel de ruido e interferencias. Se buscará una ganancia de por lo menos 7dBi, y una impedancia de 50Ohm para conseguir adaptación con el resto de la línea. La optimización de las medidas y simulación se realizarán mediante Matlab.

* **Filtro**: Se diseñará un filtro paso banda con frecuencia central en torno a los 137,5MHz. No sólo reducirá el nivel de ruido e interferencia a la entrada del SDR, sino que además resulta indispensable para evitar una saturación del amplificador situado a continuación debido a la elevada potencia recibida procedente tanto de estaciones de telefonía cercanas como de emisoras de radiodifusión FM.

* **Amplificador**: Ayudará a compensar las pérdidas del coaxial que transportará la señal hasta el SDR. Será de bajo nivel de ruido (LNA).

* **Inyector de CC**: Necesario para alimentar el amplificador.

* **SDR**: Elemento crucial en el sistema, encargado de filtrar, muestrear y digitalizar la señal.

* **Raspberry Pi**: con el fin de mantener la longitud del cable coaxial lo menor posible y así evitar las pérdidas de la señal producidas en este tramo de línea de transmisión, interesa que el SDR esté situado a la menor distancia de la antena posibles. Para ello, se utilizará una placa Raspberry Pi conectada al SDR donde se ejecutará un servidor SpyServer, de forma que se pueda acceder de forma remota a los datos en bruto muestreados por el SDR. Se podrá tener acceso a la señal recibida en directo desde cualquier dispositivo del Radioclub, incluyendo el ordenador final, donde se realizará el procesado de la señal.

* **PC**: Computadora donde la señal se filtrará digitalmente, se demodulará y, por último, se descodificará. Se realizará además el tracking de satélites para controlar el rotor. Se hará uso de software gratuito como GPredict, Orbitron, SDRShrap y GNURadio.

## Anexo 2: Justificación del presupuesto

No obstante, será necesaria la adquisición de diversos elementos para la construcción del sistema de comunicaciones.	El material necesario será el siguiente:

### Antena

Será de realización artesanal. Al tratarse de una Yagi-Uda, los principales materiales necesarios para su construcción serán un mástil (tubo de aluminio de sección cuadrada) y elementos directores/dipolo/reflector (tubos de aluminio de pequeño diámetro). Para ensamblar todas las piezas se utilizarán piezas impresas en 3D con hilo de policarbonato (material conocido por su resiliencia y resistencia a cambios de temperatura). Además, se necesitará tornillería.

### Filtro

Aunque los componentes utilizados dependerán del diseño final, se espera que sean necesarios condensadores e inductancias capaces de trabajar en VHF, además de conectores SMA hembra. Se estima que no se utilizará más de media docena de componentes. Se necesitará también una PCB de cobre (sirve una de dieléctrico FR4 con 1,4mm de grosor).

### Amplificador

Se tratará de un módulo basado en el circuito integrado SPF5189. Su ganancia y figura de ruido vienen determinadas por el rendimiento de las etapas previas (antena y filtro). En nuestro caso, se tratará de un LNA de 20dB con una figura de ruido de 1,3dB.

### Cable coaxial e inyector de CC

Por suerte, contamos en el Club con restos de cable coaxial RG-213, ideal para este tipo de proyectos. Además, ya que existe una gran libertad a la hora de elegir los componentes necesarios para el diseño del inyector de CC, se podrán utilizar los sobrantes de proyectos anteriores para la construcción de esta etapa. Se aprovechará parte de la PCB utilizada en el filtro para su construcción.

### SDR

Como ya se comentó anteriormente, el mayor problema al que nos enfrentaremos en este proyecto son los niveles de ruido e interferencias, exageradamente altos al encontrarnos en Madrid (y, concretamente, en una Escuela de Telecomunicaciones). Es por ello que la elección de un SDR que satisfaga nuestras necesidades es estratégicamente determinante para garantizar la viabilidad del proyecto. Se necesita un SDR con suficiente rango dinámico y etapas previas de filtrado de calidad y de bajo factor de ruido. Además, ayudaría en gran medida que dispusiera tanto de un oscilador estable (con desviación de frecuencia típica igual o inferior a los 10ppm) como de un ADC de al menos 10bit. Estos factores son cruciales en situaciones de alta RFI.


Un dispositivo que encaja a la perfección con estas características es el Airspy HF+ Discovery. Este SDR, diseñado por el creador del software SDRSharp, fue lanzado al mercado el pasado verano, y desde entonces no deja de recibir excelentes críticas en foros y revistas especializados. A diferencia del resto de SDRs, cuyo rango de frecuencias suele abarcar de los 50MHz a los 1600MHz, el HF+ Discovery funciona a frecuencias desde los 0,5KHz a los 260MHz. Esto abre multitud de nuevas posibilidades de cara a proyectos futuros, tales como el estudio del ruido electromagnético a VLF/LF o la recepción de WeFax en HF. Destaca su relación calidad precio, ya que, aunque para nuestro club suponga un desembolso importante (220 euros), en la banda de frecuencias a utilizar es capaz de obtener mejores resultados que otros SDR de gama alta como HackRF, LimeSDR o SDRPlay.

### Raspberry Pi

Interesa que la Raspberry Pi sea bien modelo 3A o bien modelo 4 (preferiblemetne esta última), ya que el procesado de los datos recibidos por el SDR a altas frecuencias de muestreo requiere de recursos de cómputo elevados.

### Ordenador

Se destinará uno de los PCs de los que disponemos en el Radioclub para este proyecto, por lo que no será necesario desembolso en hardware. Además, todo el software a utilizar (Orbitron, GPredict, Hamlib, SDRSharp, WXtoImg y GNURadio) es bien open source bien gratuito.

## Anexo 3: Viabilidad del proyecto

Una etapa fundamental antes de comenzar con la realización de cualquier tipo de proyecto es el estudio de su viabilidad. Es por ese motivo que socios del RadioClub se encargaron previamente de realizar los cálculos necesarios para asegurar que es factible obtener los resultados que esperamos con el sistema que pretendemos diseñar.

En primer lugar, se diseñó el balance de enlace correspondiente a la comunicación entre un satélite NOAA y nuestra futura estación receptora en VHF. Para ello, se tomó cierto margen de seguridad y se calcularon los requisitos mínimos que deberá tener el sistema receptor final (ganancia de la antena, figura de ruido del amplificador, etc.) para cercionarse de la viabilidad de la comunicación.

Los siguientes balances de enlace reflejan la diferencia entre dos modelos de LNA propuestos, asumiendo una ganancia mínima de la antena Yagi-Uda de 8dBi

#### Pérdidas de espacio libre

| Variable | Valor | Unidades |
|---|---|---|
|Velocidad de la luz|  3,00E8 | m/s |
| Boltzmann constant | 1,38E-23 | J/K |
| Distancia máx | 3,10E7| m|
| Frecuencia | 137500000 | Hz
| Lambda | 2,18E3 | m |
| Temperatura física | 290 | K |
| Pérdidas espacio libre | 145,04 | dB |

#### Cálculo de la figura de ruido del sistema, caso peor

| Ruido | 10dB LNA | 20dB LNA | Unidades |
|---|---|---|---|
| Temperatura ruido antena | 3200 | 3200 | K |
| Figura de ruido del amplificador | 0,6 | 1,3 | dB |
| Temperatura de ruido del amplificador | 42,96 | 101,20 | K |
| Figura de ruido del SDR | 4,5 | 4,5 | dB |
| Temperatura de ruido del SDR | 527,33 | 527,33 | dB |
| **Temperatura de ruido global del sistema** | **20.284,86** | **197.900,13** | K |

#### Balance de enlace

| NOAA | 10dB LNA | 20dB LNA | Unidades |
|---|---|---|---|
|Frequency|137,5|137,5|MHz|
|Bandwidth|36|36|kHz|
|Transmitter EIRP|40|40|dB|
|Free Space Propagation path Loss Lp|145,04|145,04|dB|
|Other propagation losses|4|4|dB|
|Receive antenna gain Gt|8|8|dBi|
|LNA gain|10|20|dB|
|Leable|2,1|2,1|dB|
|**Received power**|**-93,14**|**-83,13**|dBm|
|Sensibility of SDR @140MHz|-141|-141|K|
|System noise temperature Ts|20284,86|197900,13|K|
|Received noise|-109,97|-100,07|dBm|
|**Received SNR**|**16,83**|**16,94**|dB|
|SNR required | 15|15|dB|
|**Link Margin**|**1,83**| **1,94**|dB|

Posteriormente, se probó a recibir una imagen de un satélite NOAA. Ya que todavía no se dispone de ninguno de los ejementos del sistema anteriormente descrito, diversos miembros del RadioClub ofrecieron su material para realizar las pruebas pertinentes. Éste se basó en una antena omnidireccional de polarización circular con unos 4dBi de ganancia y un SDR idéntico al propuesto para el desarrollo del proyecto. El resultado de captar un paso de elevación 66º se puede ver en la tabla de *pérdidas de espacio libre*.


Dicha imagen fue recibida en un prado situado a unos 500m de la ETSIT, por lo que no es una referencia fiel de los resultados que se obtendrán al instalar el sistema en la terraza de la Escuela (los niveles de ruido e interferencias serán varios órdenes de magnitud mayores, reduciendo en gran medida la relación señal-ruido que tendremos a la entrada del receptor, por lo que con esta configuración de prueba apenas se habría recibido una porción de la imagen anterior). Sin embargo, ya que el sistema a desarrollar tendrá prestaciones muy superiores al utilizado para obtener esta imagen, podemos esperar obtener unos resultados notables una vez finalizado el proyecto.

![](/blog/2020-02-03/noaa.jpeg)
