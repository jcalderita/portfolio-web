# Privacy and Security Group Lab

> WWDC26 · Sesión 8009 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8009/)

---

## Acerca de

Únete a nosotros en línea para profundizar en el WWDC26 con ingenieros y diseñadores de Apple: haz preguntas, recibe consejos y sigue el debate sobre los anuncios más importantes de la semana en privacidad y seguridad. Se desarrolla en inglés.

David (evangelista tecnológico de WWDR) actúa como moderador de un panel de privacidad y seguridad con los ingenieros de Apple Yosh, Katie, Dan, Rohit y Emily, cubriendo los riesgos de la IA agéntica, Private Cloud Compute, telemetría, passkeys y la protección de datos sensibles en el dispositivo.

---

## Q&A

### 2:59 — [Defensa contra inyección de prompts](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=179>)

**P.** ¿Cómo evita Apple que sus modelos sean secuestrados mediante inyección de prompts?

Dan explicó que la IA agéntica introduce riesgos de indirect prompt injection —la «lethal trifecta» de acceso a datos privados, capacidad de acción y contexto no confiable. Apple combina mitigaciones deterministas (como confirmaciones del usuario) con probabilistas (como señalar el contenido no confiable en los prompts), y remite a una sesión específica de WWDC sobre cómo proteger las funciones agénticas.

### 5:10 — [PCC frente a modelos de terceros](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=310>)

**P.** Cuando una app envía datos de usuario a Private Cloud Compute o a un modelo de terceros mediante el protocolo de modelo de lenguaje, ¿qué ocurre con esos datos y qué deben revelar los desarrolladores?

Emily señaló que las garantías de stateless computation y non-targetability de PCC solo se aplican a las rutas propias de PCC, no a APIs de terceros como Anthropic o Google. Los datos enviados a PCC solo se usan para atender la solicitud, Apple no los ve y el volumen se borra en cada reinicio. Rohit añadió que los desarrolladores deben leer los términos de terceros y comunicar claramente a los usuarios cómo se tratan sus datos.

### 8:20 — [Alcance de las etiquetas de nutrición](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=500>)

**P.** En las App Privacy Nutrition Labels, ¿los datos que gestiona un procesador externo en mi nombre cuentan como datos que yo recopilo?

Katie aclaró que los desarrolladores son responsables de declarar todos los datos recopilados desde su app, independientemente de si se envían a sus propios servidores o a un servicio de terceros. Esto implica entender qué hacen los terceros con esos datos y presentar el panorama completo a los usuarios.

### 9:33 — [Riesgos del código agéntico en Xcode](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=573>)

**P.** ¿Qué riesgos de seguridad conllevan las nuevas funciones de codificación agéntica de Xcode y cómo deben mitigarlos los desarrolladores?

Dan dijo que Apple aplica un enfoque de diseño seguro en las funciones agénticas de Siri, Safari y Xcode. Xcode en concreto permite crear una lista de herramientas comunes que los llamantes pueden invocar cuando Xcode actúa como servidor MCP, con mitigaciones adaptadas a cada caso de uso.

### 10:49 — [Arquitectura de PCC](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=649>)

**P.** ¿Cuál es la arquitectura central de Private Cloud Compute y cómo es matemáticamente verificable?

Emily remitió a la guía de seguridad detallada de PCC en apple.com y describió la plataforma stateless y verificable. Apple exige dos attestations de dos proveedores de hardware distintos, aísla el procesado de riesgo (p. ej. difusión de imágenes para reencuadre espacial) en nodos con sandbox adicional, y publica un Virtual Research Environment para que cualquiera —con derecho al Apple Security Bounty— pueda verificar las afirmaciones frente al software exacto que corre en los servidores de Apple. Los nodos comprometidos generan attestations diferentes y los dispositivos cliente los rechazan automáticamente.

### 17:21 — [Auditar tu propia app](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=1041>)

**P.** ¿Hay nuevas formas de auditar la privacidad y seguridad de mi propia app, especialmente cuando uso SwiftData con CloudKit?

