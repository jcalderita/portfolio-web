# Xcode Tips and Tricks Group Lab

> WWDC26 · Sesión 8013 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8013/)

---

## Acerca de

Únete a nosotros online para profundizar en WWDC26 con ingenieros y diseñadores de Apple: haz preguntas, recibe consejos y sigue el debate sobre cómo sacar el máximo partido a Xcode. Sesión en inglés.

Angelica presenta un Group Lab centrado en Xcode con los ponentes Chris Miles (live coding, previews, playgrounds), Jake (diseño, temas, barra de herramientas), John (equipos front-end de Xcode), Kasper (Instruments) y Chris (organizer, firma). Responden preguntas de desarrolladores sobre consejos, rendimiento de compilación, firma, agentes y más.

---

## Q&A

### 1:18 — [Consejos poco conocidos](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=78>)

**P.** ¿Cuáles son los consejos y trucos de Xcode más útiles pero menos conocidos en los que se apoya cada uno de vosotros?

Los panelistas destacaron la macro #playground para fragmentos de Swift en línea, temas por espacio de trabajo, cortar código y pegarlo en el navegador de archivos para crear un nuevo archivo, find call hierarchy al refactorizar Objective-C, Command-Shift-J para revelar un archivo en el navegador, depurar sobreescrituras de apariencia de Xcode, filtrado de consola por categoría, menús de filtrado por texto en la jump bar, cuadrículas de argumentos de preview, exportar memgraphs a Instruments y breakpoints condicionales mediante clic secundario.

### 5:25 — [Función reciente infrautilizada](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=325>)

**P.** ¿Qué función reciente de Xcode merece más atención de la que recibe?

John defendió las carpetas azules (frente a los grupos) como solución casi definitiva a los conflictos de fusión en archivos de proyecto, algo que Kasper del equipo de Instruments secundó. Otros mencionaron los toggles de scheme para user-defaults, el filtrado de consola, las variantes y argumentos de preview, y exportar el memory graph debugger a Instruments para obtener líneas de tiempo de footprint.

### 9:30 — [Eliminar Derived Data](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=570>)

**P.** Un agradecimiento por el nuevo ítem de menú Eliminar Derived Data — ¿algún contexto sobre por qué llegó?

John explicó las razones habituales por las que los desarrolladores recurren a él: poco disco, más rápido que hacer clean, recuperarse de dependencias entre targets ocultas cuyo orden de compilación paralela hace las builds inestables. Sugirió analizar el proyecto en busca de dependencias faltantes si el patrón de fallos se repite.

### 10:48 — [Coexistencia de Xcode 26 + 27](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=648>)

**P.** ¿Puedo ejecutar la beta de Xcode 27 junto a Xcode 26 para publicar sin romper mi configuración?

Sí — se admiten varias versiones de Xcode en paralelo. Limítate a las funciones del SDK público para que tu app siga compilando en 26; solo hay una nueva opción de formato de proyecto este año que requiere Xcode 27. Ten en cuenta xcode-select al publicar, y Xcode Cloud es una forma limpia de validar la compatibilidad.

### 12:31 — [Funciones infravaloradas](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=751>)

**P.** ¿Cuál es la función más infravalorada de Xcode que incluso los desarrolladores con experiencia no aprovechan lo suficiente?

De nuevo las carpetas azules, anclar pestañas individuales del canvas para que las previews persistan entre archivos, toggles de edición de scheme, Xcode Cloud (con incorporación mejorada y configuración de webhooks este año), búsqueda potente con regex/símbolo/proximidad y delete-to-narrow, triángulos de expansión con Command-click para colapsar hermanos, consultas de type hierarchy y la suite completa de Instruments incluyendo las plantillas de SwiftUI, concurrency y Foundation Models.

### 18:07 — [Ejecutar 26 y 27 a la vez](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1087>)

**P.** ¿Qué consideraciones hay que tener en cuenta cuando la beta de Xcode 27 se ejecuta en la misma máquina que Xcode 26?

