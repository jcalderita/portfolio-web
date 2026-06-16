# visionOS Group Lab

> WWDC26 · Sesión 8004 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8004/)

---

## Acerca de

Únete a nosotros online para profundizar en WWDC26 con ingenieros y diseñadores de Apple: haz preguntas, recibe consejos y sigue el debate sobre los grandes anuncios de visionOS de la semana. Conducida en inglés.

El presentador Adarsh modera un panel de visionOS con Katie, Norman, John, Matt y Travis del Vision Products Group, respondiendo preguntas de desarrolladores sobre visionOS 27, RealityKit, USDKit, accesorios espaciales y foveated streaming.

---

## Q&A

### 9:04 — [Acceso a la cámara frontal](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=544>)

**P.** ¿Cómo puede un desarrollador independiente acceder a las cámaras frontales sin estar en el programa Enterprise?

Matt aclaró que el acceso a la cámara principal (incluido el par estereoscópico desde visionOS 26) no es exclusivo del programa Enterprise: está abierto a cuentas de desarrollador estándar vinculadas a un negocio con un caso de uso real. Solicítalo a través del sitio de desarrollador y publica en los foros si te bloquean, y envía feedback describiendo casos de uso concretos.

### 11:09 — [Depuración en modo inmersivo](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=669>)

**P.** ¿Cómo depuras una app dentro de un espacio inmersivo sin quitarte el visor?

Katie recomendó el ajuste de desarrollador (añadido el año pasado) que permite Mac Virtual Display dentro de un entorno inmersivo, para que puedas seguir en tu escena mientras alcanzas breakpoints en Xcode. El equipo de Apple usa este flujo de trabajo ellos mismos: programan en MVD con contenido inmersivo al lado.

### 12:47 — [Habilidades de agente](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=767>)

**P.** ¿Alguna de las nuevas habilidades de agente que lanza Apple es relevante para el desarrollo en visionOS?

Katie mencionó que se incluye una habilidad que ayuda a traducir una UI de iOS existente al factor de forma y la densidad de información de visionOS siguiendo las mejores prácticas de visionOS.

### 13:40 — [Flujo de exportación USD](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=820>)

**P.** ¿Cuál es el flujo de trabajo recomendado para exportar modelos 3D a USD cuando las conversiones desde FBX/GLB pierden materiales o transformaciones?

Travis aconsejó exportar USD directamente desde tu herramienta de creación de contenido 3D en lugar de pasar por otros formatos. Norman sugirió iterar con los formatos de archivo suelto USDA/USDC, y Travis señaló que la nueva especificación del núcleo de OpenUSD permite que los LLM modernos ayuden a razonar sobre los assets USD y a corregirlos.

### 16:14 — [Seguimiento de accesorios espaciales](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=974>)

**P.** ¿Se pueden rastrear accesorios espaciales fuera del campo de visión directo del usuario, como rastreadores de pie?

Matt explicó que los accesorios combinan Bluetooth, un IMU a bordo y emisores infrarrojos detectados por las cámaras IR de Vision Pro, de modo que las oclusiones breves las gestiona el IMU. visionOS 27 abre la especificación (DF Robot, placas Micro E) y añade un modo de depuración que muestra la señal IR; Apple quiere feedback sobre casos de uso de rastreo de pies, ya que hoy no se proporciona seguimiento de la parte inferior del cuerpo.

### 20:31 — [Culling de Gaussian splats](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1231>)

**P.** ¿Hay alguna forma de desactivar el viñeteado/culling que ocurre cuando el usuario mueve la cara dentro de un Gaussian splat, para reconstrucciones de telepresencia?

John dijo que hoy no existe ninguna API para desactivar ese culling y recomendó enviar feedback. Norman añadió que el culling se aplica a todos los modelos 3D por seguridad del campo visual sin obstrucciones; Apple quiere grabaciones de pantalla y proyectos de muestra que describan la distancia y la intención.

### 23:49 — [Splats multiplataforma](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1429>)

**P.** ¿El renderizado de Gaussian splats está soportado en iOS como sugieren los docs, ya que Xcode no muestra los símbolos?

John dijo que el Gaussian splatting debería estar soportado tanto en iOS como en visionOS; si el comportamiento de Xcode difiere de los docs durante la beta, envía feedback.

### 24:41 — [Perfiles de usuario](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1481>)

**P.** ¿Por qué Vision Pro no tiene perfiles multiusuario como macOS para uso familiar compartido?

Matt describió Vision Pro como un dispositivo personal más próximo a iPhone/iPad que a Mac. La fricción se ha reducido mediante la posibilidad de guardar tu inscripción en un dispositivo iOS (visionOS 26), de modo que el modo invitado se activa mirando un código de App Clip, además del modo Usuario invitado con dispositivo cercano para asistencia por AirPlay.

### 27:04 — [API de seguimiento facial](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1624>)

**P.** ¿Existe alguna API en visionOS para rastrear la cara y los labios del usuario, similar al seguimiento facial de ARKit en iOS?

