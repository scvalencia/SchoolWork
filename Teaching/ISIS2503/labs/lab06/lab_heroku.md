# Despliegue de una aplicación REST en la nube
-----

## Objetivos
* Aprender las ventajas del despliegue de aplicaciones REST sobre una plataforma tipo (PaaS).
* Aprender a desplegar una aplicación desarrollada en Java (JEE) haciendo uso de Heroku.
* Aprender a instalar y usar herramientas de monitoreo sobre las aplicaciones desplegadas en la nube.

## Herramientas
* Git
* Heroku
* Java 8
* Maven 3

## Pre-requisitos
* Para poder desarrollar el laboratorio, es necesario contar con un editor de texto (se recomienda el uso de Atom o Sublime Text) o entorno de desarrollo integrado.
* Se debe crear una cuenta gratuita en Heroku, basta con registrar el correo.

## Desarrollo del laboratorio

### Instalación de herramientas

Antés de comenzar con la implementación de la aplicación y el despliegue de la misma, es necesario instalar las herramientas necesarias para el desarrollo del laboratorio. Las herramientas a instalar son Sublime Text (puede usar otra herramienta ara editar el código fuente), Maven 3, y por último la herramienta de Heroku.

Para instalar Sublime Text, diríjase a la página oficial de [Sublime](git clone https://github.com/heroku/java-getting-started.git). Esta cuenta con el archivo de instalación y las instrucciones para su instalación. Para instalar Maven, descarge el .zip de Maven 3.x.x de la página oficial [Maven](git clone https://github.com/heroku/java-getting-started.git). A continuación, descomprima el archivo. La secuencia de instrucciones para la ejecución del comando mvn, se encuentra en ../apache-maven-3.x.3/bin/mvn.bat. Para ejecutar el comando desde cualquier ubicación del sistema de archivos de Windows, es necesario pegar esta ruta al PATH. 

Acontinuación, instale la herramienta de Heroku [Heroku Toolbelt](https://toolbelt.heroku.com/) para su sistema operativo. Revise el éxito de la instalación con el comando heroku en la linea de comandos de sus sistema operativo.

** IMAGEN1 **

También, revise que git se encuentre en el PATH del sistema operativo.

** IMAGEN2 **

Por último, revise la instalación de Maven en su máquina.

** IMAGEN3 **

----
Descargue y descomprima el archivo ubicado en : (https://github.com/ISIS2503-2015-02/Labs/blob/master/lab-cloudHeroku.zip). El proyecto contiene el código de una aplicación REST muy sencilla, la idea, es desplegar el código en los servidores de Heroku, de manera que la base de datos y la configuración del dominio sea remóta. Sobre la carpeta descomprimida, ejecute el comando ``git init```, el cual sirve para crear un repositorio en el directorio actual de trabajo. Ahora, es necesario crear el proyecto en Heroku. Para esto, ejecute e interactúe con Heroku:

```heroku login``` para suministrar sus credenciales
```heroku create```para crear la aplicación. El nombre de la aplicación debe ser labheroku<codigo>.
```heroku open```para revisar que su aplicación se halla desplegado debidamente. Si así fue, debe ver en la ventana de su navegador el siquiente mensaje.

** IMAGEN4 **

Ahora, suba los cambios al repositorio. (```git add```, ```git commit```, ```git push```desde la linea de comandos). Para subir los cambios a Heroku, ejecute el comando ```git push heroku master```. Nuevamente, revise el despliegue de la aplicación. 

Para conectarse con la base de datos, seleccione la aplicación en su dashboad de Heroku.

** IMAGEN5 **



### 




