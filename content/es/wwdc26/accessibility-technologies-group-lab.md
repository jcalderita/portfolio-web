# Accessibility Technologies Group Lab

> WWDC26 · Sesión 8005 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8005/)

---

## Acerca de

Únete a nosotros online para profundizar en WWDC26 con ingenieros y diseñadores de Apple: haz preguntas, recibe consejos y sigue el debate sobre los grandes anuncios de tecnologías de accesibilidad de la semana. Conducido en inglés.

Cole modera un panel de Accessibility Technologies con Julia (marketing de producto), Drew (ingeniero de software en iOS/visionOS/iPadOS, con foco en lo cognitivo), Greg (engineering manager y usuario con baja visión) y Sill (QA de accesibilidad, VoiceOver y Braille). La sesión cubre las novedades de las versiones OS 27 y preguntas de desarrolladores sobre VoiceOver, Dynamic Type, Voice Control, Assistive Access, nutrition labels y visionOS.

---

## Q&A

### 4:59 — [Pruebas en distintos tamaños de pantalla](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=299>)

**P.** Más allá de Accessibility Inspector y Device Hub, ¿qué consejos tienes para probar la usabilidad en distintos tamaños de pantalla?

Combina las pruebas de tamaño de pantalla con Dynamic Type. La interfaz debe reorganizarse dinámicamente según el tamaño de fuente, y estos dos aspectos deben considerarse juntos.

### 5:51 — [Priorizar la tecnología de asistencia](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=351>)

**P.** Cuando los equipos solo prueban VoiceOver y omiten Switch Control, Voice Control y el acceso completo por teclado, ¿cómo deberían priorizar, y qué tecnología está más infravalorada?

Empezar con VoiceOver está bien: gran parte de la accesibilidad de Switch Control y Voice Control se obtiene gratis a partir de una buena experiencia con VoiceOver, ya que comparten APIs de backend como los elementos de accesibilidad y las etiquetas. Añade feedback de usuarios reales cuando sea posible para pulir la experiencia.

### 9:28 — [Anular descripciones de imágenes](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=568>)

**P.** ¿Cómo evito que VoiceOver añada su descripción generada por el sistema después de mi propio <span class="high">accessibilityLabel</span> en una imagen de SwiftUI?

Eliminar el trait de imagen evita que VoiceOver añada su descripción, pero hacerlo también priva a los usuarios de la nueva función de descripción de imágenes con preguntas de seguimiento. Se reproduce un sonido sutil tras tu texto alternativo para que los usuarios sepan qué descripción es la del autor.

### 11:54 — [Portal de pacientes EHR](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=714>)

**P.** ¿Qué nuevas funciones de accesibilidad de WWDC debería incorporar al desarrollo un estudiante de medicina que está creando un portal de pacientes?

Accessibility Reader funciona a nivel de sistema para contenido extenso y se integra con el contenido hablado. Las descripciones de imágenes y el explorador de imágenes ayudan con gráficos e imágenes con mucho contenido de datos. Empieza con Dynamic Type y después añade etiquetas de VoiceOver.

### 15:01 — [Anunciar completados asíncronos](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=901>)

**P.** ¿Cómo le indico a VoiceOver que la acción de red de un botón ha terminado cuando el botón es reemplazado por una vista de progreso y luego se restaura?

Usa notificaciones de accesibilidad: <span class="high">layout-changed</span> para actualizaciones de interfaz menores, <span class="high">screen-changed</span> para las más grandes, y la notificación de anuncio para pronunciar una cadena arbitraria. Evita mover el foco de VoiceOver por la fuerza con demasiada frecuencia.

### 16:31 — [APIs de texto a voz](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=991>)

**P.** ¿Hay alguna API nueva de texto a voz este año?

No hay ninguna API pública nueva este año, aunque sí hay mejoras en el backend. Envía una solicitud de feedback si necesitas adiciones concretas.

### 17:18 — [Dynamic Type en tvOS](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1038>)

