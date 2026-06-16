# Apple Intelligence Group Lab

> WWDC26 · Sesión 8011 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8011/)

---

## Acerca de

Únete a nosotros en línea para profundizar en la WWDC26 con ingenieros y diseñadores de Apple: haz preguntas, recibe consejos y sigue el debate sobre los grandes anuncios de Apple Intelligence de la semana. Conducida en inglés.

Ernie dirige el Apple Intelligence Group Lab junto a los ponentes Matt y Louie (Foundation Models), James y Dan (App Intents y Siri) y Rob (Evaluation Framework). La sesión abarca los esquemas de App Intents, el nuevo Siri AI, Foundation Models (en dispositivo y Private Cloud Compute) y el Evaluation Framework.

---

## Q&A

### 1:42 — [Recursos de aprendizaje](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=102>)

**P.** ¿Qué recursos de Apple ayudan a aprender las nuevas APIs y los cambios de diseño en iOS 27?

Vídeos de sesiones de WWDC, la sección de ejemplos de la documentación, artículos técnicos y la documentación renovada de App Intents y Foundation Models. Las sesiones de años anteriores también ayudan a asentar los conocimientos básicos de App Intents.

### 3:18 — [Schemas que no coinciden](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=198>)

**P.** Si mi app no encaja en ningún tipo de schema predefinido, ¿debería usar el más parecido o ignorar los schemas por completo?

Elige los schemas que encajen con las capacidades de tu app y combínalos con App Intents personalizados para el resto. Para integrarte con Siri AI debes adoptar al menos un schema; considera los schemas genéricos system.search o system.open, y App Shortcuts para frases principales.

### 7:07 — [Sin dominio coincidente](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=427>)

**P.** Mis entidades no se corresponden con ningún dominio predefinido: ¿cómo accedo hoy a Siri agéntica y me preparo para el futuro?

Adopta los fragmentos de schema que encajen, aunque sea parcialmente. Conformar entidades a un schema y donarlas mediante Spotlight sigue habilitando Siri AI para consultar contenido y usar las nuevas view annotations APIs.

### 8:23 — [Invocación entre apps](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=503>)

**P.** ¿Puede una app de terceros actuar como su propio orquestador e invocar directamente los intents de otra app?

No — el orquestador del sistema enruta las acciones entre apps manteniendo los datos en sandbox por privacidad. Usa la nueva API Transferable para exportar o importar datos entre apps de forma explícita y con límites claros.

### 10:26 — [Conversaciones multiturn](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=626>)

**P.** ¿Puede mi app participar en conversaciones multiturn con Siri en iOS 27, o solo en acciones discretas?

Sí — App Schemas permiten preguntas de seguimiento y consultas naturales sobre tus entidades. Un modelo de lenguaje de gran escala procesa la entrada, así que los usuarios pueden formular peticiones con flexibilidad y Siri elige la acción correcta.

### 12:15 — [Mezclar Schemas](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=735>)

**P.** ¿Puedo combinar entidades sin schema e intents que coincidan con distintos schemas de diferentes dominios en una misma app?

Absolutamente — los schemas están diseñados para elegirse y combinarse entre dominios, y conviven con App Shortcuts y la búsqueda en la app. Lo esperado es una mezcla integral adaptada a tu app.

### 13:32 — [Presupuesto de trabajo en segundo plano](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=812>)

**P.** ¿Hay un presupuesto práctico de tiempo o trabajo para Foundation Models durante un activación en segundo plano?

Las peticiones en primer plano no tienen throttling, pero las peticiones en segundo plano pueden estar limitadas bajo carga del sistema. Captura el error de rate limiting del modelo en el dispositivo y vuelve a intentarlo más tarde.

### 14:40 — [Errores de throttling](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=880>)

**P.** ¿Qué tipos de error indican throttling en Foundation Models, y cuáles permiten reintentos?

El nuevo LanguageModelError cubre casos comunes como rate limiting y rechazos. El modelo PCC también expone una propiedad de uso de cuota y lanza un error de agotamiento de cuota que puedes gestionar por prompt.

### 16:09 — [Guardrail Violations](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=969>)

**P.** ¿Cómo puedo evitar errores frecuentes de guardrail violation en prompts que parecen correctos?

Usa el model judge evaluator del Evaluation Framework con una rúbrica de seguridad para puntuar los prompts, y considera dejar que el modelo PCC más grande juzgue los casos límite. Los guardrails existen para evitar respuestas inseguras, así que itera sobre la redacción del prompt.

### 17:43 — [Entrada de vídeo](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1063>)

**P.** ¿Puede Foundation Models razonar sobre vídeo, o la entrada multimodal se limita a imágenes estáticas?

El framework admite entrada de imágenes tanto en el modelo en el dispositivo como en PCC, con PCC ofreciendo además controles de profundidad de razonamiento. Para vídeo, crea una tool que use Vision y otros frameworks para extraer una descripción en texto o transcripción y pásala al modelo; los segmentos personalizados del Language Model Protocol permiten ir más allá de las modalidades integradas.

