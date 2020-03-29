---
layout:  post
author: Pablo Álvarez
published: true
date: 2020-03-29  # La fecha va con la forma YYYY-MM-DD
title: "Control de la estación de satélites desde dispositivos Android"
tags: [
  proyectos,
  antenas,
  satélites,
  SDR,
  android,
  apps
]
categorias: [
  proyectos,
  SDR
]

---

# Control de la estación de satélites desde dispositivos Android

Debido a la actual situación en que nos encontramos (de cuarentena y sin poder salir de casa), nos es extremadamente difícil avanzar en el desarrollo de cualquier proyecto que implique el uso o diseño de hardware. Es por ello que decidimos aprovechar este periodo para la mejora de los servicios telemáticos del RadioClub (puesta a punto y actualización de servidores, automatización de tareas de mantenimiento, etc.).

Durante una de estas tardes de desarrollo de software surgió la siguiente conversación:

— Oye, pues estaría guapo poder mover las antenas desde el móvil.
— ¿Para qué?
— Para nada, pero estaría guapo
— La verdad que sí

Fue así como decidimos desarrollar una aplicación que se conectara al servidor de Hamlib al que se encuentra conectado el rotor de la estación de satélites, para ser capaz de controlarlo desde dispositivos Android.


## Funcionamiento de la aplicación

La aplicación desarrollada consta de 3 apartados: un socket TCP para la comunicación con el rotor, un sistema de predicción de los próximos satélites meteorológicos que se van a recibir desde el RadioClub (a fin de que el usuario no intente mover la antena durante el paso de un satélite entorpeciendo su recepción) y una pestaña de ajustes que nos permite modificar la dirección IP y puerto del servidor al que nos conectamos.

### Socket TCP

Para la creación de un socket TCP, basta crear una clase AsyncTask dentro de nuestra actividad principal (las tareas relacionadas con la comunicación en red no pueden ejecutarse en la misma hebra que la intefaz de usuario, de ahí la necesidad de declararla como AsyncTask).

En nuestro caso, reutilizamos parte del código publicado en [este repositorio](https://github.com/dombrock-archive/TCPz-Android) (no es necesario reinventar la rueda), modificándolo para que en lugar de enviar mensajes arbitrarios, envíe los comandos necesarios para que nuestro servidor rotctld los reconozca. Estos comandos pueden consultarse desde [este enlace](http://manpages.ubuntu.com/manpages/xenial/man8/rotctld.8.html#commands). Concretamente, nos centraremos en los comandos *p* (get_position) y *P AZ EL* (set_position):

![](https://i.imgur.com/TfAntsT.png)

Cuando se pulse un botón en la aplicación de Android, se actualizará una variable booleana f correspondiente al botón pulsado y se llamará al método actualizaMensaje, el cual modifica la variable de clase msg en función del comando a enviar. Posteriormente, se llamará a sendMessage, encargado de ejecutar la AsyncTask del socket TCP:

![](https://i.imgur.com/DLQDI3t.png)

Es importante tener en cuenta que cada usuario querrá conectarse a un rotor distinto, que estará conectado a un servidor con dirección IP diferente a la nuestra. Es por ello que tanto la IP como el puerto con los que se establece la conexión se almacenarán en las variables de clase *server_address* y *server_port* y se podrán modificar desde ajustes.

![](https://i.imgur.com/6lnGaja.png)

### Actividad de ajustes para la modificación de parámetros

Para la creación del menú de ajustes recomendamos la lectura de este [tutorial](https://medium.com/@bhavyakaria/step-by-step-guide-to-create-app-settings-using-preferences-in-android-part-1-fa470305b530), que fue el que tuvimos en cuenta para el desarrollo de la aplicación.

Debemos crear, por un lado, una segunda actividad Settings hija de nuestra MainActivity, de forma que al finalizar Settings se vuelva a la interfaz principal. Por otro lado, serán necesarios unos objetos toolbar y menú en la interfaz de MainActivity, de forma que al pulsar sobre la barra de herramientas se despliegue un menú con opciones, entre las que se encontrará la de ajustes.

Una segunda clase llamada SettingsFragment se encargará del manejo del objeto SharedPreferences, donde se guardarán las preferencias del usuario. Este objeto se comparte entre las distintas clases, pudiendo leerse así los datos seleccionados en Ajustes desde nuestra actividad principal:

![](https://i.imgur.com/tsM9mY5.jpg)


### Lectura de los próximos satélites

Es importante que lo usuarios de la aplicación tomen conciencia y eviten mover las antenas mientras se está recibiendo un satélite meteorológico. Para identificar cuándo se recibirá uno de setos satélites, aprovechamos que sabemos de antemano que la estación captará automáticamente aquellos pasos de los satélites NOAA 15, 18 y 19 y Meteor M-N2 de más de 20º de elevación. Para obtener estos pasos, se pueden seguir dos caminos distintos: descargar los archivos TLE (Two Line Element) de cada satélite y realizar los cálculos pertinentes para obtener la órbita del satélite o conectarse a una API externa que ofrezca dicha información. En nuestro caso, optamos por la segunda opción, utilizando la [API de N2YO](https://www.n2yo.com/api/).

Obtener los datos que buscamos es extremadamente sencillo gracias a esta herramienta. Sólo necesitamos realizar una petición GET con el formato que nos indica la documentación y se nos devolverá un objeto JSON con los datos requeridos. Además, nos permite filtrar pasos según su elevación máxima, ahorrándonos el trabajo de tener que realizar el filtrado manualmente.

La respuesta a una petición GET por parte del servidor tendrá la siguiente forma:

![](https://i.imgur.com/7oLwXKz.png)

Se trata de un JSONArray de 2 elementos (info y passes), donde a su vez passes es otro JSONArray con la información que buscamos. Para recibir el objeto y quedarnos sólo con los pasos, utilizaremos el siguiente código:

![](https://i.imgur.com/WrrsdBc.png)

Donde el método getResponse se encarga de realizar la petición:

![](https://i.imgur.com/CCBulhH.png)


Una vez hecho esto, debemos tomar el valor de los campos *startUTC* y *endUTC* y convertirlos de formato de fecha UNIX a un formato estándar:

![](https://i.imgur.com/m56LnxF.jpg)

Finalmente, se sacarán estos datos por pantalla.

## Descarga de la aplicación

Toda la información relacionada con la app se puede encontrar en su [repositorio de Gitea](https://git.radio.clubs.etsit.upm.es/Pablo/ControlAntenas_Android).

No sólo encontrarás el archivo .apk para la instalación, sino todo el código fuente de la applicación y los archivos necesarios para la importación del proyecto desde Android Studio.

## Conclusión

Graacias a este proyecto aprendimos a implementar comunicaciones en red en aplicaciones android (tanto peticiones web como sockets). Si bien su utilidad práctica parece reducida, no deja de ser una forma más de intentar modernizar los equipos de radio, adaptándolos a los tiempos actuales.

Esperamos que demostraciones de esta aplicación ayuden también a generar un interés hacia el RadioClub y la radioafición por parte de estudiantes de nuevo ingreso o jóvenes a los que les atraigan las nuevas tecnologías.


*~mamado@ea4rct*




