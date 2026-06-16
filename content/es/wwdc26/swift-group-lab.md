# Swift Group Lab

> WWDC26 · Sesión 8001 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8001/)

---

## Acerca de

Únete a nosotros en línea para profundizar en WWDC26 con ingenieros y diseñadores de Apple para hacer preguntas, recibir consejos y seguir la conversación sobre los grandes anuncios de Swift de la semana. Conducido en inglés.

Angelica de Developer Relations presenta el Swift Group Lab con los ponentes Holly (lenguaje Swift, generics, concurrencia), Corey (Swift Server/redes), Tony (Foundation, Standard Library) y Doug (equipo del lenguaje Swift). Responden preguntas de desarrolladores sobre las características de Swift 6.3/6.4, concurrencia, rendimiento y diseño del lenguaje.

---

## Q&A

### 4:24 — [Transferencia de datos non-sendable](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=264>)

**P.** ¿Cómo se transfiere la propiedad de datos non-sendable de un dominio de aislamiento (p. ej., un actor) a otro sin copiarlos?

Holly explicó que region-based isolation permite al compilador transferir valores non-sendable cuando el actor de origen ya no los usa. La palabra clave <span class="high">sending</span> anota parámetros o retornos de forma explícita, y una propuesta activa en los foros (actualmente llamada <span class="high">disconnected</span>) propone un tipo de valor almacenado para preservar esa transferibilidad entre almacenamientos.

### 6:07 — [Consejos sobre structured concurrency](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=367>)

**P.** ¿Qué consejos y errores comunes deben tener en cuenta los desarrolladores al adoptar structured concurrency en Swift?

Corey recomendó apostar plenamente por la estructura: evitar <span class="high">Task</span>/<span class="high">Task.detached</span> no estructurados, preferir task groups con tiempos de vida de ámbito léxico, escribir recetas lineales A-luego-B-luego-C, y usar fan-out/fan-in solo mediante task groups. Destacó cancellation shields junto con <span class="high">async defer</span> para una limpieza async segura, mientras que Doug y Holly añadieron que los tipos non-sendable ayudan a razonar sobre el flujo lineal y que <span class="high">~Sendable</span> (Swift 6.4) es una forma más cómoda de desactivarlo que las conformancias no disponibles. Tony advirtió de no precipitarse a usar <span class="high">@unchecked Sendable</span> solo para silenciar al compilador.

### 12:00 — [Coste de conformancias](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=720>)

**P.** ¿Tiene algún coste añadir conformancias sin usar como Sendable, Equatable, Hashable, Identifiable o Comparable a cada struct?

Doug dijo que las conformancias a Equatable/Hashable incluyen código (funciones de igualdad/hash) que el compilador retiene porque casts en tiempo de ejecución como <span class="high">as? any Equatable</span> pueden descubrirlas, así que tienen un coste real. Sendable es solo una etiqueta en tiempo de compilación sin representación en tiempo de ejecución. Las sobrecargas de operadores genéricos también pueden ralentizar la comprobación de tipos, y Tony añadió que las conformancias deben tener sentido semántico, no añadirse de forma refleja.

### 14:36 — [Contagio de @MainActor](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=876>)

**P.** ¿Cómo evitar que @MainActor provoque una cascada de refactorizaciones async en una base de código heredada sin perder la seguridad de Swift 6?

Holly sugirió usar el modo <span class="high">main actor by default</span> cuando la mayor parte de un módulo pertenece al main actor, y luego anotar explícitamente el código que se ejecuta en otro hilo. Si no, empezar por los tipos hoja y avanzar hacia afuera, marcar como <span class="high">nonisolated</span> los métodos que no tocan estado mutable, y convertir <span class="high">static var</span> obsoletas en estado inmutable donde sea posible. Señaló la sesión de code-along «Migrate your app to Swift 6» de 2024.

### 17:23 — [Rendimiento moderno de Swift](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1043>)

**P.** ¿Qué características modernas de Swift y qué recursos hay que adoptar primero para lograr alta eficiencia y rendimiento?

Tony insistió en hacer perfilado primero con el flame graph de Instruments y la nueva vista de funciones principales, y luego aplicar las técnicas de Swift moderno explicadas en la sesión de rendimiento de Swift del año pasado, a cargo de Nate. Destacó Span, el nuevo UniqueArray (también presentado en swift-collections) y las áreas de enfoque de Embedded Swift. Corey recordó a los desarrolladores que no olviden las decisiones algorítmicas básicas de complejidad Big-O.

### 19:59 — [Anotaciones redundantes](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1199>)

**P.** Tras una migración completa a strict concurrency de Swift 6, ¿deberían los equipos eliminar las anotaciones que ahora son redundantes bajo el modelo de aislamiento más reciente?

Holly dijo que las anotaciones redundantes están bien y a menudo son valiosas como documentación de intención (p. ej., <span class="high">nonisolated</span> en extensiones, Sendable explícito). Doug estuvo de acuerdo y señaló que los comentarios que explican el porqué ayudan a futuros lectores, y Corey añadió que tratar los helpers como si tuvieran un contrato —incluso con anotaciones redundantes— es un buen hábito.

