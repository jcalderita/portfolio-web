# Safari and Web Technologies Group Lab

> WWDC26 · Sesión 8015 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8015/)

---

## Acerca de

Únete a nosotros online para explorar en profundidad WWDC26 con ingenieros de Apple: haz preguntas, recibe consejos y sigue la conversación sobre los anuncios más importantes de la semana en Safari y tecnologías web. Se realiza en inglés.

Sonia Barak presenta el Safari and Web Technologies Group Lab junto a Tim, Alexi, Chiara, Brando y Jen Simmons. Tras la presentación de Jen sobre las novedades de WebKit para Safari 27, el panel responde preguntas de desarrolladores sobre estándares, extensiones, el model element, Customizable Select, Spatial CSS y rendimiento.

---

## Q&A

### 4:43 — [Habilidades para nuevos desarrolladores](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=283>)

**P.** ¿Qué tecnologías web o APIs deberían aprender hoy los nuevos desarrolladores web para prepararse para el futuro de la web?

El panel subrayó los fundamentos atemporales: HTML semántico, maquetación con CSS, progressive enhancement y JavaScript — conocerlos te ayuda a evaluar el código generado por IA y te dura toda la carrera. Añadieron la accesibilidad (gratuita con HTML semántico), los conceptos de web 3D/espacial como el model element y WebXR, y las Web Extensions como áreas nuevas relevantes. El consejo que se repitió: sé perezoso, usa el elemento HTML nativo en lugar de apilar divs/spans con JavaScript.

### 10:05 — [Estándares web emocionantes](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=605>)

**P.** ¿Qué estándares web próximos entusiasman más al equipo?

Se mencionaron el elemento install propuesto y las actualizaciones parciales declarativas en HTML/canvas, el recién constituido Web Extensions Working Group, la función <span class="high">random-item()</span> de la nueva especificación CSS Values and Units, y Spatial CSS — que extiende los conceptos de posicionamiento 2D (top/left/right/bottom, CSS Anchor Positioning) al 3D con profundidad, permitiendo combinar modelos y experiencias de comercio electrónico más ricas. Jen también reflexionó sobre cómo el trabajo en estándares avanza despacio a propósito para que el resultado dure décadas.

### 16:06 — [Rendimiento web frente a nativo](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=966>)

**P.** ¿Cómo puede Safari ser a veces más eficiente que las apps nativas en interfaces basadas en JavaScript?

Tim recordó que iOS originalmente planeaba distribuir apps como web apps y que las web apps con buen rendimiento son posibles, aunque difíciles. Jen destacó lo profundamente integrados que están WebKit y JavaScriptCore en cada OS de Apple — JavaScriptCore ejecuta JavaScript en cualquier parte del sistema, WebKit es una vista SwiftUI y ambos funcionan incluso en watchOS — así que la división web/nativo no es realmente dos equipos enfrentados.

### 19:21 — [Defender nuevas funcionalidades](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=1161>)

**P.** ¿Cómo deberían los desarrolladores web defender funcionalidades en WebKit, y tienen en cuenta las posiciones sobre estándares el feedback de los desarrolladores?

Abre un ticket en bugs.webkit.org, habla con los evangelistas en redes sociales y explica claramente el caso de uso orientado al usuario. Jen explicó que las posiciones publicadas por Apple sobre estándares en GitHub a menudo rechazan APIs poco maduras por razones de privacidad, seguridad, rendimiento o ergonomía — pero las posiciones pueden cambiar (como ocurrió con CSS :has(), que los ingenieros acabaron encontrando la forma de hacer rápido). Tim añadió que, aunque haya una posición sobre un estándar, siempre vale la pena abrir un ticket sobre la necesidad real del usuario. Sé amable, muestra demos reales e indica cuánta gente comparte esa necesidad.

### 26:54 — [Cookies en WKWebView](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=1614>)

**P.** ¿Hay mejoras en la sincronización de cookies en WKWebView similares al comportamiento de UIWebView?

El panel no tenía a ningún experto en cookies en el escenario; desde la sala de apoyo sugirieron usar WKHTTPCookieStore para observar y manipular cookies en WKWebView. Recomendaron llevar esta pregunta a los foros de desarrolladores.

### 27:41 — [Paridad de API en extensiones](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=1661>)

**P.** ¿Hay planes para cerrar la brecha con las APIs de extensiones de Chrome/Firefox, como las APIs de grupos de pestañas?

Chiara dijo que les entusiasma que los usuarios puedan generar extensiones a partir de un prompt y animó a los desarrolladores a abrir tickets en bugs.webkit.org con casos de uso concretos. Apple trabaja activamente en el Web Extensions Community Group (y ahora en el Working Group) para estandarizar las APIs y alinear el comportamiento entre navegadores — si una API falta o se comporta de forma diferente en Safari, haz ruido y explica por qué la necesitas.

### 29:32 — [Spatial CSS hoy](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=1772>)

**P.** Con Spatial CSS, ¿veré cosas de la web en 3D en Apple Vision Pro?

