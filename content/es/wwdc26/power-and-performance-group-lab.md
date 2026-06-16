# Power and Performance Group Lab

> WWDC26 · Sesión 8003 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8003/)

---

## Acerca de

Únete a nosotros online para profundizar en el WWDC26 con ingenieros y diseñadores de Apple: pregunta, recibe consejos y sigue el debate sobre los grandes anuncios de rendimiento y batería de la semana. Conducido en inglés.

Cole presenta a los ingenieros de Apple Terry, Yanni, Casper, Kunal y Marco en un lab de Power and Performance que cubre MetricKit, Instruments, optimización de SwiftUI, tiempo de arranque, gestión térmica y diagnóstico de batería.

---

## Q&A

### 6:08 — [SwiftUI Beginner Performance](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=368>)

**P.** Como principiante, ¿qué factores afectan más al consumo y al rendimiento de una app SwiftUI, y cómo evito el drenaje de batería y la lentitud?

Separa las vistas de sus entradas para que los redibujos solo ocurran cuando cambia el estado relevante, y apóyate en el macro Observable para el rastreo de dependencias a nivel de campo. Perfila con el SwiftUI instrument más Power Profiler para encontrar los cuellos de botella reales en lugar de asumir que SwiftUI es la causa, y recurre primero a Time Profiler para tener una visión general.

### 12:12 — [Common Power Mistakes](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=732>)

**P.** ¿Cuál es el mayor error de consumo que cometen las apps sin darse cuenta?

La falta de telemetría e instrumentación, lo que lleva a los equipos a optimizar lo que no es. También no tener en cuenta los distintos estados de la app (bases de datos grandes, condiciones térmicas, cambios de red) que solo aparecen en los datos de campo a través de los registros de energía de Xcode Organizer, no en el escritorio. Usa Condition Inducer para reproducir estados limitados.

### 15:18 — [Instruments Documentation](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=918>)

**P.** ¿Dónde está la mejor documentación o guía escrita para aprender Instruments?

Empieza por los tutoriales de Instruments escritos por un ingeniero de Instruments, que incluyen un proyecto de ejemplo con problemas de rendimiento incorporados para practicar el perfilado y la corrección de hangs. Desde ahí, sigue las guías por herramienta y envía solicitudes a Feedback Assistant para la documentación que falte.

### 16:33 — [Instruments Entry Point](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=993>)

**P.** Para alguien que usa Instruments por primera vez, ¿con qué herramienta deberías empezar?

Time Profiler con la vista Flame Graph hace visualmente obvio qué pilas de llamadas están costando tiempo. El nuevo modo Top Functions en el árbol de llamadas también aplana funciones auxiliares y de tiempo de ejecución para que los mayores culpables afloren rápidamente.

### 17:46 — [High Battery Without BG Work](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=1066>)

**P.** La app solo muestra pantallas UIKit/SwiftUI con poco trabajo en segundo plano, pero Xcode reporta batería alta. ¿Cómo lo diagnostico?

El cómputo de SwiftUI/UIKit debería aparecer como energía en primer plano, así que el drenaje en segundo plano apunta a tareas en segundo plano, localización o red ejecutándose cuando no está en primer plano. Graba una traza con Power Profiler en modo sin cable mientras usas la app con naturalidad y luego ábrela en Instruments para ver la energía por subsistema (CPU, GPU, pantalla, red).

### 20:10 — [Environment Theme Objects](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=1210>)

**P.** ¿A qué escala inyectar un objeto de tema a través del entorno en componentes atómicos profundamente anidados se convierte en un cuello de botella?

Depende mucho del caso concreto y no es inherentemente problemático — el entorno es una abstracción útil. Usa el SwiftUI instrument para medir el coste de invalidación descendente en tu árbol de vistas específico antes de decidir que es un problema.

### 21:35 — [Large SwiftUI Tables](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=1295>)

**P.** ¿Cómo cargas cientos de miles de registros en una tabla SwiftUI y cómo haces seguimiento de las regresiones?

Primero plantéate si realmente necesitas cargar tanto — usa lazy stacks para que SwiftUI solo materialice las celdas visibles. Para el seguimiento de regresiones, usa el nuevo State Reporting de MetricKit para agrupar las cargas en categorías (lote pequeño/mediano/grande) en lugar de registrar cada conteo, y luego correlaciona las métricas con esos estados.

### 25:26 — [BG Tasks Vs Apple Intelligence](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=1526>)

