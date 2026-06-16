# Machine Learning & AI Group Lab

> WWDC26 · Sesión 8016 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8016/)

---

## Acerca de

Únete a nosotros en línea para profundizar en la WWDC26 con ingenieros y diseñadores de Apple: haz preguntas, recibe consejos y sigue el debate sobre los grandes anuncios de machine learning e IA de la semana. Realizado en inglés.

Shashank modera el laboratorio del grupo de Machine Learning & IA de Apple junto a los ponentes Tao y Michael (Core AI), Marcus (Evaluations framework), Louie (Foundation Models) y Ronan (MLX). Los temas abarcan Foundation Models, Private Cloud Compute, Core AI, MLX, evaluaciones y la experiencia de desarrollo en torno a la IA.

---

## Q&A

### 4:43 — [On-Device vs Private Cloud Compute](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=283>)

**P.** ¿Cómo deben elegir los desarrolladores entre el Foundation Model on-device y Private Cloud Compute para una tarea concreta?

Louie expuso las diferencias concretas: contexto de 4K on-device frente a 32K en Private Cloud Compute, disponibilidad sin conexión on-device y una nueva capacidad de razonamiento en el modelo de servidor. Marcus recomendó usar el framework de Evaluations para ejecutar la misma feature en paralelo contra ambos modelos y comparar los informes en Xcode. También señalaron que los Dynamic Profiles permiten combinar ambos modelos dentro de una sola feature, e Instruments expone ahora métricas de Foundation Models como la latencia de ida y vuelta y los presupuestos de tokens.

### 9:21 — [LLM local en Xcode](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=561>)

**P.** ¿Por qué un modelo Qwen de MLX servido mediante ACP de código abierto se comporta de forma extraña en el modo agente de Xcode, con tokens finales filtrados? ¿Es un problema de la plantilla de chat?

El panel sospechó un problema de configuración del tokenizador o de la plantilla de chat, ya que los tokens finales filtrados aparecen con frecuencia al incorporar nuevos modelos a los paquetes de MLX o de Language Model de Core AI. Recomendaron abrir una incidencia en los repositorios GitHub de código abierto de MLX/Core AI Language Model o en los foros para desarrolladores, y apuntaron a la sesión de MLX de este año, que muestra código abierto con un modelo Qwen en Xcode.

### 12:20 — [Modelos personalizados como agentes](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=740>)

**P.** ¿Puede un modelo servido localmente con MLX, o uno entrenado por ti mismo, usarse como agente de codificación completo en Xcode en lugar de solo para chat?

Aclararon que Core AI es solo para inferencia (no para entrenamiento) y que incorporar tu propio modelo a Xcode pasa por el modo agente ACP, no por el modo chat. MLX LM expone un servidor que Xcode puede detectar automáticamente; para modelos de Core AI habría que escribir una conformancia o contribuir una capa de servidor de lenguaje compatible con OpenAI.

### 15:08 — [Detección de actualizaciones del modelo](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=908>)

**P.** ¿Existe un identificador de versión del modelo en tiempo de ejecución para que un conjunto de evaluaciones detecte cuándo Apple actualiza silenciosamente el modelo on-device o de Private Cloud Compute?

Louie explicó que el modelo on-device solo cambia con las actualizaciones del OS, por lo que la versión del OS es la señal; el modelo de servidor es más dinámico. La recomendación es asumir que los modelos evolucionarán y volver a ejecutar las evaluaciones en cada versión beta del OS, comparando ejecuciones para detectar regresiones, y evitar prompts demasiado específicos en cuanto a palabras concretas. Las actualizaciones se publican aproximadamente dos veces al año y el periodo beta es el momento para enviar feedback.

### 19:01 — [Fondo y widgets](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=1141>)

**P.** ¿Puede Foundation Models ejecutarse desde widgets, App Intents o tareas en segundo plano? ¿Qué límites de frecuencia o temperatura se aplican?

Sí, el modelo on-device se ejecuta en segundo plano y en widgets, pero en iOS puede estar limitado en frecuencia según la carga del sistema, la prioridad en primer plano y la temperatura —captura el error específico y reintenta más tarde—. macOS no aplica esa limitación de frecuencia, aunque QoS sigue influyendo en la planificación. Las apps comparten una única copia en memoria del modelo del sistema.

### 21:25 — [Adaptar modelos a apps](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=1285>)

**P.** ¿Cómo pueden los desarrolladores adaptar o crear modelos para los datos y el dominio de su propia app? Por ejemplo, imágenes de perfil de usuario con estilo artístico.

