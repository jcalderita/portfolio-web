# Swift Group Lab

> WWDC26 · Session 8001 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8001/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest Swift announcements. Conducted in English.

Angelica from Developer Relations hosts the Swift Group Lab with panelists Holly (Swift language, generics, concurrency), Corey (Swift Server/networking), Tony (Foundation, Standard Library), and Doug (Swift Language team). They field developer questions on Swift 6.3/6.4 features, concurrency, performance, and language design.

---

## Q&A

### 4:24 — [Transferring Non-Sendable Data](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=264>)

**Q.** How do you transfer ownership of non-sendable data from one isolation domain (e.g. actor) to another without copying?

Holly explained that region-based isolation lets the compiler transfer non-sendable values when the originating actor no longer accesses them. The <span class="high">sending</span> keyword annotates parameters or returns explicitly, and an active forum pitch (currently called <span class="high">disconnected</span>) proposes a stored-value type to preserve this transferability across storage.

### 6:07 — [Structured Concurrency Tips](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=367>)

**Q.** What advice and pitfalls should developers keep in mind when adopting Swift's structured concurrency?

Corey advised leaning fully into structure: avoid unstructured <span class="high">Task</span>/<span class="high">Task.detached</span>, prefer task groups with lexical-scope lifetimes, write linear A-then-B-then-C recipes, and use fan-out/fan-in only via task groups. He highlighted cancellation shields plus <span class="high">async defer</span> for safe async cleanup, while Doug and Holly added that non-sendable types help reason about linear flow and that <span class="high">~Sendable</span> (Swift 6.4) is a nicer way to opt out than unavailable conformances. Tony warned against rushing to <span class="high">@unchecked Sendable</span> just to silence the compiler.

### 12:00 — [Conformance Overhead](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=720>)

**Q.** Is there a cost to adding unused conformances like Sendable, Equatable, Hashable, Identifiable or Comparable to every struct?

Doug said Equatable/Hashable conformances carry code (equality/hash functions) that the compiler retains because runtime casts like <span class="high">as? any Equatable</span> can discover them, so they have real cost. Sendable is just a compile-time tag with no runtime representation. Generic operator overloads can also slow type-checking, and Tony added that conformances should be semantically meaningful, not added reflexively.

### 14:36 — [@MainActor Contagion](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=876>)

**Q.** How do you stop @MainActor from cascading async refactors through a legacy codebase while keeping Swift 6 safety?

Holly suggested using <span class="high">main actor by default</span> mode when most of a module belongs on the main actor, then explicitly annotating offloaded code. Otherwise, start at leaf types and work outward, mark methods that don't touch mutable state as <span class="high">nonisolated</span>, and convert stale <span class="high">static var</span> into immutable state where possible. She pointed to the 2024 'Migrate your app to Swift 6' code-along session.

### 17:23 — [Modern Swift Performance](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1043>)

**Q.** Which modern Swift features and resources should be adopted first for high efficiency and performance?

Tony stressed profiling first using Instruments' flame graph and new top-functions view, then applying modern Swift techniques as shown in last year's Swift performance session by Nate. He highlighted Span, the new UniqueArray (also previewed in Swift Collections), and Embedded Swift focus areas. Corey reminded developers not to forget basic algorithmic Big-O choices.

### 19:59 — [Redundant Annotations](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1199>)

**Q.** After a full Swift 6 strict-concurrency migration, should teams remove annotations that are now redundant under the newer isolation model?

Holly said redundant annotations are fine and often valuable as documentation of intent (e.g. <span class="high">nonisolated</span> on extensions, explicit Sendable). Doug agreed, noting comments explaining why help future readers, and Corey added that treating helpers as if they have a contract — even with redundant annotations — is a good habit.

### 23:17 — [UserDefaults Sendability](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1397>)

**Q.** Why isn't UserDefaults marked Sendable even though its docs say it's thread safe?

Tony explained that during Foundation's Sendable audit, classes that could be subclassed into mutable forms (like NSString vs NSMutableString) were left non-Sendable to avoid lying to the compiler. Swift 6.4's <span class="high">~Sendable</span> lets Foundation annotate these more precisely so subclasses can opt in individually, and the standard global <span class="high">UserDefaults</span> does provide a Sendable conformance.

### 25:29 — [Borrow And Mutate Accessors](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1529>)

**Q.** Should developers migrate from get/set to borrow/mutate accessors, and when is it inappropriate?

Doug clarified that <span class="high">borrow</span> and <span class="high">mutate</span> expose references to existing storage, avoiding copies, while <span class="high">get</span>/<span class="high">set</span> produce or consume values and can run arbitrary code. Use borrow/mutate for performance-sensitive accessors that share already-stored data; stick with get/set when the value is computed or when exclusive-access restrictions of mutate would be too constraining.

### 27:15 — [Keeping Up With Features](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1635>)

**Q.** With so many additions (mutex, InlineArray, Span, typed throws, non-copyable types), how do app developers know which features apply to them versus systems/embedded developers, and how do you keep up?

Tony and Doug emphasized progressive disclosure: don't adopt non-copyable types or Span until profiling shows a need. Corey added that engineers have limited hours, so confirm a performance problem actually exists before optimizing. When you do adopt these, keep them isolated to hot paths — Corey noted spans and UniqueArrays on the hottest path typically deliver most of the gain with small changes.

### 31:58 — [Slow Incremental Builds](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=1918>)

**Q.** Our project has slow incremental builds where Swift emit-module takes minutes. Can language features cause this, and how do we diagnose it?

