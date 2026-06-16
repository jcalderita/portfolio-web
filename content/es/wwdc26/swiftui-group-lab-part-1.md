# SwiftUI Group Lab - Part 1

> WWDC26 · Sesión 8006 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8006/)

---

## Acerca de

Únete a nosotros en línea para profundizar en WWDC26 con ingenieros y diseñadores de Apple: haz preguntas, recibe consejos y sigue el debate sobre los anuncios más importantes de SwiftUI de la semana. Conducido en inglés.

Kurt, de Worldwide Developer Relations, presenta «SwiftUI After Dark» junto a los ingenieros de frameworks de UI Anna, Stephen, Nick, Russell y Sam. El panel aborda rendimiento, Liquid Glass, layout, flujo de datos, presentaciones y controles personalizados en SwiftUI.

---

## Q&A

### 2:57 — [Listas grandes y reordenables](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=177>)

**P.** ForEach con un millón de elementos reordenables sigue recorriendo toda la colección en el primer renderizado y al reordenar. ¿Qué puede hacer SwiftUI al respecto?

Stephen confirmó que el equipo es consciente del problema y está investigándolo; la mejor acción es enviar un Feedback que describa el caso de uso concreto y la forma de los datos, para que el equipo pueda garantizar que las APIs lo soporten. Enviarlo durante la beta tiene el máximo impacto en la siguiente versión.

### 4:44 — [Transiciones de navegación personalizadas](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=284>)

**P.** El protocolo NavigationTransition parece vacío —¿podemos crear nuestras propias transiciones personalizadas?

Anna explicó que NavigationTransition actualmente solo expone miembros concretos como zoom y crossFade, no una forma de crear los propios, así que conviene enviar feedback con casos de uso. Como novedad este año, las transiciones de navegación pueden cambiarse de forma dinámica, y para vistas que no son de NavigationStack puedes manejar tus propias transiciones usando Animatable, keyframe animations, modificadores y Metal shaders.

### 7:20 — [Liquid Glass y agentes](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=440>)

**P.** ¿Cómo podemos usar la inteligencia de codificación de Xcode y los modelos agentivos para construir vistas con Liquid Glass, y cómo se debe usar <span class="high">glassEffect</span> en los botones?

Stephen recomendó las nuevas skills de Xcode (que funcionan con cualquier modelo y se pueden exportar para otros sistemas agentivos) junto con iterar en Previews. El panel advirtió de no poner Liquid Glass en áreas de contenido —los botones de la barra de herramientas reciben el cristal automáticamente; para casos explícitos usa glassButtonStyle o glassProminentButtonStyle, combina glassEffect con <span class="high">buttonBorderShape</span>, y utiliza <span class="high">sharedBackgroundVisibility</span> oculto junto con la nueva API para eliminar los márgenes de contenido predeterminados de los botones, de modo que los avatares obtengan un borde de cristal sin relleno adicional.

### 14:05 — [Adaptación a tamaños de ventana](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=845>)

**P.** Con las ventanas redimensionables y el simulador redimensionable, ¿qué APIs deberíamos usar para gestionar tamaños de pantalla variables?

Russell dijo que no hay que codificar tamaños de forma fija; conviene apoyarse en size classes para experiencias distintas entre compact y regular, pero también dar soporte a una flexibilidad continua real entre medias. Anna y Sam recomendaron usar contenedores del sistema, TabView adaptativo con barra lateral, Layouts personalizados (y AnyLayout para preservar la identidad entre layouts), custom containers, ViewThatFits con moderación a alto nivel, y onGeometryChange en lugar de GeometryReader —su segundo cierre aplica debounce a las actualizaciones, de modo que el trabajo solo ocurre cuando se cruzan umbrales.

### 22:04 — [Aprender el flujo de datos](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=1324>)

**P.** ¿Cómo podemos mejorar en la gestión de datos y en pasarlos entre vistas SwiftUI?

