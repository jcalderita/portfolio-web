# App Store Connect Group Lab

> WWDC26 · Sesión 8010 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8010/)

---

## Acerca de

Únete a nosotros online para una inmersión en WWDC26 con ingenieros y diseñadores de Apple para hacer preguntas, recibir consejos y seguir el debate sobre los anuncios más importantes de la semana en App Store Connect. Se realiza en inglés.

Laurel dirige el Group Lab de App Store Connect junto a los ponentes Jeff, Lydia, Nick, Shobi y Dave, que tratan sobre envíos, TestFlight, analíticas, el App Store Connect API y las nuevas funciones de WWDC26.

---

## Q&A

### 2:41 — [APIs de ASC infrautilizadas](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=161>)

**P.** ¿Qué APIs o funciones de App Store Connect están infrautilizadas pero merecen adoptarse?

Las APIs de entrega y subida de builds automatizan todo el ciclo de TestFlight de extremo a extremo; combinar las APIs de feedback de TestFlight con webhooks permite a los equipos crear tickets automáticamente en sus propios sistemas. La API de informes de Power and Performance también está infrautilizada para entender el comportamiento real de almacenamiento y CPU en dispositivo.

### 4:20 — [Etiquetas de accesibilidad](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=260>)

**P.** ¿Cómo se indica que un juego es accesible para personas con discapacidad auditiva cuando no hay subtítulos porque no hay sonido?

Marca solo las etiquetas que apliquen de verdad: no afirmes que hay subtítulos si no los hay. Usa la descripción de la app y las previsualizaciones para comunicar el valor de accesibilidad al público que quieres alcanzar.

### 5:44 — [Rechazos de apps de suscripción](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=344>)

**P.** ¿Qué causa habitualmente los rechazos en el primer envío de suscripciones y cómo se responde rápido?

La preparación es clave: prueba en dispositivos reales, ejercita las IAP en Sandbox e incluye credenciales de demo y notas para el revisor en el envío. El nuevo flujo de envío mejorado con IAP facilita la comunicación con el revisor; tras un rechazo, usa la función de respuesta de App Store Connect para abrir un diálogo en lugar de reenviar sin más.

### 8:33 — [Analíticas de Retention Messaging](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=513>)

**P.** ¿Las analíticas mostrarán impresiones, tasa de retención y revisitas al flujo de cancelación para los mensajes de Retention Messaging?

Sí: las analíticas informarán de cuántos usuarios vieron la página de retención, cuántos procedieron a cancelar y cuántos se mantuvieron suscritos, para que los desarrolladores puedan hacer A/B testing de los mensajes y planificar ofertas.

### 9:41 — [Errores de seguridad en la API de ASC](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=581>)

**P.** ¿Qué errores de seguridad cometen los desarrolladores con las integraciones de la App Store Connect API?

Nunca pongas claves privadas en repos ni las incluyas en los clientes; tratalas como exclusivas del servidor. Revoca las claves cuando dejes de usar un servicio de terceros, limita los permisos al mínimo necesario y usa las APIs de usuarios y acceso para auditar la pertenencia a la cuenta.

### 11:47 — [Actualizaciones automáticas vs. manuales](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=707>)

**P.** ¿Las analíticas pueden distinguir las actualizaciones orgánicas/manuales de las actualizaciones automáticas en segundo plano?

Sí: el desglose no está en el panel, pero sí en los informes de analíticas descargables, que incluyen una columna que separa las actualizaciones automáticas de las manuales.

### 12:30 — [Claves de API por app](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=750>)

**P.** ¿Se puede limitar una clave de API de equipo a solo un subconjunto de apps para subidas desde CI?

Las claves de equipo dan acceso a todas las apps y no se pueden limitar por app. El modo alternativo son las claves de usuario individual, que heredan el rol y el acceso a apps de ese usuario: útil, pero cuidado con que las claves desaparezcan cuando un usuario se va.

### 14:42 — [Nombres por plataforma](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=882>)