Doug said language features rarely affect overall build perf — usually slow module emission is due to imported module dependencies. Use explicit module builds and Xcode's build timeline to see where time is spent and prune excess dependencies, much like profiling code.

### 33:42 — [Concurrency In Hindsight](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=2022>)

**Q.** With hindsight on Swift 6 concurrency adoption, what would the team design differently today?

Holly said the team would have started with the Swift 6.2 behavior where non-isolated async functions run in the caller's context, instead of the earlier model that hopped to the global concurrent pool. Real-world projects passing non-sendable values produced too many data-race errors and forced excessive Sendable conformances. Doug agreed it's a more approachable, less concurrent-by-default model.

### 37:36 — [SwiftPM Improvements](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=2256>)

**Q.** What notable Swift Package Manager improvements landed in the latest release for build and dependency performance in large multi-package projects?

Holly highlighted that Swift 6.4 unifies SwiftPM in Xcode and on other platforms (VS Code, swift.org toolchains) on the Swift Build system, previewed in 6.3 and on by default in 6.4. This brings shared maintenance, explicit module builds, and better parallelism by splitting module builds into smaller pieces.

### 39:27 — [Hidden Swift Features](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=2367>)

**Q.** What's one Swift feature most developers don't know exists but should?

Corey championed combining <span class="high">@inlinable</span> with <span class="high">@inline(never)</span> for generic cold paths, since <span class="high">@inlinable</span> also unlocks generic specialization and effects propagation. Holly recommended using <span class="high">as</span> type annotations to disambiguate overload resolution. Tony pitched the open-source forums as the feature — even iOS-only developers can shape Foundation, Testing and Swift APIs. Doug championed key paths, and Holly also called out Swiftly for installing experimental toolchains. Corey added the integer overflow APIs that carry an overflow flag through straight-line arithmetic.

### 48:18 — [Tuple Conformances](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=2898>)

**Q.** What's left in language evolution before tuples can conditionally conform to Equatable, Hashable, Comparable, etc.?

Holly said the remaining work is a small evolution of parameter packs: a syntax for tuples whose elements are a parameter pack, and parameterized extensions whose where-clause uses <span class="high">each T: Protocol</span>. An experimental implementation already exists in the compiler, and once finished the older bespoke proposal can be generalized so users can conform tuples to their own protocols too.

### 50:13 — [High-Frequency Sensor Data](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=3013>)

**Q.** What's the recommended Swift 6 pattern to ingest high-frequency sensor data on a background actor and stream updates to a main-actor @Observable model without blocking the UI?

Corey said the answer depends on 'high frequency'; in general, minimize context switches by coalescing and accumulating updates, and accept data loss where the UI doesn't need every sample (SwiftUI's Observable already coalesces). Tony added that heavy work should remain async off the main actor, sending only what the UI needs. Corey pointed to the debounce operator in Swift Async Algorithms.

### 52:57 — [Tuple Vs Struct Returns](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=3177>)

**Q.** Why might returning a tuple from a method be more expensive than returning a struct?

Doug said the compiler 'explodes' tuples into individual elements when passed across function boundaries, while structs are passed as a single entity. For very large tuples this exploding could be less efficient than a struct, but the panel was surprised by the claim and asked the developer to file a GitHub issue with a sample project.

### 54:21 — [Favorite Quality-Of-Life](<https://developer.apple.com/videos/play/wwdc2026/8001/?time=3261>)

**Q.** What's your favorite lesser-known quality-of-life or quality-of-code Swift feature that makes the language fun to write?

Tony pointed to the upcoming Iterable protocols enabling <span class="high">for in</span> over spans while preserving safety. Holly praised bidirectional type inference and Swift's generics diagnostics that surface errors at the generic's definition site. Corey loved Swift's avoidance of mutable shared state, including user-defined copy-on-write types. Tony added that replacing C with Swift feels fluent and safe, and Doug celebrated protocol extensions making generic algorithms feel like ordinary code.

---

## Highlights

- Swift 6.4 introduces <span class="high">~Sendable</span> as a cleaner alternative to unavailable Sendable conformances, and the <span class="high">@diagnose</span> attribute for fine-grained warning control.
- Async defer and cancellation shields are the new structured-concurrency cleanup primitives — pair them for robust async resource teardown.
- SwiftPM in Xcode and swift.org toolchains is now unified on the Swift Build system in 6.4, enabling explicit module builds and better build parallelism by default.
- Performance toolkit highlights: Span, the new UniqueArray (also in Swift Collections), Instruments' flame graph and top-functions view, plus <span class="high">@inlinable</span> + <span class="high">@inline(never)</span> for generic cold paths.
- Profile before adopting non-copyable types or other advanced performance features; keep them isolated to hot paths instead of refactoring whole projects.
- Referenced sessions: 'Migrate your app to Swift 6' (WWDC24), Nate's Swift performance with Instruments session, and the explicit module builds session from ~2 years ago. File issues on GitHub under the SwiftLang org and join forums.swift.org.

---

## Related sessions

- [Migrate your app to Swift 6](<https://developer.apple.com/videos/play/wwdc2024/10169/>)
- [What's new in Swift](<https://developer.apple.com/videos/play/wwdc2020/10170/>)
- [Optimize CPU performance with Instruments](<https://developer.apple.com/videos/play/wwdc2025/308/>)
- [Demystify explicitly built modules](<https://developer.apple.com/videos/play/wwdc2024/10171/>)
- [Migrate to Swift Testing](<https://developer.apple.com/videos/play/wwdc2026/267/>)
- [What’s new in Swift](<https://developer.apple.com/videos/play/wwdc2026/262/>)

---
