# SwiftData Group Lab

> WWDC26 · Sesión 8017 · [Ver vídeo completo](https://developer.apple.com/videos/play/wwdc2026/8017/)

---

## Acerca de

Únete a nosotros online para profundizar en el WWDC26 con ingenieros y diseñadores de Apple, donde podrás hacer preguntas, recibir consejos y seguir el debate sobre los anuncios más importantes de SwiftData de la semana. Sesión en inglés.

Kurt, del equipo de Apple developer relations, presenta a los ingenieros de SwiftData Rishi, David, Thomas y Ben en el último Group Lab del WWDC26. El panel cubre las nuevas funciones como ResultsObserver, HistoryObserver y el nuevo atributo Codable, además de buenas prácticas sobre CloudKit sync, migraciones, concurrencia y rendimiento.

---

## Q&A

### 2:53 — [SwiftData con Widgets](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=173>)

**P.** ¿Cómo se debe usar SwiftData con widgets y App Intents, y hay código de ejemplo?

Designa un proceso (normalmente la app principal) como propietario que realice las migraciones, y haz que los widgets y las extensiones lean y escriban en la misma base de datos a través de un group container. No incluyas el plan de migración en los widgets — deja que fallen y pidan al usuario que abra la app. La app Sample Trips muestra cómo configurar los widgets.

### 4:47 — [Conjuntos de datos grandes](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=287>)

**P.** ¿Cómo deben afrontar los desarrolladores los conjuntos de datos grandes en SwiftData?

Indexa correctamente, limita las búsquedas con predicados y límites de fetch, y usa el atributo external storage para blobs grandes. Para la ingesta, inserta en lotes con ModelContext de vida corta. Usa el instrumento de hitches de SwiftUI y el instrumento de persistencia para ver qué se está recuperando realmente.

### 7:30 — [Prácticas con datos de muestra](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=450>)

**P.** ¿Cuál es la mejor práctica para crear datos de muestra: preview traits, stores en memoria u otra cosa?

Los preview traits funcionan bien y permiten sembrar datos expresivos que también puedes consultar dentro de las previews. Más allá de las previews, mantén un corpus de versiones antiguas del store para probar migraciones con cada modelo publicado. Las herramientas agénticas también son útiles para generar instancias de modelo de muestra.

### 9:52 — [ResultsObserver vs Query](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=592>)

**P.** ¿Cuándo debe un desarrollador elegir ResultsObserver en lugar de @Query, y cuáles son los compromisos?

ResultsObserver es el equivalente de @Query para uso fuera de las vistas de SwiftUI (por ejemplo, en view models). El rendimiento es el mismo internamente; la diferencia está en la integración con el ciclo de vida. HistoryObserver, en cambio, rastrea los cambios de todo el store desde un punto en el tiempo, lo que resulta útil para la replicación. ResultsObserver también se combina bien con UIKit/AppKit a través de objetos observables.

### 13:31 — [Agregados sin NSExpression](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=811>)

**P.** Core Data tenía NSExpression para sumas, medias, mínimos/máximos directamente en SQL, ¿cuál es el equivalente en SwiftData sin cargar todo en RAM?

Las expresiones de Swift aún no cubren todos los casos de agregados; el mínimo/máximo se puede hacer con un fetch limit más un sort descriptor. Envía feedback describiendo el caso de uso para que la API se diseñe en torno a problemas reales. Como solución alternativa, usa la coexistencia: apunta un stack de Core Data al mismo store para acceder a las funcionalidades que faltan.

### 15:16 — [Inicialización de modelos sin opcionales](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=916>)

**P.** Al usar SwiftUI con SwiftData, ¿cómo se gestionan las vistas que requieren que exista un modelo con atributos no opcionales?

Si el modelo tiene propiedades no opcionales, defínelas en el inicializador. Para las vistas que necesitan un único objeto existente, recupéralo en una vista padre a través del ModelContext con un fetch limit de 1 e instancia la subvista solo cuando el modelo exista — sacar esa lógica fuera del cuerpo de la vista resulta más limpio que consultar un array de un solo elemento.

### 18:53 — [Añadir app group más tarde](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=1133>)

**P.** Si una app se publicó sin un app group ni un esquema versionado, ¿se pueden introducir más tarde sin perder los datos existentes?

Sí — añade un esquema versionado comenzando por el estado actual como versión uno. Mover a un group container crea un directorio nuevo, así que debes copiar los datos de la URL del contenedor antiguo a la nueva. La configuración de modelo por defecto mueve el store automáticamente; las URL personalizadas requieren migración manual.

### 21:17 — [App group con CloudKit](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=1277>)

**P.** ¿Cómo interactúa el uso de un app group para el store local de SwiftData con los entornos de desarrollo y producción de CloudKit?

Cada app que lea del group container debe tener el entitlement de CloudKit correspondiente, ya que cada una sincronizará por su cuenta. Si los widgets no deben sincronizar, divide en dos configuraciones de modelo: un store de sincronización en el app group y otro separado solo local, para que las extensiones no lleven el entitlement de CloudKit.

### 23:27 — [Evolución del esquema en desarrollo](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=1407>)

**P.** Al evolucionar el esquema en desarrollo con varias apps que escriben en un mismo store de CloudKit, ¿cómo se evitan duplicados y conflictos?

Mantén el esquema alineado entre todas las apps para que no ejecuten migraciones en competencia. Usa el entorno de desarrollo para aprender y luego publica el esquema en producción desde todas las apps para que puedan sincronizar contra el esquema de producción.

### 25:20 — [Contar objetos](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=1520>)

**P.** ¿Cuál es la forma más eficiente de contar objetos de SwiftData sin recuperarlos por completo, y cuándo conviene cachear fuera de @Query?

Usa <span class="high">fetchCount</span> en el ModelContext (y <span class="high">fetchIdentifiers</span> cuando solo necesites IDs). @Query internamente hace un fetch normal, pero el ciclo de vida de las vistas de SwiftUI puede relanzar fetches más de lo necesario — usa los instrumentos de SwiftUI y de persistencia para diagnosticar, divide las vistas en subvistas más pequeñas, o usa ResultsObserver/HistoryObserver para tomar el control manual.

### 30:18 — [Latencia de sincronización de CloudKit](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=1818>)

**P.** ¿Cómo puedo hacer que la sincronización de SwiftData con CloudKit sea lo más rápida posible cuando veo grandes retrasos entre dispositivos?

Comprueba primero los entitlements — las discrepancias entre debug y release son habituales. Ten en cuenta que los relojes y los dispositivos con throttling térmico sincronizan con menos agresividad, y las notificaciones push perdidas pueden generar retrasos. Poner la app en segundo plano activa una sincronización más agresiva. Cuidado con AutoSave: pulsar Stop en Xcode mata el proceso antes de que AutoSave se dispare, por lo que los cambios no se persisten. Toma sysdiagnoses y envía feedback cuando surjan problemas.

### 34:20 — [Almacenar enumeraciones](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=2060>)

**P.** ¿Cuál es la mejor forma de almacenar enumeraciones con valores asociados, incluidas las Codable, en SwiftData?

Aplica el nuevo flag <span class="high">.codable</span> en el macro @Attribute para persistir tipos Codable, incluidos los que tienen codificación personalizada o compleja. El inconveniente es que los datos se vuelven opacos para los predicados y la ordenación — si necesitas consultar por ese valor, modela la enumeración como entidades propias de SwiftData con una relación y expón un accesor de enumeración sobre ellas.

### 41:03 — [Múltiples ModelContext](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=2463>)

**P.** ¿Cuáles son las mejores prácticas para usar múltiples ModelContext, y cuándo conviene repartir el trabajo entre ellos?

Los cambios acumulados de cada contexto se convierten en una sola transacción, así que agrupa el trabajo en transacciones coherentes. Minimiza la coordinación entre contextos — serializa el trabajo (ley de Amdahl). En iPhone, iPad y Watch, la IO de NAND es el cuello de botella; más concurrencia suele significar más memoria e IO sin mayor velocidad. El WAL de SQLite permite muchos lectores y un escritor; el framework limita el pool de conexiones en torno a dos o tres operaciones concurrentes.

### 48:58 — [Heurísticas de paginación](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=2938>)

**P.** ¿Cómo sé cuándo paginar consultas en lugar de recuperar todos los registros?

Perfila con Instruments — si aparecen hitches o estás cargando objetos que nunca muestras, define fetch limits con solo lo que la vista muestra. Combínalo con los lazy stacks de SwiftUI: añade una vista de progreso al final cuyo <span class="high">onAppear</span> dispare la carga de la siguiente página.

### 50:18 — [SwiftData con backend en la nube](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=3018>)

**P.** ¿Es un antipatrón combinar SwiftData con un backend en la nube que no sea CloudKit (como Firestore) más un espejo JSON local?

No — implementa un custom data store sobre tu JSON existente (según la charla anterior de Lovina sobre stores personalizados) o mueve los datos a SwiftData y usa HistoryObserver para saber qué enviar al backend. Usar SwiftData como caché local mientras sincronizas manualmente con un backend es un patrón habitual y soportado.

### 53:33 — [Detectar migraciones necesarias](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=3213>)

**P.** ¿Cómo sabes si se necesita una migración de base de datos, por ejemplo, para mostrar una pantalla de carga o bloquear el acceso de los widgets durante la migración?

Cargar un esquema no versionado desde un widget fallará con error, lo que indica que se necesita migración — dirige al usuario a abrir la app principal y escribe la versión migrada en UserDefaults para que el widget sepa qué versión abrir después. Para mostrar el progreso en la UI, sobreescribe el handler <span class="high">didMigrate</span> en los MigrationStage personalizados para contar las etapas completadas. Envía feedback si quieres integración con Foundation Progress.

### 57:29 — [Consultas agrupadas](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=3449>)

**P.** ¿Cuál es la mejor forma de agrupar los resultados de una consulta por una propiedad y mostrarlos en secciones?

Tanto @Query como ResultsObserver admiten ahora <span class="high">sectionBy</span> con un key path a una propiedad persistida, por lo que SwiftData calcula la división en secciones por ti. La charla «Novedades» de Thomas y Sample Trips muestran el patrón.

### 58:48 — [Concurrencia con ModelActor](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=3528>)

**P.** ¿Cómo se debe gestionar la concurrencia cuando un ModelActor necesita devolver datos del modelo?

Los modelos son tipos por referencia y no son Sendable, así que extrae los datos que necesitas — identificadores persistentes, deltas en un struct o diccionario — y pasa copias a través del límite del actor. Evita pasar grafos parciales de relaciones, ya que el receptor no tendrá el grafo de objetos completo y eso genera bugs sutiles.

---

## Destacados

- El nuevo ResultsObserver lleva las consultas observables estilo @Query fuera de las vistas SwiftUI; HistoryObserver rastrea los cambios del store desde un punto en el tiempo, con filtrado por autor para ignorar tus propias escrituras remotas.
- La nueva marca <span class="high">@Attribute(.codable)</span> permite almacenar tipos Codable que antes no eran persistibles (incluidos enums con valores asociados y tipos como <span class="high">Measurement</span>) — a costa de ser opacos para predicados y ordenación.
- @Query y ResultsObserver admiten ahora <span class="high">sectionBy</span> mediante un key path para resultados agrupados.
- Usa <span class="high">fetchCount</span> y <span class="high">fetchIdentifiers</span> en ModelContext para evitar hidratar modelos completos; combínalos con los Instruments de SwiftUI y persistencia para detectar refetches innecesarios.
- En configuraciones multiproceso (widgets, App Intents), asigna a un solo proceso la propiedad de las migraciones, omite el plan de migración en las extensiones y comparte mediante un group container — consulta Sample Trips.
- Sesiones relacionadas: «Code Along: Add Persistence with SwiftData» de Matthew Turk, «Novedades en SwiftData» de Thomas, una charla de SwiftUI en AppKit por David Nadoba, y la charla de Ren sobre lazy stacks.

---

## Sesiones relacionadas

- [Code-along: Add persistence with SwiftData](<https://developer.apple.com/videos/play/wwdc2026/275/>) (Code-along: Añade persistencia con SwiftData)
- [What’s new in SwiftData](<https://developer.apple.com/videos/play/wwdc2026/274/>) (Novedades en SwiftData)
- [Use SwiftUI with AppKit and UIKit](<https://developer.apple.com/videos/play/wwdc2026/272/>) (Usa SwiftUI con AppKit y UIKit)
- [Create a custom data store with SwiftData](<https://developer.apple.com/videos/play/wwdc2024/10138/>) (Crea un custom data store con SwiftData)
- [Dive into lazy stacks and scrolling with SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/321/>) (Profundiza en lazy stacks y scroll con SwiftUI)

---