Sam sugirió construir máquinas de estado autocontenidas y probar muchas formas de datos, ya que SwiftUI es intencionalmente agnóstico en cuanto a arquitectura. Nick aconsejó construir apps de ejemplo en un dominio que conozcas, Stephen recomendó el SwiftUI Instrument para ver cómo fluyen las actualizaciones, y el panel elogió DynamicProperty como sustituto de muchos usos de onChange —se actualiza antes que <span class="high">body</span>, evitando un renderizado extra y permitiendo que los valores en caché estén disponibles en el primer ciclo de <span class="high">body</span>.

### 30:29 — [Condicionales que ocultan vistas](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=1829>)

**P.** Nos han dicho que no usemos <span class="high">if</span> para ocultar vistas condicionalmente —¿cuál es la recomendación, por ejemplo para mostrar 9:41 solo a las 9:41?

Russell dijo que conviene preferir modificadores animables como <span class="high">opacity</span> con un valor inerte (1 frente a 0) para que la vista permanezca en la jerarquía. Si realmente necesitas eliminar y volver a añadir una vista, condicionalizarla está bien; el peligro está en los condicionales dentro de cuerpos de ViewModifier (que provocan relayouts generalizados) y en los condicionales de alto nivel en contenedores lazy o ForEach donde SwiftUI cuenta las vistas —envuélvelos en un VStack o contenedor unario para garantizar una sola vista resuelta.

### 38:06 — [El coste de AnyView](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=2286>)

**P.** ¿Cuál es el coste real de borrar tipos con AnyView en vistas profundamente anidadas o que se actualizan con frecuencia?

Sam explicó que AnyView está bien cuando realmente necesitas el borrado de tipos, pero si el tipo concreto subyacente cambia, SwiftUI debe desmontar y reconstruir la jerarquía —evita cambiar el tipo subyacente. En contenedores lazy AnyView es problemático porque el contenedor no puede saber a cuántas vistas se resuelve; envuélvelo en un stack para hacerlo unario.

### 39:29 — [Previsualizaciones redimensionables](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=2369>)

**P.** Con las previsualizaciones de Xcode ahora redimensionables, ¿algún consejo para hacer los layouts de SwiftUI más adaptables?

Nick dijo que los Layouts personalizados ya reciben el tamaño como entrada, así que basta con probar todos los tamaños en la previsualización redimensionable para encontrar suposiciones codificadas de forma fija. Usa el espejado de iPad y iPhone para sentir el redimensionado real, e inspírate en apps independientes que se adaptan de forma creativa a anchos compactos y grandes.

### 42:28 — [Superposiciones a pantalla completa](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=2548>)

**P.** ¿Cómo podemos presentar una superposición SwiftUI a pantalla completa por encima de todo —incluyendo sheets— sin romper la presentación modal?

Anna señaló que SwiftUI no ofrece realmente esto si ya pueden estar presentados otros modales; coordina a través de tu modelo de navegación/datos y envía feedback. Russell sugirió bajar a UIKit y crear un nuevo UIWindow que aloje un UIHostingController para casos tipo HUD, pero Nick advirtió que «gana la última ventana» es exactamente el bug de capas que SwiftUI intenta resolver —reconsidera el diseño (por ejemplo, rebobinar la navegación hasta una vista base para el login) en lugar de forzar una capa siempre visible.

### 47:27 — [Controles personalizados](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=2847>)

**P.** ¿Cuál es la mejor forma de construir un control personalizado en SwiftUI puro, como un desplegable que se superponga a otros elementos sin afectar al layout?

Anna sugirió considerar primero la interoperabilidad con un control UIKit/AppKit existente para obtener actualizaciones gratuitas. Para dibujar fuera del layout, usa el sistema de layout basado en propuestas de SwiftUI (informa de un tamaño menor al que dibujas) o usa <span class="high">overlay</span> —pero ten en cuenta que las vistas dibujadas fuera de los límites declarados en un ScrollView pueden eliminarse cuando SwiftUI crea que están fuera de pantalla. El panel también destacó el nuevo modificador swipeActionsContainer, que permite que cualquier contenedor admita swipe actions y vistas arbitrarias dentro de los botones de acción deslizante, y recomendó construir estilos personalizados antes que controles personalizados para heredar la accesibilidad y los inicializadores.

