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

Cada año el mismo ritual: el lunes después del Keynote abro [developer.apple.com/videos](https://developer.apple.com/videos/all-videos/?collection=wwdc26) y me encuentro con más de cien sesiones. Sin orden de reproducción sugerido. Sin camino claro. Solo un catálogo enorme donde todo parece igual de importante.

El problema no es el contenido — es que sin estructura, lo que acaba pasando es que empiezo a saltar de video en video según el título que más me llame en ese momento. Veo algo de <span class="high">SwiftUI</span>, luego salto a <span class="high">AI</span>, luego me pongo con herramientas, y al final del día he consumido cinco sesiones inconexas que no se refuerzan entre sí. La comprensión es superficial porque cada bloque temático necesita contexto previo que no tengo.

Llevo tiempo queriéndome armar un orden propio. Un camino que tenga sentido, que construya el conocimiento de manera acumulativa, y que ponga primero lo que da contexto para todo lo demás.

Este año lo he hecho.

---
## Mi Solución 🧩

Mi criterio es simple: **primero la visión general, luego el núcleo del lenguaje, después las herramientas, y al final las áreas específicas según lo que más use en mi trabajo**. Cada bloque prepara el terreno para el siguiente.

No incluyo los Group Labs (son sesiones interactivas en directo, ya no están disponibles para ver), los recaps, ni las versiones en ASL. Me quedo con el contenido técnico que se puede ver cuando uno quiere.

---

### Bloque 0 — La base

Antes de cualquier sesión técnica, estos dos videos dan el marco del año. Son los que mandan.

**[Keynote](https://developer.apple.com/videos/play/wwdc2026/101/)**
El gran anuncio del año. <span class="high">Liquid Glass</span>, <span class="high">Apple Intelligence</span> con el nuevo Siri, <span class="high">Xcode 27</span> con agentes de código. No es técnico — es el por qué de todo lo demás.

**[Platforms State of the Union](https://developer.apple.com/videos/play/wwdc2026/102/)**
El Keynote para desarrolladores. Aquí ya aparece la capa técnica: qué cambia en las plataformas, qué prioridades tiene Apple este ciclo, y qué va a importar para el trabajo del día a día. Este video es el mapa del territorio.

---

### Bloque 1 — Swift y herramientas

Con el contexto del año claro, entro en el núcleo. <span class="high">Swift</span> primero porque todo lo demás construye sobre el lenguaje.

**[What's new in Swift](https://developer.apple.com/videos/play/wwdc2026/262/)**
Actualización del lenguaje: mejoras de ergonomía, concurrencia mejorada, código de alto rendimiento más seguro, interoperabilidad con C y Java, y <span class="high">Embedded Swift</span>. El estado del lenguaje en 2026.

**[What's new in Xcode 27](https://developer.apple.com/videos/play/wwdc2026/258/)**
Las novedades del entorno: agentes de código, <span class="high">Device Hub</span>, localización, rendimiento y herramientas de testing. Si voy a vivir aquí, necesito saber qué ha cambiado.

**[Xcode, agents, and you](https://developer.apple.com/videos/play/wwdc2026/259/)**
Cómo incorporar los agentes de código de Xcode al flujo de trabajo real. Desde el prototipo inicial hasta pulir una app terminada. La parte práctica de lo que se presentó en el video anterior.

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
Nuevo protocolo <span class="high">Document</span> con acceso directo a disco, APIs de reordenación en listas y grids, mejoras en toolbars, nuevas presentaciones, caché en <span class="high">AsyncImage</span> y lazy state para <span class="high">Observable</span>. El overview de lo nuevo en el framework.

**[What's new in SwiftData](https://developer.apple.com/videos/play/wwdc2026/274/)**
Persistencia de tipos externos con <span class="high">Codable</span>, agrupación de resultados en secciones para SwiftUI, <span class="high">ModelResultsObserver</span> e <span class="high">HistoryObserver</span> para observar cambios fuera de la vista. Las novedades del ORM de Apple.

**[Code-along: Add persistence with SwiftData](https://developer.apple.com/videos/play/wwdc2026/275/)**
Manos al teclado: añadir persistencia a una app existente paso a paso. Definir modelos, integrar datos persistentes con SwiftUI, gestionar el estado de la app. El mejor sitio para que lo visto en el video anterior se consolide.

**[Code-along: Build powerful drag and drop in SwiftUI](https://developer.apple.com/videos/play/wwdc2026/271/)**
Construir Solitario para explorar las nuevas capacidades de drag and drop: API de reordenación, drag containers para mover múltiples ítems, y ciclo de vida personalizado. Práctico y directo.

**[Dive into lazy stacks and scrolling with SwiftUI](https://developer.apple.com/videos/play/wwdc2026/321/)**
Rendimiento de listas y scroll en <span class="high">SwiftUI</span>. Cuándo usar lazy stacks, cómo optimizar el comportamiento de scroll, qué patrones evitar.

**[Compose advanced graphics effects with SwiftUI](https://developer.apple.com/videos/play/wwdc2026/322/)**
Efectos gráficos avanzados con <span class="high">SwiftUI</span>. Composición de capas, blending modes y efectos visuales que van más allá de lo básico.

**[Use SwiftUI with AppKit and UIKit](https://developer.apple.com/videos/play/wwdc2026/272/)**
Adopción incremental de <span class="high">SwiftUI</span> en apps existentes de <span class="high">AppKit</span> o <span class="high">UIKit</span>: el framework <span class="high">Observation</span> para actualizar vistas, integrar componentes SwiftUI en jerarquías existentes, y añadir escenas completas SwiftUI sin cambiar la arquitectura.

**[Modernize your UIKit app](https://developer.apple.com/videos/play/wwdc2026/278/)**
Actualizar layouts de iPhone para funcionar bien con <span class="high">iPhone Mirroring</span> y en iPad. Nuevas APIs de tab y navigation bars, preparar la app para Apple Intelligence, y un skill para el agente de código que moderniza el codebase.

---

### Bloque 3 — Apple Intelligence y Foundation Models

El bloque que más me interesa este año. Lo veo como una unidad porque cada video construye sobre el anterior.

**[What's new in the Foundation Models framework](https://developer.apple.com/videos/play/wwdc2026/241/)**
Acceso a <span class="high">Private Cloud Compute</span>, integración de modelos de terceros y open source, capacidades de visión, APIs de gestión de contexto, búsqueda semántica integrada y primitivas para experiencias agénticas. El overview del framework principal de AI en Apple.

**[Build agentic app experiences with the Foundation Models framework](https://developer.apple.com/videos/play/wwdc2026/242/)**
Perfiles dinámicos, instrucciones dinámicas, gestión del contexto y patrones de orquestación entre modelos locales y de servidor. La capa avanzada sobre el video anterior.

**[Debug and profile agentic app experiences with Instruments](https://developer.apple.com/videos/play/wwdc2026/243/)**
Cómo depurar y perfilar experiencias agénticas con <span class="high">Instruments</span>. Porque cuando algo falla en un agente, necesitas saber dónde y por qué.

**[Meet the Evaluations framework](https://developer.apple.com/videos/play/wwdc2026/298/)**
En un mundo probabilístico, los tests unitarios no bastan. Métricas cuantitativas y cualitativas, jueces de modelos, estadísticas agregadas para asegurar que las features de AI funcionan de manera fiable.

**[Create robust evaluations for agentic apps](https://developer.apple.com/videos/play/wwdc2026/299/)**
La capa avanzada de evaluaciones: flujos con tool calling, condiciones dinámicas, generación de datos sintéticos, jueces y validación de datasets. El trabajo real detrás de que un agente se comporte correctamente.

**[Improve your prompts by hill-climbing with Evaluations](https://developer.apple.com/videos/play/wwdc2026/335/)**
Usar el ciclo de evaluación para mejorar prompts de manera iterativa. El cierre del bloque de evaluaciones.

**[Build AI-powered scripts with the fm CLI and Python SDK](https://developer.apple.com/videos/play/wwdc2026/334/)**
Scripts con el CLI de Foundation Models y el SDK de Python. Automatización y prototipado fuera del entorno Swift.

---

### Bloque 4 — Siri y App Intents

El puente entre la app y la inteligencia del sistema. Voy de lo conceptual a lo práctico.

**[Announcing Apple's next big step for Siri and iPhone](https://developer.apple.com/videos/play/wwdc2026/121/)**
El gran anuncio del nuevo Siri. El contexto imprescindible antes de entrar en los videos técnicos de integración.

**[Discover new capabilities in the App Intents framework](https://developer.apple.com/videos/play/wwdc2026/345/)**
<span class="high">ValueRepresentation</span>, <span class="high">RelevantEntities</span>, <span class="high">EntityCollection</span>, <span class="high">SyncableEntity</span>, tipos de parámetro más ricos y long-running intents. Las novedades del framework base.

**[Explore advanced App Intents features for Siri and Apple Intelligence](https://developer.apple.com/videos/play/wwdc2026/343/)**
Técnicas avanzadas para que Siri interaccione con la app de manera natural: descubrimiento de contenido, indexación semántica, búsqueda estructurada y conexión con notificaciones y Now Playing.

**[Build intelligent Siri experiences with App Schemas](https://developer.apple.com/videos/play/wwdc2026/240/)**
Adoptar <span class="high">App Schemas</span> para que la gente haga preguntas sobre datos de la app y tome acciones mediante lenguaje natural. Ejemplo práctico con eventos de calendario y Spotlight.

**[Code-along: Make your app available to Siri](https://developer.apple.com/videos/play/wwdc2026/344/)**
El code-along de todo lo anterior: integrar <span class="high">App Intents</span> en una app de calendario real, crear entidades, activar acciones de Siri y personalizar los snippets de respuesta.

---

### Bloque 5 — Core AI y ML

Para quien quiere ir más allá de los frameworks de alto nivel y entrar en la capa de modelos.

**[Meet Core AI](https://developer.apple.com/videos/play/wwdc2026/324/)**
El nuevo framework para despliegue de modelos de AI en el dispositivo: ecosistema completo desde Python para conversión y optimización hasta la API Swift para inferencia. Integración profunda con Xcode y compilación ahead-of-time.

**[Integrate on-device AI models into your app using Core AI](https://developer.apple.com/videos/play/wwdc2026/326/)**
Colección de modelos open source optimizados para Apple silicon — <span class="high">Qwen</span>, <span class="high">Mistral</span>, <span class="high">SAM3</span> — y cómo integrarlos con pocas líneas de código. Compilación AOT y especialización on-device.

**[Dive into Core AI model authoring and optimization](https://developer.apple.com/videos/play/wwdc2026/325/)**
Autoría y optimización de modelos con herramientas Python de <span class="high">Core AI</span>. La capa profunda para quien quiere controlar el pipeline completo.

**[Explore numerical computing in Swift with MLX](https://developer.apple.com/videos/play/wwdc2026/328/)**
<span class="high">MLX</span> para computación numérica en Swift. Las primitivas sobre las que se construye todo lo demás en ML.

**[Explore distributed inference and training with MLX](https://developer.apple.com/videos/play/wwdc2026/233/)**
Inferencia y entrenamiento distribuidos con <span class="high">MLX</span>. Escalar a múltiples Macs.

**[Run local agentic AI on the Mac using MLX](https://developer.apple.com/videos/play/wwdc2026/232/)**
Agentes de AI corriendo localmente con privacidad, baja latencia y sin conexión. <span class="high">OpenCode</span>, integración con Xcode y técnicas para escalar entre Macs.

**[Build with the new Apple Foundation Model on Private Cloud Compute](https://developer.apple.com/videos/play/wwdc2026/319/)**
Usar el nuevo modelo de Apple en <span class="high">Private Cloud Compute</span>. El extremo del espectro: cuando el dispositivo no es suficiente pero la privacidad sigue siendo prioritaria.

---

### Bloque 6 — Swift del lado del servidor

Mi área de trabajo principal. El bloque que más impacto directo tiene en lo que hago cada día.

**[Build real-time apps and services with gRPC and Swift](https://developer.apple.com/videos/play/wwdc2026/265/)**
<span class="high">gRPC Swift</span> para experiencias en tiempo real: el framework RPC open source con streaming bidireccional, construido sobre Swift concurrency. Desde la definición del servicio en <span class="high">Protobuf</span> hasta el despliegue en producción. Los mensajes Protobuf son un 50% más pequeños que JSON y el runtime es moderno y seguro.

**[Discover container machines](https://developer.apple.com/videos/play/wwdc2026/389/)**
Máquinas contenedor en Apple platforms. Infraestructura para desarrollo y despliegue de servicios Swift.

---

### Bloque 7 — Diseño y accesibilidad

La capa que no se ve pero que define si una app es buena o no.

**[Principles of great design](https://developer.apple.com/videos/play/wwdc2026/250/)**
Los principios fundamentales del diseño de apps Apple. El marco conceptual antes de entrar en APIs concretas.

**[Communicate your brand identity on iOS](https://developer.apple.com/videos/play/wwdc2026/251/)**
Expresar la identidad de marca en iOS con las nuevas herramientas de personalización visual.

**[Design intuitive search experiences](https://developer.apple.com/videos/play/wwdc2026/292/)**
Diseñar búsquedas que la gente entienda y use. Patrones y antipatrones.

**[Craft clear names for features and labels in your app](https://developer.apple.com/videos/play/wwdc2026/290/)**
Nomenclatura de features y labels. Uno de esos videos que parece menor y que acaba siendo de los más prácticos.

**[Refine accessibility for custom controls](https://developer.apple.com/videos/play/wwdc2026/220/)**
Accesibilidad en controles personalizados. Cómo hacer que lo que construyes funcione para todo el mundo.

---

### Bloque 8 — Temas específicos (según proyecto)

Estos videos los veo según lo que tenga entre manos. Son interesantes pero no generales — su utilidad depende del contexto de cada uno.

**[What's new in image understanding](https://developer.apple.com/videos/play/wwdc2026/237/)**
Novedades en comprensión de imágenes con Apple Intelligence.

**[Best practices for integrating visual intelligence in your app](https://developer.apple.com/videos/play/wwdc2026/297/)**
Cómo integrar visual intelligence de manera correcta.

**[Live Activities essentials](https://developer.apple.com/videos/play/wwdc2026/223/)**
Fundamentos de <span class="high">Live Activities</span>. Imprescindible si usas esta API.

**[WidgetKit foundations](https://developer.apple.com/videos/play/wwdc2026/277/)**
Fundamentos de <span class="high">WidgetKit</span>. Igual que el anterior — muy relevante si los tienes en tu app.

**[What's new in Apple In-App Purchase](https://developer.apple.com/videos/play/wwdc2026/210/)**
Novedades en <span class="high">StoreKit</span>. Para quien tiene monetización en su app.

**[What's new in Shortcuts](https://developer.apple.com/videos/play/wwdc2026/310/)**
Novedades en <span class="high">Shortcuts</span> y la capa de automatización del sistema.

**[LLM search using Core Spotlight](https://developer.apple.com/videos/play/wwdc2026/246/)**
Búsqueda con LLMs usando <span class="high">Core Spotlight</span>. La intersección entre búsqueda local y modelos de lenguaje.

**[Secure your app: mitigate risks to agentic features](https://developer.apple.com/videos/play/wwdc2026/347/)**
Seguridad en features agénticas. Con todo lo que estamos añadiendo de AI, este video pasa a ser obligatorio.

**[Secure your apps with App Attest](https://developer.apple.com/videos/play/wwdc2026/201/)**
<span class="high">App Attest</span> para verificar la integridad de la app. Seguridad de base que todo el mundo debería tener.

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
- **Bloque 8** — Específicos según proyecto (cuando aplique)

Si llevas años viendo el <span class="high">WWDC</span> sabrás que el catálogo nunca caduca — los videos están disponibles todo el año en [developer.apple.com](https://developer.apple.com/videos/all-videos/?collection=wwdc26). Junio es para las novedades, el resto del año para profundizar. Como conté en [WWDC 26](/es/blog/wwdc26/), las sesiones técnicas son el plato fuerte — y ahora ya tengo el menú ordenado.

**Keep coding, keep running** 🏃‍♂️

---