**P.** ¿Pueden el nombre y el subtítulo diferir por plataforma dentro de un Universal Purchase?

No: el nombre, el subtítulo, la clasificación por edad y el género se comparten entre plataformas porque Universal Purchase lleva la app de una a otra. Las descripciones, en cambio, sí pueden personalizarse por plataforma, así que las menciones de funciones específicas de plataforma van ahí.

### 16:06 — [Localización de Retention Messaging](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=966>)

**P.** ¿Admite Retention Messaging localización y deberíamos localizarlo?

Sí, la localización está disponible y deberías localizar los mensajes de retención para que coincidan con las localizaciones existentes de tu app, de modo que los usuarios no se encuentren con un texto en inglés que rompa el flujo.

### 17:02 — [Densidad de la descripción de la app](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1022>)

**P.** ¿El texto denso es realmente una buena práctica para las descripciones del App Store?

Ve directo a lo que le importa al usuario en lugar de saturar de texto. Usa Custom Product Pages y Product Page Optimization para probar variantes, y apóyate en el nuevo vídeo e imágenes de cabecera de la página de producto más las previsualizaciones para transmitir el mensaje visualmente.

### 18:55 — [Buenas prácticas de TestFlight](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1135>)

**P.** ¿Cuáles son las buenas prácticas para las pruebas internas y externas en TestFlight?

Empieza con TestFlight interno para tus equipos de desarrollo y QA a través de los usuarios de App Store Connect; luego pasa a TestFlight externo (hasta 10.000 testers) tras la revisión beta de la app. Crea grupos internos separados para QA, localización y dirección, y busca testers externos en comunidades y foros temáticos.

### 22:23 — [Higiene de claves de API](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1343>)

**P.** ¿Qué consejos hay sobre cómo generar, limitar y almacenar las claves de la App Store Connect API?

Las claves pertenecen a tu servidor, nunca a las apps cliente, y no caducan, así que requieren gestión activa. Usa roles con los mínimos privilegios posibles, claves individuales para experimentar y solo pasa a una clave de equipo para la automatización en producción.

### 24:09 — [Nombres compartidos entre apps](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1449>)

**P.** ¿Se puede usar el mismo nombre de producto en registros de app separados para Mac e iOS/visionOS con bundle IDs distintos?

No: los nombres deben ser únicos entre registros. El camino recomendado es consolidar en un único registro de app con Universal Purchase, que además desbloquea más funciones multiplataforma próximas en Xcode y App Store Connect.

### 25:46 — [Lo esencial para el primer envío](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1546>)

**P.** ¿Qué es lo más importante en un primer envío con autenticación de usuario y claves de API de terceros?

Prueba a fondo la app y sus integraciones con terceros, y asegúrate de que los servicios backend están listos para producción. Trata las claves que suministren los usuarios con cuidado en cuanto a privacidad e incluye credenciales de cuenta de demo en las notas de App Review.

### 27:14 — [Restauración de pago a freemium](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1634>)

**P.** ¿Cómo verifico el código de restauración de compra para usuarios que compraron la v1 al migrar a un modelo freemium?

Usa la StoreKit 2 App Transaction API para detectar la versión original de la app comprada y conceder los derechos. Prueba con Xcode y TestFlight, y usa cuentas Sandbox en App Store Connect para simular distintos países y restablecer el estado de compra.

### 30:00 — [Publicar la primera app](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1800>)

**P.** ¿Cuál es la mejor forma de aprender el proceso paso a paso para publicar tu primera app iOS?

Usa los recursos de developer.apple.com: sesiones de WWDC (incluidos años anteriores), los Apple Developer Pathways, las guías de ayuda de App Store Connect con instrucciones página a página y la charla técnica Getting Started with TestFlight.

### 32:07 — [Aumentar la visibilidad de la app](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1927>)

**P.** ¿Cómo puedo aumentar la visibilidad de mi app en el App Store?