### 21:53 — [Ventaja de los Schemas](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1313>)

**P.** ¿Dan los schemas de App Intents ventaja frente a los intents personalizados para que Siri AI los descubra?

No se trata de una ventaja — los schemas son la forma en que Siri AI razona sobre tus acciones y entidades, y Apple ya ha hecho el trabajo de entrenamiento y frases de ejemplo para que obtengas un comportamiento consistente entre apps. Bonus: los schemas te permiten eliminar código que ahora gestiona Apple, y las intent donations ayudan a Siri a aprender los hábitos del usuario.

### 26:07 — [Imágenes fotorrealistas](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1567>)

**P.** ¿Puede Image Playground generar imágenes fotorrealistas dentro de mi app?

Sí — usa <span class="high">ImagePlaygroundStyle.all</span>. El estilo fotorrealista se ejecuta en Private Cloud Compute y se trata en una sesión de WWDC de este año.

### 27:08 — [IndexEntity frente a Schemas](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1628>)

**P.** ¿En qué se diferencia IndexEntity de las entidades definidas por schema, como el schema de libros?

Los schemas definen la forma del contenido; IndexEntity indexa ese contenido en el semantic index del sistema para que Siri AI pueda recuperarlo. Se complementan — conforma tu app a un schema y a IndexEntity para la mejor experiencia con Siri, y Apple gestiona los mapeos de claves de Spotlight por ti.

### 30:09 — [Evaluaciones para investigación](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1809>)

**P.** ¿Se puede usar el Evaluation Framework para investigación académica y métricas revisadas por pares?

Sí — está diseñado para cualquier sistema estocástico, no solo LLMs, incluidos los modelos clásicos de ML. Iteras sobre muestras de entrada, ejecutas evaluadores y exportas informes JSON; la generación de datos sintéticos, el hill climbing y los visuales de Xcode/Instruments ayudan mucho.

### 33:17 — [Siri y CarPlay](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1997>)

**P.** ¿Puede Siri entender el contexto en pantalla en CarPlay y realizar acciones como «reproduce la canción de la fila 2 columna 1»?

El contexto en pantalla usa NSUserActivity y las nuevas view annotations APIs en iPhone, iPad, Mac y visionOS. Para capacidades específicas de CarPlay, presenta una solicitud de mejora en Feedback Assistant — se aplican restricciones de seguridad vial.

### 35:39 — [App Intents en HomePod](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2139>)

**P.** ¿Pueden funcionar App Intents con HomePod si no hay beta de HomePod?

El nuevo Siri AI llega a iPhone, iPad, Mac y visionOS — no a HomePod. Los App Shortcuts existentes siguen funcionando en HomePod.

### 36:20 — [Paridad con watchOS](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2180>)

**P.** ¿Las respuestas de App Intents en watchOS coincidirán punto por punto con las de iOS?

Prueba en todos los dispositivos, incluyendo AirPods. Usa los modos de diálogo full/supporting para que los contextos solo de voz reciban una respuesta más detallada mientras los contextos con pantalla pueden ser más concisos, y usa el nuevo framework de pruebas de App Intents para automatizarlo.

### 38:32 — [Image Playground sin conexión](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2312>)

**P.** ¿Image Playground requiere ahora internet para PCC, o cae graciosamente en modo sin conexión?

Image Playground ahora requiere conexión a internet porque usa el modelo basado en servidor de PCC; no hay modo de reserva en el dispositivo.

### 39:06 — [Las funciones que más nos entusiasman](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2346>)

**P.** ¿Qué es lo que más le entusiasma a cada ponente de Apple Intelligence este año?

Rob: la inteligencia durante llamadas, como extraer números de confirmación de vuelo. James: las pruebas de App Intents (la sesión de Venkatesh) para tests unitarios y de UI compatibles con CI. Louie: el acceso a PCC con una sola línea de código y sin claves de API (bromeó con un libro inventado). Dan: el nuevo ecosistema de Siri AI y la integración del semantic index. Matt: el extensible Language Model Protocol que unifica cualquier modelo bajo una sola API.

### 45:37 — [Por qué los Schemas son fijos](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2737>)

**P.** ¿Por qué schemas fijos en lugar de un enfoque dinámico de skills/markdown como GPT o Claude?

Los schemas garantizan consistencia, privacidad y seguridad — los usuarios aprenden cómo se comporta Siri en un dominio y eso se traslada a todas las apps que adoptan ese schema. También habilitan flujos de confirmación integrados (p. ej., enviar dinero, eventos de calendario compartidos) mediante las nuevas APIs de propiedad de entidades, y permiten que Apple gestione la localización en muchos idiomas.

### 49:25 — [Evaluación de tool calls](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2965>)

**P.** ¿Puede el Evaluation Framework verificar si se están llamando mis tools?

Sí — pasa la transcripción de LanguageModelSession a un tool call evaluator con aserciones sobre qué tools se llamaron, en qué orden y con qué valores de propiedad. Es un sistema de expectativas profundo que devuelve un informe.