Tim señaló que Spatial CSS sigue siendo una propuesta sin novedades de lanzamiento, pero que Apple la ve con buenos ojos. Hoy puedes usar el model element HTML inline con USD y otros formatos 3D — colocando modelos inline, arrastrándolos o mostrándolos a escala completa con immersive website environments — además de la creación procedural; Spatial CSS acabará combinando todo esto con el árbol de accesibilidad completo.

### 30:48 — [El objetivo final del rendimiento](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=1848>)

**P.** ¿Hemos alcanzado el límite del rendimiento en los navegadores, o aún queda margen de mejora?

No hay límite. Jen subrayó que importan muchas dimensiones — velocidad de JavaScript, carga de imágenes, tiempo hasta interactividad y duración de la batería. Tim citó el salto de WebGL a WebGPU como ejemplo de reoptimización una vez identificados los cuellos de botella reales. Alexi y Brando describieron cómo el equipo de rendimiento y energía de WebKit ejecuta benchmarks en prácticamente cada commit; a medida que la web evoluciona, los benchmarks también evolucionan.

### 35:04 — [Arquitectura de extensiones para SEO](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2104>)

**P.** ¿Cuál es el camino recomendado para crear una extensión de Safari que muestre informes de SEO dentro de una ventana SwiftUI en iOS, macOS y visionOS?

Chiara sugirió mostrar los datos en un popup de la extensión, usar la webNavigation API para monitorizar los cambios de página y usar native messaging para pasar información entre la Web Extension y la app compañera, de modo que esta pueda renderizarlos en SwiftUI.

### 36:16 — [Mejora progresiva del select](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2176>)

**P.** ¿Cuál es la forma más segura de mejorar progresivamente un select con <span class="high">appearance: base</span> sin romper navegadores antiguos?

Mantén siempre contenido de texto real dentro de cada opción — ese texto es lo que usarán los navegadores sin Customizable Select (y los lectores de pantalla). Añade imágenes, muestras de color y estilos CSS encima; los navegadores que lo soportan obtienen la versión elaborada, el resto obtiene la lista de texto original. Tim señaló que es exactamente la razón por la que la especificación reutilizó <span class="high">select</span> en lugar de introducir un nuevo elemento selectmenu. Jen y Tim también adelantaron la especificación <span class="high">appearance: base</span> en desarrollo para estilizar todos los controles de formulario.

### 41:21 — [Estados de carga del model element](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2481>)

**P.** ¿Cómo gestiona el model element los estados de carga y los errores, y qué control tienen los desarrolladores durante la carga?

Hay una promesa JavaScript que se resuelve cuando el modelo está cargado, de modo que puedes mostrar un spinner y luego cambiar al modelo. Tim explicó que model tiene las mismas dos fases que las imágenes — obtener los bytes frente a que el recurso esté disponible — así que los desarrolladores pueden razonar sobre ambos estados. Para los modelos generados proceduralmente, sigue habiendo tiempo de procesamiento tras la llegada de los bytes. El equipo también recibió feedback sobre añadir una pseudoclase CSS para el estado de carga.

### 43:52 — [Orientación sobre el tamaño del modelo](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2632>)

**P.** ¿Qué tamaño se espera que tengan los modelos en la web?

Mantenlos tan pequeños como harías con las imágenes — no deberían ser más grandes que la página en la que aparecen, y las texturas y la geometría deben ajustarse a lo que realmente se ve. Tim sugirió que aproximadamente 10 MB alcanza la máxima calidad visual para el uso inline típico; los immersive website environments pueden ser más grandes. La herramienta <span class="high">usdz_compress</span> de la Alliance for OpenUSD ya comprime texturas a AVIF, y los formatos de compresión de mallas están en discusión con la Alliance for Open Media.

### 47:27 — [Permisos de extensiones](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2847>)

**P.** ¿Cómo deberían pensar los desarrolladores en los permisos de las extensiones de Safari frente a otros navegadores?

Safari diseña los permisos con la privacidad como prioridad: los permisos declarados en el WebExtension WebExtension Manifest no se conceden automáticamente, y los usuarios eligen en qué sitios se ejecuta la extensión. Chiara recomendó usar <span class="high">activeTab</span> para que la extensión solo se ejecute en la pestaña actual del usuario y pierda los permisos de host al navegar, en lugar de solicitar un acceso de host excesivamente amplio.

### 49:12 — [Traspaso de la web inmersiva](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2952>)

**P.** ¿Cómo interactúa la API de immersive website environments con el contenido web existente, y cómo funciona el traspaso de la atención?

La página web sigue activa dentro del entorno inmersivo, por lo que cualquier UI de la página sigue disponible. Es una experiencia de una sola app — otras apps como Mensajes se atenúan y una pulsación de la corona vuelve a la vista compartida. La propia página puede exponer UI para mover al usuario, reproducir o pausar animaciones en el entorno.

### 50:06 — [Relevancia de la web espacial](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=3006>)

**P.** ¿Es el model element el punto de entrada que hace relevante la web espacial para los desarrolladores de a pie?

Alexi dijo que sí — el model element es el primer paso con menos fricción para que los desarrolladores web lleven el 3D a la web. Puedes encontrar o generar modelos con IA, insertarlos y ver los resultados rápidamente, y después avanzar hacia herramientas de autoría como Blender para contenido personalizado.

