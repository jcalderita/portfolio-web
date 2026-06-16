# Camera and Photo Technologies Group Lab

> WWDC26 · Sesión 8018 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8018/)

---

## Acerca de

Únete a nosotros en línea para una inmersión profunda en WWDC26 con ingenieros y diseñadores de Apple para hacer preguntas, recibir consejos y seguir la conversación sobre los grandes anuncios de la semana en tecnologías de cámara y foto. Se realiza en inglés.

Presentado por Sergei, con los ponentes Matt (Photos Frameworks), Brad (software de cámara), Ivan (pipeline de captura de fotos fijas), David (formato de archivo/compresión/RAW) y Jake (rendimiento de cámara). El laboratorio abarca la captura con AVFoundation, PhotoKit, los pipelines RAW/HDR y las nuevas API de vídeo profesional de iPhone 17.

---

## Q&A

### 5:38 — [Metadatos de edición IA](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=338>)

**P.** Cuando Spatial Reframe o Cleanup editan una foto en iOS 27, ¿se escribe algún metadato o credencial de contenido que indique la edición mediante IA?

Sí — los metadatos IPTC del archivo (junto con EXIF) se actualizan e indican qué edición de IA (Spatial Reframe o Cleanup) se aplicó. El panel de información de la app Fotos también muestra esta información tras deslizar hacia arriba.

### 6:55 — [API de palabras clave](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=415>)

**P.** Fotos ya admite palabras clave en iOS — ¿hay alguna API para que apps de terceros las lean o editen?

Las palabras clave aparecen en el panel de información de Fotos y se persisten en los metadatos IPTC al exportar, pero todavía no existe una API a nivel de PhotoKit para obtener assets o consultarlos por palabra clave.

### 7:50 — [Carga de miniaturas](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=470>)

**P.** ¿Cuál es la forma más eficiente de cargar miniaturas de imagen para una cuadrícula lazy que anima hacia una vista de detalle a resolución completa?

En Core Graphics, abre las imágenes con la opción de miniatura para que use la miniatura incrustada o decodifique una versión reducida. En Core Image, solicita un factor de escala al abrir la imagen para que reduzca la escala lo antes posible en el pipeline.

### 9:34 — [Carrera de Deferred Start](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=574>)

**P.** ¿Puede Deferred Start hacer que los usuarios pierdan una foto si pulsan capturar antes de que la salida de foto haya terminado de conectarse?

Sí, ese es el riesgo de aplazar la inicialización. Combina Deferred Start con <span class="high">isResponsiveCaptureEnabled = true</span> en la salida de foto para que el sistema almacene y encole la captura incluso antes de que la salida esté completamente lista. Se trata en la sesión de este año «Build a responsive camera app that launches quickly».

### 11:04 — [Bokeh de profundidad en directo](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=664>)

**P.** ¿Cuál es la mejor forma de obtener el mapa de profundidad junto con la imagen, tanto para el visor como para las fotos capturadas, con el fin de renderizar un efecto bokeh 3D?

Para la previsualización, usa un AVCaptureDepthDataOutput sincronizado con el flujo de vídeo mediante AVCaptureDataOutputSynchronizer; para las fotos, activa <span class="high">depthDataDeliveryEnabled</span> en AVCapturePhotoSettings y usa los filtros Core Image con la profundidad capturada. Un atajo para efectos solo de previsualización es activar la captura de vídeo Cinematic mode en la entrada del dispositivo con una capa de previsualización de vídeo.

### 13:39 — [Quality Vs Manual](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=819>)

**P.** Con <span class="high">photoQualityPrioritization</span> en quality, los ajustes manuales de exposición/ISO se anulan — ¿es posible conocer la exposición final de antemano?

No. Los modos quality y balanced usan algoritmos de fusión que gestionan sus propias exposiciones, por lo que los ajustes manuales se ignoran en el modo foto. Si necesitas conservar el obturador/ISO manual, usa la priorización de velocidad. Esto se trató en la sesión de este año sobre resolución de ajustes de captura.

### 16:28 — [Elección del recurso original](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=988>)

**P.** ¿Para qué sirve <span class="high">originalResourceChoice</span> de PHAsset y dónde podemos aprender más?

