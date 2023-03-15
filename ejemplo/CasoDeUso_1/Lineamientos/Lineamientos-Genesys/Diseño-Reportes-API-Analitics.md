# Analytics

Genesys Cloud proporciona un amplio conjunto de API para realizar consultas ad-hoc, soporte de procesamiento por lotes y exportaciones de datos del desempeño de su agente e interacciones cliente / agente. Sin embargo, con el nivel de sofisticación que brindan estas API de consulta, a menudo es difícil determinar qué API de Analytics es adecuada para una situación determinada. Hay dos elementos clave que deben tenerse en cuenta al analizar sus casos de uso individuales:

## Perspectiva de datos

Un centro de contacto es una fuente de datos extremadamente rica sobre cómo interactúan sus clientes con su organización. Sin embargo, esas interacciones con los clientes se pueden ver desde múltiples perspectivas y cada perspectiva es útil en función del contexto en el que se consumen los datos. La API de Genesys Cloud Analytics admite tres perspectivas diferentes sobre los usuarios de la plataforma y sus clientes. Estas tres perspectivas son:

1. [Métricas de Observaciones Instantáneas](https://developer.genesys.cloud/api/rest/v2/analytics/overview#instantaneous_observations_metrics) . Una instantánea de métricas de lo que está sucediendo en tu contact center en ese momento en el que se llama a la API.
2. [Métricas agregadas](https://developer.genesys.cloud/api/rest/v2/analytics/overview#aggregate_metrics) . Indicadores clave de rendimiento y métricas que se producen durante un período de tiempo y se dividen en intervalos de tiempo.
3. [Detalle de métricas de registro](https://developer.genesys.cloud/api/rest/v2/analytics/overview#detail_record_metrics) . Registros de estilo de auditoría que capturan un nivel de detalle muy fino en torno a las interacciones del usuario (por ejemplo, el agente) y el cliente.

## Acceso a datos sincrónico vs asincrónico

Si bien Genesys Cloud proporciona perspectivas diferentes sobre los datos de su centro de contacto, una de las solicitudes más comunes que escuchamos de los clientes es que desean poder recuperar datos detallados de usuarios y conversaciones y luego realizar su propio análisis de la manera que consideren adecuada. . Los casos de uso individuales para esta recuperación de datos detallados pueden ser muy variables y pueden variar desde la creación de cuadros de mando personalizados para sus propias necesidades de datos únicas hasta la sincronización de datos detallados de usuarios y clientes con sus propios almacenes de datos.

Desafortunadamente, aquí es donde los nuevos desarrolladores de Genesys Cloud pueden meterse en problemas. La API de detalles de conversación y usuario está diseñada para consultas ad-hoc y no está diseñada para ser consultada constantemente y tiene un alcance limitado por la cantidad de tiempo en el que se pueden recuperar los datos.

Para extraer y sincronizar grandes cantidades de datos detallados de Genesys Cloud, el equipo de la API de análisis tiene cuatro mecanismos para hacer esto: trabajos de detalle de usuario, trabajos de detalle de conversación, notificaciones de análisis y exportaciones.

| Escribe                                                      | Descripción                                                  |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [Trabajo de detalles de usuario](https://developer.genesys.cloud/api/rest/v2/analytics/user_details_job.html) | Proporciona un mecanismo asincrónico basado en API para recuperar información detallada del usuario. |
| [Trabajo de detalles de conversación](https://developer.genesys.cloud/api/rest/v2/analytics/conversation_details_job.html) | Proporciona un mecanismo asincrónico basado en API para recuperar información detallada de la conversación. |
| [Notificaciones de análisis](https://developer.genesys.cloud/api/rest/v2/analytics/analytics_notifications.html) | Proporciona un protocolo asincrónico, basado en web-sockets, basado en mensajería para sincronizar el usuario y los detalles de la conversación. |
| [Exportar](https://developer.genesys.cloud/api/rest/v2/analytics/exports.html) | Manera programática de iniciar una exportación de datos analíticos. Sin embargo, los datos exportados solo se pueden recuperar desde la IU de Genesys Cloud. |

## Servicios REST

| Metodo   | RUTA                                                         | Descripcion                                                  |
| -------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| GET      | /api/v2/analytics/botflows/{botFlowId}/reportingturns        | Obtenga turnos de informes.                                  |
| POST     | /api/v2/analytics/bots/aggregates/query                      | Consulta de agregados de bot, Las consultas agregadas de bot muestran un resumen de alto nivel de las métricas de flujo de bot durante un intervalo determinado. |
| **POST** | /api/v2/analytics/conversations/aggregates/query             | Consulta de agregados de conversación, Las consultas de Conversation Aggregate muestran un resumen de alto nivel de las métricas derivadas de las interacciones (como tiempo de conversación, tiempo de abandono, velocidad de respuesta, etc). |
| **GET**  | /api/v2/analytics/conversations/details                      | Obtiene múltiples conversaciones por id.                     |
| POST     | /api/v2/analytics/conversations/details/jobs                 | Consultar los detalles de la conversación de forma asincrónica |
| GET      | /api/v2/analytics/conversations/details/jobs/availability    | Busque la fecha y hora de disponibilidad de datalake         |
| DELETE   | /api/v2/analytics/conversations/details/jobs/{jobId}         | Eliminar / cancelar una solicitud asincrónica                |
| GET      | /api/v2/analytics/conversations/details/jobs/{jobId}         | Obtener el estado de la consulta asincrónica para obtener detalles de la  conversación |
| GET      | /api/v2/analytics/conversations/details/jobs/{jobId}/results | Obtener una página de resultados para una consulta asincrónica |
| **POST** | /api/v2/analytics/conversations/details/query                | Consultar los detalles de la conversación,Las consultas de detalles de la conversación muestran cómo se invirtió el tiempo durante una interacción, como el tiempo que se pasó en ACD (distribuidor automático de llamadas), el timbre, las retenciones o el trabajo posterior a la llamada. Los segmentos son los componentes básicos de una llamada y son ideales para ver cómo se manejó una llamada individual. Cada segmento tiene un conjunto de metadatos (dimensiones) como número de teléfono, dirección de correo electrónico, campaña, motivo de desconexión o dirección |
| **POST** | /api/v2/analytics/conversations/transcripts/query (no se logro simular la respuesta) | Recursos de búsqueda, Las consultas agregadas de transcripciones muestran un resumen de alto nivel de métricas para los datos de análisis de voz y texto de las transcripciones durante un intervalo determinado. |
| **GET**  | /api/v2/analytics/conversations/{conversationId}/details     | Obtener una conversación por id                              |
| POST     | /api/v2/analytics/conversations/{conversationId}/details/properties | Propiedades de la conversación de índice                     |
| **POST** | /api/v2/analytics/evaluations/aggregates/query               | Consulta de agregados de evaluación, Las consultas de agregados de evaluación proporcionan métricas que resumen los datos de evaluación de la gestión de la calidad para una cola, formulario o usuario específicos. |
| POST     | /api/v2/analytics/flows/aggregates/query                     | Consulta de agregados de flujo, Las consultas agregadas de transcripciones muestran un resumen de alto nivel de métricas para los datos de análisis de voz y texto de las transcripciones durante un intervalo determinado. |
| POST     | /api/v2/analytics/flows/observations/query                   | Consulta de observaciones de flujo                           |
| POST     | /api/v2/analytics/journeys/aggregates/query                  | Consulta de agregados de viajes                              |
| POST     | /api/v2/analytics/queues/observations/query                  | Consulta de observaciones en cola, Puede utilizar una consulta de cola para mostrar la actividad en una cola de Genesys Cloud, que incluye:  <br />* El número de agentes miembros ( **oMemberUsers** ) <br />* El número de agentes activos ( **oActiveUsers** ) <br />* El número de interacciones actualmente en curso ( **oInteracting** ) <br />* El número de interacciones en espera ( **oWaiting** ) <br />* La cantidad de agentes activos en una presencia o estado de enrutamiento particular ( **oUserRoutingStatuses** , **oOnQueueUsers** , **oUserPresences** y **oOffQueueUsers** ) |
| GET      | /api/v2/analytics/reporting/exports                          | Obtener todas las solicitudes de exportación de vistas de un usuario, Para exportar datos de Analytics desde Genesys Cloud, se recomienda utilizar las API de Analytics; se adapta al cliente integrado de Genesys Cloud y las exportaciones se envían al Bandeja de entrada del usuario. En el futuro, esto se abrirá para permitir la exportación programática desde las vistas, pero en este momento su caso de uso es limitado para la IU de Genesys Cloud |
| POST     | /api/v2/analytics/reporting/exports                          | Genere una solicitud de exportación de vista. Esta API crea una  exportación de informes, pero la forma deseada de exportar datos analíticos  es utilizar las API de consultas analíticas en su lugar. |
| GET      | /api/v2/analytics/reporting/exports/metadata                 | Obtener todos los metadatos de exportación                   |
| GET      | /api/v2/analytics/reporting/metadata                         | Obtenga una lista de metadatos de informes.                  |
| GET      | /api/v2/analytics/reporting/reportformats                    | Obtenga una lista de formatos de informes. Obtenga una lista de formatos  de informes. |
| GET      | /api/v2/analytics/reporting/schedules                        | Obtenga una lista de trabajos de informes programados. Obtenga una lista  de trabajos de informes programados. |
| POST     | /api/v2/analytics/reporting/schedules                        | Cree un trabajo de informe programado. Cree un trabajo de informe  programado. |
| DELETE   | /api/v2/analytics/reporting/schedules/{scheduleId}           | Eliminar un trabajo de informe programado.                   |
| GET      | /api/v2/analytics/reporting/schedules/{scheduleId}           | Obtenga un trabajo de informe programado.                    |
| PUT      | /api/v2/analytics/reporting/schedules/{scheduleId}           | Actualice un trabajo de informe programado.                  |
| GET      | /api/v2/analytics/reporting/schedules/{scheduleId}/history   | Obtenga una lista de trabajos de informes programados completados. |
| GET      | /api/v2/analytics/reporting/schedules/{scheduleId}/history/latest | Obtenga el trabajo de informe programado completado más recientemente. |
| GET      | /api/v2/analytics/reporting/schedules/{scheduleId}/history/{runId} | Un trabajo de informe programado completado. Un trabajo de informe  programado completado. |
| POST     | /api/v2/analytics/reporting/schedules/{scheduleId}/runreport | Coloque un informe programado inmediatamente en la cola de informes |
| PATCH    | /api/v2/analytics/reporting/settings                         | Parche AnalyticsReportingSettings valores para una organización |
| GET      | /api/v2/analytics/reporting/timeperiods                      | Obtenga una lista de los períodos de tiempo del informe.     |
| GET      | /api/v2/analytics/reporting/{reportId}/metadata              | Obtenga metadatos de informes.                               |
| POST     | /api/v2/analytics/surveys/aggregates/query                   | Consulta de agregados de encuestas                           |
| POST     | /api/v2/analytics/transcripts/aggregates/query               | Consulta de agregados de transcripciones,Las consultas agregadas de transcripciones muestran un resumen de alto nivel de métricas para los datos de análisis de voz y texto de las transcripciones durante un intervalo determinado. |
| **POST** | /api/v2/analytics/users/aggregates/query                     | Consulta de agregados de usuarios, Las consultas de agregación de estado de usuario muestran un resumen de alto nivel de la actividad del usuario |
| POST     | /api/v2/analytics/users/details/jobs                         | Consultar los detalles del usuario de forma asincrónica      |
| GET      | /api/v2/analytics/users/details/jobs/availability            | Busque la fecha y hora de disponibilidad de datalake         |
| DELETE   | /api/v2/analytics/users/details/jobs/{jobId}                 | Eliminar / cancelar una solicitud asincrónica                |
| GET      | /api/v2/analytics/users/details/jobs/{jobId}                 | Obtener el estado de la consulta asincrónica de los detalles del usuario |
| GET      | /api/v2/analytics/users/details/jobs/{jobId}/results         | Obtener una página de resultados para una consulta asincrónica |
| **POST** | /api/v2/analytics/users/details/query                        | Consultar los detalles del usuario, Las consultas de detalles del estado del usuario muestran el nivel más fino de actividad del usuario. Los datos de la consulta reflejan la presencia de Genesys Cloud del usuario, así como su estado de enrutamiento ACD en el nivel de cambio de estado individual. |
| POST     | /api/v2/analytics/users/observations/query                   | Consulta de observaciones de usuarios, Las consultas de observación del estado del usuario muestran un resumen de alto nivel de la actividad de un usuario. Los datos de la consulta reflejan la presencia de Genesys Cloud del usuario, así como su estado de enrutamiento de cola. |