En la práctica ninguna este año — ejecutar varios Xcode simultáneamente está totalmente soportado y no hay problemas de compatibilidad de formato de proyecto reseñables entre 26 y 27.

### 19:01 — [Conflictos de fusión en proyectos](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1141>)

**P.** ¿Cómo podemos minimizar los conflictos de fusión en .xcodeproj sin generadores de terceros como Tuist o XcodeGen?

John recomendó convertir los grupos en carpetas azules (la pertenencia a targets debe coincidir con el contenido de la carpeta), usar el preflight con la tecla Option en convert-to-folder para corregir errores antes de migrar, activar la casilla «minimize cross-project references» y mover los build settings a archivos .xcconfig — que este año recibieron mejor coloreado de sintaxis y comentarios más útiles para revisiones.

### 22:40 — [Markdown en Xcode](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1360>)

**P.** ¿Hay trucos interesantes con el nuevo soporte de Markdown y alguna mejora de control de código fuente que merezca la pena conocer?

Los archivos Markdown se renderizan de forma nativa, se pueden alternar a la vista de fuente con Open As, y puedes editar ambas formas. El mismo renderizador funciona dentro de las transcripciones de agentes, y la preview del canvas ofrece una vista en paralelo. En cuanto al control de código fuente, el navegador se reescribió por dentro, el rendimiento con millones de etiquetas es mucho mejor, los diffs ahora usan rojo/verde (personalizable en temas) y el multi-select de stash se tomó como feedback.

### 25:47 — [Reaprobación de confianza de macros](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1547>)

**P.** ¿Puede fijarse la confianza de las macros a la identidad de un paquete en lugar de requerir reaprobación cada vez que un paquete como MLX Swift se actualiza?

El panel no tenía a mano a un experto en Swift Package Manager y pidió al desarrollador que enviara un informe a Feedback Assistant con el paquete concreto y la reproducción — el comportamiento descrito no debería ocurrir en cada actualización.

### 26:50 — [Abrir Terminal en la raíz](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1610>)

**P.** ¿Hay alguna forma de abrir Terminal en la raíz del proyecto desde Xcode?

No directamente. Alternativas: arrastra un archivo del navegador a Terminal para hacer cd allí, o usa la nueva ruta relativa a la copia de trabajo que aparece en el inspector de archivos (doble clic para copiar). El panel coincidió en que esto merece una solicitud de feedback junto a la acción existente Show in Finder.

### 27:55 — [Atajos de teclado diarios](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1675>)

**P.** ¿Qué atajos de teclado de Xcode usáis cada día?

Los favoritos incluyeron Shift-Cmd-J (revelar en el navegador), Shift-Cmd-Y (mostrar/ocultar área de depuración), Ctrl-Opt-Cmd-G (repetir el último test), Cmd-Opt-P (actualizar previews), Ctrl-6 (filtro de jump bar), Cmd-Opt-Arriba/Abajo (alternar cabecera/implementación), Shift-Cmd-O (Open Quickly), Ctrl-Cmd-R (ejecutar sin compilar), Cmd-I (perfilar), Ctrl-\ (siguiente diff) y Cmd-/ (activar/desactivar comentario). Todos los atajos son buscables y personalizables en Xcode Settings.

### 31:26 — [Errores de principiante](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1886>)

**P.** ¿Cuáles son los errores más comunes de los principiantes en Xcode y cómo evitarlos?

No intentes aprender todas las funciones a la vez; confía en la firma de código automática; usa la nueva barra de herramientas simplificada y el inicio con proyecto en blanco; inicia siempre un repositorio Git (activado por defecto); perfila en un dispositivo real con una build de release, nunca en el simulador ni con una build de depuración; adopta SwiftUI y Swift concurrency; y organiza los archivos en carpetas desde el principio. Las sesiones de code-along son una forma estupenda de ver los flujos de trabajo de Xcode en contexto.

### 37:54 — [Flujos de trabajo con DocC](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2274>)

**P.** ¿Cuáles son los flujos de trabajo más eficientes para generar y mantener documentación de DocC durante el desarrollo activo?

