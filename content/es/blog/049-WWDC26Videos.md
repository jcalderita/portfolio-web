---
title: WWDC26 Videos
slug: wwdc26-videos
date: 2026-08-12
description: Más de cien sesiones de WWDC26 y ningún orden oficial. Aquí está mi guía personal para verlas agrupadas y con coherencia, empezando por lo que más importa.
tags: Swift, Conference
cover: WWDC26Videos
coverDescription: Jorge de pie frente a una pizarra negra escribiendo "WWDC 26 - Videos" con una secuencia numerada de iconos que representan un flujo de once pasos con flechas, mientras por la ventana se ve un parque con corredores y cielo azul.
publish: true
---
---
## Mi Problema 🤔

Cada año el mismo ritual: el lunes después de la Keynote abro [developer.apple.com/videos](https://developer.apple.com/videos/all-videos/?collection=wwdc26) y me encuentro con más de cien sesiones. Sin orden de reproducción sugerido. Sin camino claro. Solo un catálogo enorme donde todo parece igual de importante.

El problema no es el contenido — es que sin estructura, lo que acaba pasando es que empiezo a saltar de video en video según el título que más me llame en ese momento. Veo algo de <span class="high">SwiftUI</span>, luego salto a <span class="high">AI</span>, luego me pongo con herramientas, y al final del día he consumido cinco sesiones inconexas que no se refuerzan entre sí. La comprensión es superficial porque cada bloque temático necesita contexto previo que no tengo.

Llevo tiempo queriéndome armar un orden propio. Un camino que tenga sentido, que construya el conocimiento de manera acumulativa, y que ponga primero lo que da contexto para todo lo demás.

Este año lo he hecho.

---
## Mi Solución 🧩

Mi criterio es simple: **primero la visión general, luego el núcleo del lenguaje, después las herramientas, y al final las áreas específicas según lo que más use en mi trabajo**. Cada bloque prepara el terreno para el siguiente.

Dejo fuera solo las versiones en ASL y los recaps (Dub Dub Daily, recap del State of the Union). Todo lo demás entra — incluso los Group Labs, que aunque eran sesiones interactivas en directo Apple los mantiene en el catálogo y los dejo localizados al final por si necesitas referencia del tema.

---

### Bloque 0 — La base

Antes de cualquier sesión técnica, estos dos videos dan el marco del año. Son los que mandan.

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

### Bloque 6 — Swift del lado del servidor

Solo dos videos este año, pero los dos tocan piezas grandes.

**[Build real-time apps and services with gRPC and Swift](https://developer.apple.com/videos/play/wwdc2026/265/)**
<span class="high">gRPC Swift</span> para experiencias en tiempo real: el framework RPC open source con streaming bidireccional, construido sobre Swift concurrency. Desde la definición del servicio en <span class="high">Protobuf</span> hasta el despliegue en producción. Los mensajes Protobuf son un 50% más pequeños que JSON y el runtime es moderno y seguro.

**[Discover container machines](https://developer.apple.com/videos/play/wwdc2026/389/)**
<span class="high">Máquinas contenedor</span> en Apple platforms. Infraestructura para desarrollo y despliegue de servicios Swift.

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

---

### Bloque 8 — Temas específicos (según proyecto)

Estos videos los veo según lo que tenga entre manos. Los agrupo por área para que cada uno tire del hilo que le toque. La capa de UI del sistema y la de seguridad están aquí porque, aunque importantes, no son universales — dependen del tipo de app que estés construyendo.

**UI del sistema y automatización**

- [Live Activities essentials](https://developer.apple.com/videos/play/wwdc2026/223/) — fundamentos de <span class="high">Live Activities</span>, imprescindible si usas esta API.
- [WidgetKit foundations](https://developer.apple.com/videos/play/wwdc2026/277/) — fundamentos de <span class="high">WidgetKit</span>.
- [What's new in Shortcuts](https://developer.apple.com/videos/play/wwdc2026/310/) — novedades en <span class="high">Shortcuts</span> y la automatización del sistema.
- [LLM search using Core Spotlight](https://developer.apple.com/videos/play/wwdc2026/246/) — búsqueda con LLMs sobre <span class="high">Core Spotlight</span>.

**Seguridad**

- [Secure your app: mitigate risks to agentic features](https://developer.apple.com/videos/play/wwdc2026/347/) — con toda la AI añadida este año, obligatorio si tienes features agénticas.
- [Secure your apps with App Attest](https://developer.apple.com/videos/play/wwdc2026/201/) — <span class="high">App Attest</span> para verificar la integridad de la app.

**visionOS, RealityKit y contenido espacial**

- [Build next-generation experiences with visionOS 27](https://developer.apple.com/videos/play/wwdc2026/287/)
- [Explore advances in RealityKit](https://developer.apple.com/videos/play/wwdc2026/279/)
- [Design immersive environments for visionOS apps and the spatial web](https://developer.apple.com/videos/play/wwdc2026/234/)
- [Iterate your spatial scenes faster with Reality Composer Pro 3](https://developer.apple.com/videos/play/wwdc2026/280/)
- [Extend Reality Composer Pro 3 functionality with Xcode](https://developer.apple.com/videos/play/wwdc2026/281/)
- [Discover the Spatial Preview framework](https://developer.apple.com/videos/play/wwdc2026/282/)
- [Explore enhancements to visionOS object tracking](https://developer.apple.com/videos/play/wwdc2026/283/)
- [Collaborate on structured 3D models in visionOS](https://developer.apple.com/videos/play/wwdc2026/284/)
- [Discover USDKit and what's new in OpenUSD](https://developer.apple.com/videos/play/wwdc2026/285/)
- [Use foveated streaming to bring immersive content to visionOS](https://developer.apple.com/videos/play/wwdc2026/286/)
- [Explore immersive website environments in visionOS](https://developer.apple.com/videos/play/wwdc2026/320/)
- [Supercharge your spatial workflows with Reality Composer Pro 3](https://developer.apple.com/videos/play/wwdc2026/393/)

**Juegos y Metal**

- [Bringing Cyberpunk 2077 to Mac](https://developer.apple.com/videos/play/wwdc2026/356/)
- [Speedrun your game port with agentic coding](https://developer.apple.com/videos/play/wwdc2026/357/)
- [Make your game great with touch](https://developer.apple.com/videos/play/wwdc2026/358/)
- [Build real-time neural rendering pipelines with Metal](https://developer.apple.com/videos/play/wwdc2026/359/)
- [Find and fix performance issues in your Metal games](https://developer.apple.com/videos/play/wwdc2026/388/)

**Cámara, fotografía e imagen**

- [What's new in image understanding](https://developer.apple.com/videos/play/wwdc2026/237/)
- [Best practices for integrating visual intelligence in your app](https://developer.apple.com/videos/play/wwdc2026/297/)
- [Build a responsive camera app that launches quickly](https://developer.apple.com/videos/play/wwdc2026/303/)
- [Implement high resolution photo capture](https://developer.apple.com/videos/play/wwdc2026/304/)
- [Enhance RAW image processing with Core Image](https://developer.apple.com/videos/play/wwdc2026/305/)
- [Support the Center Stage front camera in your iOS app](https://developer.apple.com/videos/play/wwdc2026/341/)
- [Create high quality images using Image Playground](https://developer.apple.com/videos/play/wwdc2026/375/)

**Web y Safari**

- [What's new in WebKit for Safari 27](https://developer.apple.com/videos/play/wwdc2026/204/)
- [Get started with the HTML Model Element](https://developer.apple.com/videos/play/wwdc2026/215/)
- [Create web extensions for Safari](https://developer.apple.com/videos/play/wwdc2026/216/)
- [Learn CSS Grid Lanes](https://developer.apple.com/videos/play/wwdc2026/314/)
- [Rediscover the HTML select element](https://developer.apple.com/videos/play/wwdc2026/315/)

**StoreKit, App Store, suscripciones y Wallet**

- [What's new in Apple In-App Purchase](https://developer.apple.com/videos/play/wwdc2026/210/) — novedades en <span class="high">StoreKit</span> para apps con monetización.
- [Enhance your presence on the App Store](https://developer.apple.com/videos/play/wwdc2026/205/)
- [What's new in Wallet](https://developer.apple.com/videos/play/wwdc2026/209/)
- [Explore Retention Messaging in App Store Connect](https://developer.apple.com/videos/play/wwdc2026/309/)
- [Unlock in-game content with StoreKit and Background Assets](https://developer.apple.com/videos/play/wwdc2026/378/)
- [Offer subscriptions to groups and organizations](https://developer.apple.com/videos/play/wwdc2026/391/)

**Música, audio y subtítulos**

- [Meet the Music Understanding framework](https://developer.apple.com/videos/play/wwdc2026/253/)
- [Integrate MusicKit into your app](https://developer.apple.com/videos/play/wwdc2026/254/)
- [Discover generated subtitles and subtitle styles](https://developer.apple.com/videos/play/wwdc2026/256/)
- [Meet the Now Playing framework](https://developer.apple.com/videos/play/wwdc2026/312/)

**Accesibilidad, lectura y texto**

- [Enhance the accessibility of your reading app](https://developer.apple.com/videos/play/wwdc2026/219/)
- [Prepare your tvOS apps for Dynamic Type](https://developer.apple.com/videos/play/wwdc2026/221/)
- [Elevate your app's text experience with TextKit](https://developer.apple.com/videos/play/wwdc2026/370/)
- [Unwrap PaperKit](https://developer.apple.com/videos/play/wwdc2026/372/)

**Otros frameworks específicos**

- [Read between the strokes with PencilKit](https://developer.apple.com/videos/play/wwdc2026/203/)
- [What's new in managing Apple devices](https://developer.apple.com/videos/play/wwdc2026/206/)
- [Deliver workout insights with HealthKit workout zones](https://developer.apple.com/videos/play/wwdc2026/207/)
- [Rev up your CarPlay app](https://developer.apple.com/videos/play/wwdc2026/212/)
- [Meet the new MetricKit](https://developer.apple.com/videos/play/wwdc2026/222/)
- [Expand the capabilities of your Virtualization app](https://developer.apple.com/videos/play/wwdc2026/224/)
- [Create live communication experiences](https://developer.apple.com/videos/play/wwdc2026/226/)
- [What's new in assessment on macOS](https://developer.apple.com/videos/play/wwdc2026/230/)
- [Design no-code games with Reality Composer Pro 3](https://developer.apple.com/videos/play/wwdc2026/252/)
- [Modernize your AppKit app](https://developer.apple.com/videos/play/wwdc2026/289/)
- [Build live production tools for Apple Immersive Video](https://developer.apple.com/videos/play/wwdc2026/338/)
- [Find your accessory with Bluetooth Channel Sounding](https://developer.apple.com/videos/play/wwdc2026/369/)
- [Meet Trust Insights](https://developer.apple.com/videos/play/wwdc2026/379/)
- [Get ready for WWDC26](https://developer.apple.com/videos/play/wwdc2026/394/) — el teaser pre-evento, marginal una vez vista la Keynote pero está en el catálogo.

---

### Bloque 9 — Group Labs

Las Group Labs originalmente eran espacios de Q&A en directo con ingenieros de Apple. Las listo aquí porque el catálogo las mantiene y conviene tenerlas localizadas para consultar el área en la que estés trabajando.

- [Swift Group Lab](https://developer.apple.com/videos/play/wwdc2026/8001/)
- [SwiftUI for Beginners Group Lab](https://developer.apple.com/videos/play/wwdc2026/8002/)
- [Power and Performance Group Lab](https://developer.apple.com/videos/play/wwdc2026/8003/)
- [visionOS Group Lab](https://developer.apple.com/videos/play/wwdc2026/8004/)
- [Accessibility Technologies Group Lab](https://developer.apple.com/videos/play/wwdc2026/8005/)
- [SwiftUI Group Lab](https://developer.apple.com/videos/play/wwdc2026/8006/)
- [Coding Intelligence for Beginners Group Lab](https://developer.apple.com/videos/play/wwdc2026/8007/)
- [Privacy and Security Group Lab](https://developer.apple.com/videos/play/wwdc2026/8009/)
- [App Store Connect Group Lab](https://developer.apple.com/videos/play/wwdc2026/8010/)
- [Apple Intelligence Group Lab](https://developer.apple.com/videos/play/wwdc2026/8011/)
- [Icon Composer for Beginners Group Lab](https://developer.apple.com/videos/play/wwdc2026/8012/)
- [Xcode Tips and Tricks Group Lab](https://developer.apple.com/videos/play/wwdc2026/8013/)
- [watchOS Group Lab](https://developer.apple.com/videos/play/wwdc2026/8014/)
- [Safari and Web Technologies Group Lab](https://developer.apple.com/videos/play/wwdc2026/8015/)
- [Machine Learning & AI Group Lab](https://developer.apple.com/videos/play/wwdc2026/8016/)
- [SwiftData Group Lab](https://developer.apple.com/videos/play/wwdc2026/8017/)
- [Camera and Photo Technologies Group Lab](https://developer.apple.com/videos/play/wwdc2026/8018/)
- [SwiftUI Group Lab (segunda tanda)](https://developer.apple.com/videos/play/wwdc2026/8120/)
- [Coding Intelligence, Machine Learning & AI Group Lab](https://developer.apple.com/videos/play/wwdc2026/8121/)

---

## Mi Resultado 🎯

Con este orden me ahorro el caos del catálogo y empiezo a ver resultados desde la primera semana. La clave es el bloque 0 y el 1: sin ese contexto, el resto no tiene el mismo peso. Y el bloque de <span class="high">Foundation Models</span> es, para mí, el más importante de este WWDC — Apple ha puesto mucho aquí y los frameworks están maduros.

Mi secuencia resumida:

- **Bloque 0** — Keynote + State of the Union (contexto del año)
- **Bloque 1** — Swift + Xcode + herramientas (el núcleo)
- **Bloque 2** — SwiftUI + SwiftData (stack de UI y datos)
- **Bloque 3** — Foundation Models + evaluaciones (AI de alto nivel)
- **Bloque 4** — Siri + App Intents (integración con el sistema)
- **Bloque 5** — Core AI + MLX (modelos y ML)
- **Bloque 6** — Swift en servidor (mi área)
- **Bloque 7** — Diseño y accesibilidad (la capa invisible)
- **Bloque 8** — Específicos según proyecto, agrupados por área (cuando aplique)
- **Bloque 9** — Group Labs (referencia por tema)

Si llevas años viendo el <span class="high">WWDC</span> sabrás que el catálogo nunca caduca — los videos están disponibles todo el año en [developer.apple.com](https://developer.apple.com/videos/all-videos/?collection=wwdc26). Junio es para las novedades, el resto del año para profundizar. Como conté en [WWDC 26](/es/blog/wwdc26/), las sesiones técnicas son el plato fuerte — y ahora ya tengo el menú ordenado.

**Keep coding, keep running** 🏃‍♂️

---