Es una nueva API que expone el comportamiento ya existente de RAW+JPEG: controla qué recurso (el RAW o la imagen comprimida) se trata como original para ediciones y derivados. Las APIs relacionadas se encuentran en PHContentEditingInput y PHAssetChangeRequest para cambiar qué recurso es el original.

### 18:02 — [Vista previa Bayer lineal](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=1082>)

**P.** ¿Expondrá iOS 27 un flujo de previsualización lineal referenciado por escena para la captura Bayer que coincida con la conversión DNG de CIRAWFilter sin mapeo tonal?

De momento no. El único camino lineal referenciado por escena en captura es el formato Log/Log2. Los fotogramas RAW de la captura de cámara llevan metadatos incompatibles con las expectativas de CIRAWFilter, pero al equipo le gusta la idea y anima a enviar una solicitud en Feedback Assistant.

### 20:18 — [Consejos para apps de captura](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=1218>)

**P.** ¿Cuáles son las recomendaciones imprescindibles para una app cuya identidad completa gira en torno a la experiencia de captura?

Prioriza el arranque rápido, Responsive Capture y Deferred Processing para que los usuarios no pierdan el momento. No ejecutes AVCaptureSession en el hilo principal — usa una cola serie dedicada y parte del código de ejemplo. Decide si tu app es pro o lúdica, diferénciate claramente e intégrala bien con los permisos de PhotoKit y los flujos de guardado.

### 25:42 — [Sincronización AV en streaming](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=1542>)

**P.** ¿Cuál es la forma óptima de transmitir audio y vídeo simultáneamente sin deriva?

Prefiere una única AVCaptureSession con entradas de dispositivo de audio y vídeo junto con sus salidas de datos — la sesión los sincroniza en una línea de tiempo compartida. Si debes usar una API de audio distinta como AU Remote I/O, usa CMClock y <span class="high">CMSyncConvertTime</span> para mapear las marcas de tiempo de vídeo al reloj de audio (la deriva de audio es más perceptible que la de vídeo). Lleva esos PTS por la red y deja que AVPlayer o <span class="high">AVSampleBufferDisplayLayer</span> gestione la sincronización de reproducción.

### 29:46 — [Apple ProRAW frente a Bayer](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=1786>)

**P.** ¿Por qué Apple ProRAW puede entregar 48 MP desde un sensor Quad Bayer mientras que la salida RAW Bayer nativa está limitada a la resolución binned?

Apple Apple ProRAW está debayerizado, fusionado y linearizado como RGB, así que la disposición del sensor no importa en la salida. Un RAW de 48 MP de un sensor Quad Bayer sería Quad Bayer, no Bayer, y distribuirlo requiere un ecosistema de decodificadores (CIRAWFilter, etc.) más algoritmos de debayerización para sensores quad — mucho más complejo que el Bayer clásico. Envía feedback si lo necesitas.

### 32:51 — [Gain Maps ISO](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=1971>)

**P.** ¿Cuál es la forma recomendada de generar y escribir Gain Maps conformes a ISO y sus metadatos para HEIC y JPEG en iOS?

Mira la charla de WWDC de hace dos años de David Hayward sobre las API de Core Graphics y Core Image para entrada y salida de Gain Maps. Un tercer camino es leer directamente las especificaciones de Gain Map que Apple añadió a las especificaciones HEIF y JPEG — ambas están bien documentadas.

### 35:18 — [Deferred frente a Prepare](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2118>)

**P.** ¿Cómo se combinan Deferred Start y <span class="high">setPreparedPhotoSettingsArray</span> de la salida de foto — la preparación pasa a través del aplazamiento?

Son ortogonales. Deferred Start solo retrasa la construcción de las ramas del grafo de captura que no son de previsualización para que esta arranque rápido; los ajustes preparados indican a la salida de foto los ajustes del peor caso para que pueda preasignar recursos. Puedes seguir llamando a los ajustes preparados una vez que la previsualización esté activa, y Quality Prioritization seguirá ralentizando el arranque si no utilizas el aplazamiento.

### 37:57 — [API de valoración de assets](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2277>)

**P.** ¿Ajustar la nueva propiedad de valoración de PHAsset requiere un PHLibraryChangeRequest?

