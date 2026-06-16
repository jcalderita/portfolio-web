# Coding Intelligence, Machine Learning & AI Group Lab

> WWDC26 · Sesión 8121 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8121/)

---

## Acerca de

Únete a nosotros online para profundizar en la WWDC26 con ingenieros y diseñadores de Apple para hacer preguntas, obtener consejos y seguir el debate sobre los anuncios más importantes de la semana en materia de inteligencia de código, machine learning e IA. Conducido en inglés.

Shashank presenta un Group Lab de la WWDC26 sobre inteligencia de código, machine learning e IA junto a los ingenieros de Apple Kevin (Xcode), Eric (Foundation Models), Steven (Evaluations), Rafiel (Core AI) y Angelos (MLX). Tratan cómo encajan entre sí los nuevos frameworks, los flujos de trabajo agénticos en Xcode, las compensaciones entre procesamiento en el dispositivo y Private Cloud Compute, y el desarrollo orientado a la evaluación.

---

## Q&A

### 4:12 — [Elección de un framework de ML](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=252>)

**P.** ¿Cómo deben entender los desarrolladores los roles de Core AI, Core ML y MLX, y cuál elegir?

Rafiel presentó el stack de Apple como una suite por capas: empieza con Foundation Models para casos de uso LLM, baja a Core AI para redes neuronales personalizadas con SLAs de producción, y usa MLX para usuarios avanzados, inferencia distribuida y entrenamiento en dispositivo. Core ML sigue siendo válido para ML tradicional como árboles de decisión, pero el nuevo trabajo neuronal debería migrar a Core AI. Eric añadió: para tareas de lenguaje, prueba primero el System Language Model, valida con el Evaluations framework y luego escala a Private Cloud Compute o conecta un backend personalizado a través del Language Model Protocol.

### 8:13 — [Tamaño de la ventana de contexto](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=493>)

**P.** ¿Cuál es la ventana de contexto de Foundation Models en dispositivo en iOS 27, y se comparte entre entrada y salida?

Eric confirmó que el contexto en dispositivo sigue siendo de 4096 tokens, compartido entre entrada y salida, mientras que Private Cloud Compute ofrece 32K, también compartido. Los desarrolladores que necesiten más pueden conectar modelos MLX o Core AI a través del Language Model Protocol para alcanzar ventanas mucho mayores.

### 11:24 — [Inferencia en segundo plano](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=684>)

**P.** ¿Puede Foundation Models ejecutarse dentro de tareas en segundo plano mientras el dispositivo está bloqueado o la app está en background?

Eric dijo que sí, la ejecución en segundo plano está soportada, pero el OS puede aplicar rate limiting y exponer un error específico de rate limit para capturarlo. En macOS las apps en primer plano no tienen limitación; la calidad de la salida no cambia, solo puede variar la latencia.

### 13:05 — [Lista de espera de Apple Intelligence](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=785>)

**P.** ¿Qué significa la lista de espera de Apple Intelligence en macOS 27, e incluye la beta el modelo AFM core advanced?

Eric aclaró que la lista de espera solo afecta a Siri, no a Private Cloud Compute ni al modelo de lenguaje en dispositivo. La beta sí incluye AFM core advanced, usado para las funciones de voz. Sugirió llevar la pregunta al group lab dedicado a Apple Intelligence.

### 14:30 — [Mezcla de proveedores de modelos](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=870>)

**P.** ¿Se pueden mezclar proveedores en dispositivo, Private Cloud Compute y terceros en un mismo flujo agéntico, y dónde están los límites de privacidad?

Eric señaló la nueva API Dynamic Profiles y la sesión «Building agentic experiences with Foundation Models». Se recomiendan dos patrones: Baton Pass comparte el contexto completo entre modelos, Phone a Friend lanza una sub-llamada efímera para que el contexto anterior permanezca privado. Los Profile modifiers permiten recortar, descartar llamadas a herramientas o conservar solo las últimas N entradas del transcript al hacer el traspaso a un modelo más pequeño.

