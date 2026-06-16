# SwiftUI Group Lab - Part 2

> WWDC26 · Sesión 8120 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8120/)

---

## Acerca de

Únete a nosotros en línea para profundizar en WWDC26 con ingenieros y diseñadores de Apple: haz preguntas, recibe consejos y sigue el debate sobre los grandes anuncios de SwiftUI de la semana. Se celebra en inglés.

El presentador Kurt, de Worldwide Developer Relations, modera «SwiftUI After Dark» junto a los ingenieros de frameworks de UI Anna, Stephen, Nick, Russell y Sam. El panel responde preguntas enviadas por desarrolladores sobre rendimiento en SwiftUI, layout, flujo de datos, controles personalizados y la evolución del framework.

---

## Q&A

### 2:57 — [ForEach con colecciones grandes](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=177>)

**P.** ForEach con un millón de elementos reordenables sigue recorriendo la colección entera en el primer renderizado y en cada cambio de orden, lo que provoca ralentizaciones. ¿Qué se puede hacer en SwiftUI?

Stephen confirmó que el equipo es consciente del problema y que no debería comportarse así; lo más útil es enviar un Feedback. El panel insistió en incluir tu caso de uso —por qué necesitas tantos elementos y cuál es la forma de los datos— para que puedan asegurarse de que las APIs lo cubran. Los Feedbacks enviados contra las betas ahora mismo son muy visibles para el equipo.

### 4:39 — [NavigationTransition personalizada](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=279>)

**P.** En la beta de iOS 27, el protocolo NavigationTransition está públicamente vacío, así que no es posible construir transiciones de navegación personalizadas. ¿Cuál es su propósito y podemos crear las nuestras?

El protocolo actualmente solo expone las conformancias proporcionadas por el sistema (crossFade, zoom, automatic) y todavía no permite crear otras propias —envía un Feedback con tu caso de uso. Un nuevo <span class="high">any NavigationTransition</span> permite cambiar entre ellas dinámicamente, y crossFade/zoom ahora también se aplican a sheets. Si no estás en un NavigationStack, puedes construir tus propias transiciones personalizadas con animaciones, animatable, keyframes y shaders.

### 7:20 — [Efecto cristal en botones](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=440>)

**P.** ¿Cómo ayudan la inteligencia de código y las herramientas agentic de Xcode a construir vistas con Liquid Glass, y cómo se deben aplicar los efectos de cristal a los botones?

Stephen destacó las nuevas skills de Xcode (utilizables con cualquier modelo y exportables a otros agentes) más la iteración con previews para Liquid Glass. Para los botones, prefiere el estilo <span class="high">glass</span> o <span class="high">glassProminent</span>; los elementos de la barra de herramientas ya reciben cristal automáticamente —usa un tint para el color, o <span class="high">sharedBackgroundVisibility(.hidden)</span> para desactivarlo (por ejemplo, en fotos de perfil). La nueva API permite eliminar solo el padding del contenido alrededor de los botones de la barra para que el borde de cristal abrace la imagen, lo que también mejora el efecto mitosis (a.k.a. Schlurp) durante el push/pop. Evita el cristal dentro de áreas de contenido plano donde no haya nada que refractar.

### 14:05 — [Adaptación a tamaños de ventana](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=845>)

**P.** Con ventanas redimensionables, divisiones verticales y el simulador redimensionable, ¿cuál es la forma correcta de gestionar los muchos tamaños de pantalla posibles?

Deja de codificar tamaños a mano y apóyate en las clases de tamaño para experiencias diferenciadas, pero también gestiona la flexibilidad continua real entre los puntos de ruptura. Prefiere los contenedores del sistema y el TabView adaptativo (con barra lateral colapsable en tamaños regulares), y recurre a layouts personalizados —o AnyLayout para cambiar entre layouts preservando la identidad estructural y el estado. ViewThatFits es muy útil en niveles superiores; los custom layouts de Paul en WWDC22 y la sesión de Matt sobre contenedores en WWDC24 son referencias clave.

### 18:53 — [Rendimiento de GeometryReader](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=1133>)

**P.** ¿Cuándo deberías usar GeometryReader y cuáles son las implicaciones de rendimiento?

Stephen recomendó <span class="high">onGeometryChange</span> para la mayoría de los casos: su primer closure se ejecuta en cada fotograma, pero devuelves un valor derivado (por ejemplo, un nivel de punto de ruptura) y la acción solo se dispara cuando ese valor cambia —convirtiendo el trabajo por fotograma en un par de disparos. GeometryReader es costoso porque sus subvistas se invalidan en cada fotograma, así que resérvalo para fondos. Para una colocación precisa, combina onGeometryChange con layouts personalizados; los alignment guides (tratados en la charla de gráficos avanzados de este año) también pueden hacer trabajo sorprendente en un solo pase de layout.

