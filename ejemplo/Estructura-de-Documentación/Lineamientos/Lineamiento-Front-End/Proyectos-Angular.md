# Angular

Angular (comúnmente llamado Angular 2+ o Angular 2) es un framework para aplicaciones web desarrollado en TypeScript, de código abierto, mantenido por Google, que se utiliza para crear y mantener aplicaciones web de una sola página. Su objetivo es aumentar las aplicaciones basadas en navegador con capacidad de Modelo Vista Controlador (MVC), en un esfuerzo para hacer que el desarrollo y las pruebas sean más fáciles.

La biblioteca lee el HTML que contiene atributos de las etiquetas personalizadas adicionales, entonces obedece a las directivas de los atributos personalizados, y une las piezas de entrada o salida de la página a un modelo representado por las variables estándar de JavaScript.

Angular se basa en clases tipo "Componentes", cuyas propiedades son las usadas para hacer el binding de los datos. En dichas clases tenemos propiedades (variables) y métodos (funciones a llamar).

Versiones 
- Angular CLI: 13.3.3
- Node: 14.17.3

## Requisitos

* nmp
* angular CLI
* npm i angular-auth-oidc-client
* npm i ngx-permissions

## Plantilla  FrontEnd.

Se siguiere el uso de la siguiente plantilla el cual proporciona una base para los desarrollos que requieran una interfaz grafica. 

![image.png](/.attachments/image-64325dab-c25b-47d7-bf80-60de4a8e9262.png)

https://adminlte.io/

Construido sobre Bootstrap, AdminLTE proporciona una gama de componentes receptivos, reutilizables y de uso común.

## Definiciones Angular.

* Se debe utilizar los environments para administración de cada proyecto. 
* Se deben realizar las respectivas pruebas Unitarias con (Jasmin y Karma)
* El código Fuente deberá ser subido a un repositorio GIt, el cual contara con su respectivo CI / CD.
* EL código deberá ser escaneado por SONARQB
* Cada proyecto al inicio o modificación deberá ser actualizado a la ultima versión de Angular disponible. 
* Los recursos de externos de angular como CSS -  JS deberán ser cargados por medio del archivo angular.json
* Se debe utilizar para la seguridad angular-auth-oidc-client
* Se debe utilizar para los permisos ngx-permissions

## Definición estructura Angular

### Plantilla

la plantilla deberá ser cargada en los assets del proyecto.

![image.png](/.attachments/image-6074bd12-31c3-4718-b2bd-223309b56e67.png)

### Modulo

Un modulo de angular, es la definición de un componente o funcionalidad lo mas especifica posible en la cual se busca la reutilización y segmentación de las funcionalidades del sistema, ejemplo módulos por microservicios y funcionalidad como editar - eliminar - agregar, pero no se limita en funciones de servicio también pueden ser funcionalidades compartidas como una barra de progreso, un menu principal o de tablas, 

#### Estructura

Se debe definir la siguiente estructura.

**shared**.

Carpeta donde se encontrara los módulos que están presente en la aplicación:

![image.png](/.attachments/image-d83daeb5-6bfd-445e-b6a1-5e5c7735f8a3.png)

**pages**

Carpeta donde se encentrara modularmente todas las interfaces de la aplicación ejemplo.

![image.png](/.attachments/image-bbd35fa1-8f7c-4c77-a1b4-e5d28f8bd204.png)

**service**

Carpeta donde estará toda las entradas de datos servicios, a consumir para la aplicación ejemplo:

![image.png](/.attachments/image-be5d0c87-762d-45e2-8404-7e08a6627377.png)

**pipes**

Carpeta contenido de pipes personalizados utilizados por la aplicación Ejemplo. 

![image.png](/.attachments/image-e9151a65-f483-41b7-bc35-314e5838f6ee.png)

**models**

Extracción de los objetos, funciona para los servicio o vistas de los moludos Ejemplo:

![image.png](/.attachments/image-97461e17-ef75-4683-8ac4-3d5ca4a971f8.png)

**interfaces**

Interfaces utilizadas en los servicios o modulos Ejemplo. 

![image.png](/.attachments/image-5ee9f7ca-b06b-42a6-ac57-e97b43844d51.png)

**guards**

Reglas de seguridad  guard de angular definición de permisos Ejemplo: 

![image.png](/.attachments/image-a774739d-024c-4fb9-8035-748ef56c9798.png)

**componentes**

Definición de componentes, los cuales pueden ser consumidos por cualquier modulo son adaptables dependiendo del modulo Ejemplo:.   

![image.png](/.attachments/image-27ef2d63-6008-4d43-9c8d-27bafcab17e9.png)

**oauth**

componente donde se almacena los módulos de login. 

![image.png](/.attachments/image-4d4cb4bf-ce25-483d-9d17-31495a3da43e.png)

**interceptors**

interceptor en angular, original mente utilizado para validación de los token de acceso entre otras funciones que requieran interceptos.

![image.png](/.attachments/image-a1aa71b9-f704-4f8e-961c-374b9f578862.png)

## Router.

Los router son una parte esencial de angular donde se define el enrutamiento de los módulos componentes los router deben ser creados bajo las siguientes primicias. 

* Un app-routing.module encargado de llamar y centralizar todos los router de los diferentes componentes. 

* Deberán existir un router por cada componente global esto siguiendo las buenas practicas de router para angular ejemplo: 

![image.png](/.attachments/image-34fe7815-fe97-4af8-a3c2-70ed434d47a5.png)

## Pruebas.

Se deberá desarrollar las pruebas unitarias como recomienda Angular y su fremework JasmineJS y Karma en donde se deberán probar los servicios y modulos. 

* La validación de las pruebas se realizara por el coverange en donde debera estar por arriba del 90%
* Se recomienda trabajar con una metologia TDD donde primero se desarrollan las pruebas y con base a eso el código. 

![image.png](/.attachments/image-8df78c8c-2708-4638-a22b-ac9f24b73156.png)

## Documentación.

La documentación deberá ser obligatoria y deberá ser realizada con compodoc para crear la documentación de forma automática.

https://compodoc.app/

Ejemplo: 

![image-20211015142247072](/.attachments/image-20211015142247072.png)

La validaciones y aprobaciones de los proyectos se realizaran una vez el coverange este al 100%. 

## Seguridad Paquetes.

### OIDC 

Para la administración de la seguridad basado en OIDC se sugiere, el paquete  **angular-auth-oidc-client** el cual facilita la autenticación basada en OIDC .

[angular-auth-oidc-client - npm (npmjs.com)](https://www.npmjs.com/package/angular-auth-oidc-client)

### Administración de Permisos. 

La administración de permisos de para la parte de frontend de angular +2 se debe administrar con el siguiente paquete **ngx-permissions** el cual facilita la definición de los permisos en angular. 

[ngx-permissions - npm (npmjs.com)](https://www.npmjs.com/package/ngx-permissions)

## Validación de código. 

Las validaciones de código deberán ser pasada por SonarQube para garantizar las mejores practicas en el desarrollo de código.  

![successful analysis](\.attachments\successfulproject.png)

## Control de Código. 

El control de código deberá ser  cargado en Azure DevOps Git y deberá estar basada en una metologia gitflow.

Example :  feature/{actividad}

![image-20211022101454671](\.attachments\image-20211022101454671.png)