**P.** ¿Qué deberían hacer los desarrolladores de tvOS para prepararse para Dynamic Type ahora que está disponible en la plataforma?

Aprende las mejores prácticas para texto grande y prepárate para reorganizar la interfaz cuando se activen los tamaños de fuente de accesibilidad. Una nueva sesión de WWDC de este año cubre en concreto el texto grande en tvOS, y tvOS ya admite una Accessibility Nutrition Label de texto grande.

### 18:13 — [Accessibility Nutrition Labels](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1093>)

**P.** ¿Puedes hablar sobre el valor de las Accessibility Nutrition Labels?

Permiten que los usuarios sepan antes de descargar una app si es compatible con las tecnologías de asistencia que necesitan, ahorrando tiempo y reduciendo la carga cognitiva. También dan a los desarrolladores un punto de referencia y una forma de defender internamente la inversión en accesibilidad, y han inspirado logros reales en la comunidad.

### 21:49 — [VoiceOver en Device Hub](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1309>)

**P.** La nueva opción de VoiceOver en Xcode 27 Device Hub no hizo nada. ¿Es para simuladores o dispositivos físicos, y podemos por fin probar VoiceOver de iOS desde un Mac?

Hay una nueva API de XCTest para controlar VoiceOver de iOS desde un Mac, y debería funcionar en el simulador de Seed 1. Lleva los detalles a los foros de desarrolladores y al Q&A de accesibilidad de mañana.

### 23:08 — [Soporte de VoiceOver en macOS](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1388>)

**P.** Al añadir VoiceOver a una app de macOS, ¿qué deberíamos revisar y cómo deberíamos probar a través de las tecnologías de asistencia en el Mac?

Los usuarios de Mac hacen multitarea y esperan aceleradores —atajos de teclado, saltos a barras laterales y secciones—, así que invierte ahí. Las nuevas funciones de VoiceOver como las descripciones de imágenes se obtienen gratis, y el atajo de accesibilidad (triple pulsación de Touch ID, o Comando-Opción-F5) hace que activar y desactivar funciones sea rápido durante el desarrollo.

### 26:09 — [Acciones del menú contextual en AppKit](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1569>)

**P.** Para controles personalizados de AppKit con acciones de menú contextual y hover, ¿cómo los expongo para que los usuarios de VoiceOver puedan descubrirlos y ejecutarlos?

Las acciones personalizadas son la opción predeterminada, pero los usuarios de Mac tienden a ignorarlas, así que para acciones importantes considera botones explícitos o atajos de teclado. En SwiftUI usa <span class="high">accessibilityRepresentation</span> para reexponer una vista como múltiples botones; en AppKit, sobreescribe los hijos de accesibilidad con elementos personalizados. Usa las acciones hover con moderación porque son difíciles para la accesibilidad cognitiva.

### 28:30 — [Diseñar para uso limitado de mano](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1710>)

**P.** ¿Cómo diseña Apple las funciones de accesibilidad para personas con uso limitado o nulo de sus manos?

Apple ofrece muchas alternativas de entrada —Voice Control, seguimiento de cabeza, seguimiento ocular en el dispositivo, acciones de sonido, Switch Control, Touch Accommodations (con un nuevo flujo de configuración de calibración en iOS 27) y AssistiveTouch— porque dos personas con la misma discapacidad suelen necesitar soluciones muy diferentes. El seguimiento ocular en el dispositivo en iOS destaca especialmente porque funciona sin equipos externos.

### 32:16 — [Funciones para personas neurodivergentes](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1936>)

**P.** ¿Qué funciones están diseñadas pensando en usuarios neurodivergentes?

Guided Access bloquea a los usuarios en la experiencia de una sola app, y Assistive Access proporciona un lenguaje visual simplificado con iconos grandes, texto grande y áreas táctiles amplias —recientemente extendido a la app de TV, con APIs para que los desarrolladores creen sus propias experiencias de Assistive Access—. Screen Time, Speak Screen, Speak Selection y Accessibility Reader también ayudan.

