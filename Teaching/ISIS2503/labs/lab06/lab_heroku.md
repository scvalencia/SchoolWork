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

![](https://raw.githubusercontent.com/scvalencia/SchoolWork/master/Teaching/ISIS2503/labs/lab06/IMAGEN1.png)

También, revise que git se encuentre en el PATH del sistema operativo.

![](https://raw.githubusercontent.com/scvalencia/SchoolWork/master/Teaching/ISIS2503/labs/lab06/IMAGEN2.png)

Por último, revise la instalación de Maven en su máquina.

![](https://raw.githubusercontent.com/scvalencia/SchoolWork/master/Teaching/ISIS2503/labs/lab06/IMAGEN3.png)

----
Descargue y descomprima el archivo ubicado en : (https://github.com/ISIS2503-2015-02/Labs/blob/master/lab-cloudHeroku.zip). El proyecto contiene el código de una aplicación REST muy sencilla, la idea, es desplegar el código en los servidores de Heroku, de manera que la base de datos y la configuración del dominio sea remóta. Sobre la carpeta descomprimida, ejecute el comando ``git init```, el cual sirve para crear un repositorio en el directorio actual de trabajo. Ahora, es necesario crear el proyecto en Heroku. Para esto, ejecute e interactúe con Heroku:

```heroku login``` para suministrar sus credenciales
```heroku create```para crear la aplicación. El nombre de la aplicación debe ser labheroku<codigo>.
```heroku open```para revisar que su aplicación se halla desplegado debidamente. Si así fue, debe ver en la ventana de su navegador el siquiente mensaje.

![](https://raw.githubusercontent.com/scvalencia/SchoolWork/master/Teaching/ISIS2503/labs/lab06/IMAGEN4.png)

Dentro de la carpeta del proyecto, cree un archivo llamado ```system.properties```el cual contenga la siguiente linea.

```
java.runtime.version=1.8
```

Ahora, suba los cambios al repositorio. (```git add```, ```git commit```, ```git push```desde la linea de comandos). Para subir los cambios a Heroku, ejecute el comando ```git push heroku master```. Nuevamente, revise el despliegue de la aplicación. 

Para conectarse con la base de datos, seleccione la aplicación en su dashboad de Heroku.

![](https://raw.githubusercontent.com/scvalencia/SchoolWork/master/Teaching/ISIS2503/labs/lab06/IMAGEN5.png)

Seleccione la opción para agregar más adiciones. Seleccione la de PostgreSQL. Instale el plug-in a la aplicación en progreso.

** IMAGEN6 **
** IMAGEN7 **

Al seleccionar la base de datos en la aplicación actual, se pueden ver los valores para la configuración de la conexión. Los valores relevantes son: host, database, user, port, password. Ahora, llene los valores del persistence.xml con los siguientes valores:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.0" xmlns="http://java.sun.com/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://java.sun.com/xml/ns/persistence http://java.sun.com/xml/ns/persistence/persistence_2_0.xsd">
  <persistence-unit name="AplicacionMundialPU" transaction-type="RESOURCE_LOCAL">
    <provider>org.eclipse.persistence.jpa.PersistenceProvider</provider>
    <exclude-unlisted-classes>false</exclude-unlisted-classes>
    <properties>
      <property name="javax.persistence.jdbc.url" value="jdbc:postgresql://<host>:<port>/<database>"/>
      <property name="javax.persistence.jdbc.user" value="<user>"/>
      <property name="javax.persistence.jdbc.driver" value="org.postgresql.Driver"/>
      <property name="javax.persistence.jdbc.password" value="<password>"/>
      <!--<property name="eclipselink.ddl-generation" value="drop-and-create-tables"/>-->
      <property name="javax.persistence.schema-generation.database.action" value="drop-and-create"/>
      <property name="eclipselink.logging.level" value="FINE"/>
    </properties>
  </persistence-unit>
</persistence>
```

Al subir las modificaciones y subir el código, debe revisarse el éxito del despliegue.

** IMAGEN8 **

Los dos únicos servicios de la aplicacón son un GET y un POST sobre el modelo Competitors. Los dos servicios, se deben probar manualmente.

** IMAGEN9 **

 