### 23:17 — [Sendability de UserDefaults](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1397>)

**P.** ¿Por qué UserDefaults no está marcado como Sendable aunque su documentación dice que es seguro para hilos?

Tony explicó que durante la auditoría de Sendable en Foundation, las clases que podían ser subclasificadas en formas mutables (como NSString frente a NSMutableString) se dejaron como non-Sendable para no engañar al compilador. <span class="high">~Sendable</span> de Swift 6.4 permite a Foundation anotar estos casos con más precisión para que las subclases puedan adoptarlo individualmente, y el <span class="high">UserDefaults</span> global estándar sí proporciona una conformancia a Sendable.

### 25:29 — [Accessors borrow y mutate](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1529>)

**P.** ¿Deberían los desarrolladores migrar de accessors get/set a borrow/mutate, y cuándo no es apropiado?

Doug aclaró que <span class="high">borrow</span> y <span class="high">mutate</span> exponen referencias al almacenamiento existente, evitando copias, mientras que <span class="high">get</span>/<span class="high">set</span> producen o consumen valores y pueden ejecutar código arbitrario. Usa borrow/mutate en accessors sensibles al rendimiento que comparten datos ya almacenados; mantén get/set cuando el valor es calculado o cuando las restricciones de acceso exclusivo de mutate serían demasiado limitantes.

### 27:15 — [Seguir las novedades del lenguaje](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1635>)

**P.** Con tantas incorporaciones (mutex, InlineArray, Span, typed throws, tipos non-copyable), ¿cómo saben los desarrolladores de aplicaciones qué características les aplican a ellos frente a los desarrolladores de sistemas o Embedded Swift, y cómo estar al día?

Tony y Doug insistieron en la divulgación progresiva: no adoptes tipos non-copyable ni Span hasta que el perfilado muestre una necesidad real. Corey añadió que los ingenieros tienen horas limitadas, así que confirma que el problema de rendimiento existe antes de optimizar. Cuando adoptes estas características, mantenlas aisladas a los caminos críticos —Corey señaló que Span y UniqueArray en el camino más caliente suelen aportar la mayor ganancia con cambios pequeños.

### 31:58 — [Compilaciones incrementales lentas](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1918>)

**P.** Nuestro proyecto tiene compilaciones incrementales lentas donde Swift emit-module tarda minutos. ¿Pueden las características del lenguaje causar esto, y cómo se diagnostica?

Doug dijo que las características del lenguaje rara vez afectan al rendimiento general de la compilación —habitualmente la emisión lenta de módulos se debe a las dependencias de módulos importados. Usa explicit module builds y la línea de tiempo de compilación de Xcode para ver dónde se invierte el tiempo y eliminar dependencias innecesarias, igual que al perfilar código.

### 33:42 — [La concurrencia en perspectiva](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=2022>)

**P.** Con la perspectiva que da la adopción de concurrencia en Swift 6, ¿qué habría diseñado el equipo de forma diferente hoy?

Holly dijo que el equipo habría empezado con el comportamiento de Swift 6.2 donde las funciones async non-isolated se ejecutan en el contexto del llamador, en lugar del modelo anterior que saltaba al global concurrent thread pool. Los proyectos reales que pasaban valores non-sendable generaban demasiados errores de carrera de datos y forzaban conformancias Sendable excesivas. Doug estuvo de acuerdo en que es un modelo más accesible y menos concurrente por defecto.

### 37:36 — [Mejoras en SwiftPM](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=2256>)

**P.** ¿Qué mejoras destacadas llegaron a Swift Package Manager en la última versión para el rendimiento de compilación y dependencias en proyectos grandes con múltiples paquetes?

Holly destacó que Swift 6.4 unifica SwiftPM en Xcode y en otras plataformas (VS Code, toolchains de swift.org) sobre el sistema Swift Build, presentado en 6.3 y activo por defecto en 6.4. Esto aporta mantenimiento compartido, explicit module builds y mayor paralelismo al dividir las compilaciones de módulos en piezas más pequeñas.

### 39:27 — [Características ocultas de Swift](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=2367>)

**P.** ¿Cuál es una característica de Swift que la mayoría de los desarrolladores no sabe que existe pero debería?

Corey defendió combinar <span class="high">@inlinable</span> con <span class="high">@inline(never)</span> para caminos fríos genéricos, ya que <span class="high">@inlinable</span> también desbloquea la especialización genérica y la propagación de efectos. Holly recomendó usar anotaciones de tipo con <span class="high">as</span> para desambiguar la resolución de sobrecargas. Tony propuso los foros de código abierto como la característica en sí —incluso los desarrolladores solo de iOS pueden influir en Foundation, Swift Testing y las APIs de Swift. Doug defendió los key paths, y Holly también mencionó Swiftly para instalar toolchains experimentales. Corey añadió las integer overflow APIs que llevan un flag de desbordamiento a lo largo de la aritmética de línea recta.

