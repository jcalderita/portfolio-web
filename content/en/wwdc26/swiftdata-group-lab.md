# SwiftData Group Lab

> WWDC26 · Session 8017 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8017/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest SwiftData announcements. Conducted in English.

Kurt from Apple developer relations hosts SwiftData engineers Rishi, David, Thomas, and Ben for the final WWDC26 Group Lab. The panel covers new features like ResultsObserver, HistoryObserver, and the new Codable attribute, plus best practices around CloudKit sync, migrations, concurrency, and performance.

---

## Q&A

### 2:53 — [SwiftData With Widgets](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=173>)

**Q.** How should SwiftData be used with widgets and app intents, and is there sample code?

Designate one process (usually the main app) as the owner that performs migrations, and have widgets/extensions read and write to the same database through a group container. Don't include the migration plan in widgets — let them error out and prompt users to open the app. The Sample Trips app demonstrates the widget setup.

### 4:47 — [Large Data Sets](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=287>)

**Q.** How should developers approach large data sets in SwiftData?

Index correctly, limit fetches with predicates and fetch limits, and use the external storage attribute for big blobs. For ingestion, batch inserts with short-lived model contexts. Use the SwiftUI hitches instrument and the persistence instrument to see what's actually being fetched.

### 7:30 — [Sample Data Practices](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=450>)

**Q.** What's the best practice for creating sample data — preview traits, in-memory stores, or something else?

Preview traits work well and let you seed expressive data that you can also query inside previews. Beyond previews, maintain a corpus of older store versions to test migrations across every shipped model. Agentic tools are also useful for generating sample model instances.

### 9:52 — [ResultsObserver vs Query](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=592>)

**Q.** When should a developer pick ResultsObserver over @Query, and what are the trade-offs?

ResultsObserver is the equivalent of @Query for use outside SwiftUI views (e.g. in view models). Performance is the same under the hood; the difference is lifecycle integration. HistoryObserver instead tracks store-wide changes from a point in time, useful for replication. ResultsObserver also pairs well with UIKit/AppKit via observable objects.

### 13:31 — [Aggregates Without NSExpression](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=811>)

**Q.** Core Data had NSExpression for sums, averages, min/max directly in SQL — what's the SwiftData equivalent without loading everything into RAM?

Swift expressions don't yet cover all aggregate cases; min/max can be done with a fetch limit plus a sort descriptor. File feedback describing the use case so the API can be designed around real problems. As a workaround, use coexistence — point a Core Data stack at the same store to reach the missing features.

### 15:16 — [Non-Optional Model Init](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=916>)

**Q.** When using SwiftUI with SwiftData, how do you handle views that require a model with non-optional attributes to exist?

If the model has non-optional properties, set them in the initializer. For views that need a single existing object, fetch it in a parent view via the model context with a fetch limit of 1 and only instantiate the subview when the model exists — moving that logic out of the view body keeps things cleaner than querying for a one-element array.

### 18:53 — [Adding App Group Later](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=1133>)

**Q.** If an app shipped without an app group or version schema, can you introduce them later without losing existing data?

Yes — add a versioned schema starting with the current state as version one. Moving to a group container creates a new directory, so you must copy the data from the old container URL to the new one. The default model configuration moves the store automatically; custom URLs require manual migration.

### 21:17 — [App Group With CloudKit](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=1277>)

**Q.** How does using an app group for the SwiftData local store interact with CloudKit dev/production environments?

Every app reading from the group container must hold the matching CloudKit entitlement, since each will sync on its own. If widgets shouldn't sync, split into two model configurations — one syncing store in the app group and a separate one for local-only sharing — so extensions don't carry the CloudKit entitlement.

### 23:27 — [Schema Evolution In Dev](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=1407>)

**Q.** When evolving the schema in development across multiple apps writing to one CloudKit store, how do you avoid duplicates and conflicts?

Keep the schema aligned across all apps so they don't run competing migrations. Use the development environment to learn, then push the schema to production from all apps so they can sync against the production schema.

### 25:20 — [Counting Objects](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=1520>)

**Q.** What's the most performant way to count SwiftData objects without fully fetching them, and when should you cache outside @Query?

Use <span class="high">fetchCount</span> on the model context (and <span class="high">fetchIdentifiers</span> when you only need IDs). @Query under the hood does a normal fetch, but SwiftUI's view lifecycle can refetch more than needed — use the SwiftUI and persistence instruments to diagnose, break views into smaller subviews, or use ResultsObserver/HistoryObserver to take manual control.

### 30:18 — [CloudKit Sync Latency](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=1818>)

**Q.** How can I make SwiftData+CloudKit sync as fast as possible when seeing long lags between devices?

