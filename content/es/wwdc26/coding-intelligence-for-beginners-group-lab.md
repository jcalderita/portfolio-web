# Coding Intelligence for Beginners Group Lab

> WWDC26 · Sesión 8007 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8007/)

---

## Acerca de

Únete a nosotros en línea para hacer preguntas, obtener consejos y seguir la discusión sobre cómo empezar con la inteligencia de código. Realizado en inglés.

Presentado por Angelica, este laboratorio orientado a principiantes sobre la inteligencia de código de Xcode reúne a Nathan (equipo de inteligencia y agentes de Xcode), Ken (responsable del equipo de Xcode), Jerome (PM de Developer Tools) y Kevin (manager de ingeniería para las herramientas de IA de Xcode). Responden preguntas sobre agentic workflows, modelos locales, privacidad y primeros pasos.

---

## Q&A

### 5:20 — [Descubrir slash commands](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=320>)

**P.** ¿Dónde puede aprender un principiante los slash commands disponibles, como /plan?

Escribe <span class="high">/</span> en Xcode para ver los comandos que expone el agente junto con las skills cargadas, y pregúntale directamente al agente — conoce sus propios comandos y puede describirlos. Experimentar revela nuevos flujos de trabajo.

### 6:27 — [Xcode frente a agentes externos](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=387>)

**P.** ¿Qué ventajas únicas ofrece la inteligencia de código integrada en Xcode frente a los agentes de IA externos?

Xcode aporta un conjunto de herramientas cuidado, comprensión del proyecto, herramientas de SDK y documentación, y herramientas de validación que incluyen compilaciones, ejecución de código y renderizado de UI. También expone datos del ecosistema Apple (informes de fallos, localización), el sistema de previsualizaciones como herramienta de agente, y plan mode y guía de incorporación listos para usar.

### 10:32 — [Indicador de uso de recursos](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=632>)

**P.** ¿Muestra Xcode 27 cuánto contexto o presupuesto del agente consume una solicitud?

No directamente en la UI — pregúntale al agente mediante un slash command del proveedor. Los proveedores suelen exponer dos cifras: el nivel de llenado actual del context window frente al coste de sesión. Envía una solicitud de Feedback si quieres que se muestre en otro lugar.

### 12:06 — [Contexto entre proyectos](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=726>)

**P.** ¿Puede el agente acceder a directorios de trabajo adicionales u otros proyectos locales para referencias entre proyectos?

Los archivos referenciados en tu workspace de Xcode son visibles para el agente de forma automática, y pegar rutas de archivos externos le permite explorarlos. La solicitud de permisos por defecto te mantiene en control, y un modo de seguridad gestionado experimental regula las acciones a nivel del sistema de archivos.

### 15:05 — [Explicar lo que se ha construido](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=905>)

**P.** ¿Podría la inteligencia de código ofrecer una explicación o resumen opcional de lo que acaba de hacer, para que los estudiantes entiendan el código?

Pregúntale al agente — explica con gusto en cualquier formato (markdown, informes HTML). Configura un AGENTS.md para que siempre añada explicaciones, abre una conversación paralela para hacer preguntas mientras el agente principal trabaja, usa plan mode para entender el enfoque antes de los cambios de código, y pídele que genere documentación de arquitectura que persista en sesiones futuras.

### 21:16 — [Errores habituales del agente](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=1276>)

**P.** ¿Qué errores habituales cometen los asistentes de código que los principiantes tienen dificultades para detectar?

Los más complicados son los desajustes sutiles de suposiciones y las implementaciones difíciles de mantener. Vigila los «atajos» — por ejemplo, descartar un test fallido como un problema solo de depuración. Los tipos fuertes, los tests y los problemas en directo dan al agente retroalimentación rápida para autocorregirse antes de que los problemas lleguen a ti.

### 24:24 — [Deshacer cambios del agente](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=1464>)

**P.** ¿Puede Xcode ofrecer un botón de deshacer con un clic para todo lo que cambió un agente, en lugar de depender de Git?

