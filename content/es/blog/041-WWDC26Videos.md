---
title: WWDC26 Videos
slug: wwdc26-videos
date: 2026-06-11
description: WWDC26 publica más de cien sesiones. Me he armado mi propia agrupación y checklist para verlas en mi orden y tachar bloques a lo largo del año.
tags: Swift, Conference
cover: WWDC26Videos
coverDescription: Jorge de pie frente a una pizarra negra escribiendo "WWDC 26 - Videos" con una secuencia numerada de iconos que representan un flujo de once pasos con flechas, mientras por la ventana se ve un parque con corredores y cielo azul.
publish: true
---
---
## Mi Problema 🤔

Cada año el mismo ritual: el lunes después de la Keynote abro los videos de la [WWDC26](https://developer.apple.com/videos/all-videos/?collection=wwdc26) y me encuentro con más de cien sesiones. Apple ofrece filtros por tema, plataforma y framework que se pueden ir acumulando hasta dejar el catálogo a tu medida — una base estupenda para arrancar.

Lo que me pasa a mí es que, incluso con esos filtros activos, si no me marco un orden propio acabo saltando de video en video según el título que más me llame en ese momento. Veo algo de <span class="high">SwiftUI</span>, luego salto a <span class="high">AI</span>, luego me pongo con herramientas, y al final del día he consumido cinco sesiones inconexas que no se refuerzan entre sí. La comprensión es superficial porque cada bloque temático necesita contexto previo que no tengo.

Llevo tiempo queriéndome armar mi propio esquema sobre lo que Apple ofrece. Un camino con sentido, que construya el conocimiento de manera acumulativa, que ponga primero lo que da contexto para todo lo demás — y que me sirva también como checklist para tachar bloques a medida que avanzo durante el año.

Este año lo he hecho.

---
## Mi Solución 🧩

Mi criterio es simple: **primero la visión general, luego el núcleo del lenguaje, después las herramientas, y al final las áreas específicas según lo que más use en mi trabajo**. Cada bloque prepara el terreno para el siguiente.

Dejo fuera solo las versiones en ASL y los recaps (Dub Dub Daily, recap del State of the Union). Todo lo demás entra — incluso los Group Labs, que aunque eran sesiones interactivas en directo Apple los mantiene en el catálogo y los dejo localizados al final por si necesitas referencia del tema.

Lo que viene a continuación es la agrupación que uso yo, y que voy tachando bloque a bloque a lo largo del año. Si te sirve, hazla tuya: lo que importa es tener un camino que seguir, no que sea el mío.

---

### Bloque 0 — Las presentaciones

Antes de cualquier sesión técnica, estos videos dan el marco del año. El teaser abre boca; Keynote y State of the Union son los que mandan.

**[Get ready for WWDC26](https://developer.apple.com/videos/play/wwdc2026/394/)**
El teaser pre-evento de la propia WWDC. Marginal una vez vista la Keynote pero está en el catálogo.

**[Keynote](https://developer.apple.com/videos/play/wwdc2026/101/)**
El gran anuncio del año. <span class="high">Liquid Glass</span>, <span class="high">Apple Intelligence</span> con la nueva <span class="high">Siri</span>, <span class="high">Xcode 27</span> con <span class="high">agentes de código</span>. No es técnico — es el por qué de todo lo demás.

**[Platforms State of the Union](https://developer.apple.com/videos/play/wwdc2026/102/)**
La Keynote para desarrolladores. Aquí ya aparece la capa técnica: qué cambia en las plataformas, qué prioridades tiene Apple este ciclo, y qué va a importar para el trabajo del día a día. Este video es el mapa del territorio.

---

### Bloque 1 — Swift y herramientas

Con el contexto del año claro, entro en el núcleo. <span class="high">Swift</span> primero porque todo lo demás construye sobre el lenguaje.

**[What's new in Swift](https://developer.apple.com/videos/play/wwdc2026/262/)**
Actualización del lenguaje: mejoras de ergonomía, <span class="high">concurrencia</span> mejorada, código de alto rendimiento más seguro, Embedded Swift e interoperabilidad con C y Java. El estado del lenguaje en 2026.

**[What's new in Xcode 27](https://developer.apple.com/videos/play/wwdc2026/258/)**
Las novedades del entorno: <span class="high">agentes de código</span>, <span class="high">Device Hub</span>, <span class="high">localización</span>, <span class="high">rendimiento</span> y <span class="high">herramientas de testing</span>. Si voy a vivir aquí, necesito saber qué ha cambiado.

**[Get the most out of Device Hub](https://developer.apple.com/videos/play/wwdc2026/260/)**
Tour profundo de <span class="high">Device Hub</span>: cómo acelera el flujo de desarrollo y cómo diagnosticar y reproducir issues rápido con dispositivos y simuladores. El compañero natural del video anterior.

**[Xcode, agents, and you](https://developer.apple.com/videos/play/wwdc2026/259/)**
Cómo incorporar los <span class="high">agentes de código de Xcode</span> al flujo de trabajo real. Desde el prototipo inicial hasta pulir una app terminada. La parte práctica de lo que se presentó en el video anterior.

**[Create UI prototypes using agents in Xcode](https://developer.apple.com/videos/play/wwdc2026/227/)**
<span class="high">Prototipado con agentes</span>: técnicas para iterar sobre layouts, generar soluciones creativas y refinar las ideas hasta una experiencia pulida. La cara creativa de los agentes en Xcode.

**[Translate your app using agents in Xcode](https://developer.apple.com/videos/play/wwdc2026/213/)**
Cómo los <span class="high">agentes traducen String Catalogs</span> usando el contexto de la app. Estrategias para revisar el output y ajustar las localizaciones. La cara práctica para producto global.

**[Build, deliver, and automate with Xcode Cloud](https://developer.apple.com/videos/play/wwdc2026/261/)**
Las novedades de <span class="high">Xcode Cloud</span>: arranque simplificado, tests en la nube, webhooks y distribución. Fundamentos para cualquiera que lo use en CI.

**[Profile, fix, and verify: Improve app responsiveness with Instruments](https://developer.apple.com/videos/play/wwdc2026/268/)**
Un flujo completo para atacar problemas de rendimiento: <span class="high">Swift Concurrency instrument</span>, <span class="high">Time Profiler</span> y <span class="high">System Trace</span>. Encontrar el cuello de botella, medir la mejora, confirmar el fix.

**[Meet the new MetricKit](https://developer.apple.com/videos/play/wwdc2026/222/)**
<span class="high">MetricKit</span> renovado con métricas de rendimiento vitales y diagnósticos accionables. Cruzar métricas con estado de la app vía <span class="high">StateReporting framework</span> para tener el cuadro completo de optimización.

**[Migrate to Swift Testing](https://developer.apple.com/videos/play/wwdc2026/267/)**
Adoptar <span class="high">Swift Testing</span> junto a los XCTests existentes usando interoperabilidad entre frameworks. Patrones para introducir las nuevas capacidades de testing de manera incremental. Conecta con lo que cuento en [SIGBUS](/es/blog/sigbus/).

---

### Bloque 2 — SwiftUI y persistencia

El stack de UI y datos. Lo veo junto porque en la práctica van de la mano.

**[What's new in SwiftUI](https://developer.apple.com/videos/play/wwdc2026/269/)**
Nuevo protocolo <span class="high">Document</span> con acceso directo a disco, APIs de reordenación en listas y grids, mejoras en toolbars, nuevas presentaciones, <span class="high">caché en AsyncImage</span> y lazy state para <span class="high">Observable</span>. El overview de lo nuevo en el framework.

**[What's new in SwiftData](https://developer.apple.com/videos/play/wwdc2026/274/)**
Persistencia de tipos externos con <span class="high">Codable</span>, agrupación de resultados en secciones para SwiftUI, <span class="high">ModelResultsObserver</span> e <span class="high">HistoryObserver</span> para observar cambios fuera de la vista. Las novedades del ORM de Apple.

**[Code-along: Add persistence with SwiftData](https://developer.apple.com/videos/play/wwdc2026/275/)**
Manos al teclado: añadir <span class="high">persistencia</span> a una app existente paso a paso. Definir modelos, integrar datos persistentes con SwiftUI, gestionar el estado de la app. El mejor sitio para que lo visto en el video anterior se consolide.

**[Code-along: Build powerful drag and drop in SwiftUI](https://developer.apple.com/videos/play/wwdc2026/271/)**
Construir Solitario para explorar las nuevas capacidades de drag and drop: <span class="high">API de reordenación</span>, drag containers para mover múltiples ítems, y ciclo de vida personalizado. Práctico y directo.

**[Dive into lazy stacks and scrolling with SwiftUI](https://developer.apple.com/videos/play/wwdc2026/321/)**
Rendimiento de listas y scroll en SwiftUI. Cuándo usar lazy stacks, cómo <span class="high">optimizar el comportamiento de scroll</span>, qué patrones evitar.

**[Compose advanced graphics effects with SwiftUI](https://developer.apple.com/videos/play/wwdc2026/322/)**
<span class="high">Efectos gráficos</span> avanzados con SwiftUI. Composición de capas, blending modes y efectos visuales que van más allá de lo básico.

**[Use SwiftUI with AppKit and UIKit](https://developer.apple.com/videos/play/wwdc2026/272/)**
Adopción incremental de SwiftUI en apps existentes de AppKit o UIKit: el framework <span class="high">Observation</span> para actualizar vistas, integrar componentes SwiftUI en jerarquías existentes, y añadir escenas completas SwiftUI sin cambiar la arquitectura.

**[Modernize your UIKit app](https://developer.apple.com/videos/play/wwdc2026/278/)**
Actualizar layouts de iPhone para funcionar bien con <span class="high">iPhone Mirroring</span> y en iPad. Nuevas APIs de tab y navigation bars, preparar la app para Apple Intelligence, y un skill para el agente de código que moderniza el codebase.

---

### Bloque 3 — Apple Intelligence y Foundation Models

El bloque que más me interesa este año. Lo veo como una unidad porque cada video construye sobre el anterior.

**[What's new in the Foundation Models framework](https://developer.apple.com/videos/play/wwdc2026/241/)**
Acceso a <span class="high">Private Cloud Compute</span>, integración de modelos de terceros y open source, capacidades de visión, APIs de gestión de contexto, <span class="high">búsqueda semántica integrada</span> y primitivas para experiencias agénticas. El overview del framework principal de AI en Apple.

**[Build agentic app experiences with the Foundation Models framework](https://developer.apple.com/videos/play/wwdc2026/242/)**
Perfiles dinámicos, instrucciones dinámicas, <span class="high">gestión del contexto</span> y patrones de orquestación entre modelos locales y de servidor. La capa avanzada sobre el video anterior.

**[Bring an LLM provider to the Foundation Models framework](https://developer.apple.com/videos/play/wwdc2026/339/)**
Extender el framework implementando un <span class="high">LanguageModelExecutor</span> para modelos nuevos. Interactuar con el transcript de la sesión, gestionar estado, optimizar el cache KV y soportar tipos de segmento personalizados. La puerta para integrar tu propio modelo en el stack de Apple.

**[Debug and profile agentic app experiences with Instruments](https://developer.apple.com/videos/play/wwdc2026/243/)**
Cómo depurar y perfilar experiencias agénticas con <span class="high">Instruments</span>. Porque cuando algo falla en un agente, necesitas saber dónde y por qué.

**[Meet the Evaluations framework](https://developer.apple.com/videos/play/wwdc2026/298/)**
En un mundo probabilístico, los tests unitarios no bastan. <span class="high">Métricas cuantitativas y cualitativas</span>, jueces de modelos, estadísticas agregadas para asegurar que las features de AI funcionan de manera fiable.

**[Create robust evaluations for agentic apps](https://developer.apple.com/videos/play/wwdc2026/299/)**
La <span class="high">capa avanzada de evaluaciones</span>: flujos con tool calling, condiciones dinámicas, generación de datos sintéticos, jueces y validación de datasets. El trabajo real detrás de que un agente se comporte correctamente.

**[Improve your prompts by hill-climbing with Evaluations](https://developer.apple.com/videos/play/wwdc2026/335/)**
Usar el ciclo de evaluación para mejorar prompts de manera iterativa. El cierre del bloque de evaluaciones.

**[Build AI-powered scripts with the fm CLI and Python SDK](https://developer.apple.com/videos/play/wwdc2026/334/)**
Scripts con el <span class="high">CLI de Foundation Models</span> y el SDK de Python. Automatización y prototipado fuera del entorno Swift.

---

### Bloque 4 — Siri y App Intents

El puente entre la app y la inteligencia del sistema. Voy de lo conceptual a lo práctico.

**[Announcing Apple's next big step for Siri and iPhone](https://developer.apple.com/videos/play/wwdc2026/121/)**
El gran anuncio del nuevo Siri. El contexto imprescindible antes de entrar en los videos técnicos de integración.

**[Discover new capabilities in the App Intents framework](https://developer.apple.com/videos/play/wwdc2026/345/)**
<span class="high">ValueRepresentation</span>, <span class="high">RelevantEntities</span>, <span class="high">EntityCollection</span>, <span class="high">SyncableEntity</span>, tipos de parámetro más ricos y long-running intents. Las novedades del framework base.

**[Explore advanced App Intents features for Siri and Apple Intelligence](https://developer.apple.com/videos/play/wwdc2026/343/)**
Técnicas avanzadas para que Siri interaccione con la app de manera natural: descubrimiento de contenido, <span class="high">indexación semántica</span>, búsqueda estructurada y conexión con notificaciones y Now Playing.

**[Build intelligent Siri experiences with App Schemas](https://developer.apple.com/videos/play/wwdc2026/240/)**
Adoptar <span class="high">App Schemas</span> para que la gente haga preguntas sobre datos de la app y tome acciones mediante lenguaje natural. Ejemplo práctico con eventos de calendario y Spotlight.

**[Code-along: Make your app available to Siri](https://developer.apple.com/videos/play/wwdc2026/344/)**
El code-along de todo lo anterior: integrar <span class="high">App Intents</span> en una app de calendario real, crear entidades, activar acciones de Siri y personalizar los snippets de respuesta.

**[Validate your App Intents adoption with AppIntentsTesting](https://developer.apple.com/videos/play/wwdc2026/295/)**
<span class="high">AppIntentsTesting</span>: validar los intents con la misma infraestructura que usan Siri, Shortcuts y Spotlight. Ejecutar intents, inspeccionar resultados, testear entities y queries sin automatización de UI. El cierre del bloque — probar lo que has integrado.

---

### Bloque 5 — Core AI y ML

Para quien quiere ir más allá de los frameworks de alto nivel y entrar en la capa de modelos.

**[Meet Core AI](https://developer.apple.com/videos/play/wwdc2026/324/)**
El <span class="high">nuevo framework</span> para despliegue de modelos de AI en el dispositivo: ecosistema completo desde Python para conversión y optimización hasta la API Swift para inferencia. Integración profunda con Xcode y compilación ahead-of-time.

**[Integrate on-device AI models into your app using Core AI](https://developer.apple.com/videos/play/wwdc2026/326/)**
Colección de modelos open source optimizados para Apple silicon — <span class="high">Qwen</span>, <span class="high">Mistral</span>, <span class="high">SAM3</span> — y cómo integrarlos con pocas líneas de código. Compilación AOT y especialización on-device.

**[Dive into Core AI model authoring and optimization](https://developer.apple.com/videos/play/wwdc2026/325/)**
Autoría y optimización de modelos con herramientas Python de <span class="high">Core AI</span>. La capa profunda para quien quiere controlar el pipeline completo.

**[Optimize custom machine learning operations with Metal tensors](https://developer.apple.com/videos/play/wwdc2026/330/)**
La <span class="high">Metal Tensor API</span> y la librería <span class="high">MPP Tensor Ops</span>. Crear operaciones portátiles que aprovechen los Neural Accelerators de M5 y A19, construir kernels custom para apps Core AI y trabajar con formatos cuantizados. La capa baja para empujar el rendimiento al máximo.

**[Explore numerical computing in Swift with MLX](https://developer.apple.com/videos/play/wwdc2026/328/)**
MLX para <span class="high">computación numérica</span> en Swift. Las primitivas sobre las que se construye todo lo demás en ML.

**[Explore distributed inference and training with MLX](https://developer.apple.com/videos/play/wwdc2026/233/)**
Inferencia y entrenamiento distribuidos con <span class="high">MLX</span>. Escalar a múltiples Macs.

**[Run local agentic AI on the Mac using MLX](https://developer.apple.com/videos/play/wwdc2026/232/)**
Agentes de AI corriendo <span class="high">localmente con privacidad</span>, baja latencia y sin conexión. <span class="high">OpenCode</span>, integración con Xcode y técnicas para escalar entre Macs.

**[Build with the new Apple Foundation Model on Private Cloud Compute](https://developer.apple.com/videos/play/wwdc2026/319/)**
Usar el nuevo modelo de Apple en <span class="high">Private Cloud Compute</span>. El extremo del espectro: cuando el dispositivo no es suficiente pero la privacidad sigue siendo prioritaria.

---

### Bloque 6 — Networking, servicios e infraestructura

Tres videos que cubren la capa de comunicación y runtime: del cliente al servicio, y de la infraestructura que los corre.

**[Build real-time apps and services with gRPC and Swift](https://developer.apple.com/videos/play/wwdc2026/265/)**
<span class="high">gRPC Swift</span> para experiencias en tiempo real: el framework RPC open source con streaming bidireccional, construido sobre Swift concurrency. Desde la definición del servicio en <span class="high">Protobuf</span> hasta el despliegue en producción. Los mensajes Protobuf son un 50% más pequeños que JSON y el runtime es moderno y seguro.

**[Discover container machines](https://developer.apple.com/videos/play/wwdc2026/389/)**
<span class="high">Máquinas contenedor</span> en Apple platforms. Infraestructura para desarrollo y despliegue de servicios Swift.

**[Expand the capabilities of your Virtualization app](https://developer.apple.com/videos/play/wwdc2026/224/)**
Capacidades nuevas en macOS 27 para apps de <span class="high">Virtualization</span>. Automatización del setup de huéspedes macOS en el primer arranque, passthrough de accesorios USB, topologías de red custom y port forwarding.

---

### Bloque 7 — Diseño y accesibilidad

La capa que no se ve pero que define si una app es buena o no.

**[Principles of great design](https://developer.apple.com/videos/play/wwdc2026/250/)**
Los principios fundamentales del <span class="high">diseño de apps</span> Apple. El marco conceptual antes de entrar en APIs concretas.

**[Communicate your brand identity on iOS](https://developer.apple.com/videos/play/wwdc2026/251/)**
Expresar la <span class="high">identidad de marca</span> en iOS con las nuevas herramientas de personalización visual.

**[Design intuitive search experiences](https://developer.apple.com/videos/play/wwdc2026/292/)**
<span class="high">Diseñar búsquedas</span> que la gente entienda y use. Patrones y antipatrones.

**[Craft clear names for features and labels in your app](https://developer.apple.com/videos/play/wwdc2026/290/)**
<span class="high">Nomenclatura de features y labels</span>. Uno de esos videos que parece menor y que acaba siendo de los más prácticos.

**[Refine accessibility for custom controls](https://developer.apple.com/videos/play/wwdc2026/220/)**
<span class="high">Accesibilidad en controles personalizados</span>. Cómo hacer que lo que construyes funcione para todo el mundo.

**[Modernize your AppKit app](https://developer.apple.com/videos/play/wwdc2026/289/)**
Modernizar AppKit a las convenciones actuales de macOS. Input con <span class="high">control events</span> y gesture recognizers más allá de tracking loops, navegación por teclado, restauración de estado, y nuevas APIs de corner concentricity para encajar con la estética macOS.

---

### Bloque 8 — Integración con el sistema

Las APIs que ponen mi app dentro del sistema: superficies como Live Activities, widgets, Lock Screen o CarPlay; integración con apps nativas (Workouts), accesorios Bluetooth, y atajos. Si la app vive más allá de su propia ventana, este bloque es relevante.

**[Live Activities essentials](https://developer.apple.com/videos/play/wwdc2026/223/)**
Fundamentos de <span class="high">Live Activities</span>: dónde aparecen, el nuevo estilo de <span class="high">Dynamic Island</span> en landscape, cómo estructurar contenido y datos, y cómo dispararlas en tiempo real con ActivityKit y push notifications. La base si voy a usar esta API.

**[WidgetKit foundations](https://developer.apple.com/videos/play/wwdc2026/277/)**
Los tipos de widget, qué los hace memorables, y cómo mantenerlos al día. <span class="high">Personalización vía App Intents</span> y estilos dinámicos. Si la app necesita vivir fuera de su icono, empieza aquí.

**[Create live communication experiences](https://developer.apple.com/videos/play/wwdc2026/226/)**
<span class="high">LiveCommunicationKit</span> transforma apps de comunicación real-time en experiencias integradas. UI de conversación nativa, presentación a pantalla completa en Lock Screen, multitasking con Dynamic Island. Conversaciones entrantes, salientes y de grupo.

**[Rev up your CarPlay app](https://developer.apple.com/videos/play/wwdc2026/212/)**
Nuevas features para apps de audio, navegación y conversación por voz en <span class="high">CarPlay</span>. Apps de video para reproducir contenido en vehículos compatibles cuando están aparcados. Thumbnails, info de media y controles por voz.

**[Deliver workout insights with HealthKit workout zones](https://developer.apple.com/videos/play/wwdc2026/207/)**
<span class="high">HealthKit</span> con workout insights —zonas de frecuencia cardiaca y de potencia en ciclismo. Zonas built-in o personalizadas, zona actual y tiempo en cada zona para guiar durante y después del entrenamiento.

**[Find your accessory with Bluetooth Channel Sounding](https://developer.apple.com/videos/play/wwdc2026/369/)**
<span class="high">Channel Sounding</span> añade distancia y dirección a accesorios Bluetooth. Nuevas APIs de Nearby Interaction y Core Bluetooth y los cambios necesarios en el accesorio. Consumo optimizado sin perder respuesta.

**[What's new in Shortcuts](https://developer.apple.com/videos/play/wwdc2026/310/)**
Construir atajos con el contenido de la app, nuevas automatizaciones del sistema, y la feature <span class="high">Use Model</span> para refinar cómo se presenta una App Entity a los LLMs. Atajos que almacenan información rica sincronizada entre dispositivos.

**[LLM search using Core Spotlight](https://developer.apple.com/videos/play/wwdc2026/246/)**
Convertir la búsqueda básica en un sistema <span class="high">RAG</span> con <span class="high">SpotlightSearchTool</span> y LanguageModelSession. Integración con Core Spotlight, hidratación por delegate, PipelineStages para tareas como análisis de sentimiento. Búsqueda contextual real sobre el índice del sistema.

---

### Bloque 9 — Seguridad y administración

Cinco videos que importan más que nunca este año. Con toda la AI añadida, dar por hecho que la integridad de la app, la inyección de prompts o la manipulación del usuario no son problema tuyo es un riesgo. Y para apps que viven en entornos gestionados —educación, empresa, flota— también la postura administrativa importa.

**[Secure your app: mitigate risks to agentic features](https://developer.apple.com/videos/play/wwdc2026/347/)**
Evaluar amenazas de <span class="high">inyección indirecta de prompts</span>: data exfiltration, acciones no deseadas. Salvaguardas del sistema y buenas prácticas con App Intents y Foundation Models —confirmaciones de usuario, diseño seguro de prompts, autenticación. Obligatorio si tengo features agénticas.

**[Secure your apps with App Attest](https://developer.apple.com/videos/play/wwdc2026/201/)**
<span class="high">App Attest</span> contra modificación no autorizada y fraude. Cómo los atacantes spoofean datos y saltan checks, y cómo defenderse. Generar y gestionar claves en el <span class="high">Secure Enclave</span>, validar attestations y assertions, y usar la fraud metric para detectar abuso.

**[Meet Trust Insights](https://developer.apple.com/videos/play/wwdc2026/379/)**
<span class="high">Trust Insights</span> usa ML preservando la privacidad para detectar cuándo alguien podría estar siendo manipulado a acciones de riesgo. Integración, interpretación de señales y diseño de intervenciones que protejan respetando la privacidad.

**[What's new in managing Apple devices](https://developer.apple.com/videos/play/wwdc2026/206/)**
Updates a <span class="high">declarative device management</span>, Apple Business y Apple School Manager. Streamline de despliegue, refuerzo de seguridad y mejora de la experiencia de la flota gestionada.

**[What's new in assessment on macOS](https://developer.apple.com/videos/play/wwdc2026/230/)**
<span class="high">Automatic Assessment Configuration</span> en macOS para apps de educación. APIs para crear entornos de examen seguros y configurables que incorporan más features del sistema. Prechecks automáticos y controles de accesibilidad para una experiencia de examen fiable.

---

### Bloque 10 — visionOS, RealityKit y contenido espacial

El bloque más extenso del catálogo. Lo veo solo si trabajo con Vision Pro o si quiero experimentar con escenas espaciales. Si no es mi área, lo dejo para más adelante.

**[Build next-generation experiences with visionOS 27](https://developer.apple.com/videos/play/wwdc2026/287/)**
El <span class="high">overview de visionOS 27</span>: las distintas vías para construir experiencias —tools nativas de Apple, streaming inmersivo desde Mac o PC, third-party engines, port de apps iOS. Avances en creación de contenido 3D, immersive media y object tracking. El video con el que arrancar el bloque.

**[Explore advances in RealityKit](https://developer.apple.com/videos/play/wwdc2026/279/)**
Las novedades de <span class="high">RealityKit</span>: simulaciones interactivas de tela, <span class="high">NavMesh</span> pathfinding, iluminación mixed reality, reverb meshes personalizables para audio espacial. Mejor sombreado, character rendering y soporte para <span class="high">Gaussian splatting</span>.

**[Design immersive environments for visionOS apps and the spatial web](https://developer.apple.com/videos/play/wwdc2026/234/)**
Crear <span class="high">entornos fotorrealistas</span> para apps visionOS, webs y experiencias SharePlay. Principios de diseño, captura de referencias, preparación de assets CG de alta fidelidad y efectos en tiempo real como movimiento e iluminación.

**[Iterate your spatial scenes faster with Reality Composer Pro 3](https://developer.apple.com/videos/play/wwdc2026/280/)**
Las novedades de <span class="high">Reality Composer Pro 3</span>: contenido, VFX, iluminación e interactividad sin salir del editor. Features asistidas por AI integradas en el flujo. La herramienta donde vivirás si haces contenido espacial.

**[Extend Reality Composer Pro 3 functionality with Xcode](https://developer.apple.com/videos/play/wwdc2026/281/)**
<span class="high">Plugins</span> específicos del proyecto en Reality Composer Pro 3: componentes custom, sistemas custom, nodos propios de <span class="high">ScriptGraph</span>. Control completo del workflow de autoría espacial.

**[Discover the Spatial Preview framework](https://developer.apple.com/videos/play/wwdc2026/282/)**
El nuevo <span class="high">Spatial Preview framework</span> envía contenido desde Mac directo a visionOS. Live-syncing y edición bidireccional entre plataformas. La API SpatialPreview, device discovery, integración 2D/3D y nuevas capacidades de Quick Look.

**[Explore enhancements to visionOS object tracking](https://developer.apple.com/videos/play/wwdc2026/283/)**
Avances en <span class="high">object tracking</span> y accesorios espaciales. Trackear objetos en movimiento y handheld, nuevas clases de accesorios espaciales soportadas, y cómo construir accesorios custom para abrir modelos de interacción únicos.

**[Collaborate on structured 3D models in visionOS](https://developer.apple.com/videos/play/wwdc2026/284/)**
Modelos 3D estructurados en visionOS: preparación <span class="high">USDZ</span>, manipulación de entidades dentro de ensamblajes jerárquicos, inspección con un plano de corte transversal. Animaciones tipo exploded-view para diseño y colaboración en Vision Pro.

**[Discover USDKit and what's new in OpenUSD](https://developer.apple.com/videos/play/wwdc2026/285/)**
<span class="high">USDKit</span> en Swift, la nueva API de preview espacial, web espacial mejorado. Updates al estándar <span class="high">OpenUSD</span>: accesibilidad, Gaussian splats, geometría comprimida. Tools de edición y rendering USD ampliadas en Preview para Mac.

**[Use foveated streaming to bring immersive content to visionOS](https://developer.apple.com/videos/play/wwdc2026/286/)**
<span class="high">Foveated streaming</span>: escenas renderizadas remotamente a Vision Pro en máxima fidelidad. Combina capacidades nativas con streaming third-party de forma inalámbrica, demostrado con una escena <span class="high">OpenXR</span> y NVIDIA CloudXR. Foveated dinámico sin comprometer la privacidad.

**[Explore immersive website environments in visionOS](https://developer.apple.com/videos/play/wwdc2026/320/)**
La nueva <span class="high">Immersive API</span> en JavaScript transporta visitantes de tu web a entornos virtuales en Vision Pro. Transiciones desde un model element inline, video docking, optimización a escala real. Pocas líneas de código corriendo en la web.

**[Supercharge your spatial workflows with Reality Composer Pro 3](https://developer.apple.com/videos/play/wwdc2026/393/)**
Interactividad rica y efectos visuales completos dentro de Reality Composer Pro: <span class="high">Shader Graph</span> para materiales, <span class="high">Animation Graph</span> para blending de animaciones esqueléticas, <span class="high">Compute Graph</span> para partículas. Script Graph para interactividad, Sequencer para eventos y Behavior Trees para NPCs.

**[Build live production tools for Apple Immersive Video](https://developer.apple.com/videos/play/wwdc2026/338/)**
Producción en directo de <span class="high">Apple Immersive Video</span>. Empaquetar video inmersivo, audio espacial y metadata de escena para transporte sobre IP con el estándar <span class="high">SMPTE 2110</span>. Immersive Media Support, Video Toolbox y AVFoundation para flujos en tiempo real.

---

### Bloque 11 — Juegos y Metal

Si trabajo en un juego, este bloque es parada obligada. Si no, lo veo por curiosidad porque hay piezas de rendimiento que aplican también a apps no-juego.

**[Bringing Cyberpunk 2077 to Mac](https://developer.apple.com/videos/play/wwdc2026/356/)**
Cómo CD PROJEKT RED llevó <span class="high">Cyberpunk 2077 a Mac</span> aprovechando hardware, software y tools de Apple. Técnicas aplicables a otros juegos. El preset <span class="high">For this Mac</span> que optimiza settings automáticamente para balancear fidelidad visual y framerate en toda la línea Mac.

**[Speedrun your game port with agentic coding](https://developer.apple.com/videos/play/wwdc2026/357/)**
Las nuevas <span class="high">skills agénticas</span> del Game Porting Toolkit 4 aceleran el port. Adoptar <span class="high">Metal 4</span>, integrar <span class="high">MetalFX</span>, tune del juego para hardware Apple. Agentes que diagnostican issues de GPU rendering autónomamente.

**[Make your game great with touch](https://developer.apple.com/videos/play/wwdc2026/358/)**
Controles touch convincentes para juegos. Insights de devs indie a AAA, buenas prácticas, y cómo aprovechar el <span class="high">Touch Controller framework</span> y Metal para rendimiento óptimo.

**[Design no-code games with Reality Composer Pro 3](https://developer.apple.com/videos/play/wwdc2026/252/)**
<span class="high">ScriptGraph</span> en Reality Composer Pro 3 para contenido 3D no-code. Nodos visuales para animaciones, momentos interactivos, e integración con SwiftUI para añadir bocadillos y UI a la experiencia.

**[Build real-time neural rendering pipelines with Metal](https://developer.apple.com/videos/play/wwdc2026/359/)**
ML integrado en el pipeline de rendering con <span class="high">Metal 4</span>. <span class="high">MetalFX neural denoising</span> con insights de Maxon Redshift Live. Entrenar y desplegar un neural tone mapper inline con el ML command encoder, y la nueva tensor API para redes pequeñas dentro de tus shaders.

**[Find and fix performance issues in your Metal games](https://developer.apple.com/videos/play/wwdc2026/388/)**
Caza de problemas de rendimiento con tools de Metal: <span class="high">Game Performance Overview</span> en Instruments, traces en background con metalperftrace y Control Center, y la nueva <span class="high">StateReporting API</span> para correlar métricas con el estado runtime del juego. Horas de telemetría convertidas en insights accionables.

---

### Bloque 12 — Cámara, fotografía e imagen

Para apps con cámara o procesamiento de imagen. Algunos videos son muy específicos (RAW, Center Stage), otros aplican incluso si solo despliego un preview.

**[What's new in image understanding](https://developer.apple.com/videos/play/wwdc2026/237/)**
Vision framework y Foundation Models actualizados. La nueva request <span class="high">tap-to-segment</span> para segmentar imágenes, Vision en watchOS, y soporte de imágenes en el Apple Foundation Model combinado con OCR, escaneo de barcodes y tools propias.

**[Best practices for integrating visual intelligence in your app](https://developer.apple.com/videos/play/wwdc2026/297/)**
Cómo <span class="high">Visual Intelligence</span> transforma el descubrimiento de contenido. Definir entidades, procesar imágenes, manejar múltiples tipos de resultado. Optimización de velocidad y relevancia, e intents para acciones directas como abrir o reproducir contenido con un tap.

**[Build a responsive camera app that launches quickly](https://developer.apple.com/videos/play/wwdc2026/303/)**
Optimizar la secuencia completa de arranque de la cámara —desde el startup hasta el <span class="high">primer frame de preview</span>. Nuevas APIs para lanzamientos más rápidos, rendering fluido y rendimiento sostenido. Para que la gente nunca se pierda el momento.

**[Implement high resolution photo capture](https://developer.apple.com/videos/play/wwdc2026/304/)**
Captura de fotos en alta resolución con AVFoundation. Las tres opciones —<span class="high">RAW</span>, <span class="high">exposure-bracketed</span>, <span class="high">fully processed</span>— y cuándo usar cada una. Configurar captura de 24MP y 48MP en cámaras Main, Tele y Ultra Wide. Deferred photo processing para que la app responda incluso con disparos rápidos.

**[Enhance RAW image processing with Core Image](https://developer.apple.com/videos/play/wwdc2026/305/)**
La versión 9 de las APIs RAW de <span class="high">Core Image</span>: más nitidez, color más definido, Apple Neural Engine para rendimiento. <span class="high">CIRAWFilter</span> para editar exposición, ruido, sharpness y contraste. Nuevas CIImageProcessor APIs con control fino sobre tile sizing y buffers.

**[Support the Center Stage front camera in your iOS app](https://developer.apple.com/videos/play/wwdc2026/341/)**
<span class="high">Center Stage</span> con AVCapture APIs en la cámara frontal de iPhone 17, 17 Pro y Air. Zoom y rotate, framing flexible para selfies y videos, todos en el encuadre en fotos de grupo. Integración en videollamadas con auto-framing y estabilización en tiempo real.

**[Create high quality images using Image Playground](https://developer.apple.com/videos/play/wwdc2026/375/)**
Generación de imágenes con <span class="high">Image Playground</span>. Modelo generativo en <span class="high">Private Cloud Compute</span>, imágenes en casi cualquier estilo incluyendo fotorrealista, dimensiones específicas, y modificación mediante lenguaje natural y touch.

---

### Bloque 13 — Web y Safari

Para web devs: las novedades de WebKit y nuevas piezas de CSS y HTML que Safari estrena este año.

**[What's new in WebKit for Safari 27](https://developer.apple.com/videos/play/wwdc2026/204/)**
El overview de WebKit y <span class="high">Safari 27</span>: Grid Lanes, Customizable Select, HTML Model, Immersive Environments, lo último de Web Extensions. Más de 1.000 mejoras del engine para hacer la web más fiable.

**[Get started with the HTML Model Element](https://developer.apple.com/videos/play/wwdc2026/215/)**
El <span class="high">model element</span> trae contenido 3D interactivo a webs en iOS, iPadOS, macOS y visionOS. Tools para crear y optimizar assets 3D, features del model element, y hacia dónde van los web standards en 3D.

**[Create web extensions for Safari](https://developer.apple.com/videos/play/wwdc2026/216/)**
Construir y probar <span class="high">web extensions</span> de Safari desde cero —sin Xcode. Content blocking, modificación de páginas, native messaging y el permissions mode trabajando juntos para una experiencia potente y respetuosa con la privacidad.

**[Learn CSS Grid Lanes](https://developer.apple.com/videos/play/wwdc2026/314/)**
<span class="high">Grid Lanes</span> para layouts web adaptables con elementos de formas variadas. CSS limpio y flexible, y <span class="high">flow-tolerance</span> para refinar accesibilidad sin perder maleabilidad.

**[Rediscover the HTML select element](https://developer.apple.com/videos/play/wwdc2026/315/)**
Control total del estilo en select menus web. Nuevo valor CSS <span class="high">appearance</span> y nuevos pseudo-elementos, contenido rico dentro de options con nuevas posibilidades HTML. Selects a medida del design system sin renunciar a accesibilidad ni robustez.

---

### Bloque 14 — StoreKit, App Store, suscripciones y Wallet

Para todo lo que toca monetización y App Store Connect. Si vendo algo en mi app, este bloque importa.

**[What's new in Apple In-App Purchase](https://developer.apple.com/videos/play/wwdc2026/210/)**
Las nuevas <span class="high">suscripciones mensuales con compromiso a 12 meses</span> como opción más asequible. Configurar y testear con App Store Connect, StoreKit APIs y Xcode testing. Mejoras en redención de offer codes y en la experiencia de App Review.

**[Enhance your presence on the App Store](https://developer.apple.com/videos/play/wwdc2026/205/)**
Reimaginar el marketing en el App Store usando imágenes y videos en nuevos lugares. Placements visuales nuevos en product page, resultados de búsqueda y campañas de Apple Ads. El nuevo <span class="high">Asset Library</span> centraliza assets y un tool permite ver la product page antes de publicarla.

**[What's new in Wallet](https://developer.apple.com/videos/play/wwdc2026/209/)**
Nuevos estilos de pase para diseños ricos. Nuevos formatos de barcode y una API flexible de pass actions. <span class="high">Pass Designer</span> y <span class="high">Pass Builder</span> simplifican diseñar, personalizar y distribuir pases a escala.

**[Explore Retention Messaging in App Store Connect](https://developer.apple.com/videos/play/wwdc2026/309/)**
<span class="high">Retention Messaging</span> para alcanzar suscriptores antes de que cancelen. Configurar en App Store Connect, añadir subscription offers, y usar la API para mensajería en tiempo real y alternativas que animen a quedarse.

**[Unlock in-game content with StoreKit and Background Assets](https://developer.apple.com/videos/play/wwdc2026/378/)**
In-App Purchases nativas en Unity con el nuevo <span class="high">StoreKit plug-in</span>. Reducción del tamaño de descarga con <span class="high">Background Assets plug-in</span> entregando packs por idioma. Y un Steam Asset Converter para migrar builds existentes.

**[Offer subscriptions to groups and organizations](https://developer.apple.com/videos/play/wwdc2026/391/)**
<span class="high">Group Purchases</span>: un suscriptor compra varios asientos e invita a otros desde la app. <span class="high">Volume Purchasing</span> vía Apple Business y Apple School Manager pone tus suscripciones delante de compradores enterprise y educación que ya compran apps a escala.

---

### Bloque 15 — Música, audio y subtítulos

Para apps con contenido multimedia. Hay un framework nuevo este año (<span class="high">Music Understanding</span>) que merece atención incluso si no haces apps de música.

**[Meet the Music Understanding framework](https://developer.apple.com/videos/play/wwdc2026/253/)**
Nuevo framework <span class="high">Music Understanding</span> que analiza audio en seis dimensiones, on-device: clave, ritmo, estructura, pace, actividad instrumental y loudness. Y un sample app, Music Understanding Lab, para visualizar resultados.

**[Integrate MusicKit into your app](https://developer.apple.com/videos/play/wwdc2026/254/)**
Apple Music dentro de tu app con <span class="high">MusicKit</span>. Autorización, suscripción, selección de música, control de playback y compartir canciones entre storefronts. Nuevo <span class="high">Music Picker</span> para navegar el catálogo y librerías personales. Diferencias entre SystemMusicPlayer y ApplicationMusicPlayer.

**[Discover generated subtitles and subtitle styles](https://developer.apple.com/videos/play/wwdc2026/256/)**
<span class="high">Subtítulos generados</span> on-device que transcriben o traducen desde otro idioma. Caption style preview para personalizar y previsualizar durante el playback. Implementación con AVKit, AVPlayerLayer y Media Accessibility.

**[Meet the Now Playing framework](https://developer.apple.com/videos/play/wwdc2026/312/)**
Nuevo framework Swift <span class="high">Now Playing</span> que conecta el playback de tu app con las superficies del sistema: Lock Screen, Control Center, Dynamic Island, CarPlay. Publicar estado, responder a comandos vía API observable, y <span class="high">remote playback sessions</span> para representar media en dispositivos externos.

---

### Bloque 16 — Accesibilidad, lectura y texto

La capa del texto y la lectura. Aquí no es solo APIs nuevas — es cómo encaja la app con las preferencias de cada persona.

**[Enhance the accessibility of your reading app](https://developer.apple.com/videos/play/wwdc2026/219/)**
Experiencias de lectura robustas para <span class="high">VoiceOver</span> y <span class="high">Speak Screen</span>. Selección de texto intuitiva, navegación clara entre líneas y párrafos, y lectura continua entre elementos y entre páginas.

**[Prepare your tvOS apps for Dynamic Type](https://developer.apple.com/videos/play/wwdc2026/221/)**
<span class="high">Dynamic Type</span> en tvOS: implementar escalado de fuentes, adaptar layouts para tamaños grandes, optimizar grids y carousels media-focused. Para que cualquier tamaño de texto siga siendo cómodo.

**[Elevate your app's text experience with TextKit](https://developer.apple.com/videos/play/wwdc2026/370/)**
Combinar la conveniencia de los text views built-in con el control de <span class="high">TextKit</span>. Nuevas APIs para extender UITextView y NSTextView con comportamientos custom como números de línea o secciones colapsables. Arquitectura TextKit, caching y políticas de reuse para text attachments.

**[Unwrap PaperKit](https://developer.apple.com/videos/play/wwdc2026/372/)**
Aplicaciones canvas-based con <span class="high">PaperKit</span>. APIs nuevas del data model para acceder, crear y modificar elementos de markup. Controles custom, anotaciones, y buenas prácticas para integrar un canvas creativo completo.

**[Read between the strokes with PencilKit](https://developer.apple.com/videos/play/wwdc2026/203/)**
Reconocimiento de escritura a mano con la misma tecnología detrás de Freeform y Notes. Reconocimiento en muchos alfabetos e idiomas, y nuevas capacidades para integrar <span class="high">PencilKit</span> en más tipos de apps.

---

### Bloque 17 — Group Labs

Las Group Labs eran sesiones de Q&A en directo con ingenieros y diseñadores de Apple durante la semana del evento. Apple las mantiene en el catálogo aunque la sesión interactiva ya pasara, así que sirven como referencia rápida del área en la que esté trabajando. Las descripciones oficiales son prácticamente la misma boilerplate, así que las agrupo por tema con una línea de contexto.

- **Núcleo del lenguaje y frameworks principales**
  - **[Swift Group Lab](https://developer.apple.com/videos/play/wwdc2026/8001/)** — Q&A sobre los anuncios de Swift de la semana.
  - **[SwiftUI Group Lab](https://developer.apple.com/videos/play/wwdc2026/8006/)** y **[SwiftUI Group Lab (segunda tanda)](https://developer.apple.com/videos/play/wwdc2026/8120/)** — Dos sesiones de Q&A sobre los anuncios de SwiftUI.
  - **[SwiftUI for Beginners Group Lab](https://developer.apple.com/videos/play/wwdc2026/8002/)** — Q&A para arrancar con SwiftUI desde cero.
  - **[SwiftData Group Lab](https://developer.apple.com/videos/play/wwdc2026/8017/)** — Q&A sobre los anuncios de SwiftData.
- **Xcode, rendimiento y plataformas**
  - **[Xcode Tips and Tricks Group Lab](https://developer.apple.com/videos/play/wwdc2026/8013/)** — Q&A para sacarle el máximo a Xcode.
  - **[Power and Performance Group Lab](https://developer.apple.com/videos/play/wwdc2026/8003/)** — Q&A sobre los anuncios de potencia y rendimiento.
  - **[visionOS Group Lab](https://developer.apple.com/videos/play/wwdc2026/8004/)** — Q&A sobre los anuncios de visionOS.
  - **[watchOS Group Lab](https://developer.apple.com/videos/play/wwdc2026/8014/)** — Q&A sobre los anuncios de watchOS.
  - **[Safari and Web Technologies Group Lab](https://developer.apple.com/videos/play/wwdc2026/8015/)** — Q&A sobre los anuncios de Safari y tecnologías web.
- **Inteligencia, ML y AI**
  - **[Apple Intelligence Group Lab](https://developer.apple.com/videos/play/wwdc2026/8011/)** — Q&A sobre los anuncios de Apple Intelligence.
  - **[Machine Learning & AI Group Lab](https://developer.apple.com/videos/play/wwdc2026/8016/)** — Q&A sobre los anuncios de ML y AI.
  - **[Coding Intelligence for Beginners Group Lab](https://developer.apple.com/videos/play/wwdc2026/8007/)** — Q&A para arrancar con coding intelligence.
  - **[Coding Intelligence, Machine Learning & AI Group Lab](https://developer.apple.com/videos/play/wwdc2026/8121/)** — Q&A combinado sobre coding intelligence, ML y AI.
- **Plataforma, distribución y diseño**
  - **[Accessibility Technologies Group Lab](https://developer.apple.com/videos/play/wwdc2026/8005/)** — Q&A sobre los anuncios de accesibilidad.
  - **[Privacy and Security Group Lab](https://developer.apple.com/videos/play/wwdc2026/8009/)** — Q&A sobre los anuncios de privacidad y seguridad.
  - **[App Store Connect Group Lab](https://developer.apple.com/videos/play/wwdc2026/8010/)** — Q&A sobre los anuncios de App Store Connect.
  - **[Camera and Photo Technologies Group Lab](https://developer.apple.com/videos/play/wwdc2026/8018/)** — Q&A sobre los anuncios de cámara y fotografía.
  - **[Icon Composer for Beginners Group Lab](https://developer.apple.com/videos/play/wwdc2026/8012/)** — Q&A para arrancar con Icon Composer.

---

## Mi Resultado 🎯

Con este orden me ahorro el caos del catálogo y empiezo a ver resultados desde la primera semana.

Mi secuencia resumida:

- **Bloque 0** — Las presentaciones
- **Bloque 1** — Swift y herramientas
- **Bloque 2** — SwiftUI y persistencia
- **Bloque 3** — Apple Intelligence y Foundation Models
- **Bloque 4** — Siri y App Intents
- **Bloque 5** — Core AI y ML
- **Bloque 6** — Networking, servicios e infraestructura
- **Bloque 7** — Diseño y accesibilidad
- **Bloque 8** — Integración con el sistema
- **Bloque 9** — Seguridad y administración
- **Bloque 10** — visionOS, RealityKit y contenido espacial
- **Bloque 11** — Juegos y Metal
- **Bloque 12** — Cámara, fotografía e imagen
- **Bloque 13** — Web y Safari
- **Bloque 14** — StoreKit, App Store, suscripciones y Wallet
- **Bloque 15** — Música, audio y subtítulos
- **Bloque 16** — Accesibilidad, lectura y texto
- **Bloque 17** — Group Labs

Si llevas años viendo el <span class="high">WWDC</span> sabrás que el catálogo nunca caduca — los videos están disponibles todo el año en [developer.apple.com](https://developer.apple.com/videos/all-videos/?collection=wwdc26). Junio es para las novedades, el resto del año para profundizar. Como conté en [WWDC 26](/es/blog/wwdc26/), las sesiones técnicas son el plato fuerte — y ahora ya tengo mi propia checklist por la que ir tachando.

**Keep coding, keep running** 🏃‍♂️

---