Usa PHAssetChangeRequest — expone la propiedad de valoración con un enum de «sin establecer» y valores del 1 al 5.

### 38:30 — [Tipo de archivo en el Picker](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2310>)

**P.** ¿Hay alguna forma nativa de conservar el tipo de archivo original (PNG, JPEG, etc.) al importar desde PhotosPicker en lugar de obtener PNG?

Especifica el UTType explícitamente al configurar el Transferable en lugar de depender del tipo de imagen por defecto. El picker también puede convertir formatos (p. ej., RAW) cuando el usuario ha restringido los subtítulos o la ubicación. El código de ejemplo de PhotosPicker de Apple de una sesión anterior lo explica paso a paso.

### 39:53 — [Plist de ajustes](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2393>)

**P.** ¿Está documentado el formato del plist de ajustes de la app Fotos y se pueden reimportar los ajustes exportados?

No — no hay ningún formato documentado ni API para decodificar o reimportar ese plist. Envía una solicitud en Feedback Assistant si lo necesitas.

### 40:51 — [Errores frecuentes](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2451>)

**P.** ¿Cuáles son los errores más grandes que cometen los desarrolladores al crear apps para iPhone con mucho peso en la cámara?

Ejecutar AVCaptureSession en el hilo principal (bloquea durante la reconfiguración — usa una cola serie dedicada) y omitir <span class="high">beginConfiguration</span>/<span class="high">commitConfiguration</span> al cambiar varias propiedades (de lo contrario, cada setter reevaluaría el grafo). Además, no uses AVCaptureVideoDataOutput solo para renderizar la previsualización — AVCaptureVideoPreviewLayer es mucho más eficiente a menos que necesites acceder a los buffers.

### 43:45 — [Zoom y paneo](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2625>)

**P.** ¿Cuál es la forma más cercana a la nativa de implementar zoom suave, desplazamiento y paneo en una foto grande sin pixelación?

Usa Core Image (y CIRAWFilter para RAW) — almacena en caché a lo largo del pipeline de decodificación y solo recalcula la región de interés visible, por lo que el paneo y el zoom se mantienen fluidos incluso en imágenes de 100 MP.

### 46:45 — [Límites de Visual Intelligence](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2805>)

**P.** ¿Hay límites de uso en la función de cámara Visual Intelligence y afecta a la calidad de la imagen?

No hay ningún límite en el dispositivo sobre la frecuencia con la que puedes usarla, pero las capturas van a la app de inteligencia, no a la biblioteca del usuario, y se guardan con la resolución y la relación de aspecto de la pantalla — no con la calidad del modo foto completo. Sí hay un límite en el número de consultas conversacionales que puedes hacer sobre una foto determinada.

### 47:42 — [API de Spatial Reframe](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2862>)

**P.** ¿Pueden los desarrolladores acceder al pipeline de reconstrucción 3D de Spatial Reframe, o es exclusivo de Fotos?

No hay API para desarrolladores — Spatial Reframe está restringido a Fotos. ARKit ofrece algunas primitivas de captura y reconstrucción de escenas 3D, y en los iPhone Pro puedes usar el AVCaptureDevice respaldado por LiDAR o la cámara frontal TrueDepth para capturas basadas en profundidad. Envía feedback sobre el pipeline de reencuadre.

### 48:54 — [Gestión de la rotación](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2934>)

**P.** ¿Cuándo gestionará el sistema la rotación de la cámara automáticamente en iOS, iPadOS y macOS? Hacerlo bien es muy tedioso.

El sistema no puede inferir la intención, así que las apps deben seguir gestionándola, pero AVCaptureDeviceRotationCoordinator (añadido en los últimos años) te da el ángulo de rotación correcto para la previsualización o el nivel de horizonte. También puedes establecer <span class="high">videoRotationAngle</span> en la conexión: los buffers de vídeo se rotan físicamente, las fotos usan EXIF y las películas usan metadatos de pista. La sesión «Support the Center Stage front camera in your iOS app» trata esto para la nueva orientación de la cámara frontal del iPhone 17.

### 52:12 — [24 MP con profundidad](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=3132>)

**P.** ¿Se pueden capturar fotos de 24 MP junto con datos de profundidad usando el pipeline de captura de fotos diferida?