**P.** ¿Cómo prioriza iOS 27 las tareas en segundo plano cuando Apple Intelligence está haciendo trabajo intensivo?

Muchas cargas de trabajo de Intelligence se ejecutan en el Neural Engine o en Private Cloud Compute, por lo que el trabajo de app limitado por CPU a menudo puede ejecutarse de forma concurrente. Estructura las tareas en segundo plano en fragmentos pequeños y reanudables para que el sistema pueda pausar y reanudar sin perder el progreso. Las nuevas vistas de System Trace en Instruments ahora muestran la prioridad de los hilos y qué te ha interrumpido.

### 28:14 — [Thread Hopping At Launch](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=1694>)

**P.** ¿Cuánto cuesta el salto frecuente entre hilos frente al bloqueo, y cómo deberías estructurar el trabajo costoso en el arranque?

El coste por salto es insignificante salvo que hagas miles por segundo — bloquear el hilo principal es peor. Aplaza el trabajo no crítico tras el primer frame, usa BGAppRefreshTask para precalentar datos y prioriza las colas en segundo plano por debajo del trabajo visible al usuario. Inspecciona los recuentos de cambios de contexto y los estados de bloqueo del hilo principal en System Trace, y consulta la sección de arranque de Xcode Organizer para las pilas de llamadas de campo.

### 34:13 — [Measuring Launch Time](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2053>)

**P.** ¿Cuál es la forma correcta de medir el tiempo de arranque de una app?

No lo implementes tú mismo con APIs del kernel — eso añade sobrecarga. MetricKit y Xcode Organizer miden desde el toque en la pantalla de inicio (antes de que exista tu proceso) hasta el primer frame, la misma metodología que Apple usa para sus propias apps como Mail.

### 35:48 — [Silent SwiftUI Battery Drain](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2148>)

**P.** Más allá de las tareas en segundo plano, ¿cuál es el drenaje de batería silencioso más común en SwiftUI y cómo detectas la sobre-invalidación de vistas?

La sobre-invalidación es silenciosa porque nada cambia visiblemente mientras la CPU está ocupada redibujando vistas idénticas. Minimiza los redibujos, aplana la jerarquía de vistas, vigila el trabajo en segundo plano despachado que alimenta las vistas y cachea donde sea posible. Usa el SwiftUI instrument para detectar la agitación.

### 37:44 — [Large Lists On macOS](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2264>)

**P.** ¿Hay mejoras o buenas prácticas para listas y tablas SwiftUI con miles de elementos?

Mantén los tamaños de celda constantes para que el caché de SwiftUI funcione — las celdas de altura variable fuerzan recálculos en cascada de los desplazamientos de scroll. Usa estructuras de datos perezosas y haz el filtrado en el lado del modelo en lugar de dentro de ForEach, para que SwiftUI solo gestione lo que tiene que mostrar.

### 39:51 — [AnyView Cost](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2391>)

**P.** ¿Cuánto cuesta el borrado de tipos de AnyView y hay un umbral para evitarlo?

Añade algo de sobrecarga en la creación pero no vale la pena contorsionar tu arquitectura para evitarlo. Trátalo como algo a revisar si la medición demuestra que es un problema — la intuición suele sobrestimar el coste comparado con las mediciones reales.

### 42:01 — [Lesser-Known New Tools](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2521>)

**P.** Más allá de State Reporting y las extensiones de informes de crash, ¿qué nuevas herramientas para desarrolladores merecen atención?

Los nuevos Metric Goals de Xcode Organizer te permiten comparar las métricas de tu app con apps comparables para establecer una línea base. El instrumento de Foundation Models es ahora una herramienta de depuración completa que muestra peticiones, prompts y caché de tokens. Una nueva herramienta en la versión 26.4 perfila apps Metal de larga duración durante horas en busca de valores atípicos de FPS, y hay una publicación en los Apple developer forums bajo la etiqueta MetricKit que resume todo.

### 45:45 — [WWDC Homework](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2745>)

**P.** Si los desarrolladores tienen que probar una cosa nueva antes de que acabe el WWDC, ¿cuál es?

Mira Metric Goals en Xcode Organizer para comparar con apps similares, y adopta State Reporting en MetricKit para segmentar las métricas por estado de la aplicación e identificar dónde invertir.

### 46:50 — [Deep Swift Performance Path](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2810>)

**P.** Más allá de las sesiones y Swift Evolution, ¿cómo profundizas en el rendimiento de Swift — bases de código, internos del compilador, libros?