### 22:04 — [Aprender el flujo de datos](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=1324>)

**P.** ¿Algún consejo o proyecto para aprender bien la gestión de datos y el paso de datos entre vistas en SwiftUI?

Sam sugirió construir máquinas de estado autocontenidas y mantener las vistas como transformaciones delgadas del modelo a los datos de vista; SwiftUI es intencionadamente agnóstico a la arquitectura porque la forma correcta depende de los datos. Kurt recomendó construir apps en un dominio que realmente te importe para no tener que aprender también el problema. Stephen mencionó la herramienta SwiftUI de Instruments para ver las actualizaciones de body de las vistas fluyendo por tu app, y Nick destacó DynamicProperty como forma de reemplazar muchos usos de onChange —su método <span class="high">update</span> se ejecuta antes que <span class="high">body</span>, ahorrando un ciclo de renderizado. Usar onChange para mutar el estado de la vista suele ser un antipatrón; prefiere un modelo observable que proporcione valores derivados.

### 30:15 — [Ocultar vistas condicionalmente](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=1815>)

**P.** Sigo escuchando que no hay que usar <span class="high">if</span> para ocultar elementos condicionalmente (por ejemplo, mostrar las 9:41 solo a las 9:41). ¿Cuál es la recomendación?

Si la vista permanece en el layout, usa un modificador basado en valor como <span class="high">.opacity(...)</span> con un valor inerte (1 o 0) en lugar de un <span class="high">if</span>, para preservar la identidad y el estado. Si realmente necesitas eliminarlo del layout, un <span class="high">if</span> está bien —eso es exactamente para lo que sirve. Evita poner <span class="high">if</span> dentro del cuerpo de un modificador de vista (el patrón helper <span class="high">.if</span>), ya que cambia de rama silenciosamente y destruye el estado; y en el nivel superior de contenedores lazy o ForEach, los condicionales confunden el conteo de vistas, así que envuélvelos en un contenedor unario (VStack; Group no aplana) para garantizar una única vista resuelta.

### 38:00 — [Coste de AnyView](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=2280>)

**P.** ¿Cuál es el coste concreto de borrar tipos con AnyView en vistas profundamente anidadas o que se actualizan con frecuencia?

AnyView está bien cuando genuinamente necesitas borrar un tipo que el compilador no conoce. El coste aparece cuando cambia el tipo concreto subyacente —eso obliga a destruir y reconstruir el subárbol, igual que con un if/else. El otro problema es con los contenedores lazy, que no pueden saber cuántas vistas resuelve un AnyView; envuélvelo en un stack para darles un conteo estable.

### 39:29 — [Previews redimensionables](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=2369>)

**P.** ¿Algún consejo para hacer los layouts de SwiftUI más adaptables ahora que las previews de Xcode son redimensionables?

Trata las previews redimensionables como una prueba de estrés: escribe layouts que acepten cualquier tamaño propuesto, luego arrastra la preview para encontrar tus números mágicos codificados a mano y las suposiciones rotas. Usa la app en contextos genuinamente redimensionables (iPad, iPhone Mirroring) y estudia cómo otras apps —especialmente las indie— se adaptan creativamente a distintos tamaños.

### 42:28 — [Overlays a pantalla completa](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=2548>)

**P.** ¿Cuál es la mejor forma de presentar un overlay SwiftUI a pantalla completa por encima de todo, incluyendo sheets, sin romper la presentación modal?

No existe una forma limpia de dibujar por encima de modales arbitrarios usando solo SwiftUI; habría que coordinar las presentaciones a través del modelo de datos para que un <span class="high">fullScreenCover</span> sea el tope de la pila. Russell sugirió bajar a UIKit y crear una nueva <span class="high">UIWindow</span> (que aloje un <span class="high">UIHostingController</span>) para casos como un HUD de login —pero advirtió que la última ventana gana, que es exactamente el problema de centralización que SwiftUI intenta resolver. A menudo la respuesta correcta es repensar el diseño (por ejemplo, deshacer el stack de navegación en lugar de apilar más) y enviar un Feedback para que las APIs cubran el hueco.

### 47:22 — [Controles SwiftUI personalizados](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=2842>)

**P.** ¿Cuál es la mejor forma de construir un control personalizado puro en SwiftUI, como un desplegable que se expande sobre otros elementos sin afectar a su layout?