Usa el asistente de preview de documentación para obtener feedback en tiempo real sobre los comentarios del código fuente, publica el archivo DocC como sitio estático para la revisión de PRs y considera escribir artículos (Instruments los usa para documentación interna, con variantes de imagen en modo claro/oscuro). Vigila los agentes — tienden a documentar en exceso y a filtrar detalles de implementación. DocC es de código abierto y la búsqueda con IA generativa de developer.apple.com muestra sesiones relacionadas.

### 40:07 — [Consejos para reducir el tiempo de compilación](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2407>)

**P.** ¿Qué ajustes o prácticas mejoran significativamente el tiempo de compilación?

John recomendó Cmd-Ctrl-R para ejecutar sin compilar, dividir el código en paquetes/frameworks para que los cambios no invaliden todo, usar el asistente de línea de tiempo de compilación para investigar, activar las advertencias de tiempo de comprobación de tipos de expresiones de Swift y auditar las fases de script para que declaren entradas/salidas y no se ejecuten de forma incondicional. Los módulos explícitos y los imports private/internal también pueden ayudar.

### 43:09 — [Previews más rápidas](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2589>)

**P.** ¿Cómo puedo hacer que las Xcode Previews carguen más rápido sin esperar a un simulador fuera de pantalla?

El mismo consejo que para el rendimiento de compilación: las previews comparten artefactos de compilación, así que haz primero una compilación y ejecución inicial y luego las previews y las macros playground en línea se recargan de forma incremental. Modularizar el proyecto mantiene la invalidación acotada.

### 44:11 — [Integración de swift-format](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2651>)

**P.** ¿Cuál es la mejor forma de integrar swift-format en Xcode sin las alertas y la carga de disco que generan las ejecuciones en fases de compilación?

En lugar de ejecutarlo en cada compilación, integra swift-format al guardar o como paso pre-commit de Git — así el editor no interfiere y se garantiza igualmente que el código formateado llega al repositorio, especialmente en el momento del PR. Envía feedback si el comportamiento de Xcode resulta un obstáculo.

### 45:41 — [Acciones de breakpoints en LLDB](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2741>)

**P.** ¿Cuáles son los comandos de LLDB o las acciones de breakpoint más infrautilizadas para inspeccionar el estado sin detener la ejecución?

Usa las acciones de breakpoint para reproducir un sonido, registrar un mensaje o imprimir un backtrace — cualquier comando de LLDB funciona ahí. John usa un breakpoint condicional activado con la tecla Shift para detener la ejecución bajo demanda en código de layout ruidoso. Otros consejos: ignore-count para saltarse N ocurrencias, prefiere la vista de variables sobre po, usa expression + print de Swift para el escapado exacto, p/x para hexadecimal y prints basados en breakpoints en lugar de sentencias print permanentes en el código.

### 48:59 — [Símbolos no utilizados](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2939>)

**P.** ¿Puede Xcode mostrar variables, propiedades y funciones no utilizadas? Y si no, ¿por qué?

El compilador emite advertencias de variable no utilizada cuando puede demostrar estáticamente que no se usa, pero las propiedades públicas no se pueden marcar con seguridad porque puede haber llamadores externos. Find call hierarchy ayuda para símbolos concretos. Envía feedback con casos reales donde Xcode podría razonablemente mostrar esto.

### 50:37 — [La realidad de Derived Data](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=3037>)

**P.** ¿Eliminar Derived Data es una práctica de ingeniería o una superstición compartida, y a qué deberíamos recurrir primero cuando las builds se comportan de forma extraña?

Ambas cosas: las causas legítimas incluyen dependencias entre targets faltantes (una carrera en la compilación) o el disco lleno, pero el equipo considera que necesitar borrarlo es un bug — suyo o tuyo. Xcode 27 reduce significativamente la necesidad, especialmente al cambiar de rama. Prueba primero con Clean, envía feedback con reproducciones y recuerda que Swift Build es de código abierto si quieres profundizar. Los work trees también pueden disparar el tamaño de Derived Data.

### 54:53 — [Pérdida de contexto del agente](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=3293>)