Katie sugirió usar asistentes de codificación de IA generativa para revisar las garantías de privacidad y seguridad e identificar dónde adoptar APIs más privadas, como los out-of-process pickers. Dan destacó que los frameworks (Network framework con suites de cifrado post-quantum TLS, CloudKit) son seguros por defecto. Yosh insistió en pensar en las entradas en las que confías y en dónde viertes los datos recopilados como las dos preguntas de seguridad fundamentales.

### 22:26 — [Frameworks para principiantes](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=1346>)

**P.** Para desarrolladores que empiezan en plataformas Apple, ¿en qué frameworks de privacidad y seguridad deberíamos centrarnos primero?

El panel recomendó CloudKit para sincronización, Keychain y CryptoKit para secretos en el dispositivo, y passkeys para autenticación. Ante todo, practica la data minimization: no recopiles lo que no necesitas, usa out-of-process pickers para fotos, contactos y ubicación, y elige la Data Protection class correcta del Keychain (p. ej. tras el primer desbloqueo frente a siempre disponible). Para la telemetría, considera identificadores rotativos o de sesión, la agregación y herramientas como Differential Privacy y private federated learning.

### 28:16 — [Proteger datos de diario](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=1696>)

**P.** ¿Cómo debo proteger contenido SwiftData muy sensible, como entradas de diario, manteniendo la búsqueda y la sincronización con CloudKit?

Yosh recomendó cifrar con una clave de Keychain ajustada a una Data Protection class estricta (p. ej. solo cuando está desbloqueado, opcionalmente protegida con biometría), aplicar las clases de protección de archivos correspondientes en disco y usar valores cifrados de CKRecord para que los usuarios con Advanced Data Protection obtengan cifrado de extremo a extremo en todos sus dispositivos. Dan añadió que existe una Data Protection class que mantiene los datos accesibles durante una ventana acotada tras el bloqueo, dándole tiempo a los procesos en segundo plano para indexar antes de que la clave vuelva a bloquearse.

### 31:22 — [VM sin conexión en Xcode](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=1882>)

**P.** ¿Pueden las funciones de codificación con IA de Xcode ejecutarse dentro de una VM aislada sin internet?

Dan dijo que el autocompletado de código existente funciona completamente en el dispositivo y sin conexión, pero las funciones que integran modelos externos como Claude u OpenAI Codex requieren acceso a la red por su propia naturaleza.

### 32:12 — [Nueva privacidad de Siri](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=1932>)

**P.** ¿Cómo protege la nueva Siri la privacidad y seguridad, por ejemplo evitando filtrar contexto privado a las apps?

Katie y Emily explicaron que Siri ejecuta todo lo posible en el dispositivo, con sandboxing en el dispositivo y entitlements que restringen qué proceso puede recopilar el contexto del prompt. Cuando se necesita el Apple Foundation Model más grande, las solicitudes van a PCC con todas sus garantías, con múltiples ida y vuelta que siguen respetando las peticiones de TCC en el dispositivo. Rohit añadió que los datos enviados a apps de terceros a través de Siri se minimizan a justo lo que requiere la consulta.

### 37:50 — [Controles MDM de Siri](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=2270>)

**P.** ¿Tendrá Siri nuevas políticas MDM configurables?

Dan confirmó que sí: los controles MDM existentes para Siri siguen vigentes, y animó a las empresas a enviar Feedback con necesidades de configuración específicas. Señaló la nueva función de cambio automático de contraseñas de Safari como especialmente útil para pequeñas empresas sin SSO.

### 38:59 — [Actualizaciones de ITP en Safari](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=2339>)

**P.** ¿Hay nuevas mejoras en Safari Intelligent Tracking Prevention este año?

Katie dijo que Apple sigue invirtiendo en ITP año tras año. No se mencionaron funciones nuevas concretas para esta versión; remitió a los desarrolladores a webkit.org para más detalles.

### 39:53 — [Transmitir confianza](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=2393>)

**P.** ¿Cómo transmites de forma creíble que una app es privada y segura sin que parezca teatro de seguridad?

El panel recomendó etiquetas App Privacy Nutrition Labels precisas, transparencia dentro de la app sobre los datos que almacenas, y articular garantías de privacidad concretas como norte. Dan advirtió contra términos de marketing como «cifrado de grado bancario» y aconsejó apoyarse en experiencias nativas de Apple (passkeys, Sign in with Apple, Accessory Setup Kit). Emily señaló que Apple publica el código fuente de PCC como modelo de transparencia. David enfatizó el uso de cadenas de propósito y pedir permisos de forma contextual en el momento en que aporte valor, no al arrancar la app.

