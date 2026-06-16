# Accessibility Technologies Group Lab

> WWDC26 · Session 8005 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8005/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest accessibility technologies announcements. Conducted in English.

Cole hosts an Accessibility Technologies panel with Julia (product marketing), Drew (software engineer on iOS/visionOS/iPadOS, cognitive focus), Greg (engineering manager and low-vision user), and Sill (accessibility QA, VoiceOver and Braille). The session covers what's new in the OS 27 releases and developer questions across VoiceOver, Dynamic Type, Voice Control, Assistive Access, nutrition labels, and visionOS.

---

## Q&A

### 4:59 — [Testing Across Screen Sizes](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=299>)

**Q.** Beyond Accessibility Inspector and Device Hub, what advice do you have for testing usability across screen sizes?

Pair screen-size testing with Dynamic Type. UI should re-layout dynamically depending on font size, and these two concerns should be considered together.

### 5:51 — [Prioritizing Assistive Tech](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=351>)

**Q.** When teams only test VoiceOver and skip Switch Control, Voice Control, and full keyboard access, how should they prioritize, and which tech is most underestimated?

Starting with VoiceOver is fine — much of Switch Control and Voice Control accessibility comes for free from a great VoiceOver experience since they share backend APIs like accessibility elements and labels. Add real-user feedback when possible to polish the experience.

### 9:28 — [Overriding Image Descriptions](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=568>)

**Q.** How do I stop VoiceOver from appending its system-generated description after my own <span class="high">accessibilityLabel</span> on a SwiftUI image?

Removing the image trait stops VoiceOver from appending its description, but doing so also denies users the new image description feature with follow-up questions. A subtle earcon plays after your alt text so users can tell which description is author-provided.

### 11:54 — [EHR Patient Portal](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=714>)

**Q.** Which new WWDC accessibility features should a medical student building a patient portal fold into development?

Accessibility Reader works system-wide for long-form content and integrates with spoken content. Image descriptions and image explorer help with charts and data-rich images. Start with Dynamic Type and then layer in VoiceOver labels.

### 15:01 — [Announcing Async Completion](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=901>)

**Q.** How do I tell VoiceOver that a button's network action has completed when the button is replaced by a progress view and then restored?

Use accessibility notifications: <span class="high">layout-changed</span> for smaller UI updates, <span class="high">screen-changed</span> for larger ones, and the announcement notification to speak an arbitrary string. Avoid forcibly moving VoiceOver focus too often.

### 16:31 — [Text To Speech APIs](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=991>)

**Q.** Are there any new text-to-speech APIs this year?

No new public API this year, though there are backend improvements. File a feedback request if you need specific additions.

### 17:18 — [Dynamic Type On tvOS](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1038>)

**Q.** What should tvOS developers do to get ready for Dynamic Type now that it's available on the platform?

Learn the large-text best practices and be ready to reflow UI when accessibility font sizes are enabled. A new WWDC session this year covers large text on tvOS specifically, and tvOS now supports a large-text accessibility nutrition label.

### 18:13 — [Accessibility Nutrition Labels](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1093>)

**Q.** Can you talk about the value of accessibility nutrition labels?

They let users know before download whether an app supports the assistive technologies they need, saving time and reducing cognitive load. They also give developers a benchmark and a way to advocate internally for accessibility investment, and have inspired real community wins.

### 21:49 — [VoiceOver In Device Hub](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1309>)

**Q.** The new VoiceOver option in Xcode 27 Device Hub didn't do anything — is it for simulators or physical devices, and can we finally test iOS VoiceOver from a Mac?

There's a new XCTest API to drive iOS VoiceOver from a Mac, and it should be working in Seed 1's simulator. Bring specifics to the developer forums and the Accessibility Q&A tomorrow.

### 23:08 — [macOS VoiceOver Support](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1388>)

**Q.** As we add VoiceOver to a macOS app, what should we revisit and how should we test across assistive technologies on the Mac?

Mac users multitask and expect accelerators — hotkeys, jumps to sidebars and sections — so invest there. New VoiceOver features like image descriptions come for free, and the accessibility shortcut (triple-press Touch ID, or Command-Option-F5) makes toggling features fast during development.

### 26:09 — [AppKit Context Menu Actions](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1569>)

**Q.** For custom AppKit controls with context-menu and hover actions, how do I expose them so VoiceOver users can discover and perform them?

Custom actions are the default, but Mac users tend to skip them, so for important actions consider explicit buttons or hotkeys. In SwiftUI use <span class="high">accessibilityRepresentation</span> to re-expose a view as multiple buttons; in AppKit, override accessibility children with custom elements. Use hover actions sparingly because they're hard for cognitive accessibility.

### 28:30 — [Designing For Limited Hand Use](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1710>)

**Q.** How does Apple design accessibility features for people with limited or no use of their hands?

Apple offers many input alternatives — Voice Control, head tracking, on-device eye tracking, sound actions, Switch Control, Touch Accommodations (with a new calibration setup flow in iOS 27), and AssistiveTouch — because two people with the same disability often need very different solutions. On-device eye tracking on iOS is a standout because it works without external rigs.

### 32:16 — [Neurodivergent Features](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=1936>)

**Q.** What features are designed with neurodivergent users in mind?

Guided Access locks users into a single app experience, and Assistive Access provides a simplified visual language with large icons, big text, and large touch targets — recently extended to the TV app, with APIs for developers to build their own Assistive Access experiences. Screen Time, Speak Screen, Speak Selection, and Accessibility Reader also help.

### 34:46 — [Reorderable VoiceOver](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=2086>)

**Q.** How do I make SwiftUI's new reorderable modifier accessible to VoiceOver since drag-and-drop isn't a VoiceOver idiom?

