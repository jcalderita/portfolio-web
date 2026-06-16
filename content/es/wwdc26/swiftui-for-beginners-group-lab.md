# SwiftUI for Beginners Group Lab

> WWDC26 · Sesión 8002 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8002/)

---

## Acerca de

Únete a nosotros online para hacer preguntas, recibir consejos y seguir el debate sobre cómo empezar con SwiftUI. En inglés.

Kurt, de Worldwide Developer Relations, presenta a los ingenieros de UI Frameworks Gabriel, Jeff, Sam, Sima y Trevor en una conversación orientada a principiantes sobre cómo iniciarse en SwiftUI, que abarca la elección de lenguaje, rutas de aprendizaje, estado, rendimiento y programación asistida por IA.

---

## Q&A

### 8:32 — [SwiftUI vs React Native](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=512>)

**P.** Como principiante, ¿debería elegir SwiftUI o un framework multiplataforma como React Native?

SwiftUI está estrechamente integrado con las plataformas de Apple, por lo que el nuevo lenguaje de diseño como Liquid Glass y los comportamientos de plataforma vienen incluidos de serie. Los frameworks multiplataforma tienden a quedar en un terreno intermedio incómodo que exige más trabajo de pulido después, y SwiftUI además se beneficia de la expresividad y el rendimiento de Swift.

### 11:04 — [Aprender desde cero](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=664>)

**P.** Sin experiencia en programación, ¿cuál es la mejor manera de aprender a programar y crear una app con SwiftUI?

Elige un problema pequeño de tu vida o de tu familia y crea una app que lo resuelva — la motivación impulsa el aprendizaje. El agentic coding en Xcode ahora te permite iterar rápidamente, y las skills de codificación de Xcode mejoradas este año ayudan a crear mejores experiencias.

### 14:59 — [Hoja de ruta para encontrar trabajo](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=899>)

**P.** ¿Qué hoja de ruta seguirías para convertirte en un ingeniero iOS listo para el mercado laboral, y qué habilidades habría que priorizar?

Empieza con los fundamentos de Swift — el sistema de tipos y la concurrencia — y luego pasa a SwiftUI con los tutoriales interactivos. Usa las herramientas agentic como tutores: pídeles que expliquen el código, solicita revisiones de código de tus propios intentos y profundiza en conceptos de informática como redes y almacenamiento en lugar de limitarte a generar código.

### 18:58 — [Cómo funciona @State](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=1138>)

**P.** ¿Qué hace realmente @State por debajo, y por qué una <span class="high">var</span> normal de Swift no puede almacenar datos de la interfaz?

Las vistas son descripciones ligeras de tipo valor que SwiftUI recrea con frecuencia, por lo que una <span class="high">var</span> simple se descartaría. @State le pide a SwiftUI que reserve almacenamiento persistente vinculado a la identidad de la vista, de modo que el valor sobreviva a las reevaluaciones, y el compilador lo hace cumplir generando un error si intentas mutar una propiedad normal en <span class="high">body</span>.

### 23:09 — [De la web a Swift](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=1389>)

**P.** Como diseñador web que conoce HTML, CSS, JavaScript, PHP y Lua, ¿qué tan difícil es aprender Swift y SwiftUI?

La sintaxis de Swift, similar a C, te resultará familiar si vienes de JavaScript, y la jerarquía declarativa de SwiftUI encaja bien con la forma de pensar en HTML/CSS. Usa Xcode Previews y el nuevo Device Hub en Xcode 27 para obtener actualizaciones en vivo al estilo web mientras aprendes.

### 27:08 — [Por dónde empezar](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=1628>)

**P.** Con tantos tutoriales disponibles, ¿por dónde debería empezar realmente un desarrollador de Java para aprender SwiftUI?

Los tutoriales oficiales de SwiftUI de Apple te guían por <span class="high">view body</span>, estado, animación y flujo de datos, y también cubren aspectos de producción como el almacenamiento de datos. Hundred Days of SwiftUI de Paul Hudson es un gran complemento de la comunidad, y las Human Interface Guidelines ayudan a que tu app se sienta nativa.

### 31:44 — [Actualizaciones de estado en tiempo real](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=1904>)

**P.** ¿Cómo debo gestionar actualizaciones de estado frecuentes en tiempo real, como datos de sensores, sin provocar redibujos innecesarios de la vista?

Usa @Observable para que solo se vuelvan a renderizar las vistas que realmente leen una propiedad modificada, mantén los <span class="high">body</span> de las vistas pequeños y con estructura de hoja, y apóyate en TimelineView, LazyVStack y ForEach dentro de contenedores lazy. Pregúntate si la interfaz realmente necesita actualizaciones por fotograma o si el modelo puede exponer un estado semántico, evita poner valores que cambien rápido en el entorno, mantén el trabajo asíncrono fuera de los <span class="high">body</span> de las vistas y usa SwiftUI Instruments cuando encuentres un cuello de botella de verdad.

### 36:38 — [IA en Xcode y SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=2198>)

**P.** ¿Se ha entrenado Apple Intelligence en Xcode con la documentación actual de SwiftUI, dado que otros LLMs suelen generar código SwiftUI incorrecto?

