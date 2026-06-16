# visionOS Group Lab

> WWDC26 · Session 8004 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8004/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest visionOS announcements. Conducted in English.

Host Adarsh moderates a visionOS panel with Katie, Norman, John, Matt, and Travis from the Vision Products Group, fielding developer questions about visionOS 27, RealityKit, USDKit, spatial accessories, and foveated streaming.

---

## Q&A

### 9:04 — [Front Camera Access](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=544>)

**Q.** How can an independent developer get access to the front-facing cameras without being in the Enterprise program?

Matt clarified main camera access (including the stereoscopic pair as of visionOS 26) is not exclusive to the Enterprise program — it's open to standard developer accounts attached to a business with a real use case. Apply via the developer site and post in the forums if blocked, and file feedback describing concrete use cases.

### 11:09 — [Debugging In Immersive](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=669>)

**Q.** How do you debug an app while inside an immersive space without removing the headset?

Katie recommended the developer setting (added last year) that allows Mac Virtual Display inside an immersive environment, so you can stay in your scene while hitting breakpoints in Xcode. The Apple team uses this workflow themselves — coding in MVD with immersive content alongside.

### 12:47 — [Agent Skills](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=767>)

**Q.** Are any of the new agent skills Apple is shipping relevant to visionOS development?

Katie noted a skill ships that helps translate an existing iOS UI to visionOS form factor and information density while following visionOS best practices.

### 13:40 — [USD Export Workflow](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=820>)

**Q.** What's the recommended workflow for exporting 3D models to USD when FBX/GLB conversions lose materials or transforms?

Travis advised exporting USD directly from your 3D content creation tool rather than transiting through other formats. Norman suggested iterating with USDA/USDC loose-file formats, and Travis noted the new OpenUSD core specification lets modern LLMs help reason about and fix USD assets.

### 16:14 — [Spatial Accessory Tracking](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=974>)

**Q.** Can spatial accessories be tracked outside the user's direct view, like foot trackers?

Matt explained accessories combine Bluetooth, an onboard IMU, and infrared emitters seen by Vision Pro's IR cameras, so brief occlusion is handled by the IMU. visionOS 27 opens the spec (DF Robot, Micro E boards) and adds a debug mode showing the IR feed; Apple wants feedback on foot-tracking use cases since lower-body breakthrough isn't provided today.

### 20:31 — [Gaussian Splat Culling](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1231>)

**Q.** Is there a way to disable the vignette/culling that occurs when the user moves their face inside a Gaussian splat, for telepresence reconstructions?

John said there is no API to disable that culling today and recommended filing feedback. Norman added the culling applies to all 3D models for unobstructed field-of-view safety; Apple wants screen recordings and sample projects describing the distance and intent.

### 23:49 — [Splat Cross-Platform](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1429>)

**Q.** Is Gaussian splat rendering supported on iOS as the docs suggest, since Xcode isn't showing the symbols?

John said Gaussian splatting should be supported on both iOS and visionOS; if Xcode behavior diverges from the docs during beta, file feedback.

### 24:41 — [User Profiles](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1481>)

**Q.** Why doesn't Vision Pro have multi-user profiles like macOS for shared family use?

Matt framed Vision Pro as a personal device closer to iPhone/iPad than Mac. Friction has been reduced via saving your enrollment to an iOS device (visionOS 26) so guest mode is unlocked by glancing at an App Clip code, plus Guest User with nearby device for AirPlay-mirrored assistance.

### 27:04 — [Face Tracking API](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1624>)

**Q.** Is there an API on visionOS to track the wearer's face and lips, similar to ARKit face tracking on iOS?

John confirmed ARKit face tracking remains iOS-only and recommended filing feedback. Matt noted third-party apps can request the matted persona video feed (persona over background) for video-conferencing use, but raw face data and lens-style effects aren't exposed.

### 28:22 — [Visual Intelligence Privacy](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1702>)

**Q.** Does Visual Intelligence on Vision Pro require third-party apps to access the main camera, or is it entirely system-level?

Katie confirmed it's a system-level capability done in a privacy-preserving way — no information is shared with third parties.

### 29:15 — [Controller Interaction Model](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=1755>)

**Q.** How does Apple see game controllers fitting alongside eyes, hands, and voice for non-game apps, and what new controller capabilities should developers target?

Norman described controllers (PSVR2 Sense, Logitech MX Ink) as deeply system-integrated via GameController and ARKit, with visionOS 27 expanding the spatial accessory spec for custom hardware. Matt and Katie emphasized eyes-and-hands remains the foundation modeled on real-world interaction; accessories add precision, haptics, or tool-like affordances when the experience calls for it.

### 33:32 — [WebXR AR Mode](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2012>)

**Q.** Are there updates to WebXR in Safari on visionOS 27, particularly to enable immersive AR mode instead of only VR?

Norman confirmed WebXR is supported but only in immersive (VR) rendering mode per the spec. Travis and Norman pointed to the new <span class="high"><model></span> HTML tag this year as a non-WebXR path that lets a webpage place USD assets into the user's environment with full platform capabilities.

### 36:09 — [Visual Intelligence Sensors](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2169>)

**Q.** Is Visual Intelligence on visionOS purely camera-based or does it use depth sensors too?

Norman wouldn't reveal implementation details but said Apple blends whatever sensors each device offers to produce the most accurate result. Matt added the same approach applies across SLAM, hand tracking, and other system features — the right sensor amalgamation for each use case.

### 37:49 — [Keeping Device Awake](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2269>)

**Q.** How do you keep Vision Pro awake on a desk during development since it sleeps the moment it leaves your head?

