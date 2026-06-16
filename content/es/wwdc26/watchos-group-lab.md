# watchOS Group Lab

> WWDC26 · Sesión 8014 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8014/)

---

## Acerca de

Únete a nosotros en línea para profundizar en WWDC26 con ingenieros y diseñadores de Apple: haz preguntas, recibe consejos y sigue el debate sobre los grandes anuncios de watchOS de la semana. Conducido en inglés.

Leah, de Worldwide Developer Relations, modera un laboratorio grupal de watchOS junto a los ingenieros Dan (equipo de workout), Anne (frameworks de Watch), Devin (widgets y Live Activities) y Matthew (espacios del sistema). El panel responde preguntas sobre watchOS 27 y abarca Foundation Models, Liquid Glass, widgets, HealthKit y los fundamentos de la plataforma.

---

## Q&A

### 2:49 — [Foundation Models Runtime](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=169>)

**P.** ¿Dónde ejecuta el framework Foundation Models en Apple Watch: en el iPhone vinculado o a través de Private Cloud Compute?

Anne explicó que Foundation Models en el Watch no requiere el iPhone vinculado, pero sí necesita conexión de red. Las llamadas van a PCC (que requiere un entitlement) o a cualquier proveedor que conforme con Language Model; la compatibilidad con Claude y Gemini está en camino. No hay modelo en el propio dispositivo.

### 9:01 — [PCC vs iPhone Model](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=541>)

**P.** ¿Puede el Watch reutilizar el modelo en dispositivo del iPhone por Bluetooth o red local, o siempre acude a PCC?

Anne confirmó que nunca recurre al modelo en dispositivo del iPhone. Cada llamada implica un salto de red a PCC u otro proveedor de Language Model, por lo que los desarrolladores deben tener en cuenta la latencia y ser deliberados con la frecuencia de las llamadas.

### 10:20 — [Transición de iOS a watchOS](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=620>)

**P.** ¿Qué paradigmas arquitectónicos o trampas debe conocer un desarrollador de iOS al gestionar trabajo pesado fuera del hilo principal —como la sincronización con CloudKit— en watchOS?

Matthew señaló que la mayoría de las APIs conocidas —NSURLSession, CloudKit, Swift concurrency, SwiftUI— funcionan en el Watch, pero los tiempos límite del watchdog son estrictos para proteger la batería y el runtime compartido. Anne y Dan añadieron que el menor número de núcleos premia ser deliberado con el trabajo programado, y que las apps de Watch merecen un rediseño fresco en lugar de un port (véase «Design and build apps with watchOS»). Devin apuntó que el runtime de widgets es comparable al de iOS, y que los widgets de la pantalla de bloqueo suelen funcionar con pequeños ajustes de layout; la relevancia en Smart Stack es el diferenciador clave.

### 19:08 — [Rendimiento del bucle de depuración](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=1148>)

**P.** ¿Cómo pueden los desarrolladores acelerar los ciclos de depuración en dispositivo para watchOS, los retrasos de instalación de Xcode y la sincronización inicial de símbolos?

Anne recomendó instalar Xcode 27 —el equipo ha invertido mucho en la velocidad de instalación y ha añadido diagnósticos; si los problemas persisten, conviene enviar feedback con los logs. Matthew destacó la conexión directa Mac–Watch de Device Hub (sin usar el iPhone como proxy), la necesidad de una red que permita el descubrimiento de dispositivos entre pares, y el Wi-Fi 5 GHz del hardware Apple Watch más reciente como mejoras de ancho de banda.

### 23:26 — [Funciones favoritas de watchOS 27](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=1406>)

**P.** ¿Cuáles son las funciones nuevas favoritas del panel en watchOS 27?

Dan eligió Workout Buddy y los nuevos análisis de entrenamiento. Anne destacó Foundation Models en el Watch y la actualización de widgets a través de Watch Connectivity. Devin resaltó el trabajo de rendimiento y fiabilidad de los widgets, junto con las nuevas sugerencias de Smart Stack —incluidas sorpresas navideñas—. Matthew avanzó trabajo de inteligencia de Siri que está por llegar, y Leah añadió las novedades de HealthKit: Heart Rate Zones, Power Zones de ciclismo y la Perimenopause/Menopause API.

### 27:17 — [Sustitución de SceneKit](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=1637>)

**P.** Con SceneKit obsoleto en watchOS 26 y RealityKit no disponible, ¿cuál es la forma recomendada de renderizar gráficos 3D en watchOS?

Matthew dijo que SceneKit está obsoleto pero sigue siendo utilizable; el camino a seguir en el Watch es SwiftUI, concretamente SwiftUI Canvas, que Anne señaló que está acelerado por GPU. Si encuentras carencias, contacta con DTS, publica en los foros y envía feedback.

### 29:19 — [Capacidades de Watch infrautilizadas](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=1759>)

**P.** ¿Qué capacidades podrían no conocer los desarrolladores en Apple Watch que justificarían ampliar su app —por ejemplo, usar el Watch como periférico de raqueta de tenis para visionOS?