Este año Xcode incluye skills de SwiftUI con buenas prácticas internas y las nuevas APIs, invocadas automáticamente por el agente de codificación según el contexto. La charla «What's New in SwiftUI» muestra cómo exportar esas skills para usarlas con modelos de terceros, y enviar feedback cuando las skills fallen ayuda a mejorarlas.

### 40:40 — [Actualizaciones de vistas con buen rendimiento](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=2440>)

**P.** ¿Cuáles son las buenas prácticas para que las vistas SwiftUI tengan buen rendimiento y evitar actualizaciones innecesarias?

Adopta @Observable para que solo se invaliden las vistas que leen propiedades modificadas, y piensa en las vistas como un árbol donde cada nodo solo se vuelve a ejecutar cuando cambian sus entradas. Lee únicamente los valores del entorno que realmente uses, divide los <span class="high">body</span> grandes en vistas personalizadas separadas en lugar de propiedades computadas (que no aportan ninguna ventaja de rendimiento), y evita trabajo pesado como crear formatters dentro de <span class="high">body</span>.

### 48:37 — [Aprender con IA](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=2917>)

**P.** ¿Cómo pueden los estudiantes usar la IA en Xcode de forma eficaz sin que cortocircuite el aprendizaje real?

Trata al LLM como un tutor o compañero de trabajo, no como un empleado: pregúntale qué hace cada fragmento de código, cuestiona sus respuestas, pide alternativas y sus ventajas e inconvenientes, y avanza paso a paso en lugar de pedir features enteras de golpe. El objetivo es entender, no generar volumen de código — usa la IA para profundizar tu modelo mental y tomar tú mismo las decisiones de diseño.

### 55:46 — [Modelo mental de SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=3346>)

**P.** ¿Existe algún recurso de una sola página que explique cómo encajan las piezas de SwiftUI?

No hay un único esquema, pero la sesión «Intro to SwiftUI», el vídeo «SwiftUI Essentials» y la página «Getting Started with SwiftUI» del sitio para desarrolladores son los resúmenes recomendados.

### 56:40 — [Evitar malos hábitos con la IA](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=3400>)

**P.** ¿Cómo puede un principiante usar las herramientas de IA de Xcode para aprender los patrones correctos de SwiftUI en lugar de patrones con errores?

Apóyate en las nuevas skills de SwiftUI de Xcode, que codifican buenas prácticas que el modelo adoptará. Deja que el modelo compile su salida para que los errores en tiempo de compilación de Swift guíen la iteración, y trabaja pieza a pieza en lugar de pedir features enteras de golpe.

### 57:54 — [Anuncios que no hay que perderse](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=3474>)

**P.** ¿Qué se anunció esta semana que los principiantes podrían pasar por alto pero que importará a medida que avancen?

La flexibilidad de layout — ventanas redimensionables en iPad, macOS, Vision Pro y ahora en iPhone mediante iPhone Mirroring hacen que los layouts adaptativos sean esenciales. Apóyate en los constructores de layout de SwiftUI (y en los Layouts personalizados cuando sea necesario), y usa el nuevo Device Hub junto con los previews redimensionables para probar en distintos tamaños.

### 59:10 — [De los diseños a SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=3550>)

**P.** ¿Cuál es la mejor manera de convertir la maqueta de un diseñador en SwiftUI — debería usar un asistente de codificación de Xcode?

Mapea tú mismo el diseño a las primitivas de layout de SwiftUI, y aprovecha las integraciones con Figma y Sketch que generan código SwiftUI desde esas herramientas de diseño. Todavía no existe una skill de Xcode dedicada a esta conversión.

---

## Destacados

- Adopta @Observable y mantén los cuerpos de vista pequeños y granulares para que solo se re-rendericen las vistas que leen las propiedades modificadas.
- Xcode 27 incluye skills de SwiftUI con las mejores prácticas internas de Apple; se pueden exportar para usarlas con LLMs de terceros (se explica al final de What's New in SwiftUI).
- Usa Xcode Previews y el nuevo Device Hub para obtener feedback en vivo y en múltiples tamaños mientras aprendes — especialmente útil para desarrolladores que vienen del ámbito web.
- Empieza a aprender con los tutoriales oficiales de SwiftUI de Apple, el vídeo SwiftUI Essentials y el Hundred Days of SwiftUI de Paul Hudson; consulta las Human Interface Guidelines para adaptar tu app a cada plataforma.
- Trata los LLMs como tutores y compañeros de trabajo: pídeles que expliquen código, solicita alternativas y sus pros y contras, y pídeles que revisen tus propios intentos en lugar de generar funcionalidades de golpe.
- Envía feedback a través de Feedback Assistant (en el propio sistema operativo en betas, o en feedbackassistant.apple.com) — especialmente sobre las nuevas skills de SwiftUI en Xcode.

---

## Sesiones relacionadas

- [What’s new in SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/269/>) (Novedades en SwiftUI)
- [SwiftUI essentials](<https://developer.apple.com/videos/play/wwdc2024/10150/>) (SwiftUI essentials)
- [Meet Liquid Glass](<https://developer.apple.com/videos/play/wwdc2025/219/>) (Descubre Liquid Glass)

---