Xcode ya rastrea el historial por turno cuando hay un repositorio Git inicializado en tu proyecto — abre la vista del historial, mueve el deslizador y revierte al estado anterior al último turno del agente. También puedes pedirle al agente que deshaga cambios concretos. El panel recomienda encarecidamente mantener Git activo incluso en proyectos en solitario.

### 29:04 — [Desarrollar habilidades de IA](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=1744>)

**P.** ¿Cómo debería un desarrollador iOS experimentado con poca experiencia en IA desarrollar habilidades de desarrollo asistido por agentes?

Empieza con tareas que ya conozcas para poder comparar resultados y ganar confianza. Enseña al agente tus convenciones, úsalo como apoyo para la planificación si no estás listo para delegar código, y mira la sesión «Xcode Agents and You» para ver patrones de flujo de trabajo. Prueba tanto el enfoque descendente (describe la forma) como el ascendente (define las interfaces, deja que implemente los cuerpos).

### 34:15 — [chat mode frente a agent mode](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2055>)

**P.** ¿Cuáles son las diferencias entre chat mode y agent mode, y por qué un LLM local en chat mode rinde por debajo de lo que muestra la demo?

Chat mode expone aproximadamente entre diez y quince herramientas; agent mode expone unas 60 más acceso a línea de comandos, subagents y gestión de contexto — capacidad prácticamente ilimitada. Los agentes ahora operan durante una hora o más de forma independiente, frente a los turnos de unos 30 segundos del chat. El panel anima a dar el salto del chat a los agentes en Xcode 27.

### 38:01 — [Ventajas e inconvenientes de los modelos locales](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2281>)

**P.** ¿Qué capacidades se pierden al usar un modelo local en lugar de uno en la nube — solo velocidad y precisión, o también funciones completas?

El conjunto de herramientas de Xcode es idéntico a través de ACP — los agentes locales obtienen las mismas herramientas. La diferencia real es la inteligencia bruta del modelo: los modelos gigantes alojados en la nube superan a lo que cabe en un portátil. Compénsalo con salvaguardas más sólidas — tests sólidos y bucles de validación mantienen a los modelos más pequeños en el buen camino.

### 40:33 — [LLM local más allá del chat](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2433>)

**P.** ¿Se puede conectar un LLM local (por ejemplo, un servidor MLX LM) a un flujo de agente completo en lugar de solo a chat mode?

Sí — usa la compatibilidad con ACP junto con agentes de código abierto como OpenCode que admiten modelos locales. ACP es también la forma en que las empresas conectan sus propios sistemas backend mientras mantienen la experiencia de Xcode.

### 41:25 — [Privacidad del código](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2485>)

**P.** ¿Qué ocurre con la privacidad de mi código cuando un LLM de terceros accede a él a través de Xcode? ¿Puede entrenarse con mi código?

Apple no está en el circuito — las solicitudes van directamente al proveedor que hayas configurado. El entrenamiento y la retención se rigen por las condiciones de ese proveedor; consulta la configuración de tu cuenta para desactivar el uso en entrenamiento. La única excepción son los informes de feedback que envíes explícitamente a Apple.

### 43:38 — [Flujos de trabajo de IA sin conexión](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2618>)

**P.** ¿Cuál es la mejor forma de trabajar con IA en Xcode sin conexión y sin hardware de primera línea?

Usa MLX para ejecutar el modelo local más grande que sea viable (consulta la sesión «Run local agentic AI on Mac using MLX»). Apóyate en salvaguardas sólidas — los tests unitarios que el agente debe superar mantienen honestos a los modelos pequeños. Planifica previamente con un modelo grande en la nube antes de desconectarte, deja que los agentes locales ejecuten y documenten las suposiciones, y verifica con un modelo grande cuando vuelvas a conectarte.

### 46:13 — [Por qué quedarse en Xcode](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2773>)

**P.** Tras usar Claude Code intensivamente en el terminal, ¿qué me estoy perdiendo por no usar Xcode?