### 20:10 — [Personalización de voz](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=1210>)

**P.** ¿Personaliza iOS automáticamente el reconocimiento de voz en dispositivo para nombres poco habituales, o debe el desarrollador mantener un vocabulario personalizado?

El panel indicó que los frameworks de voz quedaban fuera de su área de conocimiento. Rafiel explicó que los reconocedores de voz suelen ir acompañados de un modelo de lenguaje de personalización más pequeño (por ejemplo, entrenado con contactos), y Angelos sugirió apoyarse primero en el reconocedor en dispositivo soportado. Eric recomendó publicar en los foros de desarrolladores, donde los ingenieros relevantes están atentos.

### 23:01 — [Enseñar estilo de código a agentes](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=1381>)

**P.** ¿Cómo se puede enseñar a un agente de codificación con LLM local las convenciones y APIs de una base de código compleja (visionOS, Metal, macros)?

Kevin hizo hincapié en la búsqueda y el aprendizaje: los agentes aprenden el estilo del código existente, y puedes usar un AGENTS.md o CLAUDE.md breve que referencie archivos markdown de estilo o arquitectura más extensos bajo demanda. Anima al agente a tomar notas y documentar suposiciones por área. Angelos añadió que con cada modelo nuevo conviene reintentar sin todo el andamiaje, y Kevin señaló que Xcode 27 incluye soporte para ACP, de modo que proveedores locales como LM Studio se conectan como agentes completos, con interacción con el simulador y búsqueda en la documentación.

### 32:37 — [Pruebas de UI con IA](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=1957>)

**P.** ¿Qué pasos prácticos permiten integrar pruebas de UI automatizadas con IA en flujos de trabajo de plataformas Apple?

Kevin recomendó una pirámide: miles de pruebas unitarias rápidas, cientos de pruebas de integración y solo un puñado de pruebas de UI. Como novedad en Xcode 27, el agente puede manejar el simulador mediante toques, gestos de deslizamiento, escritura, capturas de pantalla y el árbol de accesibilidad, y luego escribir pruebas de UI duraderas a partir de lo aprendido, de modo que el agente no necesita ejecutarse cada vez.

### 35:43 — [Vision frente a Foundation Models](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=2143>)

**P.** Ahora que Foundation Models acepta imágenes, ¿cuándo deben los desarrolladores seguir usando Vision framework para tareas de imagen?

Eric recomendó la sesión «What's new in image understanding» y trazó la línea así: usa Vision para detección bien definida y repetible, como objetos específicos o segmentación, porque está optimizado y es testeable. Usa Foundation Models cuando la tarea requiera comprensión semántica o prompts en lenguaje natural, y ten en cuenta las nuevas herramientas integradas como lector de códigos de barras y OCR. Comparó Foundation Models con una impresora 3D frente a la línea de producción de Vision.

### 39:44 — [Gestión de presupuestos de tokens](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=2384>)

**P.** ¿Cuáles son las mejores prácticas para gestionar el tamaño del prompt, las herramientas y el contexto en LLMs en dispositivo con tokens limitados?

Eric destacó las nuevas APIs: símbolos de tamaño de contexto y conteo de tokens añadidos en la versión 26.4, además de <span class="high">response.usage</span> que informa de tokens de entrada, salida, caché y razonamiento. El repositorio open-source Foundation Models Utilities incluye un modificador Summarize history y Profile modifiers para descartar llamadas a herramientas tras su uso o conservar solo las últimas N entradas. Steven añadió que el Evaluations framework es la vía para decidir con qué agresividad resumir, y Angelos señaló que los tokens de razonamiento son lo primero que hay que eliminar y que las arquitecturas de atención más nuevas (sliding window attention, lineal) se comportan mejor en contextos largos.

### 51:38 — [Rechazos de Guardrails](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=3098>)

**P.** ¿Cómo pueden los desarrolladores evitar rechazos de Guardrails en prompts emocionalmente intensos pero legítimos, y distinguir los rechazos de otros errores?