Primero plantéate si realmente necesitas uno personalizado —<span class="high">UIViewRepresentable</span> te permite reutilizar controles de UIKit/AppKit y heredar las actualizaciones del framework, como el nuevo diseño. Si decides construir uno personalizado, explota el protocolo de layout de SwiftUI: un hijo puede renderizarse más grande que el tamaño que reporta, o usa <span class="high">.overlay</span> para el aislamiento, pero vigila los scroll views que pueden descartar vistas cuyos límites de layout se salgan de pantalla. Prefiere *estilos* personalizados sobre envolver controles para conservar la accesibilidad y los inicializadores estándar, y recuerda que el nuevo modificador swipe action container permite ahora que cualquier contenedor admita swipe actions.

### 54:55 — [Descomposición de vistas](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=3295>)

**P.** Dividir vistas grandes en más pequeñas ayuda al rendimiento, pero ¿cuán pequeñas deben ser y cuándo deben ser structs nuevas frente a propiedades computadas con @ViewBuilder?

Stephen lo planteó como aislar dependencias, no solo dividir código: una struct de vista separada crea un límite donde SwiftUI puede comparar las entradas y omitir trabajo; una propiedad computada con ViewBuilder tiene el mismo conjunto de dependencias que el padre y no aporta ningún beneficio. Sam añadió que Observable ayuda porque la referencia que se pasa no cambia, así que una supervista puede saltarse el re-body mientras una hoja pequeña que lee una propiedad específica sigue actualizándose. Las vistas son structs de tipo valor —no tengas miedo de tener muchas.

### 58:16 — [Lo más orgulloso de SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=3496>)

**P.** Mirando atrás desde SwiftUI 1 hasta el framework maduro de hoy, ¿de qué estáis más orgullosos?

Sam: la API de contenedores personalizados y el reencuadre semántico y orientado al flujo de datos que SwiftUI hace de la UI de plataforma (por ejemplo, TabView como pestañas estándar o como scroll view paginado). Russell: que SwiftUI haya alcanzado la madurez suficiente para usarse internamente dentro de componentes clave como UINavigationController. Anna: el equipo y la cultura que ha crecido en torno al framework. Stephen: convertir antipatrones como GeometryReader en APIs adecuadas como onGeometryChange y onScrollVisibilityChange. Nick: exponer bloques de construcción de nivel más bajo para que los desarrolladores puedan construir lo mismo que construyen los ingenieros de Apple internamente.

---

## Destacados

- Envía Feedback con casos de uso concretos — el equipo revisa los informes entrantes a diario durante la beta.
- Prefiere <span class="high">onGeometryChange</span> sobre <span class="high">GeometryReader</span>; su segunda clausura limita las actualizaciones a cambios reales de punto de ruptura.
- <span class="high">DynamicProperty</span> puede sustituir muchos usos de <span class="high">onChange</span> y se actualiza antes de que se ejecute <span class="high">body</span>, ahorrando un ciclo de renderizado.
- Para Liquid Glass en botones, usa los estilos <span class="high">glass</span>/<span class="high">glassProminent</span>; los elementos de la barra de herramientas obtienen el cristal automáticamente — desactívalo con <span class="high">sharedBackgroundVisibility(.hidden)</span>.
- Dentro de contenedores lazy (List, LazyVStack, ForEach), envuelve las ramas con múltiples vistas en un contenedor unario (VStack, Layout personalizado) para que el conteo de vistas tome el camino rápido.
- Sesiones de referencia: layouts personalizados en WWDC22 (Paul), Demystify SwiftUI containers en WWDC24 (Matt), la charla sobre lazy stacks de este año (Renz), gráficos avanzados en SwiftUI, y What's New in SwiftUI.
- Novedades de este año: <span class="high">any NavigationTransition</span> para cambios dinámicos, el modificador swipe action container que extiende las acciones de deslizamiento más allá de List, y la API de barra de herramientas para eliminar el relleno del contenido de los botones manteniendo el borde de cristal.

---

## Sesiones relacionadas

- [What’s new in SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/269/>) (Novedades en SwiftUI)
- [Meet the Presenter: Compose custom layouts with SwiftUI](<https://developer.apple.com/videos/play/wwdc2022/110392/>) (Conoce al ponente: Crea layouts personalizados con SwiftUI)
- [Demystify SwiftUI performance](<https://developer.apple.com/videos/play/wwdc2023/10160/>) (Desmitifica el rendimiento de SwiftUI)
- [Compose advanced graphics effects with SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/322/>) (Crea efectos gráficos avanzados con SwiftUI)
- [Dive into lazy stacks and scrolling with SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/321/>) (Profundiza en lazy stacks y scroll con SwiftUI)

---
