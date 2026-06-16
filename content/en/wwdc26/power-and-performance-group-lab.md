# Power and Performance Group Lab

> WWDC26 · Session 8003 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8003/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest power and performance announcements. Conducted in English.

Cole hosts Apple engineers Terry, Yanni, Casper, Kunal, and Marco for a Power and Performance lab covering MetricKit, Instruments, SwiftUI optimization, launch time, thermal handling, and battery diagnosis.

---

## Q&A

### 6:08 — [SwiftUI Beginner Performance](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=368>)

**Q.** As a beginner, which factors most affect SwiftUI app power and performance, and how do I avoid drain and lag?

Separate views from their inputs so redraws only happen when relevant state changes, and lean on the Observable macro for field-level dependency tracking. Profile with the SwiftUI instrument plus Power Profiler to find real bottlenecks rather than assuming SwiftUI is the cause, and reach for Time Profiler for an overall picture first.

### 12:12 — [Common Power Mistakes](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=732>)

**Q.** What's the biggest power pitfall apps make without realizing?

Lack of telemetry and instrumentation, so teams optimize the wrong thing. Also failing to account for varied app state (large databases, thermal conditions, network changes) that only shows up in field data via Xcode Organizer energy logs, not at the desk. Use Condition Inducer to reproduce constrained states.

### 15:18 — [Instruments Documentation](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=918>)

**Q.** Where's the best documentation or written guide for learning Instruments?

Start with the Instruments tutorials written by an Instruments engineer, which include a sample project with built-in performance issues to walk through profiling and fixing hangs. From there, follow the per-tool guides, and file Feedback Assistant requests for missing docs.

### 16:33 — [Instruments Entry Point](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=993>)

**Q.** For a first-time Instruments user, which tool should you start with?

Time Profiler with the Flame Graph view makes it visually obvious which call stacks are costing time. The new Top Functions mode in the call tree also flattens helpers and runtime functions so the biggest offenders surface quickly.

### 17:46 — [High Battery Without BG Work](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=1066>)

**Q.** The app only shows UIKit/SwiftUI screens with little background work, yet Xcode reports high battery. How do I diagnose?

SwiftUI/UIKit compute should show as foreground energy, so background drain points to background tasks, location, or networking running when not foreground. Record a Power Profiler trace in untethered mode while using the app naturally, then open it in Instruments to see per-subsystem energy (CPU, GPU, display, networking).

### 20:10 — [Environment Theme Objects](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=1210>)

**Q.** At what scale does injecting a theme object via the environment into deeply nested atomic components become a bottleneck?

It's very case-by-case and not inherently problematic — the environment is a useful abstraction. Use the SwiftUI instrument to measure downstream invalidation cost in your specific view tree before deciding it's a problem.

### 21:35 — [Large SwiftUI Tables](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=1295>)

**Q.** How do you load hundreds of thousands of records into a SwiftUI table, and how do you track regressions?

First question whether you really need to load that much — use lazy stacks so SwiftUI only realizes visible cells. For regression tracking, use MetricKit's new State Reporting to bucket loads into categories (small/medium/large batch) rather than logging every count, then correlate metrics against those states.

### 25:26 — [BG Tasks Vs Apple Intelligence](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=1526>)

**Q.** How does iOS 27 prioritize background tasks when Apple Intelligence is doing heavy work?

Many Intelligence workloads run on the Neural Engine or Private Cloud Compute, so CPU-bound app work can often run concurrently. Structure background tasks into small, resumable chunks so the system can pause and resume without losing progress. New System Trace views in Instruments now show thread priority and what preempted you.

### 28:14 — [Thread Hopping At Launch](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=1694>)

**Q.** How costly is frequent thread hopping versus blocking, and how should expensive launch work be structured?

Per-hop overhead is negligible unless you're doing thousands per second — blocking the main thread is worse. Defer non-critical work past first frame, use BGAppRefreshTask to pre-warm data, and prioritize background queues below user-facing work. Inspect context switch counts and main-thread blocked states in System Trace, and check Xcode Organizer's launch section for field call stacks.

### 34:13 — [Measuring Launch Time](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2053>)

**Q.** What's the right way to measure app launch time?

Don't roll your own via kernel APIs — that adds overhead. MetricKit and Xcode Organizer measure from the tap on the home screen (before your process exists) to first frame, the same methodology Apple uses for its own apps like Mail.

### 35:48 — [Silent SwiftUI Battery Drain](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2148>)

**Q.** Beyond background tasks, what's the most common silent battery drain in SwiftUI, and how do you catch view over-invalidation?

Over-invalidation is silent because nothing visibly changes while the CPU churns redrawing identical views. Minimize redraws, flatten the view hierarchy, watch dispatched background work feeding views, and cache where possible. Use the SwiftUI instrument to spot the churn.

### 37:44 — [Large Lists On macOS](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2264>)

**Q.** Any improvements or best practices for SwiftUI lists and tables with thousands of items?