La inmersión práctica a través de las plantillas de Instruments es el mejor maestro. Mira la sesión del año pasado «Optimize CPU performance with Instruments», que cubre Time Profiler, CPU Counters y Processor Trace, y estudia la Apple Silicon CPU Optimization Guide para entender el hardware sobre el que corre tu Swift.

### 49:02 — [Escaping Closures In SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2942>)

**P.** ¿Cómo arquitectas SwiftUI cuando los parámetros de closure de escape causan sobre-invalidación pero el contenido ViewBuilder no siempre es suficiente?

Llama al closure en <span class="high">init</span> en lugar de en <span class="high">body</span> para que no se ejecute en cada reevaluación, o busca una forma alternativa de la API. Lleva preguntas detalladas al group lab de SwiftUI.

### 50:34 — [Heavy Assets On Older Devices](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=3034>)

**P.** ¿Cómo evitas que los datos dinámicos y los assets pesados provoquen hitches o picos de CPU en dispositivos antiguos?

Ajusta el tamaño de los assets al contexto (no uses una imagen de 2000 px para una miniatura), cachea los resultados decodificados y carga las imágenes fuera del hilo principal con marcadores de posición para que la UI siga siendo responsiva. Para aproximarte al hardware más antiguo, activa el Modo de Bajo Consumo y usa Condition Inducer; complementa con datos de campo de MetricKit y Xcode Organizer, y perfilar siempre en un dispositivo físico — el rendimiento del simulador refleja el del Mac.

### 55:10 — [Thermal Pressure Outdoors](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=3310>)

**P.** Una app de ARKit/Metal usada bajo la luz directa del sol alcanza los límites térmicos — ¿cómo gestionar la presión térmica?

Suscríbete a <span class="high">ProcessInfo.thermalState</span> y degrada con elegancia: solicita assets de red más ligeros, simplifica animaciones y transiciones, y reduce la tasa de frames o la resolución de renderizado bajo presión. El sistema ya limita algunas tasas de frames de animación y pantalla en estados de alta temperatura, así que constrúyelo sobre esa base.

### 59:04 — [Many Environment Values](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=3544>)

**P.** ¿Inyectar muchos valores <span class="high">@Environment</span> a lo largo de una jerarquía SwiftUI profunda perjudica el rendimiento del renderizado o de las actualizaciones?

Leer valores de entorno es barato; el coste viene de la agitación del entorno — actualizar frecuentemente los valores del entorno obliga a cada lector a reevaluarse. Inspecciónalo con el SwiftUI instrument.

---

## Destacados

- Usa Power Profiler en modo no conectado para capturar trazas del mundo real y ábrelas en Instruments para ver el desglose de energía por subsistema.
- Adopta la nueva API Swift-first de MetricKit con State Reporting para segmentar métricas por estados definidos por la app (p. ej., categoría de tamaño de lote).
- Metric Goals en Xcode Organizer ahora compara tu app con apps similares en lanzamientos, hitches, hangs y energía en primer plano.
- Empieza a aprender Instruments con Time Profiler + Flame Graph y los tutoriales oficiales de Instruments; el nuevo modo Top Functions aplana los árboles de llamadas.
- Mide el tiempo de lanzamiento con MetricKit/Xcode Organizer (del toque al primer frame) — no lo especules mediante APIs del kernel.
- Simula hardware más antiguo o con limitaciones con el Modo de bajo consumo y Condition Inducer de Xcode; perfilasiempre en dispositivos físicos, no en simuladores.
- El instrument de Foundation Models ahora expone prompts, peticiones y caché de tokens; una nueva herramienta 26.4 perfila apps Metal de larga duración durante horas.

---

## Sesiones relacionadas

- [Optimize CPU performance with Instruments](<https://developer.apple.com/videos/play/wwdc2025/308/>) (Optimiza el rendimiento de CPU con Instruments)
- [Dive into Core AI model authoring and optimization](<https://developer.apple.com/videos/play/wwdc2026/325/>) (Profundiza en la creación y optimización de modelos Core AI)
- [Profile and optimize your game's memory](<https://developer.apple.com/videos/play/wwdc2022/10106/>) (Perfila y optimiza la memoria de tu juego)
- [What's new in MetricKit](<https://developer.apple.com/videos/play/wwdc2020/10081/>) (Novedades de MetricKit)
- [Debug and profile agentic app experiences with Instruments](<https://developer.apple.com/videos/play/wwdc2026/243/>) (Depura y perfila experiencias de apps agénticas con Instruments)

---