### 34:46 — [VoiceOver reordenable](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=2086>)

**P.** ¿Cómo hago accesible para VoiceOver el nuevo modificador reordenable de SwiftUI, dado que arrastrar y soltar no es un patrón de VoiceOver?

El panel no tenía una respuesta definitiva y sugirió hacer un seguimiento en los foros de desarrolladores; el comportamiento de accesibilidad al arrastrar y soltar varía entre iOS y macOS.

### 35:47 — [Interpretación por vídeo en FaceTime](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=2147>)

**P.** ¿Cómo pueden las apps de terceros integrar la nueva función de interpretación por vídeo de FaceTime, y qué entitlements o APIs aplican?

Esa función todavía no está disponible en la beta de iOS 27; habrá más información cuando se publiquen las APIs.

### 36:29 — [Identificadores de vista reutilizables](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=2189>)

**P.** Para componentes SwiftUI reutilizables, ¿cuál es la forma recomendada de exponer identificadores de accesibilidad estables sin hacer un mal uso de <span class="high">accessibilityLabel</span>?

Envuelve los componentes reutilizables de forma que quien los use esté obligado a proporcionar tanto un <span class="high">accessibilityIdentifier</span> como un <span class="high">accessibilityLabel</span> —rechazando incluso las etiquetas nil—. Esto es especialmente importante para los botones basados en símbolos.

### 38:02 — [Accesibilidad desde el primer día](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=2282>)

**P.** ¿Qué proceso mantiene la accesibilidad integrada desde el inicio de un proyecto en lugar de añadirla después?

Revisa el trabajo con VoiceOver desde el primer día y trata la accesibilidad como una categoría de planificación de primer nivel, al mismo nivel que la privacidad y la seguridad. Usa historias reales de personas para motivar a tus compañeros, incorpora la accesibilidad en los prototipos e iteraciones, y reserva tiempo cerca del final para refinar VoiceOver y Dynamic Type una vez que la interfaz se estabilice. Valora la criticidad para los usuarios, no solo el tamaño de la población.

### 44:59 — [Problemas entre plataformas](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=2699>)

**P.** ¿Hay problemas de accesibilidad específicos de cada plataforma a tener en cuenta al crear una app universal para macOS, iPadOS, watchOS y tvOS?

Prueba cada plataforma de forma individual porque las expectativas difieren: los usuarios de Mac esperan muchos atajos de teclado y navegación jerárquica con VoiceOver con agrupación; iOS depende del hit-testing y la navegación lineal; tvOS solo tiene el mando a distancia; y watchOS añade la Digital Crown. La agrupación es especialmente importante en Mac para apps complejas como Final Cut Pro.

### 51:31 — [Voces de IA para VoiceOver](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=3091>)

**P.** ¿Estarán disponibles las nuevas voces de IA mejoradas para VoiceOver?

VoiceOver usa voces específicamente ajustadas para casos de uso de lectores de pantalla, donde los usuarios suelen llevar la velocidad del habla muy alta.

### 52:17 — [Prevenir regresiones](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=3137>)

**P.** Más allá de las pruebas manuales, ¿cómo se previenen las regresiones de accesibilidad? ¿Con pruebas de snapshot, pruebas de interfaz automatizadas con aserciones?

XCTest y XCUITest se basan en la jerarquía de accesibilidad, por lo que los tests que fallan suelen poner de manifiesto regresiones de accesibilidad; también puedes asegurarte de que las vistas tienen etiquetas de accesibilidad. La nueva API de este año permite que los tests inicien VoiceOver y recorran elemento a elemento para validar lo que pronuncia.

### 53:46 — [Accesibilidad en Xcode](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=3226>)

**P.** ¿Hay mejoras de accesibilidad en Xcode y las herramientas para desarrolladores este año para un desarrollador iOS ciego?

