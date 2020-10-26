---
layout: post
published: true
title: Propuesta de proyecto - Implementación de la estación del RadioClub en la red de SatNogs
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
  "Proyecto",
  "Satnogs"
]
---

## Actividad

La actividad que se propone realizar es la implementación de la estación terrena de satélites del RadioClub E.I.T en la red de [satnogs](https://network.satnogs.org/). Esta red consiste en estaciones radio distribuidas por todo el globo que hacen seguimiento todos los satélite
s de radioaficionado.

El trabajo de la [Libre Space Foundation](https://libre.space/) con la creación de esta red ha sido bastante aceptada por la comunidad de Software Libre y de Radioafición. Los resultados obtenidos son muy buenos, siendo el principal portal para la consulta de datos de satélites en abierto.

![](/blog/2020-02-03/2_satnogs.png)

## Origen y fundamento del proyecto

Desde la creación de la red de Satnogs, hace 5 años, cada vez son más las estaciones incluidas y más decodificadores. Su creación ha supuesto un cambio en la forma de recibir satélites. Supone una fuente fiable y abierta de la recepción de datos de gran valor.

El software [Satnogs](https://network.satnogs.org/) consiste en un conjunto de programas para automatizar la recepción de satélites, y la subida de los datos a una base de datos pública. Es capaz de mover las antenas cada vez que un satélite va a pasar, mueve las antes, graba la transmisión, la decodifica y sube los datos a la red.

Para ser parte de la red hay que tener una estación terrena que se controle por software, y dar control por serie al programa Satnogs, controlado por un conjunto de librerías de software Libre.

En España hay 6 estaciones operativas, y ninguna de ellas en Madrid ni alrededores. Sería muy importante tener una por Madrid para su aprovechamiento de Universidades, RadioClubes y radioaficionados de la zona.

La estación de satélites del RadioClub lleva en funcionamiento desde hace 10 años. Este proyecto supondrá un paso más allá, pues se aprovechará todo el tiempo recibiendo los satélites de forma automática.

Se trata de un proyecto que puede ayudar mucho a la comunidad ciéntifica, a los grupos de investigación y estudiantes de la escuela. Las recepciones obtenidas son de gran valor. Los satélites que se podrán recibir diaríamente darán datos útiles para muchas aplicaciones, y la obtención libre y fiable es muy importante.

## Denominación del proyecto, responsables y equipo de trabajo

El responsable del proyecto será **Francisco Jesús Acién Pérez**. Se espera reunir un equipo de trabajo de 15 personas ampliable según se desarrolle el proyecto, dado el interés general de los miembros del club en las comunicaciones satelitales.

## Actividades a realizar: denominación, descripción y metodología

Se trata de un proyecto mayoritariamente de Software.

Las tareas a realizar serán:

1. Estudio del estado de la Estación de Satélites
2. Conexión de todos los sistemas al ordenador central
1. Implementación en la red con Linux
1. Comprobación de su funcionamiento

### Cronograma de ejecución

En el siguiente diagrama se mostrará el calendario propuesto para el proyecto. Las referencias de la tareas son las seguidas en la metodología propuesta en la sección anterior.

![](/blog/2020-02-03/crono_satnogs.png)


## Lugar de realización

El proyecto se realizará íntegramente en el RadioClub E.I.T de la ETSIT UPM.

## Recursos o medios

Los recursos con los que cuenta el RadioClub E.I.T permiten la viabilidad del proyecto. Contamos con antenas, receptores de radio, libros del tema, y profesores que nos apoyan.

Aprovecharemos la actual estación de satélites del RadioClub para este proyecto. La estación de satélites cuenta con una antena yagi de VHF y otra de UHF, así como rotor y preamplificador.

Para esta actividad se necesitará de la participación de los socios del club interesados en software, radioafición, satélites o sistemas.

La gran parte de los materiales necesarios ya están en el RadioClub como parte de proyectos desarrollados en el pasado. Gracias a todo el trabajo detrás del RadioClub se podrá desarrollar este proyecto.

Sólo necesitaremos los materiales para el control automático de la estación. Los recursos que necesitaremos serán los materiales más adelante detallados.

## Presupuesto detallado de ingresos y gastos

Los ingresos que cuenta el club son las cuotas de los socios que son anuales. Ese dinero se destina al mantenimiento de los equipos del club de Radio, tales como: seguro de antenas, gestión de los equipos telemáticos, costes de DNS, etc. Es por ello que no contamos con efectivo suficiente para asumir el coste total de la realización del proyecto, por lo que esperamos que gracias a la Ayuda a Asociaciones Universitarias de la UPM alcancemos el total del presupuesto previsto.

No será necesario la construcción de una nueva estación de satélites porque usaremos la que ya disponemos, fruto de un proyecto desarrollado hace 10 años.

Los materiales necesarios serán:

* **Nooelec Nooelec NESDR SMArt v4 SDR**
*  **LNA** (basado en el chip SPF5189)
* **Raspberry Pi 4**

| Producto | Precio | Cantidad |
|---|---|---|
| Nooelec NESDR SMArt v4 SDR | 35€ | 1 |
| LNA | 35€ | 1 |
| Raspberry Pi 4 | 40€ | 1 |
| **TOTAL** | **110€** |

## Seguimiento y evaluación del proyecto

El seguimiento del proyecto se desarrollará en la [página web del club](https://radio.clubs.etsit.upm.es/). Todos los resultados **se reflejarán en diferentes artículos en la web** conforme vaya avanzando el proyecto. Además, se ofrecerá información detallada sobre el desarrollo del proyecto en el servidor [Gitea del RadioClub](https://git.radio.clubs.etsit.upm.es/)

Al finalizar el mismo, se creará un artículo exponiendo los resultados del mismo, los diagramas electrónicos, software desarrollado, etc.

Además, al finalizar el proyecto, se creará una **Memoria Final del proyecto** con los resultados obtenidos, planteamiento del proyecto, organización y desarrollo, grado de consecución de los objetivos, conclusiones, los aspectos de mejora, difusión realizada y justificación de los gastos.