Matt explained there's intentionally no caffeination because Vision Pro has no lock button — taking it off must lock the device for security. Katie and Norman recommended developing inside Mac Virtual Display so you rarely doff, and setting up Optic ID for fast re-authentication when you do.

### 39:25 — [Automated Testing](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2365>)

**Q.** What's the state of automated testing for visionOS, ARKit, and RealityKit?

John pointed to the RealityRenderer class for driving RealityKit programmatically, and recommended the Migrate to Swift Testing and Get the Most Out of Device Hub sessions this year. Norman added RealityKit is now in Swift, so existing Swift/Xcode test infrastructure works out of the box.

### 40:52 — [Common Beginner Mistakes](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2452>)

**Q.** What are the biggest mistakes new visionOS developers make?

Katie called out porting iOS information density and tap-target sizes one-to-one instead of redesigning for eyes-and-hands input, and not adding visionOS-only features (like 3D product models) when bringing iOS apps over. Norman urged thinking beyond legacy paradigms to use spatial superpowers, and Travis warned that compressed images and video encodings optimized for TVs reveal macroblocking on Vision Pro's high-fidelity, close-up display.

### 47:18 — [Agentic Coding Errors](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=2838>)

**Q.** When using agentic coding in Xcode to generate a visionOS RealityView project, the LLM produced wrong syntax — how do you fix or teach it?

Katie advised verifying LLM output and feeding Apple's robust sample projects (Hello World, Petite Asteroids, Canyon Crosser, the new Model Manipulator sample) as context. Norman noted models trained on older API years lag behind new SDK releases, so currency varies; Matt highlighted the Collaborate on Structured 3D Models session and sample as a useful reference.

### 50:49 — [Object Tracking Performance](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=3049>)

**Q.** How fast can object tracking get now in terms of frame rate and latency?

Matt reported visionOS 27 adds a high frame rate mode reaching up to 30 fps (up from ~5 fps in visionOS 2), with significant latency reduction and new smoothing that makes tracked objects feel attached in hand. The same trained models now also work on iOS, and Create ML adds an extended training mode for higher accuracy. Norman noted tracking updates now carry frame-display-time-aligned timestamps.

### 53:30 — [Exposing Internal Frameworks](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=3210>)

**Q.** Will Apple expose more internal frameworks like Persona Kit and Core IK to developers, especially for accessibility and telepresence?

Travis gave the standard no-future-comment but encouraged feedback, particularly for accessibility where Apple sees high impact. Matt highlighted the recently announced wheelchair-control feature shipping in visionOS 27 as an example of accessibility work the platform enables.

### 55:30 — [Shared Mac Virtual Display](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=3330>)

**Q.** Mac Virtual Display is tied to the Vision Pro's iCloud account — is there a supported path for driving multiple shared enterprise Macs?

Matt confirmed MVD requires shared iCloud today and asked for feedback on the enterprise scenario. Norman and Matt pointed to alternatives: the new Spatial Preview framework and last year's Remote Immersive Space (host rendering on Mac, stream stereoscopically) both work without matching iCloud accounts, and foveated streaming supports two-way data with SwiftUI/SharePlay still on the visionOS side.

### 59:27 — [Splats In USDZ](<https://developer.apple.com/videos/play/wwdc2026/8004/?time=3567>)

**Q.** Can Gaussian splats live inside a USDZ alongside meshes and be used in a website?

Travis explained OpenUSD supports particle fields (the generic form of Gaussian splats) — Apple, Adobe, and others drove that through the standard — and RealityKit has its own splat support, but the two pipelines haven't been wired together yet. Norman said this year laid the foundation in RealityKit and the next step is aligning the standardization, runtime, and authoring stories end-to-end.

---

## Highlights

- visionOS 27 highlights from the panel: Physical Space Lighting, Spatial Panos, Spatial Preview framework, USDKit, foveated streaming, and unfoveated on-device screen recording up to 3 minutes.
- Spatial accessory spec is open in visionOS 27 — DF Robot and Micro E sell trackable add-on caps and IR-emitter boards; a new debug mode visualizes Vision Pro's infrared feed.
- Object tracking jumps from ~5 fps to a 30 fps high-frame-rate mode with frame-display-time-aligned timestamps; trained models now also run on iOS, with Create ML adding an extended training mode.
- Recommended sessions: Build Next Generation Experiences for visionOS 27, What's New in Object Tracking and Spatial Accessories, Collaborate on Structured 3D Models in visionOS, Migrate to Swift Testing, Get the Most Out of Device Hub.
- Sample projects to lean on: Hello World, Petite Asteroids, Canyon Crosser, and the new Model Manipulator sample for complex 3D hierarchy editing.
- Save enrollment to an iOS 26 device for app-clip-fast guest unlocking; combine with Optic ID and Mac Virtual Display inside immersive scenes for a frictionless dev loop.

---

## Related sessions

- [Explore enhancements to visionOS object tracking](<https://developer.apple.com/videos/play/wwdc2026/283/>)
- [Create enhanced spatial computing experiences with ARKit](<https://developer.apple.com/videos/play/wwdc2024/10100/>)
- [Migrate to Swift Testing](<https://developer.apple.com/videos/play/wwdc2026/267/>)
- [Get the most out of Device Hub](<https://developer.apple.com/videos/play/wwdc2026/260/>)
- [Build next-generation experiences with visionOS 27](<https://developer.apple.com/videos/play/wwdc2026/287/>)
- [Collaborate on structured 3D models in visionOS](<https://developer.apple.com/videos/play/wwdc2026/284/>)
- [Design considerations for vision and motion](<https://developer.apple.com/videos/play/wwdc2023/10078/>)
- [Use foveated streaming to bring immersive content to visionOS](<https://developer.apple.com/videos/play/wwdc2026/286/>)

---
