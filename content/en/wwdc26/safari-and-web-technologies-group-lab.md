# Safari and Web Technologies Group Lab

> WWDC26 · Session 8015 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8015/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers to ask questions, get advice, and follow the discussion about the week's biggest Safari and web technologies announcements. Conducted in English.

Sonia Barak hosts the Safari and Web Technologies Group Lab with Tim, Alexi, Chiara, Brando, and Jen Simmons. After Jen previews what's new in WebKit for Safari 27, the panel takes developer questions on standards, extensions, the model element, customizable select, spatial CSS, and performance.

---

## Q&A

### 4:43 — [Skills For New Devs](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=283>)

**Q.** What web technologies or APIs should new web developers learn today to prepare for the future of the web?

The panel stressed the timeless fundamentals: semantic HTML, CSS layout, progressive enhancement, and JavaScript — knowing these helps you judge AI-generated code and lasts a whole career. They added accessibility (free with semantic HTML), 3D/spatial web concepts like the model element and WebXR, and web extensions as relevant new areas. The repeated advice: be lazy, reach for the built-in HTML element instead of div/span + JS piles.

### 10:05 — [Exciting Web Standards](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=605>)

**Q.** Which upcoming web standards is the team most excited about?

Mentions included the proposed install element and declarative partial updates in HTML/canvas, the newly chartered Web Extensions Working Group, the <span class="high">random-item()</span> function in the new CSS Values spec, and Spatial CSS — which extends 2D positioning concepts (top/left/right/bottom, anchor positioning) into 3D with depth, enabling combined models and richer e-commerce experiences. Jen also reflected that standards work goes slow on purpose so the result lasts decades.

### 16:06 — [Web Vs Native Performance](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=966>)

**Q.** How can Safari sometimes be more performant than native apps for UI/UX driven by JavaScript?

Tim recalled that iOS originally planned to ship apps as web apps and that performant web apps are possible, just hard. Jen highlighted how deeply WebKit and JavaScriptCore are integrated into every Apple OS — JavaScriptCore powers JS anywhere on the system, WebKit is a SwiftUI view, and both run even on watchOS — so the web/native split isn't really two opposing teams.

### 19:21 — [Advocating For Features](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=1161>)

**Q.** How should web developers advocate for features in WebKit, and do standards positions consider developer feedback?

File on bugs.webkit.org, talk to the evangelists on social media, and explain the user-facing use case clearly. Jen explained that Apple's published standards positions on GitHub often push back on under-baked APIs for privacy, security, performance, or ergonomics — but positions can change (as with :has(), which engineers eventually figured out how to make fast). Tim added that even with a standards position, the underlying user need is always worth filing. Be kind, show real demos, and indicate how many people share the need.

### 26:54 — [WKWebView Cookies](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=1614>)

**Q.** Are there improvements to cookie synchronization in WKWebView similar to UIWebView's behavior?

The panel didn't have a cookies expert on stage; the back room suggested using WKHTTPCookieStore to observe and manipulate cookies for WKWebView. They recommended taking this question to the developer forums.

### 27:41 — [Extension API Parity](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=1661>)

**Q.** Are there plans to close the gap with Chrome/Firefox extension APIs, like tab group APIs?

Chiara said they're excited that users can now generate extensions from a prompt and encouraged developers to file bugs on bugs.webkit.org with concrete use cases. Apple is actively working in the Web Extensions Community Group (and now Working Group) to standardize APIs and align behavior across browsers — if an API is missing or differs in Safari, be loud about why you need it.

### 29:32 — [Spatial CSS Today](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=1772>)

**Q.** With Spatial CSS, will I see things from the web in 3D on Apple Vision Pro?

Tim noted Spatial CSS is still a proposal with no shipping news, but Apple feels positively about it. Today you can use the inline HTML model element with USD/other 3D formats — placing models inline, dragging them out, or showing them at full scale via immersive environments — plus procedural creation, while Spatial CSS will eventually combine these with the full accessibility tree.

### 30:48 — [Performance Endgame](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=1848>)

**Q.** Have we reached the endgame for browser performance, or is there more to squeeze out?

No endgame. Jen emphasized many dimensions — JS speed, image loading, time-to-interactive, and battery life — all matter. Tim cited the shift from WebGL to WebGPU as an example of re-optimizing once the real bottlenecks were understood. Alexi and Brando described the WebKit power-and-performance team running benchmarks on nearly every commit; as the web evolves, benchmarks evolve too.

### 35:04 — [SEO Extension Architecture](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2104>)

**Q.** What's a recommended path for building a Safari extension that surfaces SEO reports inside a SwiftUI window across iOS, macOS, and visionOS?

Chiara suggested showing data in an extension popup, using the webNavigation API to monitor page changes, and using native messaging to pass information between the web extension and the companion app so it can render in SwiftUI.

### 36:16 — [Progressive Select Enhancement](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2176>)

**Q.** What's the safest way to progressively enhance a select with <span class="high">appearance:base-select</span> without breaking older browsers?

Always keep real text content inside each option — that text is what browsers without customizable select (and screen readers) will use. Layer images, swatches, and CSS styling on top; browsers that support it get the fancy version, the rest get the OG text list. Tim noted that's exactly why the spec reused <span class="high">select</span> instead of introducing a new selectmenu element. Jen and Tim also previewed the in-progress <span class="high">appearance:base</span> spec to style all form controls.

### 41:21 — [Model Loading States](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2481>)

**Q.** How does the model element handle loading states and errors, and what control do developers have during loading?

