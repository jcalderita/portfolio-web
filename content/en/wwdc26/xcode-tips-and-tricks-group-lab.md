# Xcode Tips and Tricks Group Lab

> WWDC26 · Session 8013 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8013/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about getting the most out of Xcode. Conducted in English.

Angelica hosts an Xcode-focused Group Lab with panelists Chris Miles (live coding, previews, playgrounds), Jake (design, themes, toolbar), John (front-end Xcode teams), Kasper (Instruments) and Chris (organizer, signing). They field developer questions on tips, build performance, signing, agents and more.

---

## Q&A

### 1:18 — [Lesser-Known Tips](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=78>)

**Q.** What are the most useful but lesser-known Xcode tips and tricks each of you relies on?

Panelists highlighted the #Playground macro for inline Swift snippets, per-workspace themes, cutting code and pasting into the file navigator to create a new file, find call hierarchy when refactoring Objective-C, Command-Shift-J to reveal a file in the navigator, debug Xcode appearance overrides, console filtering by category, type-to-filter menus in the jump bar, preview argument grids, exporting memgraphs to Instruments, and conditional breakpoints via secondary click.

### 5:25 — [Underused Recent Feature](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=325>)

**Q.** Which recent Xcode feature deserves more attention than it gets?

John pushed blue folders (vs. groups) as a near-elimination of project-file merge conflicts, which Kasper echoed from the Instruments team. Others called out scheme user-defaults toggles, console filtering, preview variants and arguments, and exporting the memory graph debugger into Instruments for footprint timelines.

### 9:30 — [Delete Derived Data](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=570>)

**Q.** A thank-you for the new Delete Derived Data menu item — any context on why it landed?

John explained common reasons developers reach for it: low disk, faster than clean, recovering from hidden inter-target dependencies whose parallel build order makes builds flaky. He suggested analyzing the project for missing dependencies if the failure pattern repeats.

### 10:48 — [Xcode 26 + 27 Coexistence](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=648>)

**Q.** Can I run the Xcode 27 beta alongside Xcode 26 for shipping without breaking my setup?

Yes — multiple Xcode versions are supported side by side. Stick to public SDK features so your app still builds in 26; only one new project-format opt-in this year requires Xcode 27. Mind xcode-select when shipping, and Xcode Cloud is a clean way to validate compatibility.

### 12:31 — [Underrated Features](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=751>)

**Q.** What's the most underrated Xcode feature even experienced developers don't use enough?

Blue folders again, pinning individual canvas tabs so previews persist across files, scheme-edit toggles, Xcode Cloud (with improved onboarding and webhook config this year), powerful search with regex/symbol/proximity and delete-to-narrow, Command-click disclosure triangles to collapse siblings, type hierarchy queries, and the full Instruments suite including the SwiftUI, concurrency and Foundation Models templates.

### 18:07 — [Running 26 And 27](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1087>)

**Q.** What caveats apply when Xcode 27 beta runs on the same machine as Xcode 26?

Effectively none this year — running multiple Xcodes simultaneously is fully supported, and there are no notable project-format compatibility gotchas between 26 and 27.

### 19:01 — [Project Merge Conflicts](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1141>)

**Q.** How can we minimize .xcodeproj merge conflicts without third-party generators like Tuist or XcodeGen?

John recommended converting groups to blue folders (target membership must align with the folder contents), using the option-key preflight in convert-to-folder to fix errors before migrating, enabling the 'minimize cross-project references' checkbox, and moving build settings into .xcconfig files — which got improved syntax coloring this year and review-friendly comments.

### 22:40 — [Markdown In Xcode](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1360>)

**Q.** Are there cool tricks with the new Markdown support, and any source-control improvements worth knowing?

Markdown files render natively, can be toggled to source view via Open As, and you can edit either form. The same renderer works inside agent transcripts, and the canvas preview gives a side-by-side view. On source control, the navigator was rewritten under the hood, performance with millions of tags is much better, diffs now use red/green (customizable in themes), and stash multi-select was taken as feedback.