Check entitlements first — debug/release mismatches are common. Be aware that watches and thermally throttled devices sync less aggressively, and missed push notifications can delay things. Backgrounding the app triggers more aggressive sync. Watch out for AutoSave: hitting Stop in Xcode kills the process before AutoSave fires, so changes never persist. Grab sysdiagnoses and file feedback when issues occur.

### 34:20 — [Storing Enums](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=2060>)

**Q.** What's the best way to store enums with associated values, including Codable ones, in SwiftData?

Apply the new <span class="high">.codable</span> flag on the @Attribute macro to persist Codable types, including those with custom or complex coding. The downside is the data becomes opaque to predicates and sorting — if you need to query by it, model the enum as proper SwiftData entities with a relationship and expose an enum accessor on top.

### 41:03 — [Multiple Model Contexts](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=2463>)

**Q.** What are the best practices for using multiple model contexts, and when should you split work across them?

Each context's accumulated changes become one transaction, so chunk work into coherent transactions. Minimize cross-context coordination — it serializes work (Amdahl's law). On iPhone/iPad/Watch, NAND IO is the bottleneck; more concurrency typically means more memory and IO without faster results. SQLite's WAL allows many readers plus one writer; the framework throttles connection pooling around 2–3 concurrent operations.

### 48:58 — [Pagination Heuristics](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=2938>)

**Q.** How do I know when to paginate queries instead of fetching all records?

Profile with Instruments — if hitches appear or you're loading objects you never display, set fetch limits to only what the view shows. Combine with SwiftUI lazy stacks: append a trailing progress view whose <span class="high">onAppear</span> triggers loading the next page.

### 50:18 — [SwiftData With Cloud Backend](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=3018>)

**Q.** Is combining SwiftData with a non-CloudKit cloud backend (like Firestore) plus a local JSON mirror an anti-pattern?

No — either implement a custom data store over your existing JSON (per Lovina's earlier talk on custom stores) or move data into SwiftData and use HistoryObserver to know what to push to the backend. Using SwiftData as a local cache while syncing manually to a backend is a common, supported pattern.

### 53:33 — [Detecting Required Migration](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=3213>)

**Q.** How do you know if a database migration is required, e.g. to show a loading screen or block widget access during one?

Loading an unversioned schema from a widget will error out, signaling that migration is needed — direct the user to open the main app, and write the migrated version into UserDefaults so the widget knows which version to open next. For progress UI, override the <span class="high">didMigrate</span> handler on custom migration stages to count completed stages. File feedback if you want Foundation Progress integration.

### 57:29 — [Grouped Queries](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=3449>)

**Q.** What's the best way to group query results by a property and display them in sections?

@Query and ResultsObserver both now support <span class="high">sectionBy</span> with a key path to a persisted property, so SwiftData computes the section breakdown for you. Thomas's What's New talk and Sample Trips demonstrate the pattern.

### 58:48 — [Model Actor Concurrency](<https://developer.apple.com/videos/play/wwdc2026/8017/?time=3528>)

**Q.** How should concurrency be handled when a ModelActor needs to return model data?

Models are reference types and not Sendable, so extract the data you need — persistent identifiers, deltas in a struct or dictionary — and pass copies across the actor boundary. Avoid passing partial graphs of relationships, since the receiver won't have the full object graph and that creates subtle bugs.

---

## Highlights

- New ResultsObserver brings @Query-style observable fetches outside SwiftUI views; HistoryObserver tracks store changes from a point in time, with author filtering to ignore your own remote writes.
- New <span class="high">@Attribute(.codable)</span> flag lets previously unpersistable Codable types (including enums with associated values and types like <span class="high">Measurement</span>) be stored — at the cost of being opaque to predicates and sorting.
- @Query and ResultsObserver now support <span class="high">sectionBy</span> via a key path for grouped results.
- Use <span class="high">fetchCount</span> and <span class="high">fetchIdentifiers</span> on ModelContext to avoid hydrating full models; pair with the SwiftUI and persistence Instruments to find unnecessary refetches.
- For multi-process setups (widgets, App Intents), give one process ownership of migrations, omit the migration plan from extensions, and share via a group container — see Sample Trips.
- Referenced sessions: Matthew Turk's 'Code Along: Add Persistence with SwiftData', Thomas's 'What's New in SwiftData', a SwiftUI-in-AppKit talk by David Nadoba, and Ren's talk on lazy stacks.

---

## Related sessions

- [Code-along: Add persistence with SwiftData](<https://developer.apple.com/videos/play/wwdc2026/275/>)
- [What’s new in SwiftData](<https://developer.apple.com/videos/play/wwdc2026/274/>)
- [Use SwiftUI with AppKit and UIKit](<https://developer.apple.com/videos/play/wwdc2026/272/>)
- [Create a custom data store with SwiftData](<https://developer.apple.com/videos/play/wwdc2024/10138/>)
- [Dive into lazy stacks and scrolling with SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/321/>)

---