Invierte en recursos creativos: capturas de pantalla, previsualizaciones y la nueva imagen/vídeo de cabecera de la página de producto. Usa In-App Events, Custom Product Pages vinculadas a palabras clave, presenta una nominación para destacar al equipo editorial y usa los momentos compartibles de la app de App Store Connect para lanzamientos y actualizaciones.

### 33:58 — [Binarios de app universales](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2038>)

**P.** ¿Una app universal necesita un binario separado por plataforma?

Envías binarios distintos para cada plataforma que soporte la app (iOS, macOS, watchOS, etc.) con metadatos propios de cada plataforma, pero no necesitas tenerlos todos desde el principio. Empieza con iOS, hazla disponible en macOS y visionOS, y añade binarios nativos específicos de plataforma más adelante según adoptes sus capacidades.

### 35:49 — [Idioma de las notas de revisión](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2149>)

**P.** ¿Las notas de revisión de la app deben estar en inglés o en el idioma nativo del desarrollador?

App Review tiene una cobertura lingüística amplia y revisa habitualmente en muchos idiomas, así que las notas en tu idioma principal están bien. El inglés también es válido, pero no es obligatorio.

### 37:07 — [Nuevos flujos de trabajo en ASC](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2227>)

**P.** ¿Qué nuevos flujos de trabajo de App Store Connect de este año deberían revisar los desarrolladores que trabajan mucho con automatización?

Echa un vistazo a la gran actualización de analíticas en la web: más de 100 nuevas métricas de suscripción/IAP con visualizaciones potentes que no están en la API. Revisa también los envíos de entidades de Game Center, las IAP en el flujo de envío mejorado y las APIs ampliadas de Offer Codes para consumibles y no consumibles.

### 38:54 — [Motivos de rechazo más habituales](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2334>)

**P.** ¿Cuáles son los motivos más habituales por los que se rechazan las apps?

Errores y cuelgues por pruebas insuficientes en dispositivo, información incompleta para el revisor (especialmente credenciales de demo que faltan) y no cumplir las App Review Guidelines específicas de categoría (niños, criptomonedas, etc.). Haz que más personas la prueben a través de TestFlight antes de enviarla: los simuladores no detectan todo.

### 42:16 — [Validación previa a la subida](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2536>)

**P.** ¿Qué comprobaciones de metadatos/capacidades solo ocurren tras la subida y se moverán más al Xcode?

La validación se ejecuta a lo largo de toda la pipeline y el equipo intenta continuamente mostrar los problemas antes, incluidas advertencias (no solo errores). Usa el paso de validación de app antes de la entrega de Xcode para detectar problemas antes de subir, y adopta la entrega continua para encontrar los problemas rápido.

### 44:13 — [Organizar las builds de TestFlight](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2653>)

**P.** ¿Se pueden organizar las builds de TestFlight en flujos para ramas de funciones en paralelo?

Sí: usa los grupos de TestFlight (internos y externos) para controlar qué testers ven qué builds. Crea grupos por rama (por ejemplo, trabajo de la función 2.0 vs. corrección de errores 1.x) y combínalos con Xcode Cloud para distribuir automáticamente las builds de cada rama al grupo correspondiente.

### 46:52 — [Retraso en el cambio de precio](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2812>)

**P.** ¿Por qué hay un retraso de varios días antes de que los cambios de precio de las compras integradas entren en vigor?

El retraso existe para que el nuevo precio pueda propagarse y entrar en vigor simultáneamente en todas las zonas horarias del mundo a medida que avanza el día.

### 47:33 — [Fusionar apps por país](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2853>)

**P.** ¿Cómo se fusionan los listados de apps por país en un único listado?

Elige el registro de app principal que va a perdurar, actualiza los demás con una versión final que dirija a los usuarios a descargar la nueva app y dale tiempo a los usuarios antes de forzar la migración. Mantén el código antiguo para correcciones de seguridad y errores durante la transición, y usa las sesiones de analíticas por versión para seguir el progreso de la migración.

### 49:58 — [Nuevo panel de analíticas](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2998>)

**P.** ¿Qué incluye el nuevo panel de analíticas del App Store y cómo sacarle el máximo partido?