### 25:47 — [Macro Trust Reapproval](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1547>)

**Q.** Can macro trust be pinned to a package identity instead of requiring reapproval every time a package like MLX Swift updates?

The panel didn't have a package-manager expert on hand and asked the developer to file a Feedback Assistant report with the specific package and reproduction — the behavior described shouldn't happen on every update.

### 26:50 — [Open Terminal At Root](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1610>)

**Q.** Is there a way to open Terminal at the project root from Xcode?

Not directly. Workarounds: drag a navigator file into Terminal to cd there, or use the new working-copy-relative path shown in the file inspector (double-click to copy). The panel agreed this is worth a feedback request alongside the existing Show in Finder action.

### 27:55 — [Daily Keyboard Shortcuts](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1675>)

**Q.** What Xcode keyboard shortcuts do you use every day?

Favorites included Shift-Cmd-J (reveal in navigator), Shift-Cmd-Y (toggle debug area), Ctrl-Opt-Cmd-G (rerun last test), Cmd-Opt-P (refresh previews), Ctrl-6 (jump bar filter), Cmd-Opt-Up/Down (switch header/impl), Shift-Cmd-O (Open Quickly), Ctrl-Cmd-R (run without building), Cmd-I (profile), Ctrl-\ (next diff), and Cmd-/ (toggle comment). All bindings are searchable and customizable in Xcode Settings.

### 31:26 — [Beginner Mistakes](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=1886>)

**Q.** What are the most common beginner mistakes in Xcode and how do I avoid them?

Don't try to learn every feature at once; lean on automatic code signing; use the new simplified toolbar and blank-project start; always start a Git repo (on by default); profile on a real device with a release build, never the simulator or a debug build; adopt SwiftUI and Swift Concurrency; and organize files into folders early. Code-along sessions are a great way to see Xcode workflows in context.

### 37:54 — [DocC Workflows](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2274>)

**Q.** What are efficient workflows for generating and maintaining DocC documentation alongside active development?

Use the documentation preview assistant for live feedback on source comments, host the DocC archive as a static site for PR review, and consider writing articles (Instruments uses them for internal docs, with light/dark image variants). Watch agents — they tend to over-document and leak implementation details. DocC is open source, and developer.apple.com's generative AI search surfaces related sessions.

### 40:07 — [Build Time Tips](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2407>)

**Q.** Which settings or practices significantly improve build time?

John recommended Cmd-Ctrl-R to run without building, splitting code into packages/frameworks so changes don't invalidate everything, using the build timeline assistant to investigate, enabling the Swift expression type-check-time warnings, and auditing script phases so they declare inputs/outputs and don't run unconditionally. Explicit modules and private/internal imports can also help.

### 43:09 — [Faster Previews](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2589>)

**Q.** How can I get Xcode Previews to load faster without waiting on an offscreen simulator?

The same advice as build performance applies: previews share build artifacts, so do an initial build and run first, then previews and inline playground macros reload incrementally. Modularizing the project keeps invalidation scoped.

### 44:11 — [swift-format Integration](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2651>)

**Q.** What's the best way to integrate swift-format into Xcode without the alerts and disk-reload churn from build-phase runs?

Rather than running on every build, integrate swift-format at save time or as a Git pre-commit step — that keeps the editor out of its way and still guarantees formatted code lands in the repo, especially at PR time. File feedback if Xcode's behavior gets in the way.

### 45:41 — [LLDB Breakpoint Actions](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2741>)

**Q.** What are the most underutilized LLDB commands or breakpoint actions for inspecting state without halting execution?

Use breakpoint actions to play a sound, log a message, or print a backtrace — any LLDB command works there. John uses a conditional breakpoint gated on the Shift key to stop on demand in noisy layout code. Other tips: ignore-count to skip N hits, prefer the variables view over po, use expression + Swift print for exact escaping, p/x for hex, and breakpoint-driven prints instead of committed print statements.