### 47:59 — [Puntos de partida profesional](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=2879>)

**P.** Como estudiante de ciberseguridad, ¿qué frameworks y conceptos de Apple debería aprender primero?

Dan recomendó empezar por la Apple Platform Security Guide y el blog security.apple.com (posts sobre Memory Integrity Enforcement, iMessage PQ3 y asignación de memoria del kernel), junto con el programa de bug bounty. Yosh añadió que para trabajo de bajo nivel conviene aprender explotación de binarios e ingeniería inversa; para redes, aprender cómo funcionan realmente TLS e internet — la seguridad se reduce a entender en profundidad cómo funcionan los sistemas.

### 50:34 — [Ciclo de vida de las passkeys](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=3034>)

**P.** ¿Cómo gestiona Apple las passkeys obsoletas, revocadas o inválidas en la app Contraseñas?

David señaló el nuevo Signal API, que permite a las partes que confían notificar al sistema operativo que las credenciales han cambiado para que las actualizaciones se reflejen. Las passkeys evolucionan a través de un organismo de estándares entre empresas en el que Apple participa.

### 51:44 — [Secretos en memoria](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=3104>)

**P.** En macOS, ¿deben los desarrolladores cifrar los secretos en RAM o las protecciones de la plataforma son suficientes?

Yosh dijo que hay que empezar con Hardened Runtime, que impide que otros procesos y depuradores lean tu memoria. Para secretos de corta duración, destruirlos supera al cifrado: borra los tokens una vez usados. Dan añadió que CryptoKit pone a cero la memoria de respaldo de las claves, algo que el runtime de Swift no garantiza por sí solo, y que las claves pueden vincularse al Secure Enclave para que no sean exportables aunque la app se vea comprometida.

### 55:41 — [Equilibrio en la telemetría](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=3341>)

**P.** ¿Cómo equilibras la telemetría de desarrollo útil con la privacidad del usuario?

Katie lo enmarcó en torno a los pilares de privacidad de Apple: data minimization (¿necesitas marcas de tiempo precisas o puedes agregar?), procesado en el dispositivo, transparencia y control, y seguridad de lo que sí recopilas. Rohit advirtió que incluso series temporales sin agregar pueden revelar patrones de comportamiento (p. ej. la telemetría de alarmas puede delatar la hora de despertar) y señaló que la minimización también ahorra ancho de banda. Dan subrayó que las exclusiones voluntarias de los usuarios deben aplicarse técnicamente y que borrar datos es en sí mismo un control de seguridad.

---

## Destacados

- PCC aplica dos attestations de dos fabricantes de hardware independientes por nodo, con un Virtual Research Environment público elegible para el Apple Security Bounty.
- Usa las Data Protection classes de Keychain (p. ej. solo-cuando-desbloqueado, ACL biométrica) junto con los valores cifrados de CKRecord para la sincronización de CloudKit con cifrado de extremo a extremo bajo Advanced Data Protection.
- Adopta passkeys desde el primer día — combínalos con el nuevo Signal API para notificar a las partes dependientes de los cambios en el ciclo de vida de las credenciales.
- En macOS, activa Hardened Runtime y usa CryptoKit (que pone a cero la memoria de claves); vincula las claves al Secure Enclave para que no sean exportables.
- Network framework usa por defecto conjuntos de cifrado post-quantum TLS en iOS 26 sin necesidad de cambios en el código.
- Usa out-of-process pickers, Accessory Setup Kit y cadenas de propósito contextuales en lugar de solicitudes de permisos amplias desde el principio; declara todos los datos recopilados —incluidos los gestionados por procesadores externos— en las App Privacy Nutrition Labels.
- Recursos: Apple Platform Security Guide, blog security.apple.com, guía de seguridad de PCC en apple.com, y la sesión de WWDC sobre cómo proteger las funciones agénticas.

---

## Sesiones relacionadas

- [Secure your app: mitigate risks to agentic features](<https://developer.apple.com/videos/play/wwdc2026/347/>) (Protege tu app: mitiga los riesgos en las funciones agénticas)

---
