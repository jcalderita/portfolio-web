# SwiftUI Group Lab - Part 1

> WWDC26 · Session 8006 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8006/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest SwiftUI announcements. Conducted in English.

Kurt from Worldwide Developer Relations hosts "SwiftUI After Dark" with UI frameworks engineers Anna, Stephen, Nick, Russell, and Sam. The panel covers performance, Liquid Glass, layout, data flow, presentations, and custom controls in SwiftUI.

---

## Q&A

### 2:57 — [Large Reorderable Lists](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=177>)

**Q.** ForEach with a million reorderable items still traverses the whole collection on first display and reorder. What can SwiftUI do here?

Stephen confirmed the team is aware and looking into it; the best action is filing a Feedback that describes the specific use case and data shape so the team can ensure APIs support it. Filing during beta has maximum influence on the next release.

### 4:44 — [Custom Navigation Transitions](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=284>)

**Q.** The NavigationTransition protocol appears empty—can we build our own custom transitions?

Anna explained that NavigationTransition currently only exposes concrete members like zoom and crossFade, not a way to author custom ones, so file feedback with use cases. New this year, navigation transitions can be switched dynamically, and for non-navigation-stack views you can drive your own transitions using Animatable, keyframes, modifiers, and shaders.

### 7:20 — [Liquid Glass And Agents](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=440>)

**Q.** How can we use Xcode's coding intelligence and agentic models to build views with Liquid Glass, and how should <span class="high">glassEffect</span> be used on buttons?

Stephen recommended Xcode's new skills (which work with any model and are exportable for other agentic systems) plus iterating in Previews. The panel cautioned against putting Liquid Glass in content areas—toolbar buttons get glass automatically; for explicit cases use glassButtonStyle or glassProminent, combine glassEffect with <span class="high">buttonBorderShape</span>, and use <span class="high">sharedBackgroundVisibility</span> hidden plus the new API to remove default button content margins so avatars get a glass rim without extra padding.

### 14:05 — [Adapting To Window Sizes](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=845>)

**Q.** With resizable windows and the resizable simulator, what APIs should we use to handle varying screen sizes?

Russell said don't hard-code sizes; lean on size classes for distinct compact vs. regular experiences, but support true continuous flexibility in between. Anna and Sam recommended system containers, adaptive TabView with sidebar, custom Layouts (and AnyLayout to preserve identity across layouts), custom containers, ViewThatFits sparingly at a high level, and onGeometryChange over GeometryReader—its second closure debounces updates so work only happens when thresholds cross.

### 22:04 — [Learning Data Flow](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=1324>)

**Q.** How can we get better at managing data and passing it between SwiftUI views?

Sam suggested building self-contained state machines and trying many data shapes since SwiftUI is intentionally architecture-agnostic. Nick advised building sample apps in a domain you know, Stephen recommended the SwiftUI Instrument to see updates flow, and the panel praised DynamicProperty as a replacement for many onChange uses—it updates before <span class="high">body</span>, avoiding an extra render and letting cached values be vended on first <span class="high">body</span> run.

### 30:29 — [Conditionals Hiding Views](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=1829>)

**Q.** We've been told not to use <span class="high">if</span> to conditionally hide views—what's the recommendation, e.g., showing 9:41 only at 9:41?

Russell said to prefer animatable modifiers like <span class="high">opacity</span> with an inert value (1 vs 0) so the view stays in the hierarchy. If you truly need to remove and re-add a view, conditionalizing is fine; the danger is conditionals inside ViewModifier bodies (causing widespread relayout) and top-level conditionals in lazy containers/ForEach where SwiftUI counts views—wrap in a VStack or unary container to guarantee one resolved view.

### 38:06 — [Cost Of AnyView](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=2286>)

**Q.** What's the real cost of type-erasing with AnyView in deeply nested or frequently updating views?

Sam explained AnyView is fine when you genuinely need type erasure, but if the underlying concrete type changes, SwiftUI must tear down and rebuild the hierarchy—avoid changing the underlying type. In lazy containers AnyView is problematic because the container can't tell how many views it resolves to; wrap it in a stack to make it unary.

### 39:29 — [Resizable Previews](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=2369>)