La accesibilidad del Terminal mejoró significativamente —mejor movimiento al inicio visible, marcas y lectura del autocompletado de pestañas—. Xcode incluye muchas correcciones de bugs de VoiceOver en Seed 1, SwiftUI iguala el terreno de juego al sustituir la edición WYSIWYG, y las nuevas habilidades de codificación con IA para VoiceOver y Dynamic Type pueden editar código y diagnosticar problemas de accesibilidad a petición.

### 57:30 — [visionOS más allá de la mirada](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=3450>)

**P.** Para herramientas de computación espacial que dependen de la mirada, ¿cómo deberían los diseñadores evitar asumir que todos los usuarios pueden usar la mirada visual como entrada principal?

Pointer Control en visionOS permite a los usuarios sustituir sus ojos por la cabeza, el dedo, la muñeca o el tobillo como puntero. La sesión original de WWDC sobre accesibilidad en visionOS de Drew y Dan cubre esto en profundidad, incluida una API de RealityKit para contenido 3D.

---

## Destacados

- La nueva API de XCTest te permite controlar VoiceOver en iOS desde un Mac, disponible en el simulador de Seed 1.
- Xcode Seed 1 incluye habilidades de codificación con IA para VoiceOver y Dynamic Type que pueden editar código para corregir problemas de accesibilidad.
- Usa las notificaciones de accesibilidad (<span class="high">layoutChanged</span>, <span class="high">screenChanged</span>, <span class="high">announcement</span>) para señalar cambios de interfaz a VoiceOver —evita forzar el foco con demasiada frecuencia—.
- <span class="high">accessibilityRepresentation</span> en SwiftUI permite que una sola vista se exponga como varios elementos de accesibilidad distintos (p. ej., cuatro botones).
- iOS 27 añade un flujo de configuración basado en calibración para Touch Accommodations, similar al entrenamiento de seguimiento ocular.
- Atajo de accesibilidad: triple pulsación de Touch ID en Mac, o Command-Opción-F5; en macOS 27 activa o desactiva VoiceOver con Command-F5.
- Envuelve los componentes SwiftUI reutilizables para exigir tanto <span class="high">accessibilityIdentifier</span> como <span class="high">accessibilityLabel</span>, rechazando etiquetas nil.
- Dynamic Type ya está disponible en tvOS con la etiqueta de accesibilidad correspondiente y una sesión de WWDC dedicada a texto grande en tvOS.
- Assistive Access ahora incluye la app TV y ofrece APIs para que las apps de terceros puedan ofrecer experiencias optimizadas de Assistive Access.
- Envía comentarios en feedbackassistant.apple.com; el Q&A de Accesibilidad e Inclusión se celebra el miércoles a las 10 AM hora del Pacífico en los foros para desarrolladores.

---

## Sesiones relacionadas

- [Prepare your tvOS apps for Dynamic Type](<https://developer.apple.com/videos/play/wwdc2026/221/>) (Prepara tus apps de tvOS para Dynamic Type)
- [Catch up on accessibility in SwiftUI](<https://developer.apple.com/videos/play/wwdc2024/10073/>) (Ponte al día con la accesibilidad en SwiftUI)
- [Evaluate your app for Accessibility Nutrition Labels](<https://developer.apple.com/videos/play/wwdc2025/224/>) (Evalúa tu app para Accessibility Nutrition Labels)
- [Customize your app for Assistive Access](<https://developer.apple.com/videos/play/wwdc2025/238/>) (Personaliza tu app para Assistive Access)
- [Make your Mac app more accessible to everyone](<https://developer.apple.com/videos/play/wwdc2025/229/>) (Haz tu app de Mac más accesible para todos)
- [Create accessible spatial experiences](<https://developer.apple.com/videos/play/wwdc2023/10034/>) (Crea experiencias espaciales accesibles)
- [Prepare your app for Accessibility Nutrition Labels](<https://developer.apple.com/videos/play/tech-talks/111433/>) (Prepara tu app para Accessibility Nutrition Labels)

---