### 48:59 — [Unused Symbols](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=2939>)

**Q.** Can Xcode show unused vars, properties and functions — and if not, why not?

The compiler emits unused-variable warnings where it can statically prove disuse, but public properties can't be safely flagged because external callers may exist. Find Call Hierarchy helps for specific symbols. File feedback with concrete cases where Xcode could reasonably surface this.

### 50:37 — [Derived Data Reality](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=3037>)

**Q.** Is deleting derived data an engineering practice or a shared superstition, and what should we reach for first when builds get weird?

It's both: legitimate causes include missing inter-target dependencies (a race in the build) or disk bloat, but the team considers needing to delete it a bug — theirs or yours. Xcode 27 reduces the need significantly, particularly around branch switching. Try Clean first, file feedback with reproductions, and remember Swift Build is open source if you want to dig in. Work trees can also blow up derived data size.

### 54:53 — [Agent Context Loss](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=3293>)

**Q.** When Claude Code's context compresses mid-session it silently loses project understanding — could we get a compression indicator and a pre-edit pause?

Good feedback to file. Mitigations today: use plan mode to write the plan to disk so the model can reread it, and create artifacts the agent can reference across sessions and model switches. Watch CLAUDE.md size — it loads into context by default, so a 230-line file is itself growing the context window.

### 56:49 — [Signing And Profiles](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=3409>)

**Q.** How do we stop signing and provisioning-profile mismatches, especially when switching profiles across many targets to profile in Instruments?

Use automatic signing — most reasons teams went manual no longer apply, and Xcode Cloud handles signing for CI. Don't use distribution signing for your local Release configuration; distribution signing belongs at App Store upload time. Don't disable code-sign-inject-base-entitlements as a workaround — it breaks Instruments tools like Allocations that need debuggable entitlements.

### 59:12 — [Code Folding For Focus](<https://developer.apple.com/videos/play/wwdc2026/8013/?time=3552>)

**Q.** Can Xcode's code folding and structural navigation be configured to hide noise and show only high-value logic?

Not in a single configurable mode today — file feedback describing the desired workflow. Workarounds: split a type's definition across extensions or files so noise lives in a 'junk drawer,' and explore existing actions under the Editor → Code Folding menu.

---

## Highlights

- <span class="high">#Playground</span> macro lets you run Swift snippets inline in any file; File → New → Playground gives you a single-file scaffold.
- Convert groups to blue folders (option-key preflight in Convert to Folder) to eliminate most <span class="high">.xcodeproj</span> merge conflicts; align folder contents with target membership.
- Xcode 27 ships Delete Derived Data, themed per-workspace color schemes, customizable toolbar, blank-project new-file flow, red/green diff colors (themable), and a rewritten source-control navigator.
- Export memgraph debugger snapshots into Instruments for allocation timelines; use the SwiftUI, Concurrency and Foundation Models Instruments templates.
- Build-perf toolkit: Cmd-Ctrl-R to run without building, build-timeline assistant, Swift expression type-check warnings, audited script-phase inputs, <span class="high">.xcconfig</span> files with improved editor support.
- Use Feedback Assistant (feedbackassistant.apple.com) and developer.apple.com/forums — including the new generative-AI search — for follow-ups; Swift Build and DocC are open source.

---

## Related sessions

- [Analyze heap memory](<https://developer.apple.com/videos/play/wwdc2024/10173/>)
- [Profile, fix, and verify: Improve app responsiveness with Instruments](<https://developer.apple.com/videos/play/wwdc2026/268/>)
- [Code-along: Elevate an app with Swift concurrency](<https://developer.apple.com/videos/play/wwdc2025/270/>)
- [Demystify parallelization in Xcode builds](<https://developer.apple.com/videos/play/wwdc2022/110364/>)
- [Code-along: Explore localization with Xcode](<https://developer.apple.com/videos/play/wwdc2025/225/>)

---