John confirmó que el seguimiento facial de ARKit sigue siendo exclusivo de iOS y recomendó enviar feedback. Matt señaló que las apps de terceros pueden solicitar la señal de vídeo de persona con matte (persona sobre fondo) para uso en videoconferencia, pero los datos faciales en bruto y los efectos tipo lente no están expuestos.

### 28:22 — [Privacidad de Visual Intelligence](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1702>)

**P.** ¿Visual Intelligence en Vision Pro requiere que apps de terceros accedan a la cámara principal, o es una capacidad totalmente a nivel de sistema?

Katie confirmó que es una capacidad a nivel de sistema realizada de forma que preserva la privacidad: no se comparte ninguna información con terceros.

### 29:15 — [Modelo de interacción con el mando](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1755>)

**P.** ¿Cómo ve Apple el encaje de los mandos de juego junto a ojos, manos y voz en apps que no son juegos, y qué nuevas capacidades de mando deberían tener en cuenta los desarrolladores?

Norman describió los mandos (PlayStation VR2 Sense, Logitech MX Ink) como profundamente integrados en el sistema a través de Game Controller framework y ARKit, con visionOS 27 ampliando la especificación de accesorios espaciales para hardware personalizado. Matt y Katie subrayaron que ojos y manos siguen siendo la base, modelada en la interacción del mundo real; los accesorios añaden precisión, hápticos o funciones similares a herramientas cuando la experiencia lo requiere.

### 33:32 — [Modo AR de WebXR](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2012>)

**P.** ¿Hay novedades en WebXR en Safari en visionOS 27, en particular para habilitar el modo AR inmersivo en lugar de solo VR?

Norman confirmó que WebXR está soportado pero únicamente en modo de renderizado inmersivo (VR) según la especificación. Travis y Norman señalaron la nueva etiqueta HTML <span class="high"><model></span> de este año como una vía alternativa a WebXR que permite a una página web colocar assets USD en el entorno del usuario con todas las capacidades de la plataforma.

### 36:09 — [Sensores de Visual Intelligence](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2169>)

**P.** ¿Visual Intelligence en visionOS se basa exclusivamente en la cámara o también usa sensores de profundidad?

Norman no reveló detalles de implementación, pero dijo que Apple combina los sensores que ofrece cada dispositivo para obtener el resultado más preciso. Matt añadió que el mismo enfoque se aplica a SLAM, seguimiento de manos y otras funciones del sistema: la combinación de sensores adecuada para cada caso de uso.

### 37:49 — [Mantener el dispositivo activo](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2269>)

**P.** ¿Cómo mantienes Vision Pro activo en un escritorio durante el desarrollo, ya que se duerme en el momento en que lo quitas?

Matt explicó que no existe ningún mecanismo de «cafeína» de forma intencionada, porque Vision Pro no tiene botón de bloqueo: quitárselo debe bloquear el dispositivo por seguridad. Katie y Norman recomendaron desarrollar dentro de Mac Virtual Display para ponérselo lo menos posible, y configurar Optic ID para una reautenticación rápida cuando sí te lo quites.

### 39:25 — [Pruebas automatizadas](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2365>)

**P.** ¿En qué estado están las pruebas automatizadas para visionOS, ARKit y RealityKit?

John señaló la clase Reality Renderer para controlar RealityKit por programa, y recomendó las sesiones de este año «Migrate to Swift Testing» y «Get the Most Out of Device Hub». Norman añadió que RealityKit está ahora en Swift, por lo que la infraestructura de pruebas existente de Swift/Xcode funciona de serie.

### 40:52 — [Errores frecuentes de principiantes](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2452>)

**P.** ¿Cuáles son los errores más grandes que cometen los nuevos desarrolladores de visionOS?

Katie destacó portar la densidad de información de iOS y los tamaños de objetivo táctil tal cual en lugar de rediseñar para la entrada de ojos y manos, y no añadir funciones exclusivas de visionOS (como modelos 3D de productos) al traer apps de iOS. Norman instó a pensar más allá de los paradigmas heredados para aprovechar los superpoderes espaciales, y Travis advirtió que las imágenes comprimidas y las codificaciones de vídeo optimizadas para televisores revelan macroblocking en la pantalla de alta fidelidad y primer plano de Vision Pro.

### 47:18 — [Errores en el desarrollo agéntico](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2838>)

**P.** Al usar el desarrollo agéntico en Xcode para generar un proyecto de RealityView en visionOS, el LLM produjo sintaxis incorrecta — ¿cómo se corrige o se enseña?

Katie aconsejó verificar la salida del LLM y proporcionar como contexto los proyectos de muestra robustos de Apple (Hello World, Petite Asteroids, Canyon Crosser, el nuevo ejemplo Model Manipulator). Norman señaló que los modelos entrenados con API de años anteriores van rezagados respecto a las nuevas versiones del SDK, por lo que la actualidad varía; Matt destacó la sesión y el ejemplo «Collaborate on Structured 3D Models» como referencia útil.

### 50:49 — [Rendimiento del seguimiento de objetos](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=3049>)

**P.** ¿Qué velocidad puede alcanzar ahora el seguimiento de objetos en términos de tasa de fotogramas y latencia?