### 48:18 — [Conformancias de tuplas](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=2898>)

**P.** ¿Qué queda por hacer en la evolución del lenguaje para que las tuplas puedan conformar condicionalmente a Equatable, Hashable, Comparable, etc.?

Holly dijo que el trabajo restante es una pequeña evolución de parameter packs: una sintaxis para tuplas cuyos elementos son un parameter pack, y extensiones parametrizadas cuya cláusula where usa <span class="high">each T: Protocol</span>. Ya existe una implementación experimental en el compilador, y una vez terminada, la propuesta específica más antigua podrá generalizarse para que los usuarios también puedan conformar tuplas a sus propios protocolos.

### 50:13 — [Datos de sensores de alta frecuencia](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=3013>)

**P.** ¿Cuál es el patrón recomendado en Swift 6 para ingerir datos de sensores de alta frecuencia en un actor en segundo plano y transmitir actualizaciones a un modelo @Observable en el main actor sin bloquear la UI?

Corey dijo que la respuesta depende de qué se entiende por «alta frecuencia»; en general, hay que minimizar los cambios de contexto acumulando y agrupando actualizaciones, y aceptar la pérdida de datos cuando la UI no necesita cada muestra (Observable de SwiftUI ya agrupa actualizaciones). Tony añadió que el trabajo pesado debe permanecer async fuera del main actor, enviando solo lo que necesita la UI. Corey señaló el operador debounce en swift-async-algorithms.

### 52:57 — [Tuplas vs. structs como valor de retorno](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=3177>)

**P.** ¿Por qué devolver una tupla desde un método puede ser más costoso que devolver un struct?

Doug dijo que el compilador «explota» las tuplas en elementos individuales cuando se pasan entre límites de función, mientras que los structs se pasan como una sola entidad. Para tuplas muy grandes, esta explosión podría ser menos eficiente que un struct, pero el panel se sorprendió por la afirmación y pidió al desarrollador que abriera un issue en GitHub con un proyecto de ejemplo.

### 54:21 — [Mejoras de calidad de vida favoritas](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=3261>)

**P.** ¿Cuál es tu característica favorita de Swift, menos conocida, que mejore la calidad de vida o del código y haga que el lenguaje sea divertido de escribir?

Tony señaló los próximos protocolos Iterable que permiten <span class="high">for in</span> sobre spans preservando la seguridad. Holly elogió la inferencia de tipos bidireccional y los diagnósticos de genéricos de Swift que muestran los errores en el punto de definición del genérico. Corey amó la forma en que Swift evita el estado mutable compartido, incluyendo los tipos copy-on-write definidos por el usuario. Tony añadió que reemplazar C por Swift se siente fluido y seguro, y Doug celebró que las extensiones de protocolo hagan que los algoritmos genéricos parezcan código ordinario.

---

## Destacados

- Swift 6.4 introduce <span class="high">~Sendable</span> como alternativa más limpia a las conformancias Sendable no disponibles, y el atributo <span class="high">@diagnose</span> para un control preciso de advertencias.
- Async defer y cancellation shields son los nuevos primitivos de limpieza de structured concurrency — combínalos para un desmontaje robusto de recursos asíncronos.
- SwiftPM en Xcode y las toolchains de swift.org se unifican ahora en el sistema Swift Build en la versión 6.4, lo que habilita explicit module builds y mayor paralelismo de compilación por defecto.
- Lo más destacado del kit de rendimiento: Span, el nuevo UniqueArray (también en swift-collections), la vista de flame graph y top-functions de Instruments, más <span class="high">@inlinable</span> + <span class="high">@inline(never)</span> para rutas genéricas frías.
- Perfila antes de adoptar tipos non-copyable u otras características avanzadas de rendimiento; mantenlos aislados en las rutas críticas en vez de refactorizar proyectos enteros.
- Sesiones de referencia: «Migrate your app to Swift 6» (WWDC24), la sesión de rendimiento Swift con Instruments de Nate, y la sesión sobre explicit module builds de hace aproximadamente dos años. Abre issues en GitHub en la organización SwiftLang y únete a forums.swift.org.

---

## Sesiones relacionadas

- [Migrate your app to Swift 6](<https://developer.apple.com/videos/play/wwdc2024/10169/>) (Migra tu app a Swift 6)
- [What's new in Swift](<https://developer.apple.com/videos/play/wwdc2020/10170/>) (Novedades de Swift)
- [Optimize CPU performance with Instruments](<https://developer.apple.com/videos/play/wwdc2025/308/>) (Optimiza el rendimiento de CPU con Instruments)
- [Demystify explicitly built modules](<https://developer.apple.com/videos/play/wwdc2024/10171/>) (Desmitifica los módulos compilados explícitamente)
- [Migrate to Swift Testing](<https://developer.apple.com/videos/play/wwdc2026/267/>) (Migra a Swift Testing)
- [What's new in Swift](<https://developer.apple.com/videos/play/wwdc2026/262/>) (Novedades de Swift)

---
