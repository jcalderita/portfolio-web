---
title: WWDC26 Group Labs
slug: wwdc26-group-labs
date: 2026-06-17
description: Los Group Labs de la WWDC26 son sesiones de Q&A con ingenieros de Apple. Te cuento mi descubrimiento y dónde encontrar mis notas transcritas.
tags: Swift, Conference
cover: GroupLab26
coverDescription: Ilustración inspirada en los covers oficiales de los Group Labs de Apple, con el icono del personaje animado de Jorge sobre un círculo y el texto "Jorge's Group Lab Guide WWDC26".
publish: true
---
---
## Mi Problema 🤔

Cuando publiqué mi [guía de videos de la WWDC26](/es/blog/wwdc26-videos/), dediqué el Bloque 17 a los <span class="high">Group Labs</span> con apenas una línea de contexto por sesión. La razón era sencilla: las descripciones oficiales de Apple son prácticamente idénticas entre sí —«Únete a nosotros para profundizar en WWDC26 con ingenieros de Apple»— y no dicen nada útil sobre lo que se habló dentro.

Lo que no conté entonces es que, antes de escribir ese bloque, me había puesto a ver los Group Labs y me había llevado una sorpresa. No son sesiones pasivas. Son rondas de Q&A en directo entre desarrolladores reales e ingenieros del equipo de Apple, y la calidad de las preguntas y respuestas es muy distinta a la de las sesiones normales. En las sesiones ordinarias, Apple muestra lo que quiere mostrar. En los Group Labs, los desarrolladores preguntan lo que de verdad necesitan saber, y los ingenieros responden de forma directa.

El problema es que ese contenido es prácticamente invisible. No hay transcripciones, no hay índice, no hay forma de buscar dentro del video. Si no te sientas a ver la sesión entera, no sabes qué cubre.

Me puse a tomar notas. Una sesión, otra, y al final acabé con dieciocho.

---
## Mi Solución 🧩

Decidí transcribir y estructurar el contenido de cada Group Lab: los temas preguntados, el timecode exacto, la respuesta resumida y qué ingenieros participaron. El objetivo era tener algo consultable, que me permitiera ir directamente al minuto que me interesa en lugar de buscar a ciegas en el video.

Antes de la lista, tres ejemplos de lo que apareció dentro y que no encontrarías en ninguna sesión principal:

- En el <span class="high">Swift Group Lab</span>, el equipo del lenguaje explicó por qué habrían diseñado la concurrencia de forma diferente si empezaran hoy, y qué fue lo que cambió en Swift 6.2 para corregir el modelo.
- En el <span class="high">SwiftUI Group Lab</span>, los ingenieros desmontaron cuándo usar <span class="high">AnyView</span>, cómo funciona <span class="high">DynamicProperty</span> antes que <span class="high">body</span>, y por qué los condicionales dentro de contenedores lazy son un antipatrón.
- En el <span class="high">Apple Intelligence Group Lab</span>, el equipo explicó las diferencias reales entre <span class="high">App Schemas</span> e <span class="high">IndexEntity</span>, y los límites actuales del soporte de vídeo en Foundation Models.

Aquí están todas las sesiones disponibles, con enlace directo al video oficial:

### Lenguaje y datos

- **[Swift Group Lab](/es/wwdc26/swift-group-lab/)** — Concurrencia, rendimiento, SwiftPM y características del lenguaje.
- **[SwiftData Group Lab](/es/wwdc26/swiftdata-group-lab/)** — ResultsObserver, HistoryObserver, el nuevo Codable, CloudKit sync, migraciones y concurrencia.

### SwiftUI

- **[SwiftUI Group Lab - Part 1](/es/wwdc26/swiftui-group-lab-part-1/)** — Liquid Glass, flujo de datos, rendimiento de layouts y AnyView.
- **[SwiftUI Group Lab - Part 2](/es/wwdc26/swiftui-group-lab-part-2/)** — ForEach con colecciones grandes, NavigationTransition, Liquid Glass en botones y layouts adaptativos.
- **[SwiftUI for Beginners Group Lab](/es/wwdc26/swiftui-for-beginners-group-lab/)** — SwiftUI vs multiplataforma, @State por dentro y rutas de aprendizaje.

### Herramientas y rendimiento

- **[Xcode Tips and Tricks Group Lab](/es/wwdc26/xcode-tips-and-tricks-group-lab/)** — Cómo sacarle el máximo a Xcode 27.
- **[Power and Performance Group Lab](/es/wwdc26/power-and-performance-group-lab/)** — Instrumentación, MetricKit y rendimiento en producción.

### Plataformas y web

- **[visionOS Group Lab](/es/wwdc26/visionos-group-lab/)** — Acceso a la cámara, depuración inmersiva, exportación USD y accesorios espaciales.
- **[watchOS Group Lab](/es/wwdc26/watchos-group-lab/)** — Foundation Models en Watch, transición desde iOS y debugging en dispositivo.
- **[Safari and Web Technologies Group Lab](/es/wwdc26/safari-and-web-technologies-group-lab/)** — WebKit, CSS Grid Lanes, Web Extensions y más.

### Inteligencia, ML y AI

- **[Apple Intelligence Group Lab](/es/wwdc26/apple-intelligence-group-lab/)** — Foundation Models, App Schemas, Siri y Evaluations.
- **[Machine Learning & AI Group Lab](/es/wwdc26/machine-learning-ai-group-lab/)** — Foundation Models, Private Cloud Compute, Core AI, MLX y evaluaciones.
- **[Coding Intelligence for Beginners Group Lab](/es/wwdc26/coding-intelligence-for-beginners-group-lab/)** — Slash commands, Xcode frente a agentes externos y contexto entre proyectos.
- **[Coding Intelligence, Machine Learning & AI Group Lab](/es/wwdc26/coding-intelligence-machine-learning-ai-group-lab/)** — Core AI vs Core ML vs MLX, ventanas de contexto e inferencia en background.

### Calidad y distribución

- **[Accessibility Technologies Group Lab](/es/wwdc26/accessibility-technologies-group-lab/)** — VoiceOver, Dynamic Type y accesibilidad en controles personalizados.
- **[Privacy and Security Group Lab](/es/wwdc26/privacy-and-security-group-lab/)** — App Attest, Trust Insights y diseño seguro de features agénticas.
- **[Camera and Photo Technologies Group Lab](/es/wwdc26/camera-and-photo-technologies-group-lab/)** — AVFoundation, captura RAW y Center Stage.
- **[App Store Connect Group Lab](/es/wwdc26/app-store-connect-group-lab/)** — In-App Purchase, suscripciones y StoreKit.

---
## Mi Resultado 🎯

El valor de los Group Labs no está en las descripciones oficiales —está dentro. Las preguntas de los desarrolladores sacan a la superficie los casos de uso que Apple no cubre en las sesiones principales: los bugs que el equipo reconoce, las decisiones de diseño que explican en off, los patrones que recomiendan en la práctica y no en el marketing.

Si ya tienes mi [guía de videos](/es/blog/wwdc26-videos/) como mapa del catálogo, los Group Labs son la capa que va encima: donde los ingenieros de Apple hablan de verdad sobre lo que construyeron.

**Keep coding, keep running** 🏃‍♂️

---