Matt informó de que visionOS 27 añade un modo de alta tasa de fotogramas que alcanza hasta 30 fps (frente a los ~5 fps de visionOS 2), con una reducción significativa de la latencia y un nuevo suavizado que hace que los objetos rastreados parezcan fijados en la mano. Los mismos modelos entrenados funcionan ahora también en iOS, y Create ML añade un modo de entrenamiento extendido para mayor precisión. Norman señaló que las actualizaciones de seguimiento llevan ahora marcas de tiempo alineadas con el tiempo de visualización de fotograma.

### 53:30 — [Exposición de frameworks internos](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=3210>)

**P.** ¿Expondrá Apple más frameworks internos como Persona Kit y Core IK a los desarrolladores, especialmente para accesibilidad y telepresencia?

Travis dio la respuesta habitual de sin comentarios sobre el futuro, pero animó a enviar feedback, especialmente en accesibilidad, donde Apple ve un alto impacto. Matt destacó la función de control mediante silla de ruedas anunciada recientemente, que se lanza en visionOS 27, como ejemplo del trabajo de accesibilidad que permite la plataforma.

### 55:30 — [Mac Virtual Display compartida](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=3330>)

**P.** Mac Virtual Display está vinculada a la cuenta de iCloud de Vision Pro — ¿existe alguna vía soportada para controlar varios Mac empresariales compartidos?

Matt confirmó que MVD requiere iCloud compartido hoy en día y pidió feedback sobre el escenario empresarial. Norman y Matt señalaron alternativas: el nuevo framework Spatial Preview y el Remote Immersive Space del año pasado (renderizado en el host Mac, transmitido de forma estereoscópica) funcionan ambos sin necesidad de cuentas de iCloud coincidentes, y el foveated streaming admite datos bidireccionales con SwiftUI/SharePlay aún en el lado de visionOS.

### 59:27 — [Splats en USDZ](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=3567>)

**P.** ¿Pueden los Gaussian splats convivir dentro de un USDZ junto a mallas y usarse en una web?

Travis explicó que OpenUSD admite particle fields (la forma genérica de los Gaussian splats) — Apple, Adobe y otros lo impulsaron a través del estándar — y RealityKit tiene su propio soporte de splats, pero ambos pipelines aún no se han conectado entre sí. Norman dijo que este año se sentaron las bases en RealityKit y el siguiente paso es alinear la estandarización, el runtime y las historias de autoría de principio a fin.

---

## Destacados

- Novedades de visionOS 27 presentadas en el panel: Physical Space Lighting, Spatial Panos, framework Spatial Preview, USDKit, foveated streaming y grabación de pantalla en dispositivo sin foveated de hasta 3 minutos.
- La especificación de Spatial accessories es abierta en visionOS 27 — DF Robot y Micro E venden tapas rastreables y placas emisoras de infrarrojos; un nuevo modo de depuración visualiza el feed infrarrojo de Apple Vision Pro.
- Object tracking pasa de ~5 fps a un modo de alta frecuencia de 30 fps con marcas de tiempo alineadas al tiempo de visualización de fotograma; los modelos entrenados también funcionan ahora en iOS, y Create ML añade un modo de entrenamiento extendido.
- Sesiones recomendadas: Build Next Generation Experiences for visionOS 27, What's New in Object Tracking and Spatial Accessories, Collaborate on Structured 3D Models in visionOS, Migrate to Swift Testing, Get the Most Out of Device Hub.
- Proyectos de ejemplo de referencia: Hello World, Petite Asteroids, Canyon Crosser y el nuevo ejemplo Model Manipulator para edición de jerarquías 3D complejas.
- Guarda el registro en un dispositivo iOS 26 para desbloqueo rápido de invitado estilo app clip; combínalo con Optic ID y Mac Virtual Display dentro de escenas inmersivas para un flujo de desarrollo sin fricciones.

---

## Sesiones relacionadas

- [Explore enhancements to visionOS object tracking](<https://developer.apple.com/videos/play/wwdc2026/283/>) (Explora las mejoras en object tracking de visionOS)
- [Create enhanced spatial computing experiences with ARKit](<https://developer.apple.com/videos/play/wwdc2024/10100/>) (Crea experiencias de spatial computing mejoradas con ARKit)
- [Migrate to Swift Testing](<https://developer.apple.com/videos/play/wwdc2026/267/>) (Migra a Swift Testing)
- [Get the most out of Device Hub](<https://developer.apple.com/videos/play/wwdc2026/260/>) (Saca el máximo partido a Device Hub)
- [Build next-generation experiences with visionOS 27](<https://developer.apple.com/videos/play/wwdc2026/287/>) (Construye experiencias de próxima generación con visionOS 27)
- [Collaborate on structured 3D models in visionOS](<https://developer.apple.com/videos/play/wwdc2026/284/>) (Colabora en modelos 3D estructurados en visionOS)
- [Design considerations for vision and motion](<https://developer.apple.com/videos/play/wwdc2023/10078/>) (Consideraciones de diseño para visión y movimiento)
- [Use foveated streaming to bring immersive content to visionOS](<https://developer.apple.com/videos/play/wwdc2026/286/>) (Usa foveated streaming para llevar contenido inmersivo a visionOS)

---