### 51:43 — [Estilos con appearance: base](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=3103>)

**P.** Con <span class="high">appearance: base</span> en el select, ¿cuánto estilo funciona de forma nativa frente a lo que los desarrolladores deben resetear para lograr consistencia?

El layout funciona, la fuente se hereda de tu página (a diferencia de <span class="high">appearance: none</span>), y obtienes nuevos pseudoelementos para apuntar al icono selector, el menú desplegable y la marca de verificación de forma independiente. Tim y Brando enfatizaron que <span class="high">appearance: base</span> en el select es 100 % interoperable entre navegadores con una estructura DOM consistente — la base necesaria para un estilado predecible entre navegadores. Aún hay debate activo sobre el aspecto predeterminado, pero el objetivo es heredar todo lo posible de la página (fondo, fuente, color) y maquetar usando CSS normal sin la magia de los controles de formulario, de modo que puedas usar incluso CSS Grid, Flexbox o CSS Grid Lanes dentro del selector.

### 56:38 — [Portar extensiones a Safari](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=3398>)

**P.** ¿Cuánto trabajo supone portar una extensión de Chrome o Firefox a Safari, y dónde crean problemas las diferencias en el WebExtension Manifest y las APIs?

Varía — a veces simplemente funciona. Usa el menú Desarrollo para cargar los recursos de la extensión como extensión temporal en Safari y probarla. La compatibilidad con el WebExtension Manifest está ampliamente alineada y Safari intencionalmente no falla con las claves no soportadas. Si encuentras divergencias en las APIs, plantéalas en el community group/working group o abre un ticket en bugs.webkit.org o en Feedback Assistant.

### 58:45 — [Reflexión final](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=3525>)

**P.** ¿Qué es lo más importante que quieres que los desarrolladores web sepan sobre la próxima versión o WebKit en general?

Jen señaló las notas de versión de Safari 27 y 26.x, inusualmente extensas, como prueba de un esfuerzo deliberado por la calidad — más de 1.100 correcciones, entre ellas la reescritura del JavaScript module loader para arreglar bugs de top-level await. Chiara recordó a los desarrolladores que el soporte de extensiones de Safari ahora vive en WebKit, por lo que las contribuciones son bienvenidas. Alexi animó a la gente a jugar con el model element. Tim animó a los desarrolladores a apoyarse en la plataforma y usar el menor número posible de frameworks. Brando desearía ver más demos que muestren funcionalidades exclusivas de Safari como <span class="high">random()</span>, las funciones filter y CSS <span class="high">hanging-punctuation</span>.

---

## Destacados

- Safari 27 incluye el select personalizable, el model element en iOS/iPadOS/macOS, y los entornos web inmersivos en visionOS 27; CSS Grid Lanes ya se publicó en la versión 26.4.
- Más de 1.100 mejoras y correcciones en la línea 26.x — entre ellas una reescritura del JavaScript module loader para solucionar bugs de top-level await.
- Envía solicitudes de funcionalidades y bugs a bugs.webkit.org con casos de uso concretos; las posiciones estándar de Apple están en GitHub y pueden cambiar (como ocurrió con <span class="high">:has()</span>).
- Usa WKHTTPCookieStore para observar y manipular cookies en WKWebView; lleva los problemas más profundos a los foros de desarrolladores.
- Para extensiones: prefiere activeTab sobre permisos de host amplios, usa webNavigation + native messaging para manejar interfaces SwiftUI complementarias, y carga extensiones temporales desde el menú Desarrollo de Safari para probar los ports.
- El model element expone una promesa de carga JavaScript; <span class="high">usdz_compress</span> (Alliance for OpenUSD) ahora comprime texturas a AVIF — apunta a unos 10 MB para modelos en línea.
- <span class="high">appearance: base</span> para el select es interoperable entre navegadores con un DOM consistente y nuevos pseudoelementos para el icono del selector, el menú y la marca de verificación — CSS Grid, Flexbox y CSS Grid Lanes funcionan dentro del selector.
- Guía de referencia de CSS Grid Lanes en CSS Gridlanes.webkit.org.

---

## Sesiones relacionadas

- [Learn CSS Grid Lanes](<https://developer.apple.com/videos/play/wwdc2026/314/>) (Aprende CSS Grid Lanes)
- [Rediscover the HTML select element](<https://developer.apple.com/videos/play/wwdc2026/315/>) (Redescubre el select element de HTML)
- [Get started with the HTML Model Element](<https://developer.apple.com/videos/play/wwdc2026/215/>) (Empieza con el model element de HTML)
- [Explore immersive website environments in visionOS](<https://developer.apple.com/videos/play/wwdc2026/320/>) (Explora los immersive website environments en visionOS)
- [Create web extensions for Safari](<https://developer.apple.com/videos/play/wwdc2026/216/>) (Crea Web Extensions para Safari)
- [What’s new in WebKit for Safari 27](<https://developer.apple.com/videos/play/wwdc2026/204/>) (Novedades de WebKit para Safari 27)

---