Eric explicó que el System Language Model expone una opción de «permissive content transformations» que relaja los Guardrails del lado de entrada. Los errores de rechazo (el modelo declina en lenguaje natural) son distintos de los errores de Guardrails (un modelo de moderación que marca la entrada/salida) y se pueden capturar por separado. Los Guardrails se reentrenaron este año con muchos menos falsos positivos; en caso contrario, los desarrolladores pueden incluir su propio modelo como Qwen.

### 54:25 — [Filosofía de evaluación de Apple](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=3265>)

**P.** ¿Cuál es la filosofía que guía a Apple en la evaluación de IA?

Steven describió el desarrollo orientado a evaluación: empieza con la eval, trátala como la especificación viva de tu funcionalidad, incluye casos límite y margen de mejora, y toma prestado del ámbito educativo el concepto de evaluación formativa para seguir aprendiendo dónde falla el modelo. El framework permite partir de un dataset pequeño y curado, ampliarlo de forma sintética, ejecutar configuraciones en paralelo y mejorar iterativamente los resultados.

### 57:27 — [Compartir modelos entre apps](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=3447>)

**P.** ¿Pueden distintas apps en iPhone compartir los mismos pesos de modelo para ahorrar almacenamiento?

Rafiel dijo que en general no: el sandboxing, la contención de recursos y las decisiones de Quantization específicas para cada caso de uso hacen que compartir entre apps sea poco práctico. La caché de modelos de Core AI puede compartir recursos dentro de un App Group (mismo desarrollador). Angelos señaló que el verdadero uso compartido entre apps requeriría un servicio del sistema con garantías de integridad, no simplemente una descarga compartida.

---

## Destacados

- Language Model Protocol permite cambiar los backends de MLX, Core AI, Google o Anthropic detrás del Foundation Models API; el Foundation Models framework pasará a ser open source.
- Dynamic Profiles junto con los profile modifiers (descartar llamadas a herramientas, conservar las últimas N entradas, resumir el historial) coordinan los traspasos entre el modelo en dispositivo, Private Cloud Compute y modelos de terceros — consulta «Building agentic experiences with Foundation Models».
- El contexto en dispositivo sigue siendo 4096 tokens compartidos entre entrada y salida; Private Cloud Compute ofrece 32K; <span class="high">response.usage</span> ahora informa tokens de entrada, salida, en caché y de razonamiento.
- Foundation Models Utilities es un nuevo repositorio open source con bloques de construcción como <span class="high">SummarizeHistory</span>; las nuevas herramientas integradas incluyen lectura de códigos de barras y OCR.
- Xcode 27 añade soporte ACP para agentes locales (LM Studio, Ollama), interacción con el simulador (tap, swipe, capturas de pantalla, árbol de accesibilidad) y búsqueda en documentación para fundamentar el trabajo sobre nuevas APIs.
- El Evaluations framework admite evaluadores basados en modelo-juez, expansión sintética de datasets y comparación lado a lado; úsalo para elegir entre el modelo en dispositivo y Private Cloud Compute, y para ajustar las estrategias de resumen.

---

## Sesiones relacionadas

- [What’s new in the Foundation Models framework](<https://developer.apple.com/videos/play/wwdc2026/241/>) (Novedades en el Foundation Models framework)
- [What’s new in image understanding](<https://developer.apple.com/videos/play/wwdc2026/237/>) (Novedades en comprensión de imágenes)
- [Bring an LLM provider to the Foundation Models framework](<https://developer.apple.com/videos/play/wwdc2026/339/>) (Integra un proveedor LLM en el Foundation Models framework)
- [Explore distributed inference and training with MLX](<https://developer.apple.com/videos/play/wwdc2026/233/>) (Explora la inferencia y el entrenamiento distribuidos con MLX)
- [Apple Intelligence Group Lab](<https://developer.apple.com/videos/play/wwdc2026/8011/>) (Apple Intelligence Group Lab)

---