**P.** Cuando el contexto de Claude Code se comprime a mitad de sesión, pierde silenciosamente la comprensión del proyecto — ¿podríamos tener un indicador de compresión y una pausa antes de editar?

Es un buen feedback para enviar. Mitigaciones actuales: usa el modo plan para escribir el plan en disco de forma que el modelo pueda releerlo, y crea artefactos a los que el agente pueda hacer referencia entre sesiones y cambios de modelo. Controla el tamaño del CLAUDE.md — se carga en el contexto por defecto, así que un archivo de 230 líneas ya está aumentando la ventana de contexto por sí solo.

### 56:49 — [Firma y perfiles](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=3409>)

**P.** ¿Cómo evitamos los conflictos de firma y perfiles de aprovisionamiento, especialmente al cambiar de perfiles entre muchos targets para perfilar en Instruments?

Usa la firma automática — la mayoría de las razones por las que los equipos pasaron a manual ya no aplican, y Xcode Cloud gestiona la firma para CI. No uses la firma de distribución para tu configuración Release local; la firma de distribución corresponde al momento de subir a App Store. No desactives code-sign-inject-base-entitlements como solución alternativa — rompe las herramientas de Instruments como Allocations que necesitan entitlements depurables.

### 59:12 — [Code folding para concentrarse](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=3552>)

**P.** ¿Puede configurarse el code folding y la navegación estructural de Xcode para ocultar el ruido y mostrar solo la lógica de mayor valor?

Hoy no existe un modo configurable único para eso — envía feedback describiendo el flujo de trabajo deseado. Alternativas: divide la definición de un tipo entre extensiones o archivos para que el ruido viva en un «cajón de sastre», y explora las acciones existentes en el menú Editor → Code Folding.

---

## Destacados

- El macro <span class="high">#playground</span> te permite ejecutar fragmentos de Swift inline en cualquier archivo; Archivo → Nuevo → Playground te da un andamiaje de un solo archivo.
- Convierte grupos a carpetas azules (preflight con la tecla Option en Convertir a carpeta) para eliminar la mayoría de los conflictos de merge en <span class="high">.xcodeproj</span>; alinea el contenido de la carpeta con la pertenencia al target.
- Xcode 27 incluye Eliminar Derived Data, esquemas de color por workspace con temas, barra de herramientas personalizable, flujo de nuevo archivo para proyectos en blanco, colores diff rojo/verde (temizables) y un navegador de control de código reescrito.
- Exporta instantáneas del depurador memgraph a Instruments para líneas de tiempo de allocations; usa las plantillas de SwiftUI, Concurrency y Foundation Models en Instruments.
- Kit de rendimiento de compilación: Cmd-Ctrl-R para ejecutar sin compilar, asistente de línea de tiempo de compilación, advertencias de comprobación de tipos de expresiones Swift, entradas de fases de script auditadas, archivos <span class="high">.xcconfig</span> con soporte de editor mejorado.
- Usa Feedback Assistant (feedbackassistant.apple.com) y developer.apple.com/forums —incluida la nueva búsqueda con IA generativa— para el seguimiento; Swift Build y DocC son de código abierto.

---

## Sesiones relacionadas

- [Analyze heap memory](<https://developer.apple.com/videos/play/wwdc2024/10173/>) (Analizar la memoria del heap)
- [Profile, fix, and verify: Improve app responsiveness with Instruments](<https://developer.apple.com/videos/play/wwdc2026/268/>) (Perfila, corrige y verifica: mejora la respuesta de tu app con Instruments)
- [Code-along: Elevate an app with Swift concurrency](<https://developer.apple.com/videos/play/wwdc2025/270/>) (Code-along: Eleva una app con Swift concurrency)
- [Demystify parallelization in Xcode builds](<https://developer.apple.com/videos/play/wwdc2022/110364/>) (Desmitifica la paralelización en las compilaciones de Xcode)
- [Code-along: Explore localization with Xcode](<https://developer.apple.com/videos/play/wwdc2025/225/>) (Code-along: Explora la localización con Xcode)

---