**Q.** With Xcode previews now resizable, any tips for making SwiftUI layouts more adaptable?

Nick said custom Layouts already take size as input, so just test across all sizes in the resizable preview to find hardcoded assumptions. Use iPad and iPhone mirroring to feel real resizing, and take inspiration from indie apps that adapt creatively to compact and large widths.

### 42:28 — [Full-Screen Overlays](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=2548>)

**Q.** How can we present a full-screen SwiftUI overlay above everything—including sheets—without breaking modal presentation?

Anna noted SwiftUI doesn't really offer this if other modals may already be presented; coordinate via your navigation/data model and file feedback. Russell suggested dropping to UIKit and creating a new UIWindow hosting a UIHostingController for HUD-like cases, but Nick warned that last-window-wins is exactly the layering bug SwiftUI tries to solve—reconsider the design (e.g., rewind navigation to a base view for login) instead of forcing an always-on-top layer.

### 47:27 — [Custom Controls](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=2847>)

**Q.** What's the best way to build a pure-SwiftUI custom control like a dropdown that overlays other elements without affecting layout?

Anna suggested first considering interop with an existing UIKit/AppKit control so you get free updates. To draw outside the layout, use SwiftUI's proposal-based layout (report a smaller size than you draw) or use <span class="high">overlay</span>—but beware that views drawn outside reported bounds in a ScrollView can be removed when SwiftUI thinks they're offscreen. The panel also highlighted the new swipeActionsContainer modifier that lets any container support swipe actions and arbitrary views inside swipe action buttons, and recommended building custom styles before custom controls to inherit accessibility and initializers.

### 54:57 — [View Decomposition](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=3297>)

**Q.** How small should we break SwiftUI views, and when do we use struct views vs. <span class="high">@ViewBuilder</span> computed properties?

Stephen explained the goal is isolating dependencies, not just shrinking files: split when header/content/footer can update independently so SwiftUI's initialization-time equality check can skip work. @ViewBuilder computed properties don't give that benefit—they're equivalent to one big <span class="high">body</span> sharing all dependencies. Use Observable so a pointer-stable model lets only the small subviews reading a property re-render.

### 58:16 — [Proud Of SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/8006/?time=3496>)

**Q.** Looking back at SwiftUI's evolution, what are you most proud of?

Sam cited the custom containers API and SwiftUI's semantic, data-flow-oriented framing of platform UI. Russell pointed to SwiftUI now powering core UIKit components like UINavigationController internals. Nick called out the team itself, Stephen praised replacing rough spots like GeometryReader with targeted APIs (onGeometryChange, onScrollVisibilityChange), and Anna highlighted exposing lower-level building blocks so developers can build their own custom pieces.

---

## Highlights

- File Feedback Assistant reports during beta with concrete use cases—not just bug repros—to influence the next release.
- Prefer onGeometryChange over GeometryReader; its second closure debounces updates to threshold crossings.
- Use glassButtonStyle / glassProminent and pair glassEffect with <span class="high">buttonBorderShape</span>; remove default button content margins with the new API for avatar-style rims.
- DynamicProperty's <span class="high">update</span> runs before <span class="high">body</span>—use it to replace many onChange uses and to vend cached values on first render (see this year's Lazy Stacks talk by Renz).
- In lazy containers, wrap conditional/AnyView/multi-view content in a unary container (VStack) so SwiftUI gets one resolved view.
- Referenced sessions: Demystify SwiftUI containers (WWDC24), Build custom layouts (WWDC22), Advanced graphics in SwiftUI, What's new in SwiftUI, and the Lazy Stacks talk.

---

## Related sessions

- [Meet the Presenter: Compose custom layouts with SwiftUI](<https://developer.apple.com/videos/play/wwdc2022/110392/>)
- [Demystify SwiftUI performance](<https://developer.apple.com/videos/play/wwdc2023/10160/>)
- [What’s new in SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/269/>)
- [Compose advanced graphics effects with SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/322/>)
- [Dive into lazy stacks and scrolling with SwiftUI](<https://developer.apple.com/videos/play/wwdc2026/321/>)
- [Modernize your UIKit app](<https://developer.apple.com/videos/play/wwdc2026/278/>)

---