Xcode ofrece una experiencia no lineal y visualmente rica — un panel de artefactos que muestra los cambios en evolución junto a la conversación, markdown enriquecido, previsualizaciones y el contexto completo de Xcode (archivos abiertos, esquemas, historial de Git, datos de fallos, Instruments, hub de dispositivos). El terminal también funciona bien; no tiene que ser todo o nada.

### 49:19 — [Selección de modelo local](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2959>)

**P.** ¿Cómo equilibro velocidad, precisión y privacidad al elegir un modelo local en Xcode 27?

Pruébalos — los benchmarks ayudan, pero al final lo que importa es la «sensación». Crea tu propio conjunto de casos relevantes para tu proyecto y repítelo cuando salgan nuevos modelos. Más grande no siempre es mejor; puedes cambiar de modelo según la tarea y mantener varios cargados en un Mac capaz.

### 52:25 — [Foundation Models como agente](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=3145>)

**P.** Para evitar compartir código con Anthropic, OpenAI o Google, ¿puede Foundation Models dirigir el agente de Xcode?

Usa agentes locales con modelos locales a través de ACP — la sesión «Run local agentic AI on Mac using MLX» cubre ese camino. Incluso un solo Mac con M5 es capaz; un conjunto de Mac Studio puede alojar modelos muy grandes.

### 53:13 — [Visión general para principiantes](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=3193>)

**P.** ¿Existe un documento de visión general para principiantes — un mapa del tema — en lugar de tutoriales prácticos?

La sesión «Xcode Agents and You» tiene diagramas ilustrativos de lo que hace el agente. Plan mode es una forma de bajo riesgo de inspeccionar el enfoque del agente. Las técnicas se transfieren entre IDEs, así que los recursos de la comunidad y la documentación del proveedor son aplicables. No le des demasiadas vueltas — pruébalo.

### 58:06 — [Conocimiento de nuevas API](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=3486>)

**P.** ¿Cómo nos aseguramos de que el agente conozca las API completamente nuevas anunciadas en WWDC?

Xcode incluye una herramienta de documentación con un índice optimizado para el modelo que se descarga con Xcode y se actualiza como un recurso independiente. El agente lo consulta cuando una API le es desconocida. Xcode también incluye skills especializadas (por ejemplo, la nueva función de redimensionado de iOS 27). Esto funciona independientemente del proveedor — Claude, Codex, Gemini o local.

---

## Destacados

- Usa AGENTS.md para fijar convenciones como «resume siempre lo que has hecho», de modo que el agente se comporte de forma consistente entre turnos.
- Activa Git en todos tus proyectos — Xcode 27 registra el historial por turno y muestra un control deslizante para revertir al estado anterior al último turno del agente.
- El soporte de ACP significa que los agentes de código abierto (OpenCode, Claude Code, Codex, Gemini) tienen acceso a las mismas ~60 herramientas de Xcode que los flujos integrados, incluso con modelos alojados localmente mediante MLX.
- Mira «Xcode Agents and You» para patrones de workflow y «Run local agentic AI on Mac using MLX» para configurar modelos locales.
- Plan mode te permite inspeccionar y orientar el enfoque del agente antes de que cualquier cambio de código llegue a tu proyecto.
- La herramienta de documentación de Xcode incluye un índice optimizado para el modelo que se actualiza como un recurso independiente, de modo que los agentes conocen las nuevas API de WWDC independientemente del proveedor o modelo que uses.
- Apple no está en el bucle de peticiones — las políticas de privacidad y entrenamiento las rigen los términos de tu proveedor de modelos; configura las exclusiones voluntarias en tu cuenta de proveedor.

---

## Sesiones relacionadas

- [Run local agentic AI on the Mac using MLX](<https://developer.apple.com/videos/play/wwdc2026/232/>) (Ejecuta IA agéntica local en Mac con MLX)
- [Code-along: Experiment with coding intelligence in Xcode 26](<https://developer.apple.com/videos/play/meet-with-apple/268/>) (Code-along: Experimenta con la inteligencia de código en Xcode 26)

---
