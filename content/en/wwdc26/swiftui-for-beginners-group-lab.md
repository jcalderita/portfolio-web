# SwiftUI for Beginners Group Lab

> WWDC26 · Session 8002 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8002/)

---

## About

Join us online to ask questions, get advice, and follow the discussion about getting started with SwiftUI. Conducted in English.

Kurt from Worldwide Developer Relations hosts UI Frameworks engineers Gabriel, Jeff, Sam, Sima, and Trevor for a beginner-focused conversation on getting started with SwiftUI, covering language choice, learning paths, state, performance, and AI-assisted coding.

---

## Q&A

### 8:32 — [SwiftUI vs React Native](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=512>)

**Q.** As a beginner, should I pick SwiftUI or a cross-platform framework like React Native?

SwiftUI is tightly integrated with Apple's platforms, so new design language like Liquid Glass and platform behaviors come for free. Cross-platform frameworks tend to land in an awkward middle ground that requires more polish work later, and SwiftUI also benefits from Swift's expressiveness and performance.

### 11:04 — [Learning From Scratch](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=664>)

**Q.** With no coding background, what's the best way to learn to code and build a SwiftUI app?

Pick a small problem in your life or your family's and build an app that solves it — motivation drives learning. Agentic coding in Xcode now lets you iterate quickly, and this year's enhanced Xcode coding skills help produce better experiences.

### 14:59 — [Job-Ready Roadmap](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=899>)

**Q.** What roadmap would you follow to become a job-ready iOS engineer, and which skills should be prioritized?

Start with Swift fundamentals — the type system and concurrency — then move to SwiftUI using the interactive tutorials. Use agentic tools as tutors: ask them to explain code, request code reviews of your own attempts, and dig into CS concepts like networking and storage rather than just generating code.

### 18:58 — [How @State Works](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=1138>)

**Q.** What does @State actually do under the hood, and why can't a normal Swift <span class="high">var</span> hold UI data?

Views are lightweight value-type descriptions that SwiftUI recreates frequently, so a plain <span class="high">var</span> would get thrown away. @State asks SwiftUI to allocate persistent storage tied to the view's identity so the value survives re-evaluations, and the compiler enforces this by erroring if you try to mutate a normal property in <span class="high">body</span>.

### 23:09 — [Web Background To Swift](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=1389>)

**Q.** As a web designer who knows HTML, CSS, JavaScript, PHP, and Lua, how hard is it to pick up Swift and SwiftUI?

Swift's C-like syntax will feel familiar from JavaScript, and SwiftUI's declarative hierarchy maps well to HTML/CSS thinking. Use Xcode Previews and the new Device Hub in Xcode 27 to get web-style live updates while you're learning.

### 27:08 — [Where To Begin](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=1628>)

**Q.** With so many tutorials out there, where should a Java developer actually start learning SwiftUI?

Apple's official SwiftUI tutorials walk you through <span class="high">view body</span>, state, animation, and data flow, and also cover production concerns like data storage. Paul Hudson's Hundred Days of SwiftUI is a great community supplement, and the Human Interface Guidelines help your app feel native.

### 31:44 — [Real-Time State Updates](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=1904>)

**Q.** How should I handle frequent real-time state updates like sensor data without causing unnecessary view redraws?

Use @Observable so only views that actually read a changed property re-render, keep view <span class="high">body</span> small and leaf-like, and lean on TimelineView, LazyVStack, and ForEach inside lazy containers. Ask whether the UI truly needs per-frame updates or whether the model can expose a semantic state, avoid putting fast-changing values in the environment, keep async work outside view <span class="high">body</span>, and use SwiftUI Instruments when you actually hit a bottleneck.

### 36:38 — [Xcode AI And SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=2198>)

**Q.** Has Apple Intelligence in Xcode been trained on current SwiftUI documentation, since other LLMs often produce incorrect SwiftUI code?

This year Xcode ships SwiftUI skills containing internal best practices and new APIs, automatically invoked by the coding agent based on context. The What's New in SwiftUI talk shows how to export those skills for use with third-party models, and filing feedback when skills stumble helps improve them.

### 40:40 — [Performant View Updates](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=2440>)

**Q.** What are best practices to make SwiftUI views performant and avoid unnecessary updates?

Adopt @Observable so only views reading changed properties invalidate, and think of views as a tree where each node only re-runs when its inputs change. Read only the environment values you actually use, break large <span class="high">body</span> into separate custom views rather than computed properties (which give no perf benefit), and avoid heavy work like creating formatters inside <span class="high">body</span>.

### 48:37 — [Learning With AI](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=2917>)

**Q.** How can students use AI in Xcode effectively without letting it short-circuit actual learning?

Treat the LLM as a tutor or coworker, not an employee: ask it what each chunk of code does, push back, request alternatives and trade-offs, and go step by step rather than one-shotting whole features. The goal is understanding, not volume of code — use AI to deepen your mental model and weigh design decisions yourself.

### 55:46 — [SwiftUI Mental Model](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=3346>)

**Q.** Is there a one-page resource that lays out how SwiftUI's pieces fit together?

There isn't a single chart, but the Intro to SwiftUI session, the SwiftUI Essentials video, and the Getting Started with SwiftUI page on the developer site are the recommended overviews.

### 56:40 — [Avoiding AI Bad Habits](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=3400>)

**Q.** How can a beginner use Xcode's AI tools so they learn correct SwiftUI patterns instead of buggy ones?

Rely on the new Xcode SwiftUI skills, which encode best practices the model will pick up. Let the model compile its output so Swift's compile-time errors guide iteration, and work piece by piece instead of one-shotting whole features.

### 57:54 — [Overlooked Announcements](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=3474>)

**Q.** What was announced this week that beginners might overlook but will matter as they grow?

Layout flexibility — resizable windows on iPad, macOS, Vision Pro, and now iPhone via iPhone Mirroring make adaptive layouts essential. Lean on SwiftUI's layout constructs (and custom Layouts when needed), and use the new Device Hub plus resizable previews to test across sizes.

### 59:10 — [Designs Into SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/8002/?time=3550>)

**Q.** What's the best way to convert a designer's mockup into SwiftUI — should I use an Xcode coding assistant?

Map the design to SwiftUI's layout primitives yourself, and take advantage of the Figma and Sketch connections that generate SwiftUI code from those design tools. There isn't a dedicated Xcode skill for this conversion yet.

---

## Highlights

- Adopt @Observable and keep view bodies small and leaf-like so only views reading changed properties re-render.
- Xcode 27 ships SwiftUI skills with Apple's internal best practices; they can be exported for use with third-party LLMs (covered at the end of What's New in SwiftUI).
- Use Xcode Previews and the new Device Hub to get live, multi-size feedback while learning — especially helpful for developers from a web background.
- Start learning via Apple's official SwiftUI tutorials, the SwiftUI Essentials video, and Paul Hudson's Hundred Days of SwiftUI; consult the Human Interface Guidelines for platform fit.
- Treat LLMs as tutors and coworkers: ask them to explain code, request alternatives and trade-offs, and request code reviews of your own attempts rather than one-shotting features.
- File feedback via Feedback Assistant (in-OS on betas, or feedbackassistant.apple.com) — especially on the new Xcode SwiftUI skills.

---

## Related sessions

- [What’s new in SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/269/>)
- [SwiftUI essentials](<https://developer.apple.com/videos/play/wwdc2024/10150/>)
- [Meet Liquid Glass](<https://developer.apple.com/videos/play/wwdc2025/219/>)

---