Michael sugirió usar Foundation Models para resumir datos de la app o del usuario en un prompt para un modelo de generación de imágenes, con la posibilidad de hacer fine-tuning a un modelo de difusión de código abierto incorporado mediante Core AI. Ronan indicó que MLX permite hacer fine-tuning de muchos modelos, pero Tao subrayó la importancia de empezar con aprendizaje en contexto antes de pasar a un fine-tuning completo. Marcus propuso el hill climbing con el framework de Evaluations —incluido un sample generator que produce entradas de texto sintéticas que se pueden combinar con salidas de difusión para construir conjuntos de datos—.

### 28:49 — [Casos de uso adecuados para Foundation Models](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=1729>)

**P.** ¿Qué casos de uso se adaptan al framework Foundation Models y cuáles deben evitar los desarrolladores?

Louie dijo que la extracción y generación de contenido, especialmente con la nueva entrada de imágenes, encajan muy bien; el modelo no puede generar imágenes, así que para eso hay que usar un modelo de difusión. Michael advirtió contra las cargas de trabajo en tiempo real o por debajo del milisegundo por fotograma, donde son más adecuadas las APIs especializadas como Vision, Speech o Translation. Shashank recordó que el mayor contexto de Private Cloud Compute ahora desbloquea casos de resumen y transformación que superaban los límites de contexto on-device.

### 32:27 — [Aprender IA/ML](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=1947>)

**P.** ¿Por dónde debe empezar un principiante para aprender IA y ML? ¿Qué recursos se recomiendan?

Marcus señaló el contenido de Intro to ML de Swift Playgrounds (clasificador de imágenes de piedra, papel o tijera) y destacó que Xcode abre ahora un playground con un solo clic, ideal para las primeras llamadas a Foundation Models. El panel animó al aprendizaje basado en proyectos —construye una app, luego un modelo—, aprovechando los agentes de IA como tutores, explorando los tutoriales de PyTorch y MLX, y profundizando gradualmente hasta los pesos de Hugging Face, Core AI y MLX.

### 37:14 — [De PyTorch a Core AI](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=2234>)

**P.** ¿Se puede importar a Core AI o al ecosistema Apple en general todo lo que se puede expresar en PyTorch?

Michael dijo que si un modelo se puede exportar desde PyTorch y usa ops de ATen principales, Core AI lo convierte de forma directa; las ops inusuales se pueden gestionar mediante lowerings personalizados o kernels Metal personalizados para el rendimiento. Ronan señaló que la API de MLX es muy similar a la de PyTorch, y que Hugging Face aloja más de 10.000 modelos convertidos a MLX para experimentar fácilmente. Los agentes de codificación con IA y las skills pueden ayudar a portar entre representaciones de PyTorch, MLX y Core AI.

### 42:56 — [UX cuando Foundation Models no está disponible](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=2576>)

**P.** ¿Cuál es la mejor UX cuando Foundation Models no está disponible? ¿Se puede precalentar el modelo para reducir la latencia de la primera petición?

Louie confirmó que una API de precalentamiento carga el modelo on-device en memoria antes de que el usuario interactúe, y que una API de disponibilidad permite detectar dispositivos no compatibles o Apple Intelligence desactivado. Para los casos de no disponibilidad, el nuevo Language Model Protocol permite intercambiar modelos de MLX, Core AI o alojados en servidor. Shashank insistió en guiar al usuario de forma fluida —por ejemplo, invitarle a activar Apple Intelligence u ocultar el punto de entrada por completo en lugar de mostrar un error—.

### 46:59 — [De Core ML a Core AI](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=2819>)

**P.** ¿Cómo y cuándo deben los desarrolladores migrar de Core ML a Core AI? ¿Tienen que esperar a que los usuarios actualicen a iOS 27?

Michael aclaró que no hay ningún imperativo de migrar: Core ML sigue siendo compatible y es la opción correcta para árboles de decisión y modelos por debajo del milisegundo. Core AI es donde Apple invierte para los modelos generativos modernos; tratar el cambio como adoptar cualquier API nueva vinculada al OS, condicionada a tu base de usuarios. Para las experiencias generativas existentes en Core ML, Core AI es el camino recomendado a partir de ahora.

### 49:02 — [Modelo máximo on-device](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=2942>)

**P.** ¿Cuál es el modelo local más grande que puedes incluir en una app antes de plantearte usar Private Cloud Compute?

