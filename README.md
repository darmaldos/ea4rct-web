# EA4RCT-web

Este es el repositorio de la nueva web del Radioclub. Está alojada en `radio.clubs.etsit.upm.es`. Está creada con [gohugo](https://gohugo.io/), [Markdown](http://es.wikipedia.org/wiki/Markdown) y `HTML/CSS`.

## ¿Cómo está desarrollada?

La plantilla está creada con `HTML/CSS/BOOTSTRAP`, aunque cada página individual está escrita en markdown con la idea de simplificar su creación y mantener un estilo uniforme en toda la web.

Para tareas de construcción, está hecho con `gohugo`.

La página cuenta con algunas automatizaciones hechas con *Zapier*:

1. Cuando se publica una nueva actividad se envia directamente un correo a la lista de correo del radioclub y se añade la actividad al calendario del RadioClub.

2. Cuando se publica un nuevo post en el blog se envia un correo a la lista de correo del radioclub.

## ¿Cómo instalar Hugo?

Para instalar Hugo en tu máquina Linux escribe en el terminal `snap install hugo`.

Para más información: [Install Hugo](https://gohugo.io/getting-started/installing/)

## ¿Cómo usar Hugo?

Para utilizar Hugo vete a la carpeta raiz  de la web y ejecuta:

```
$ hugo server
```

## ¿Cómo añadir una nueva actividad?

Para añadir una nueva actividad a la página web, copia el fichero `examples/2018-12-02-Taller-ejemplo.md` en la carpeta `content/projects/` y llámalo con el nombre de la actividad con la forma:

```
2018-09-10-Taller-Arduino.md
```

Y las carpetas quedarán de la forma:

```
├── content
│   ├── activities
│   │   ├── 2018-09-10-Taller-Arduino.md
```

Actualiza el fichero con la información de la actividad.

Para ver la página de la actividad ejectura `hugo server` y entra en la dirección que te proporciona el comando.

## ¿Cómo añadir un nuevo post al blog?

Para añadir un nuevo post al blog, copia el fichero `examples/2019-01-28-Nombre-del-post-del-blog.md` en la carpeta `content/blog/` y llámalo con un nombre descriptivo del blog:

```
2019-01-28-Nombre-del-post-del-blog.md
```

Y las carpetas quedarán de la forma:

```
├── content
│   ├── blog
│   │   ├── 2019-01-28-Nombre-del-post-del-blog.md
```

Actualiza el fichero con la información del post. Echa un vistazo antes a las categorias y los tags, para poner los tags que encajen con tu post.

Para ver la página de la actividad ejectura `hugo server` y entra en la dirección que te proporciona el comando.


## Añadiendo imágenes

Si quieres añadir imagenes en tu página, pon las imágenes en `static/blog/TITULODELPOST/` si es un post del blog, y `static/activities/TITULO_DE_LA_ACTIVIDAD`. Y en el post puedes referencial la imagen así:

```
![Descripción de la imagen](/blog/TITULODELPOST/imagen1.jpg)
```


## Añadiendo ecuaciones matemáticas

Las ecuaciones matemáticas se hacen con MathJax **siguiendo la sintaxis de LaTeX**.

Cuando quieras añadir una ecuación matmática, hazlo de la siguiente forma:

```
<div>
$$
\sqrt{\frac{\lambda}{\ro}}
$$
</div>
```

En hugo actualmente hay problemas con el `_`, que se utilizan para los subíndices , tienes que escribirlo de la forma `$ 2\_{asdf} $` o `$ var_ 2$`.