Dan señaló los datos del sensor de Core Motion como una entrada poco explorada para experiencias novedosas. Matthew y Devin pusieron el énfasis en las superficies proactivas —Live Activities, sugerencias de Smart Stack y widgets relevantes vinculados a tiempo, ubicación o contexto semántico (casa, trabajo)—. Devin advirtió contra ocupar demasiado tiempo el primer puesto de Smart Stack; Matthew citó la app Sports, que calibra la cadencia de alertas por deporte, como modelo de actualizaciones de Live Activity juiciosas.

### 37:46 — [Liquid Glass en watchOS](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=2266>)

**P.** ¿Qué hay de nuevo en Liquid Glass específicamente en watchOS 27?

Matthew describió los refinamientos tras watchOS 26: especulares más oscuros en los bordes, mejor separación del contenido al hacer scroll para mejorar la legibilidad, mejoras de rendimiento y cristal interactivo en todo el sistema. La mayoría de las apps que adoptaron el lenguaje de diseño de watchOS 10 reciben las actualizaciones de forma automática. No hay selector claro/tintado por usuario en el Watch —la interfaz oscura y la pantalla pequeña llevaron al equipo a confiar en un único equilibrio ajustado—, pero están disponibles las opciones de accesibilidad como reducir transparencia y aumentar contraste.

### 45:54 — [Presupuestos de actualización de widgets](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=2754>)

**P.** ¿Cambia watchOS 27 las recomendaciones sobre la frecuencia de actualización de widgets/complicaciones —sigue vigente la regla de unas 50 actualizaciones al día, independientemente de Background App Refresh o APNs?

Devin dijo que no hay cambios importantes en las recomendaciones: espera actualizaciones cada unos 15–20 minutos para widgets en uso activo, con los widgets de la esfera en lo alto del nivel de presupuesto y los widgets de Smart Stack escalados según la frecuencia con que el usuario los consulta. Las actualizaciones pueden llegar desde la invalidación en el lado de la app, las políticas de recarga de la timeline, los pushes de APNs (añadidos en watchOS 26) y ahora Watch Connectivity (nuevo este año). Matthew encuadró la elección entre widget, widget relevante, Live Activity y Control como seleccionar la herramienta adecuada para el modelo de datos; consulta la sesión de fundamentos de WidgetKit y el artículo «Keeping your widget up to date».

### 54:29 — [Sincronización del primer arranque en modo independiente](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=3269>)

**P.** ¿Cuáles son las buenas prácticas para una app de Watch autónoma que descarga activos pesados en el primer arranque sin depender de Watch Connectivity?

Anne recomendó incluir en el bundle todo lo que sea posible para que el primer arranque muestre algo útil de inmediato, y luego usar Background URL Session para el resto —evita un primer inicio con solo un spinner—. Matthew añadió que diseñar una UX que enmascare la descarga es el reto de diseño central en el Watch. Anne también recordó a los desarrolladores que gestionen de forma elegante el caso de uso totalmente sin conexión (usuarios de Apple Watch Ultra en zonas remotas sin cobertura).

---

## Destacados

- Foundation Models en watchOS siempre va por la red —PCC (requiere entitlement) o cualquier proveedor que conforme a LanguageModel—; no hay modelo en el dispositivo ni fallback al modelo del iPhone vinculado.
- Device Hub en Xcode 27 conecta el Mac directamente al reloj (sin proxy a través del teléfono); el hardware más reciente de Apple Watch tiene Wi-Fi a 5GHz para ciclos de instalación y depuración más rápidos —envía feedback si los problemas persisten—.
- SceneKit está deprecated en el reloj; migra a SwiftUI Canvas (acelerado por GPU) para dibujo 2D/3D.
- Novedades en watchOS 27: actualizaciones de widgets mediante Watch Connectivity, la API Reorderable de SwiftUI (primera vez que los desarrolladores pueden reordenar contenedores en watchOS), insights de Workout Buddy, y las APIs de Heart Rate/Power Zones y Perimenopause/Menopause de HealthKit.
- Refinamientos de Liquid Glass: especulares de borde más oscuros, mejor separación del contenido en scroll, vidrio interactivo; las apps que usan el lenguaje de diseño de watchOS 10 lo obtienen automáticamente —sin el deslizador de usuario limpio/con tinte en el reloj—.
- Elige la herramienta de widget según la forma de los datos: timeline (tiempo, calendario), widget relevante (vinculado a hora/lugar), Live Activity (sesiones como partidos o rutas), Control (acciones rápidas). Consulta las sesiones de fundamentos de WidgetKit y fundamentos de Live Activities, y el artículo «Keeping your widget up to date».

---

## Sesiones relacionadas

- [Live Activities essentials](<https://developer.apple.com/videos/play/wwdc2026/223/>) (Fundamentos de Live Activities)
- [WidgetKit foundations](<https://developer.apple.com/videos/play/wwdc2026/277/>) (Fundamentos de WidgetKit)
- [Bring your Live Activity to Apple Watch](<https://developer.apple.com/videos/play/wwdc2024/10068/>) (Lleva tu Live Activity a Apple Watch)
- [What’s new in SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/269/>) (Novedades en SwiftUI)
- [What’s new in the Foundation Models framework](<https://developer.apple.com/videos/play/wwdc2026/241/>) (Novedades en el framework Foundation Models)

---