### 51:17 — [Entropía semántica](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3077>)

**P.** ¿Cómo mitiga el framework la entropía semántica al pasar contexto entre los modelos en el dispositivo y PCC?

Usa dynamic profiles (cambio similar a agente en la misma transcripción) con modificadores history transform declarativos para equilibrar el contexto. El nuevo paquete Foundation Models Utilities ofrece summarization para compactar transcripciones al pasar a un tamaño de contexto más pequeño; las evaluaciones ayudan a validar los compromisos.

### 53:00 — [Evaluaciones sin Foundation Models](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3180>)

**P.** ¿Tengo que usar Foundation Models para usar el Evaluation Framework?

No — puedes evaluar cualquier sistema estocástico. Algunos evaluadores (como el de tool call) actualmente necesitan una transcripción de Foundation Models, pero ya vienen en camino transformaciones genéricas para otros proveedores de modelos.

### 53:52 — [Recuperación entre apps](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3232>)

**P.** ¿Puede una de mis apps recuperar entidades donadas a Spotlight por otra de mis apps mediante la tool de búsqueda en Spotlight?

La recuperación está en sandbox para cada app. Para compartir datos entre apps del mismo desarrollador, usa el protocolo Transferable con formatos de fidelidad progresiva, optando solo por lo que quieres compartir.

### 55:46 — [Entidades intercambiables](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3346>)

**P.** ¿Son intercambiables mediante Transferable las entidades vinculadas a schemas como file y photo?

Sí — Transferable te permite declarar múltiples transformaciones de datos (texto, archivo, foto), incluso de forma dinámica por tipo de payload, de modo que un mensaje puede exportarse como foto a cualquier app que adopte el schema de fotos. También existe un protocolo FileEntity para formatos basados en archivos.

### 57:42 — [Schemas de coincidencia aproximada](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3462>)

**P.** ¿Es aceptable usar un schema de coincidencia aproximada como <span class="high">messages.MessagesPerson</span> para una lista de contactos genérica?

Sí — elige los schemas que encajen, aunque sea parcialmente. Unicorn Chat usa el schema de persona de mensajes de esta forma. Recurre a system.search o App Shortcuts cuando ningún schema encaje, asumiendo que App Shortcuts requieren tus propias frases de ejemplo.

### 1:00:04 — [Límites de tokens](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3604>)

**P.** Con la entrada de imágenes añadida, ¿hay nuevas restricciones en los tokens de prompt o instrucciones para el modelo en el dispositivo?

El modelo en el dispositivo se mantiene en 4.096 tokens; una imagen consume aproximadamente 200 tokens (medibles en Instruments). PCC ofrece 32K. Las nuevas APIs de recuento de tokens en la versión 26.4 ayudan, y ser preciso con las instrucciones más ejemplos saca más partido al modelo más pequeño — usa evaluaciones y hill climbing para ajustarlo.

---

## Destacados

- Foundation Models gana acceso a Private Cloud Compute (contexto de 32K) junto al modelo en el dispositivo (4.096 tokens) con nueva compatibilidad de entrada de imágenes
- Language Model Protocol hace el framework extensible — incorpora cualquier modelo, declara capacidades como visión y define segmentos personalizados para modalidades como vídeo
- App Schemas en distintos dominios (mensajes, calendario, system.search, system.open) gestionan frases, localización y flujos de confirmación para que escribas menos código
- El protocolo Transferable controla el intercambio de datos bidireccional y con consentimiento explícito entre apps, con formatos de fidelidad progresiva
- Evaluation Framework admite rúbricas de seguridad con model judge evaluator, tool call evaluators, datos sintéticos, hill climbing y visualización en Xcode/Instruments
- El nuevo framework de pruebas de App Intents habilita tests unitarios y de UI compatibles con CI; los dynamic profiles junto a Foundation Models Utilities ayudan a gestionar las transcripts ante cambios de tamaño de contexto

---

## Sesiones relacionadas

- [Explore advanced App Intents features for Siri and Apple Intelligence](<https://developer.apple.com/videos/play/wwdc2026/343/>) (Explora las funciones avanzadas de App Intents para Siri y Apple Intelligence)
- [What’s new in image understanding](<https://developer.apple.com/videos/play/wwdc2026/237/>) (Novedades en comprensión de imágenes)
- [Get to know App Intents](<https://developer.apple.com/videos/play/wwdc2025/244/>) (Conoce App Intents)
- [Create high-quality images using Image Playground](<https://developer.apple.com/videos/play/wwdc2026/375/>) (Crea imágenes de alta calidad con Image Playground)
- [Validate your App Intents adoption with AppIntentsTesting](<https://developer.apple.com/videos/play/wwdc2026/295/>) (Valida la adopción de App Intents con AppIntentsTesting)
- [Explore new advances in App Intents](<https://developer.apple.com/videos/play/wwdc2025/275/>) (Explora los nuevos avances en App Intents)

---
