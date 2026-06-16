# SwiftUI Group Lab - Part 2

> WWDC26 · Session 8120 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8120/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest SwiftUI announcements. Conducted in English.

Host Kurt from Worldwide Developer Relations moderates "SwiftUI After Dark" with UI frameworks engineers Anna, Stephen, Nick, Russell, and Sam. The panel takes developer-submitted questions on SwiftUI performance, layout, data flow, custom controls, and the framework's evolution.

---

## Q&A

### 2:57 — [ForEach Large Collections](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=177>)

**Q.** ForEach with a million reorderable items still traverses the whole collection on first display and on every order change, causing slowdowns. What can be done in SwiftUI?

Stephen confirmed the team is aware and that it shouldn't behave that way; the best step is filing a Feedback. The panel emphasized including your use case — why you need so many items and the shape of the data — so they can ensure APIs cover it. Feedback filed against the betas right now is highly visible to the team.

### 4:39 — [Custom NavigationTransition](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=279>)

**Q.** In iOS 27 beta, the NavigationTransition protocol is publicly empty, so you can't build custom navigation transitions. What's its purpose and can we make our own?

The protocol currently exposes only system-provided conformances (crossFade, zoom, automatic) and doesn't yet allow custom ones — file Feedback with your use case. A new <span class="high">any NavigationTransition</span> lets you switch between them dynamically, and crossFade/zoom now apply to sheets too. If you're not on a NavigationStack, you can build custom transitions yourself with animations, animatable, keyframes, and shaders.

### 7:20 — [Glass Effect On Buttons](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=440>)

**Q.** How do coding intelligence and Xcode's agentic tools help build views with Liquid Glass, and how should glass effects be applied to buttons?

Stephen highlighted Xcode's new skills (usable with any model and exportable to other agents) plus preview iteration for Liquid Glass. For buttons, prefer <span class="high">glass</span> or <span class="high">glassProminent</span> button style; toolbar items already get glass automatically — use a tint for color, or <span class="high">sharedBackgroundVisibility(.hidden)</span> to opt out (e.g. profile photos). New API lets you remove just the content padding around toolbar buttons so the glass rim hugs the image, which also improves mitosis (a.k.a. slurp) during push/pop. Avoid glass inside flat content areas where there's nothing to refract.

### 14:05 — [Adapting To Window Sizes](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=845>)

**Q.** With resizable windows, vertical splits, and the resizable simulator, what's the right way to handle the many possible screen sizes?

Stop hard-coding sizes and lean into size classes for distinct experiences, but also handle true continuous flexibility between breakpoints. Prefer system containers and adaptive TabView (with collapsible sidebar at regular sizes), and reach for custom Layouts — or AnyLayout to switch layouts while preserving structural identity and state. ViewThatFits is handy at higher levels; Paul's WWDC22 custom layouts and Matt's WWDC24 demystify-containers sessions are key references.

### 18:53 — [GeometryReader Performance](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=1133>)

**Q.** When should you use GeometryReader, and what are the performance implications?

Stephen recommended <span class="high">onGeometryChange</span> for most cases: its first closure runs every frame, but you return a derived value (e.g. a breakpoint bucket) and the action only fires when that value changes — turning per-frame work into a couple of fires. GeometryReader is expensive because its subviews invalidate on every frame, so reserve it for backgrounds. For precise placement, combine onGeometryChange with custom Layouts; alignment guides (covered in this year's advanced graphics talk) can also do surprising work in a single layout pass.

### 22:04 — [Learning Data Flow](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=1324>)

**Q.** Any tips or projects for properly learning data management and passing data between views in SwiftUI?

Sam suggested building self-contained state machines and keeping views as thin mappings from model to view data; SwiftUI is intentionally architecture-agnostic because the right shape depends on the data. Kurt recommended building apps in a domain you actually care about so you're not also learning the problem. Stephen plugged the SwiftUI Instruments tool to see view-body updates flowing through your app, and Nick promoted DynamicProperty as a way to replace many onChange usages — its <span class="high">update</span> runs before <span class="high">body</span>, saving a render cycle. onChange to mutate view state is usually an anti-pattern; prefer an observable model that vends derived values.

### 30:15 — [Conditionally Hiding Views](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=1815>)

**Q.** I keep hearing not to use <span class="high">if</span> to conditionally hide elements (e.g. showing 9:41 only at 9:41). What's the recommendation?

If the view stays in the layout, use a value-based modifier like <span class="high">.opacity(...)</span> with an inert value (1 or 0) rather than an <span class="high">if</span>, so identity and state are preserved. If you actually need to remove it from layout, an <span class="high">if</span> is fine — that's its purpose. Avoid putting <span class="high">if</span> inside the body of a view modifier (the <span class="high">.if</span> helper pattern), since it silently switches branches and tears down state; and at the top level of lazy containers/ForEach, conditionals confuse view counting, so wrap in a unary container (VStack, Group doesn't flatten) to guarantee one resolved view.

### 38:00 — [AnyView Cost](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=2280>)

**Q.** What's the concrete cost of type-erasing with AnyView in deeply nested or frequently updating views?

