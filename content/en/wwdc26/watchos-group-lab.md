# watchOS Group Lab

> WWDC26 · Session 8014 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8014/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest watchOS announcements. Conducted in English.

Leah from Worldwide Developer Relations hosts a watchOS Group Lab with engineers Dan (workout team), Anne (Watch frameworks), Devin (widgets and Live Activities), and Matthew (system spaces). The panel fields questions about watchOS 27, covering Foundation Models, Liquid Glass, widgets, HealthKit, and platform fundamentals.

---

## Q&A

### 2:49 — [Foundation Models Runtime](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=169>)

**Q.** Where does the Foundation Models framework execute on Apple Watch — on the paired iPhone, or via Private Cloud Compute?

Anne explained Foundation Models on watch do not require the paired iPhone but do require a network connection. Calls go to PCC (which needs an entitlement) or to any LanguageModel-conforming provider; Claude and Gemini support is coming. There is no on-device model on the watch itself.

### 9:01 — [PCC vs iPhone Model](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=541>)

**Q.** Can the watch reuse the iPhone's on-device model over Bluetooth or local network, or does it always go to PCC?

Anne confirmed it never falls back to the iPhone's on-device model. Every call is a network hop to PCC or another LanguageModel provider, so developers should account for latency and be intentional about call frequency.

### 10:20 — [iOS-to-watchOS Transition](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=620>)

**Q.** What architectural paradigms or pitfalls should an iOS developer know when handling heavy off-main-thread work like CloudKit sync on watchOS?

Matthew said most familiar APIs — NSURLSession, CloudKit, Swift concurrency, SwiftUI — work on watch, but watchdog timeouts are strict to protect battery and shared runtime. Anne and Dan added that the lower core count rewards being deliberate about scheduled work, and that watch apps deserve a fresh design pass rather than a port (see "Design and build apps with watchOS"). Devin noted widget runtime is comparable to iOS, and lock-screen widgets often work with minor layout tweaks; Smart Stack relevance is a key differentiator.

### 19:08 — [Debug Loop Performance](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=1148>)

**Q.** How can developers speed up on-device watchOS debug cycles, Xcode install delays, and the initial symbol sync?

Anne urged installing Xcode 27 — the team has invested heavily in install speed and added diagnostics; file feedback with logs if issues remain. Matthew highlighted Device Hub's direct Mac-to-watch connection (no phone proxy), the need for a network that allows peer device discovery, and the 5GHz Wi-Fi on newer Apple Watch hardware as throughput wins.

### 23:26 — [Favorite watchOS 27 Features](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=1406>)

**Q.** What are the panel's favorite new features in watchOS 27?

Dan picked Workout Buddy and the new workout insights. Anne called out Foundation Models on watch and updating widgets via Watch Connectivity. Devin highlighted widget performance and reliability work plus new Smart Stack suggestions including holiday surprises. Matthew teased upcoming Siri intelligence work, and Leah added the HealthKit additions: Heart Rate Zones, cycling Power Zones, and the Perimenopause/Menopause API.

### 27:17 — [SceneKit Replacement](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=1637>)

**Q.** With SceneKit deprecated on watchOS 26 and RealityKit unavailable, what is the recommended way to render 3D graphics on watchOS?

Matthew said SceneKit is deprecated but still usable; the forward path on watch is SwiftUI, specifically SwiftUI Canvas, which Anne noted is GPU-accelerated. If you hit gaps, contact DTS, post on the forums, and file feedback.

### 29:19 — [Underused Watch Capabilities](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=1759>)

**Q.** What capabilities might developers not realize they have on Apple Watch that would justify extending their app — e.g., using the watch as a visionOS tennis racket peripheral?

Dan pointed at Core Motion sensor data as an under-explored input for novel experiences. Matthew and Devin emphasized proactive surfaces — Live Activities, Smart Stack suggestions, and relevant widgets tied to time, location, or semantic context (home, work). Devin warned against camping in the top Smart Stack slot too long; Matthew cited the Sports app calibrating alert cadence per sport as a model for judicious Live Activity updates.

### 37:46 — [Liquid Glass on watchOS](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=2266>)

**Q.** What is new with Liquid Glass specifically on watchOS 27?

Matthew described refinements after watchOS 26: darker speculars on edges, better content separation while scrolling for legibility, performance improvements, and interactive glass throughout the system. Most apps adopting the watchOS 10 design language get the updates automatically. There is no per-user clear/tinted slider on watch — the dark UI and small display made the team confident in a single tuned balance — but accessibility options like reduce transparency and increase contrast are available.

### 45:54 — [Widget Refresh Budgets](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=2754>)

**Q.** Does watchOS 27 change guidance for how often widgets/complications can refresh — is ~50 updates/day still the rule, regardless of background refresh or APNs?

Devin said no major guidance change: expect roughly 15–20 minute refreshes for actively used widgets, with watch-face widgets at the top of the budget tier and Smart Stack widgets scaled to how often the user views them. Refreshes can come from app-side invalidation, timeline reload policies, APNs pushes (added in watchOS 26), and now Watch Connectivity (new this year). Matthew framed widget vs. relevant widget vs. Live Activity vs. Control as picking the right tool for the data model; see the WidgetKit foundations session and the "Keeping your widget up to date" article.

### 54:29 — [Standalone First-Launch Sync](<https://developer.apple.com/videos/play/wwdc2026/8014/?time=3269>)

**Q.** What are best practices for a standalone watch app fetching heavy assets on first launch without relying on Watch Connectivity?

Anne recommended bundling whatever you can so first launch shows something useful immediately, then using Background URL Session for the rest — avoid a spinner-only first run. Matthew added that crafting a UX that masks the download is the core watch design challenge. Anne also reminded developers to handle the fully offline case (Ultra users in the backcountry) gracefully.

---

## Highlights

- Foundation Models on watchOS always go over the network — PCC (entitlement required) or any LanguageModel-conforming provider; no on-device model and no fallback to the paired iPhone's model.
- Device Hub in Xcode 27 connects Mac directly to watch (no phone proxy); newer Apple Watch hardware has 5GHz Wi-Fi for faster install/debug cycles — file feedback if issues persist.
- SceneKit is deprecated on watch; migrate to SwiftUI Canvas (GPU-accelerated) for 2D/3D drawing.
- New in watchOS 27: widget updates via Watch Connectivity, the Reorderable SwiftUI API (first time devs can reorder containers on watchOS), Workout Buddy insights, and HealthKit Heart Rate/Power Zones plus Perimenopause/Menopause APIs.
- Liquid Glass refinements: darker edge speculars, better scroll-content separation, interactive glass; apps using the watchOS 10 design language get it automatically — no user clear/tinted slider on watch.
- Match the widget tool to the data shape: timeline (weather, calendar), relevant widget (time/place-bound), Live Activity (sessions like games/rides), Control (quick actions). See the WidgetKit foundations and Live Activities fundamentals sessions, plus the "Keeping your widget up to date" article.

---

## Related sessions

- [Live Activities essentials](<https://developer.apple.com/videos/play/wwdc2026/223/>)
- [WidgetKit foundations](<https://developer.apple.com/videos/play/wwdc2026/277/>)
- [Bring your Live Activity to Apple Watch](<https://developer.apple.com/videos/play/wwdc2024/10068/>)
- [What’s new in SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/269/>)
- [What’s new in the Foundation Models framework](<https://developer.apple.com/videos/play/wwdc2026/241/>)

---