Keep cell sizes constant so SwiftUI's caching can work — variable-height cells force cascading recalculations of scroll offsets. Use lazy data structures and do filtering on the model side rather than inside ForEach, so SwiftUI only handles what it must display.

### 39:51 — [AnyView Cost](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2391>)

**Q.** How expensive is AnyView type erasure, and is there a threshold to avoid it?

It adds some creation overhead but isn't worth contorting your architecture to avoid. Treat it as something to revisit if measurement shows it's a problem — instinct often overestimates the cost compared to actual measurements.

### 42:01 — [Lesser-Known New Tools](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2521>)

**Q.** Beyond State Reporting and crash report extensions, what new developer tools deserve attention?

Xcode Organizer's new Metric Goals lets you compare your app's metrics against comparable apps to form a baseline. The Foundation Models instrument is now a full debugging tool showing requests, prompts, and token caching. A new tool in 26.4 profiles long-running Metal apps over hours for FPS outliers, and there's a developer-forum post under the MetricKit tag summarizing everything.

### 45:45 — [WWDC Homework](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2745>)

**Q.** If developers should try one new thing before WWDC ends, what is it?

Look at Metric Goals in Xcode Organizer to compare against similar apps, and adopt State Reporting in MetricKit to slice metrics by application state and pinpoint where to invest.

### 46:50 — [Deep Swift Performance Path](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2810>)

**Q.** Beyond sessions and Swift Evolution, how do you go deep on Swift performance — codebases, compiler internals, books?

Hands-on immersion through Instruments templates is the best teacher. Watch last year's "Optimize CPU performance with Instruments" session covering Time Profiler, CPU Counters, and Processor Trace, and study the Apple Silicon CPU Optimization Guide to understand the hardware your Swift runs on.

### 49:02 — [Escaping Closures In SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=2942>)

**Q.** How do you architect SwiftUI when escaping closure parameters cause over-invalidation but ViewBuilder content isn't always enough?

Call the closure in <span class="high">init</span> rather than <span class="high">body</span> so it doesn't run on every reevaluation, or find an alternate API shape. Bring detailed questions to the SwiftUI group lab.

### 50:34 — [Heavy Assets On Older Devices](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=3034>)

**Q.** How do you keep dynamic data and heavy assets from causing hitches or CPU spikes on older devices?

Right-size assets (don't use a 2000px image for a thumbnail), cache decoded results, and load images off the main thread with placeholders so the UI stays responsive. To approximate older hardware, enable Low Power Mode and use Condition Inducer; supplement with MetricKit and Xcode Organizer field data, and always profile on a physical device — simulator perf reflects the Mac.

### 55:10 — [Thermal Pressure Outdoors](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=3310>)

**Q.** ARKit/Metal app used in direct sunlight hits thermal limits — how to manage thermal pressure?

Subscribe to <span class="high">ProcessInfo.thermalState</span> and degrade gracefully: request lighter network assets, simplify animations and transitions, and lower frame rate or rendering resolution under pressure. The system already throttles some animation/display frame rates in high thermal states, so build on top of that.

### 59:04 — [Many Environment Values](<https://developer.apple.com/videos/play/wwdc2026/8003/?time=3544>)

**Q.** Does injecting many <span class="high">@Environment</span> values across a deep SwiftUI hierarchy hurt rendering or update performance?

Reading environment values is cheap; the cost comes from environment churn — frequently updating environment values forces every reader to re-evaluate. Inspect this with the SwiftUI instrument.

---

## Highlights

- Use Power Profiler in untethered mode to capture real-world traces, then open in Instruments to see per-subsystem energy breakdowns.
- Adopt MetricKit's new Swift-first API with State Reporting to slice metrics by app-defined states (e.g. batch size category).
- Xcode Organizer Metric Goals now compares your app against similar apps for launches, hitches, hangs, and foreground energy.
- Start Instruments learning with Time Profiler + Flame Graph and the official Instruments tutorials; new Top Functions mode flattens call trees.
- Measure launch time with MetricKit/Xcode Organizer (tap-to-first-frame) — don't speculate via kernel APIs.
- Simulate older or constrained hardware with Low Power Mode and Xcode's Condition Inducer; always profile on physical devices, not simulators.
- Foundation Models instrument now exposes prompts, requests, and token caching; a new 26.4 tool profiles long-running Metal apps over hours.

---

## Related sessions

- [Optimize CPU performance with Instruments](<https://developer.apple.com/videos/play/wwdc2025/308/>)
- [Dive into Core AI model authoring and optimization](<https://developer.apple.com/videos/play/wwdc2026/325/>)
- [Profile and optimize your game's memory](<https://developer.apple.com/videos/play/wwdc2022/10106/>)
- [What's new in MetricKit](<https://developer.apple.com/videos/play/wwdc2020/10081/>)
- [Debug and profile agentic app experiences with Instruments](<https://developer.apple.com/videos/play/wwdc2026/243/>)

---