AnyView is fine when you genuinely need to erase a type the compiler doesn't know. The cost shows up when the underlying concrete type changes — that forces tearing down and rebuilding the subtree, just like an if/else. The other pitfall is lazy containers, which can't tell how many views an AnyView resolves to; wrap it in a stack to give them a stable count.

### 39:29 — [Resizable Previews](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=2369>)

**Q.** Any tips for making SwiftUI layouts more adaptable now that Xcode previews are resizable?

Treat resizable previews as a stress test: write layouts that accept any proposed size, then drag the preview to find your hard-coded magic numbers and broken assumptions. Use the app in genuinely resizable contexts (iPad, iPhone Mirroring) and study how other apps — especially indie apps — adapt creatively across sizes.

### 42:28 — [Full-Screen Overlays](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=2548>)

**Q.** What's the best way to present a full-screen SwiftUI overlay on top of everything, including sheets, without breaking modal presentation?

There isn't a clean SwiftUI-only way to draw above arbitrary modals; you'd need to coordinate presentations through your data model so a <span class="high">fullScreenCover</span> is the top of the stack. Russell suggested dropping to UIKit and creating a new <span class="high">UIWindow</span> (hosting a <span class="high">UIHostingController</span>) for cases like a login HUD — but warned that last-window-wins, which is exactly the centralization problem SwiftUI tries to solve. Often the right answer is to rethink the design (e.g. unwinding the navigation stack instead) and file Feedback so APIs can fill the gap.

### 47:22 — [Custom SwiftUI Controls](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=2842>)

**Q.** What's the best way to build a pure SwiftUI custom control like a dropdown that expands over other elements without affecting their layout?

First consider whether you need custom at all — <span class="high">UIViewRepresentable</span> lets you reuse UIKit/AppKit controls and inherit framework updates like the new design. If you do build custom, exploit SwiftUI's layout protocol: a child can render larger than the size it reports back, or use <span class="high">.overlay</span> for isolation, but watch for scroll views that may cull views whose layout bounds go off-screen. Prefer custom *styles* over wrapping controls so you keep accessibility and the standard initializers, and remember the new swipe-action container modifier now lets any container support swipe actions.

### 54:55 — [View Decomposition](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=3295>)

**Q.** Breaking large views into smaller ones helps performance, but how small should they be, and when should they be new structs versus @ViewBuilder computed properties?

Stephen framed it as isolating dependencies, not just splitting code: a separate struct view creates a boundary where SwiftUI can compare inputs and skip work; a ViewBuilder computed property has the same dependency set as the parent and gives no benefit. Sam added that Observable helps because the reference passed in doesn't change, so a superview can skip rebodying while a small leaf that reads a specific property still updates. Views are value-type structs — don't be afraid to have lots of them.

### 58:16 — [Proudest Of SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/8120/?time=3496>)

**Q.** Looking back from SwiftUI 1 to today's mature framework, what are you most proud of?

Sam: the custom containers API and SwiftUI's semantic, data-flow-first reframing of platform UI (e.g. TabView as either standard tabs or a paginating scroll view). Russell: SwiftUI reaching the maturity to be used internally inside core components like UINavigationController. Anna: the team and culture that's grown around the framework. Stephen: turning anti-patterns like GeometryReader into proper APIs such as onGeometryChange and onScrollVisibilityChange. Nick: exposing lower-level building blocks so developers can build the things Apple engineers build internally.

---

## Highlights

- File Feedback now with concrete use cases — the team watches incoming reports daily during the beta.
- Prefer <span class="high">onGeometryChange</span> over <span class="high">GeometryReader</span>; its second closure throttles updates to real breakpoint changes.
- <span class="high">DynamicProperty</span> can replace many <span class="high">onChange</span> usages and updates before <span class="high">body</span> runs, saving a render cycle.
- For Liquid Glass on buttons, use <span class="high">glass</span>/<span class="high">glassProminent</span> button styles; toolbar items get glass automatically — opt out via <span class="high">sharedBackgroundVisibility(.hidden)</span>.
- Inside lazy containers (List, LazyVStack, ForEach), wrap multi-view branches in a unary container (VStack, custom Layout) so view counting takes the fast path.
- Referenced sessions: WWDC22 custom layouts (Paul), WWDC24 Demystify SwiftUI containers (Matt), this year's lazy stacks talk (Renz), advanced graphics in SwiftUI, and What's New in SwiftUI.
- New this year: <span class="high">any NavigationTransition</span> for dynamic switching, swipe-action container modifier extending swipe actions beyond List, and toolbar API to drop button content padding while keeping the glass rim.

---

## Related sessions

- [What’s new in SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/269/>)
- [Meet the Presenter: Compose custom layouts with SwiftUI](<https://developer.apple.com/videos/play/wwdc2022/110392/>)
- [Demystify SwiftUI performance](<https://developer.apple.com/videos/play/wwdc2023/10160/>)
- [Compose advanced graphics effects with SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/322/>)
- [Dive into lazy stacks and scrolling with SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/321/>)

---
