# Microservicios

La arquitectura de microservicios es una aproximación para el desarrollo de software que consiste en construir una aplicación como un conjunto de pequeños servicios, los cuales se ejecutan en su propio proceso y se comunican con mecanismos ligeros.

## Arquitectura de microservicio. 

![Arquitectura de microservicios: qué es, ventajas y desventajas](/.attachments/microservicio.png)

## Spring Boot

Spring Boot facilita la creación de aplicaciones independientes basadas en Spring de grado de producción que puede "simplemente ejecutar".

Tomamos una visión obstinada de la plataforma Spring y las bibliotecas de terceros para que pueda comenzar con el mínimo esfuerzo. La mayoría de las aplicaciones Spring Boot necesitan una configuración mínima de Spring.

### Características

- Cree aplicaciones independientes de Spring
- Incruste Tomcat, Jetty o Undertow directamente (no es necesario implementar archivos WAR)
- Proporcione dependencias 'de inicio' obstinadas para simplificar la configuración de su compilación
- Configure automáticamente las bibliotecas de Spring y de terceros siempre que sea posible
- Proporcione funciones listas para producción, como métricas, comprobaciones de estado y configuración externa.
- Absolutamente sin generación de código y sin requisitos de configuración XML

Requisitos

* JAVA 
* Eclipse - spring tool

### Definición  Seguridad. 

![image-20211021100757210](/.attachments/image-20211021100757210.png)

Se debe definir las perspectivas políticas de seguridad por medio de un servidor de identidades el cual dará como resultado un token de acceso para acceder a los respectivos recursos solicitados.

Para esto es necesario desarrollar y implementar un servidor de identidades. 

Servidores de autenticaciones 

* Spring Security 
* ws02 identity server
* identityserver4

Donde la recomendación la implementación con ws02 identity server.

### Definición de un microservicio. 

Se define una estructura base para un microservicio el cual debe estar a cargo de una funcionalidad especifica, teniendo en cuenta los principios SOLID, y una definición MVC.

#### Estructura

Ejemplo de la estructura de deberá llevar un microservicio. 

![image-20211015141834373](/.attachments/image-20211015141834373.png)

* controlller:  RestController, que ofrecen las interfaces de consumo hacia los clientes de tipo REST, se deberá utilizar la librería core.services.data cuando sea necesario.

* exceptiones:  siguiendo los principios de RestControllerAdvice la excepciones serán personalizables y heredadas de la siguiente interfaz ExceptionRestController  la cual la ofrece el siguiente paquete core.services.data

  ```xml
  <dependency>
  			<groupId>core.services.data</groupId>
  			<artifactId>core.services.data</artifactId>
  			<version>{colocar l aultima version disponible}</version>
  </dependency>
  ```

* models: carpeta que almacena los entity y repository que administra el servicio se debera utilizar de igual forma la librería  core.services.data cuando sea necesario.

* ouath: políticas de seguridad para el microservicio, deberá validar el token dado por el identity server.

* service: cualquier tipo de logica de negocio.

* **clientes** : cuando se necesite hacer peticiones externas a otros microservicios sera necesario crear una nueva carpeta con la estructura necesario para consumir el servicio en el cual se deberá utilizar RestTemplete o Fingering  dependiendo del servicio.

  Ejemplo :

  ![image-20211021103656822](/.attachments/image-20211021103656822.png)

### Codigos de Respuesta.
[cheatsheet_rest.pdf](/.attachments/cheatsheet_rest-d645e382-77b7-4457-b9a7-348108d2f10b.pdf)

Se deberá utilizar los respectivos códigos de respuesta HTTP Status codes como se define el estandar.
 
![image.png](/.attachments/image-56952a14-61e3-48a0-8d11-1347b08ecfa1.png)

### Trazabilidad de lo servicios.

Los servicios deberán ser trazados utilizando zipkin con kafka - los eventos deberán ser capturadas con prometheus y grafana.


Trazabilidad. 

![OpenZipkin · A distributed tracing system](/.attachments/dependency-graph.png)

Alertas y métricas. 

![En Busca del Dashboard perfecto: InfluxDB, Telegraf y Grafana – Parte XXIX  (Monitorizando Pi-hole) - El Blog de Jorge de la Cruz](/.attachments/pihole-grafana-001.png)

## Pruebas 

### JUnit

JUnit se trata de un Framework Open Source para la automatización de las pruebas (tanto unitarias, como de integración) en los proyectos Software. El framework provee al usuario de herramientas, clases y métodos que le facilitan la tarea de realizar pruebas en su sistema y así asegurar su consistencia y funcionalidad.

Se debe realizar las respectivas pruebas unitarias y de integración con JUnit https://junit.org/junit5/ en la cual deberá contra con una cobertura de código igual o superior al 90%  y deberán pasar el 100% de las pruebas programadas para esto se deberán mokiar las respectivas pruebas.

Ejempló Test: 

```java

@RunWith(SpringRunner.class)
@SpringBootTest(
        classes = PlatziTestingApplication.class
)
public class PlatziTestingApplicationTests {

    @Autowired
    private WebApplicationContext wac;

    private MockMvc mockMvc;

    @Before
    public void setUp() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }

	@Test
	public void testHelloEndpointIsOK() throws Exception {
        this.mockMvc.perform(get("/hello"))
            .andExpect(status().isOk())
            .andExpect(content().string("Hola Mundo"));
	}

}
```

Ejemplo Validación.

![image-20211022100121034](\.attachments\image-20211022100121034.png)   

![image-20211022100137369](\.attachments\image-20211022100137369.png)

## Validación de código. 

Las validaciones de código deberán ser pasada por SonarQube para garantizar las mejores practicas en el desarrollo de código.  

![successful analysis](\.attachments\successfulproject.png)

## Control de Código. 

El control de código deberá ser  cargado en Azure DevOps Git y deberá estar basada en una metologia gitflow.

Example feature/{actividad}

![image-20211022101454671](\.attachments\image-20211022101454671.png)

## Documentación.

### Documentación de  servicios REST. 

La documentación de los servicios desarrollados deberán realizarse con https://swagger.io/, el cual ofrece la forma para documentar cada servicio y hacer unas pruebas del servicio desde la misma interfaz. 

Ejemplo:

![image-20211022081009552](\.attachments\image-20211022081009552.png)

### Documentación de código. 

#### Javadoc

Javadoc es una utilidad de Oracle para la generación de documentación de APIs en formato HTML a partir de código fuente Java. Javadoc es el estándar de la industria para documentar clases de Java. La mayoría de los IDEs los generan automáticamente.

![image-20211022090429112](\.attachments\image-20211022090429112.png)

Ejemplo: 

```java
 /**
  * Inserta un título en la clase descripción.
  * Al ser el título obligatorio, si es nulo o vacío se lanzará
  * una excepción.
  *
  * @param titulo El nuevo título de la descripción.
  * @throws IllegalArgumentException Si titulo es null, está vacío o contiene sólo espacios.

  */
 public void setTitulo (String titulo) throws IllegalArgumentException
 {
   if (titulo == null || titulo.trim().equals(""))
   {
       throw new IllegalArgumentException("El título no puede ser nulo o vacío");
   }
   else
   {
       this.titulo = titulo;
   }
 }
```

#### Generar PDF Documentación.

**doclet** se deberá generar el documento en PDF con el cual se puede utilizar la librería **AurigaDoclet.jar**.

http://aurigadoclet.sourceforge.net/

Ejemplo:

![image-20211022094237401](\.attachments\image-20211022094237401.png)