The panel didn't have a definitive answer and suggested following up on the developer forums; drag-and-drop accessibility behavior varies between iOS and macOS.

### 35:47 — [FaceTime Video Interpreting](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=2147>)

**Q.** How can third-party apps integrate the new FaceTime video interpreting feature, and what entitlements or APIs apply?

That feature isn't available in the iOS 27 beta yet — more information will come when the APIs ship.

### 36:29 — [Reusable View Identifiers](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=2189>)

**Q.** For reusable SwiftUI components, what's the recommended way to expose stable accessibility identifiers without misusing <span class="high">accessibilityLabel</span>?

Wrap reusable components so callers are required to supply both an <span class="high">accessibilityIdentifier</span> and an <span class="high">accessibilityLabel</span> — even rejecting nil labels. This is especially important for symbol-based buttons.

### 38:02 — [Accessibility From Day One](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=2282>)

**Q.** What process keeps accessibility built in from the start of a project rather than bolted on later?

Check work with VoiceOver from day one and treat accessibility as a first-class planning category alongside privacy and security. Use human stories to motivate teammates, build accessibility into prototypes and iterations, and reserve time near the end to refine VoiceOver and Dynamic Type once the UI stabilizes. Weigh criticality to users, not just population size.

### 44:59 — [Cross-Platform Pitfalls](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=2699>)

**Q.** Are there platform-specific accessibility pitfalls to watch for when building a universal app across macOS, iPadOS, watchOS, and tvOS?

Test each platform individually because expectations differ: Mac users expect heavy keyboard shortcuts and hierarchical VoiceOver navigation with grouping, iOS depends on hit-testing and linear navigation, tvOS has only the remote, and watchOS adds the Digital Crown. Grouping is particularly important on the Mac for complex apps like Final Cut Pro.

### 51:31 — [AI Voices For VoiceOver](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=3091>)

**Q.** Will the new improved AI voices be available for VoiceOver?

VoiceOver uses voices specifically tuned for screen-reader use cases, where users often crank speech rate very high.

### 52:17 — [Preventing Regressions](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=3137>)

**Q.** Beyond manual testing, how do you prevent accessibility regressions — snapshot tests, automated UI tests with assertions?

XCTest and XCUITest rely on the accessibility hierarchy, so failing tests often surface accessibility regressions; you can also assert that views have accessibility labels. New API this year lets tests start VoiceOver and step element-to-element to validate what it speaks.

### 53:46 — [Xcode Accessibility](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=3226>)

**Q.** Are there accessibility improvements in Xcode and developer tools this year for a blind iOS developer?

Terminal accessibility improved significantly — better visible-beginning movement, marks, and tab auto-complete reading. Xcode has many VoiceOver bug fixes in Seed 1, SwiftUI levels the playing field by replacing WYSIWYG editing, and new AI coding skills for VoiceOver and Dynamic Type can edit code and diagnose accessibility issues on request.

### 57:30 — [visionOS Beyond Gaze](<https://developer.apple.com/videos/play/wwdc2026/8005/?time=3450>)

**Q.** For spatial computing tools that rely on gaze, how should designers avoid assuming all users can use visual gaze as the main input?

visionOS Pointer Control lets users substitute their head, finger, wrist, or ankle as a pointer instead of their eyes. Drew and Dan's original visionOS accessibility WWDC session covers this in depth, including a RealityKit accessibility API for 3D content.

---

## Highlights

- New XCTest API lets you drive iOS VoiceOver from a Mac, available in Seed 1 simulator.
- Xcode Seed 1 ships AI coding skills for VoiceOver and Dynamic Type that can edit code to fix accessibility issues.
- Use accessibility notifications (<span class="high">layoutChanged</span>, <span class="high">screenChanged</span>, <span class="high">announcement</span>) to signal UI changes to VoiceOver — avoid forcing focus too often.
- SwiftUI <span class="high">accessibilityRepresentation</span> lets a single view expose itself as multiple distinct accessibility elements (e.g. four buttons).
- iOS 27 adds a calibration-based setup flow for Touch Accommodations, similar to eye-tracking training.
- Accessibility shortcut: triple-press Touch ID on Mac, or Command-Option-F5; on macOS 27 toggle VoiceOver with Command-F5.
- Wrap reusable SwiftUI components to require both <span class="high">accessibilityIdentifier</span> and <span class="high">accessibilityLabel</span>, rejecting nil labels.
- Dynamic Type is now available on tvOS with a matching accessibility nutrition label and a dedicated WWDC session on large text in tvOS.
- Assistive Access now includes the TV app and offers APIs so third-party apps can ship optimized Assistive Access experiences.
- File feedback at feedbackassistant.apple.com; the Accessibility & Inclusion Q&A runs Wednesday 10 AM Pacific on the developer forums.

---

## Related sessions

- [Prepare your tvOS apps for Dynamic Type](<https://developer.apple.com/videos/play/wwdc2026/221/>)
- [Catch up on accessibility in SwiftUI](<https://developer.apple.com/videos/play/wwdc2024/10073/>)
- [Evaluate your app for Accessibility Nutrition Labels](<https://developer.apple.com/videos/play/wwdc2025/224/>)
- [Customize your app for Assistive Access](<https://developer.apple.com/videos/play/wwdc2025/238/>)
- [Make your Mac app more accessible to everyone](<https://developer.apple.com/videos/play/wwdc2025/229/>)
- [Create accessible spatial experiences](<https://developer.apple.com/videos/play/wwdc2023/10034/>)
- [Prepare your app for Accessibility Nutrition Labels](<https://developer.apple.com/videos/play/tech-talks/111433/>)

---