There's a JS promise that resolves when the model is loaded, so you can show a spinner and then swap to the model. Tim explained model has the same two phases as images — fetching bytes vs. the resource being usable — so developers can reason about both states. For procedurally generated models there's still processing time after the bytes arrive. The team also took feedback about adding a CSS pseudoclass for the loading state.

### 43:52 — [Model Size Guidance](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2632>)

**Q.** How big do you expect models on the web to be?

Keep them as small as you would images — they shouldn't be larger than the page they appear on, and textures/geometry should match what's actually visible. Tim suggested roughly 10 MB hits maximum visual quality for typical inline use; immersive environments can be larger. The Alliance for OpenUSD's <span class="high">usdz_compress</span> tool now compresses textures to AVIF, and mesh compression formats are under discussion with the Alliance for Open Media.

### 47:27 — [Extension Permissions](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2847>)

**Q.** How should developers think about Safari extension permissions versus other browsers?

Safari designs permissions privacy-first: requested manifest permissions aren't auto-granted, and users choose which sites the extension runs on. Chiara recommended using activeTab so the extension only runs on the user's current tab and loses host permissions on navigation, rather than requesting overly broad host access.

### 49:12 — [Immersive Web Handoff](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=2952>)

**Q.** How does the immersive environments API interact with existing web content, and how does attention handoff work?

The webpage is still active inside the immersive environment, so any UI on the page remains available. It's a single-app experience — other apps like Messages dim, and a crown press returns to the shared view. The page itself can expose UI to move the user, play, or pause animations in the environment.

### 50:06 — [Spatial Web Relevance](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=3006>)

**Q.** Is the model element the entry point that makes spatial web relevant for everyday developers?

Alexi said yes — model element is the lowest-friction first step for web developers to bring 3D to the web. You can find or AI-generate models, drop them in, and see results quickly, then progress to authoring tools like Blender for custom content.

### 51:43 — [Appearance:Base Styling](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=3103>)

**Q.** With <span class="high">appearance:base-select</span>, how much styling works out of the box versus what must developers reset for consistency?

Layout works, the font inherits from your page (unlike <span class="high">appearance:none</span>), and you get new pseudo-elements to target the picker icon, dropdown menu, and checkmark independently. Tim and Brando emphasized <span class="high">appearance:base-select</span> is 100% interoperable across browsers with a consistent DOM structure — the necessary foundation for predictable cross-browser styling. There's still active discussion about the default look, but the goal is to inherit as much as possible from the page (background, font, color) and to lay out using normal CSS without form-control magic, so you can even use Grid, Flex, or Grid Lanes inside the picker.

### 56:38 — [Porting Extensions To Safari](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=3398>)

**Q.** How much work is it to port a Chrome or Firefox extension to Safari, and where do manifest/API differences trip people up?

It varies — sometimes it just works. Use the Develop menu to load the extension's resources as a temporary extension in Safari and test. Manifest support is broadly aligned and Safari intentionally doesn't fail on unsupported keys. If you hit API divergence, raise it in the community/working group or file on bugs.webkit.org or Feedback Assistant.

### 58:45 — [Final Takeaway](<https://developer.apple.com/videos/play/wwdc2026/8015/?time=3525>)

**Q.** What's one thing you want web developers to know about the upcoming release or WebKit in general?

Jen pointed to the unusually long Safari 27 and 26.x release notes as evidence of a deliberate quality push — over 1,100 fixes, including rewriting the JS module loader to fix top-level await bugs. Chiara reminded developers that Safari's extension support now lives in WebKit, so contributions are welcome. Alexi urged people to play with the model element. Tim encouraged developers to lean on the platform and use as few frameworks as possible. Brando wished for more demos showcasing Safari-first features like <span class="high">random()</span>, filter functions, and <span class="high">hanging punctuation</span>.

---

## Highlights

- Safari 27 ships customizable select, the model element on iOS/iPadOS/macOS, and immersive website environments on visionOS 27; grid lanes already shipped in 26.4.
- Over 1,100 feature improvements and fixes across the 26.x line — including a JS module loader rewrite to fix top-level await bugs.
- File feature requests and bugs at bugs.webkit.org with concrete use cases; Apple's standards positions live on GitHub and can change (see <span class="high">:has()</span>).
- Use WKHTTPCookieStore to observe/manipulate cookies in WKWebView; bring deeper issues to the developer forums.
- For extensions: prefer <span class="high">activeTab</span> over broad host permissions, use webNavigation + native messaging to drive companion SwiftUI UIs, and load temporary extensions via Safari's Develop menu to test ports.
- Model element exposes a JS load promise; <span class="high">usdz_compress</span> (Alliance for OpenUSD) now compresses textures to AVIF — aim for ~10 MB for inline models.
- <span class="high">appearance:base-select</span> is interoperable across browsers with a consistent DOM and new pseudo-elements for the picker icon, menu, and checkmark — Grid, Flex, and Grid Lanes work inside the picker.
- Field guide to Grid Lanes at gridlanes.webkit.org.

---

## Related sessions

- [Learn CSS Grid Lanes](<https://developer.apple.com/videos/play/wwdc2026/314/>)
- [Rediscover the HTML select element](<https://developer.apple.com/videos/play/wwdc2026/315/>)
- [Get started with the HTML Model Element](<https://developer.apple.com/videos/play/wwdc2026/215/>)
- [Explore immersive website environments in visionOS](<https://developer.apple.com/videos/play/wwdc2026/320/>)
- [Create web extensions for Safari](<https://developer.apple.com/videos/play/wwdc2026/216/>)
- [What’s new in WebKit for Safari 27](<https://developer.apple.com/videos/play/wwdc2026/204/>)

---