La mayor actualización en más de diez años añade más de 100 métricas centradas en IAP y suscripciones, vinculando las fuentes de búsqueda/exploración/Today Tab del App Store con las compras y renovaciones posteriores para que puedas ver el recorrido completo del cliente. Los nuevos benchmarks te permiten ver dónde superas o no alcanzas la media, con una guía y un vídeo disponibles.

### 52:27 — [Nominaciones para destacar](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3147>)

**P.** ¿Consejos para una nominación exitosa para destacar en el App Store?

Presenta una app interesante o novedosa con recursos visuales potentes, incluidos los nuevos elementos de la página de producto, para destacar entre categorías saturadas. Nomina de nuevo en actualizaciones, no solo en lanzamientos, y cuenta la historia detrás de la app o el desarrollador, ya que el destacado a veces se centra en el creador.

### 54:24 — [Claves para terceros con mínimos privilegios](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3264>)

**P.** ¿Qué rol de clave de API con mínimos privilegios se recomienda para herramientas de terceros?

Para herramientas solo de analíticas, el rol Sales es el de menor privilegio adecuado. El rol Developer permite subir builds y usar TestFlight interno, y el rol Marketing puede editar metadatos y eventos: ninguno de los dos puede publicar una nueva versión.

### 55:51 — [Analíticas en tiempo real vía API](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3351>)

**P.** ¿Puede la API exponer las analíticas de las últimas 24 horas que muestra la interfaz?

No: la API se actualiza con una cadencia diaria (con agregados semanales y mensuales), mientras que Sales and Trends en la interfaz es donde encontrarás las últimas 24 horas. Son los mismos datos, solo con una cadencia diferente.

### 57:11 — [Impacto de las Custom Product Pages orgánicas](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3431>)

**P.** ¿Cómo se mide la visibilidad/descargas incrementales de una Custom Product Page de búsqueda orgánica sin datos de palabras clave?

En App Analytics, filtra el rendimiento de la CPP por tipo de fuente para aislar la búsqueda en el App Store. Si no usas Apple Ads, eso es puramente orgánico; si los usas, CPPs separadas para anuncios y orgánico te permiten diferenciar ambos.

### 58:14 — [Progreso del Phased Release](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3494>)

**P.** ¿Se puede ver el progreso del despliegue por fases de la versión actual mientras se prepara una nueva?

Sí: abre la página de la versión en distribución en App Store Connect y haz clic en Phased Release Rollout para ver en qué día del ciclo estás, incluso mientras se prepara una nueva versión.

### 59:19 — [App Review de apps geoespaciales](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3559>)

**P.** ¿Cómo se pasa App Review para una app de AR geoespacial que requiere una ubicación específica?

Incluye una demo grabada de la experiencia vinculada a esa ubicación en tu envío y usa TestFlight interno y luego externo para recopilar feedback. Considera también ofrecer alguna funcionalidad a los usuarios que no estén en esa ubicación.

---

## Destacados

- El flujo de envío mejorado ahora incluye In-App Purchases junto con el contenido de la app y los In-App Events
- La App Transaction API de StoreKit 2 permite detectar la versión de la app que el usuario compró originalmente, para restauraciones
- Las APIs de feedback de TestFlight más webhooks permiten crear tickets automáticos en tu propio bug tracker
- Filtra el rendimiento de las Custom Product Pages por tipo de fuente en App Analytics para aislar la búsqueda orgánica en el App Store
- Usa Validate App de Xcode antes de la entrega, y presta atención a los avisos (no solo a los errores) en la validación del pipeline
- La actualización de primavera de App Analytics añadió más de 100 métricas de IAP/suscripciones y nuevos benchmarks, con una guía y un vídeo dedicados
- Envía feedback en feedbackassistant.apple.com y pregunta tus dudas en developer.apple.com/forums

---

## Sesiones relacionadas

- [Get started with TestFlight](<https://developer.apple.com/videos/play/tech-talks/110343/>) (Empieza con TestFlight)

---