Sí. Activa el procesamiento completo (los 24 MP lo requieren), establece <span class="high">maxPhotoDimensions</span> en un tamaño de 24 MP compatible con el dispositivo, elige Quality Prioritization y activa la entrega de datos de profundidad — la captura diferida incluirá entonces la profundidad.

### 53:37 — [Multicam en iPhone](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=3217>)

**P.** ¿Se puede construir una configuración de streaming multi-iPhone al estilo Group Lab con API públicas, y cuáles son?

Sí — las API de vídeo pro del año pasado lo hacen viable. Usa Locked Frame Duration para una frecuencia de fotogramas sólida, Genlock externo (p. ej., mediante Blackmagic Pro Dock) para sincronizar varios iPhone, y el nuevo código de tiempo de generación/salida para una alineación limpia en Final Cut Pro Pro. La nueva API AVProVideoStorage de esta semana también ofrece velocidades de escritura deterministas para capturas ProRes.

### 56:52 — [Nueva API infravalorada](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=3412>)

**P.** ¿Hay alguna nueva API de nicho que merezca destacarse y que no haya recibido mucha atención?

AVProVideoStorage — un archivo preasignado para la captura ProRes que garantiza escrituras seguras a la frecuencia de fotogramas incluso en dispositivos más antiguos o con fragmentación, con una interfaz de ajustes integrada para la asignación controlada por el usuario. También se mencionó: el nuevo motor RAW 9 basado en ML para debayerización y reducción de ruido en RAW de terceros, tratado en la sesión Core Image de David Hayward.

---

## Destacados

- Combina Deferred Start con <span class="high">isResponsiveCaptureEnabled</span> para evitar fotografías perdidas durante el arranque rápido — consulta «Build a responsive camera app that launches quickly».
- Las ediciones con IA (Spatial Reframe, Cleanup) actualizan los metadatos IPTC y aparecen en el panel de información de Fotos; aún no hay API para leer o establecer palabras clave desde apps de terceros.
- Usa AVCaptureDataOutputSynchronizer con profundidad + vídeo, o activa la captura de vídeo en modo Cinematic en la entrada del dispositivo para previsualizaciones de bokeh en directo.
- Para la sincronización A/V, prefiere una única AVCaptureSession; de lo contrario, reconcilia los relojes con <span class="high">CMSyncConvertTime</span> y mantén el audio como línea de tiempo maestra.
- Stack de vídeo pro: Locked Frame Duration, Genlock mediante Blackmagic Pro Dock, salida de código de tiempo y el nuevo AVProVideoStorage para escrituras ProRes deterministas.
- Usa AVCaptureDeviceRotationCoordinator y <span class="high">videoRotationAngle</span> — consulta «Support the Center Stage front camera in your iOS app» para la cámara frontal reorientada del iPhone 17.
- 24 MP + profundidad requiere optar por el procesado completo, configurar <span class="high">maxPhotoDimensions</span>, la priorización de calidad y <span class="high">depthDataDeliveryEnabled</span>.

---

## Sesiones relacionadas

- [Build a responsive camera app that launches quickly](<https://developer.apple.com/videos/play/wwdc2026/303/>) (Crea una app de cámara responsive que se lance rápido)
- [Create a more responsive camera experience](<https://developer.apple.com/videos/play/wwdc2023/10105/>) (Crea una experiencia de cámara más responsive)
- [Implement high resolution photo capture](<https://developer.apple.com/videos/play/wwdc2026/304/>) (Implementa la captura de fotos en alta resolución)
- [Capture cinematic video in your app](<https://developer.apple.com/videos/play/wwdc2025/319/>) (Captura vídeo en modo Cinematic en tu app)
- [Support HDR images in your app](<https://developer.apple.com/videos/play/wwdc2023/10181/>) (Añade compatibilidad con imágenes HDR en tu app)
- [Support the Center Stage front camera in your iOS app](<https://developer.apple.com/videos/play/wwdc2026/341/>) (Añade compatibilidad con la cámara frontal Center Stage en tu app iOS)
- [Enhance RAW image processing with Core Image](<https://developer.apple.com/videos/play/wwdc2026/305/>) (Mejora el procesado de imágenes RAW con Core Image)

---