### 54:57 — [Descomposición de vistas](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=3297>)

**P.** ¿Cómo de pequeñas deberíamos partir las vistas SwiftUI, y cuándo usamos structs de vista frente a propiedades computadas con <span class="high">@ViewBuilder</span>?

Stephen explicó que el objetivo es aislar dependencias, no solo reducir archivos: divide cuando la cabecera, el contenido y el pie de página pueden actualizarse de forma independiente, de modo que la comprobación de igualdad en tiempo de inicialización de SwiftUI pueda saltarse trabajo. Las propiedades computadas con @ViewBuilder no ofrecen esa ventaja —son equivalentes a un <span class="high">body</span> grande que comparte todas las dependencias. Usa Observable para que un modelo estable en memoria permita que solo las subvistas pequeñas que leen una propiedad se vuelvan a renderizar.

### 58:16 — [Orgullosos de SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=3496>)

**P.** Mirando atrás a la evolución de SwiftUI, ¿de qué estáis más orgullosos?

Sam citó la API de custom containers y el enfoque semántico y orientado al flujo de datos de SwiftUI para la UI de plataforma. Russell señaló que SwiftUI ahora impulsa componentes centrales de UIKit como las interioridades de UINavigationController. Nick destacó al propio equipo, Stephen elogió la sustitución de puntos débiles como GeometryReader por APIs más precisas (onGeometryChange, onScrollVisibilityChange), y Anna subrayó la exposición de bloques de construcción de bajo nivel para que los desarrolladores puedan crear sus propias piezas personalizadas.

---

## Destacados

- Envía informes a Feedback Assistant durante la beta con casos de uso concretos —no solo reproducciones de bugs— para influir en la próxima versión.
- Prefiere onGeometryChange sobre GeometryReader; su segundo closure elimina el ruido de actualizaciones reduciéndolas a cruces de umbral.
- Usa glassButtonStyle / glassProminentButtonStyle y combina glassEffect con <span class="high">buttonBorderShape</span>; elimina los márgenes de contenido por defecto de los botones con la nueva API para bordes estilo avatar.
- El <span class="high">update</span> de DynamicProperty se ejecuta antes que <span class="high">body</span> —úsalo para sustituir muchos usos de onChange y para proporcionar valores en caché en el primer renderizado (consulta la charla de este año sobre Lazy Stacks de Renz).
- En contenedores lazy, envuelve contenido condicional, AnyView o de múltiples vistas en un contenedor unario (VStack) para que SwiftUI obtenga una única vista resuelta.
- Sesiones de referencia: Demystify SwiftUI containers (WWDC24), Build custom layouts (WWDC22), Advanced graphics in SwiftUI, What's new in SwiftUI, y la charla sobre Lazy Stacks.

---

## Sesiones relacionadas

- [Meet the Presenter: Compose custom layouts with SwiftUI](<https://developer.apple.com/videos/play/wwdc2022/110392/>) (Conoce al ponente: Crea layouts personalizados con SwiftUI)
- [Demystify SwiftUI performance](<https://developer.apple.com/videos/play/wwdc2023/10160/>) (Desmitifica el rendimiento en SwiftUI)
- [What’s new in SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/269/>) (Novedades en SwiftUI)
- [Compose advanced graphics effects with SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/322/>) (Crea efectos gráficos avanzados con SwiftUI)
- [Dive into lazy stacks and scrolling with SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/321/>) (Profundiza en lazy stacks y scroll con SwiftUI)
- [Modernize your UIKit app](<https://developer.apple.com/videos/play/wwdc2026/278/>) (Moderniza tu app UIKit)

---