Michael ofreció una regla general de menos de 2 GB en iOS para ser un buen ciudadano de la plataforma, con macOS limitado principalmente por la memoria disponible perfilada en Instruments. La Quantization (tratada en la sesión de Core AI de este año) permite acercarse a LLMs de unos 6.000 millones de parámetros dentro de ese límite, con evaluaciones que orientan sobre la pérdida de precisión tolerable. En macOS puedes escalar el tamaño del modelo según la clase de dispositivo, y una nueva sesión muestra cómo enlazar cuatro Mac Studio mediante Thunderbolt 5 para ejecutar modelos muy grandes con MLX.

### 53:34 — [Cuándo usar IA](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=3214>)

**P.** ¿Cómo decides cuándo la IA debe ayudar activamente al usuario frente a mantenerse al margen?

Shashank argumentó en contra de usar IA por el mero hecho de hacerlo —parte de la experiencia de usuario que quieres y recurre a un modelo solo si cubre una necesidad real—. Marcus sugirió prototipar ideas secundarias y luego validarlas con evaluaciones e historias de usuario antes de comprometerse. Louie y Ronan enmarcaron la IA como una herramienta más entre muchas —idealmente invisible, que ayuda a los usuarios a llegar de A a B más rápido en lugar de interponerse en el camino—.

### 58:38 — [Backend LLM personalizado](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=3518>)

**P.** Para apps que soportan iPhones más antiguos con un backend LLM propio alojado en servidor, ¿es el camino recomendado en iOS 27 envolverlo en un proveedor de Language Model personalizado?

Louie confirmó que el nuevo Language Model Protocol es exactamente el enfoque correcto, ya que ofrece una API Swift unificada para prompts, llamadas a herramientas y salida generativa con cualquier modelo. Apple publica un paquete de utilidades de código abierto con una implementación que se ajusta a la forma típica de petición de chat-completions de OpenAI, junto con los paquetes de MLX y Core AI. Elegir entre el modelo del sistema y los modelos personalizados se reduce entonces a un simple <span class="high">if</span> mientras el resto del código permanece idéntico.

---

## Destacados

- El framework Foundation Models ahora tiene un Language Model Protocol: conecta modelos de MLX, Core AI, servidor o compatibles con OpenAI tras una única API Swift.
- Modelo en dispositivo: contexto de 4K, sin conexión, incluido en el OS; modelo en servidor de Private Cloud Compute: contexto de 32K con nuevos niveles de razonamiento.
- El framework de Evaluations en Xcode admite informes comparativos entre modelos —incluidos sistemas que no son LLM como difusión o escaladores de imagen— con un sample generator integrado para entradas sintéticas.
- Foundation Models Instruments añade latencia de ida y vuelta, presupuestos de tokens y más; las API de disponibilidad y precalentamiento ayudan a gestionar dispositivos no compatibles y la latencia de arranque en frío.
- Core AI publica recetas de exportación de código abierto, utilidades de runtime en Swift, compilación anticipada para modelos grandes y skills agénticas para agentes de código.
- MLX añade soporte de escritura GPU/URX para M5 y RDMA por Thunderbolt 5 —una sesión muestra cuatro Mac Studios ejecutando modelos de ~100B parámetros—; la regla general en iOS es mantenerse por debajo de ~2 GB.
- Core ML no está obsoleto: úsalo para árboles de decisión y modelos de latencia inferior al milisegundo; Core AI es el camino para las cargas de trabajo generativas modernas.
- Registra incidencias en developer.apple.com/forums y feedback.apple.com; consulta las sesiones sobre Dynamic Profiles y MLX para ver ejemplos prácticos.

---

## Sesiones relacionadas

- [Run local agentic AI on the Mac using MLX](<https://developer.apple.com/videos/play/wwdc2026/232/>) (Ejecuta IA agéntica local en el Mac con MLX)
- [What’s new in image understanding](<https://developer.apple.com/videos/play/wwdc2026/237/>) (Novedades en comprensión de imágenes)
- [Dive into Core AI model authoring and optimization](<https://developer.apple.com/videos/play/wwdc2026/325/>) (Profundiza en la autoría y optimización de modelos Core AI)
- [Explore distributed inference and training with MLX](<https://developer.apple.com/videos/play/wwdc2026/233/>) (Explora la inferencia y el entrenamiento distribuidos con MLX)
- [Explore prompt design & safety for on-device foundation models](<https://developer.apple.com/videos/play/wwdc2025/248/>) (Explora el diseño de prompts y la seguridad en Foundation Models en dispositivo)

---
