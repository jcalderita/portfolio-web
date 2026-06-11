---
title: WWDC26 Videos
slug: wwdc26-videos
date: 2026-06-11
description: WWDC26 publishes over a hundred sessions. I built my own grouping and checklist to watch them in my order and tick off blocks throughout the year.
tags: Swift, Conference
cover: WWDC26Videos
coverDescription: Jorge standing in front of a blackboard writing "WWDC 26 - Videos" with a numbered sequence of icons representing an eleven-step flow connected by arrows, while through the window a park with runners and a blue sky is visible.
publish: true
---
---
## My Problem 🤔

Every year the same ritual: the Monday after the Keynote I open the [WWDC26](https://developer.apple.com/videos/all-videos/?collection=wwdc26) videos and find more than a hundred sessions. Apple offers filters by topic, platform and framework that you can stack until the catalog fits your needs — a great starting point.

What happens to me is that, even with those filters active, if I don't set my own order I end up jumping from video to video based on whatever title catches my eye in the moment. I watch a bit of <span class="high">SwiftUI</span>, then I jump to <span class="high">AI</span>, then I move on to tools, and by the end of the day I've consumed five disconnected sessions that don't reinforce each other. Comprehension is shallow because each topic block needs prior context that I don't have.

For a while I've wanted to put together my own scheme over what Apple offers. A path with a sense of direction, that builds knowledge cumulatively, that puts the things providing context for everything else first — and that also works as a checklist to tick off blocks as I progress throughout the year.

This year I've done it.

---
## My Solution 🧩

My criterion is simple: **first the overall vision, then the language core, then the tooling, and finally the specific areas based on what I use most in my work**. Each block prepares the ground for the next.

I leave out only the ASL versions and the recaps (Dub Dub Daily, State of the Union recap). Everything else is in — including Group Labs, which although they were live interactive sessions, Apple keeps them in the catalog, so I leave them at the end as a topic reference.

What follows is the grouping I use, and that I tick off block by block throughout the year. If it works for you, make it your own: what matters is having a path to follow, not that it's mine.

---

### Block 0 — The presentations

Before any technical session, these videos set the frame for the year. The teaser whets the appetite; Keynote and State of the Union are the ones that matter.

**[Get ready for WWDC26](https://developer.apple.com/videos/play/wwdc2026/394/)**
The pre-event teaser from WWDC itself. Marginal once you've seen the Keynote, but it's in the catalog.

**[Keynote](https://developer.apple.com/videos/play/wwdc2026/101/)**
The big announcement of the year. <span class="high">Liquid Glass</span>, <span class="high">Apple Intelligence</span> with the new <span class="high">Siri</span>, <span class="high">Xcode 27</span> with <span class="high">code agents</span>. Not technical — it's the why behind everything else.

**[Platforms State of the Union](https://developer.apple.com/videos/play/wwdc2026/102/)**
The Keynote for developers. Here the technical layer already shows up: what changes on the platforms, what priorities Apple has for this cycle, and what will matter for day-to-day work. This video is the map of the territory.

---

### Block 1 — Swift and tooling

With the year's context clear, I move into the core. <span class="high">Swift</span> first because everything else is built on top of the language.

**[What's new in Swift](https://developer.apple.com/videos/play/wwdc2026/262/)**
Language update: ergonomic improvements, enhanced <span class="high">concurrency</span>, safer high-performance code, Embedded Swift and C and Java interop. The state of the language in 2026.

**[What's new in Xcode 27](https://developer.apple.com/videos/play/wwdc2026/258/)**
Updates to the environment: <span class="high">code agents</span>, <span class="high">Device Hub</span>, <span class="high">localization</span>, <span class="high">performance</span> and <span class="high">testing tools</span>. If I'm going to live here, I need to know what's changed.

**[Get the most out of Device Hub](https://developer.apple.com/videos/play/wwdc2026/260/)**
Deep tour of <span class="high">Device Hub</span>: how it speeds up the development flow and how to quickly diagnose and reproduce issues with devices and simulators. The natural companion to the previous video.

**[Xcode, agents, and you](https://developer.apple.com/videos/play/wwdc2026/259/)**
How to fold the <span class="high">Xcode code agents</span> into a real workflow. From the initial prototype to polishing a finished app. The practical side of what was shown in the previous video.

**[Create UI prototypes using agents in Xcode](https://developer.apple.com/videos/play/wwdc2026/227/)**
<span class="high">Prototyping with agents</span>: techniques to iterate over layouts, generate creative solutions and refine ideas into a polished experience. The creative side of agents in Xcode.

**[Translate your app using agents in Xcode](https://developer.apple.com/videos/play/wwdc2026/213/)**
How <span class="high">agents translate String Catalogs</span> using the app's context. Strategies to review the output and adjust localizations. The practical side for a global product.

**[Build, deliver, and automate with Xcode Cloud](https://developer.apple.com/videos/play/wwdc2026/261/)**
What's new in <span class="high">Xcode Cloud</span>: simplified onboarding, cloud tests, webhooks and distribution. Fundamentals for anyone using it in CI.

**[Profile, fix, and verify: Improve app responsiveness with Instruments](https://developer.apple.com/videos/play/wwdc2026/268/)**
A full flow to tackle performance problems: <span class="high">Swift Concurrency instrument</span>, <span class="high">Time Profiler</span> and <span class="high">System Trace</span>. Find the bottleneck, measure the improvement, confirm the fix.

**[Meet the new MetricKit](https://developer.apple.com/videos/play/wwdc2026/222/)**
<span class="high">MetricKit</span> refreshed with vital performance metrics and actionable diagnostics. Cross-referencing metrics with app state via the <span class="high">StateReporting framework</span> for the complete optimization picture.

**[Migrate to Swift Testing](https://developer.apple.com/videos/play/wwdc2026/267/)**
Adopt <span class="high">Swift Testing</span> alongside existing XCTests using framework interop. Patterns to introduce the new testing capabilities incrementally. Connects with what I cover in [SIGBUS](/blog/sigbus/).

---

### Block 2 — SwiftUI and persistence

The UI and data stack. I watch them together because in practice they go hand in hand.

**[What's new in SwiftUI](https://developer.apple.com/videos/play/wwdc2026/269/)**
New <span class="high">Document</span> protocol with direct disk access, reorder APIs in lists and grids, toolbar improvements, new presentations, <span class="high">AsyncImage caching</span> and lazy state for <span class="high">Observable</span>. The overview of what's new in the framework.

**[What's new in SwiftData](https://developer.apple.com/videos/play/wwdc2026/274/)**
Persistence of external types with <span class="high">Codable</span>, grouping results into sections for SwiftUI, <span class="high">ModelResultsObserver</span> and <span class="high">HistoryObserver</span> to observe changes outside the view. The updates to Apple's ORM.

**[Code-along: Add persistence with SwiftData](https://developer.apple.com/videos/play/wwdc2026/275/)**
Hands on keyboard: adding <span class="high">persistence</span> to an existing app step by step. Defining models, integrating persisted data with SwiftUI, managing app state. The best place to cement what was shown in the previous video.

**[Code-along: Build powerful drag and drop in SwiftUI](https://developer.apple.com/videos/play/wwdc2026/271/)**
Building Solitaire to explore the new drag and drop capabilities: <span class="high">reorder API</span>, drag containers to move multiple items, and a custom lifecycle. Practical and direct.

**[Dive into lazy stacks and scrolling with SwiftUI](https://developer.apple.com/videos/play/wwdc2026/321/)**
List and scroll performance in SwiftUI. When to use lazy stacks, how to <span class="high">optimize scroll behavior</span>, which patterns to avoid.

**[Compose advanced graphics effects with SwiftUI](https://developer.apple.com/videos/play/wwdc2026/322/)**
Advanced <span class="high">graphics effects</span> with SwiftUI. Layer composition, blending modes and visual effects that go beyond the basics.

**[Use SwiftUI with AppKit and UIKit](https://developer.apple.com/videos/play/wwdc2026/272/)**
Incremental adoption of SwiftUI in existing AppKit or UIKit apps: the <span class="high">Observation</span> framework to update views, integrating SwiftUI components into existing hierarchies, and adding full SwiftUI scenes without changing the architecture.

**[Modernize your UIKit app](https://developer.apple.com/videos/play/wwdc2026/278/)**
Updating iPhone layouts to work well with <span class="high">iPhone Mirroring</span> and on iPad. New tab and navigation bar APIs, preparing the app for Apple Intelligence, and a skill for the code agent that modernizes the codebase.

---

### Block 3 — Apple Intelligence and Foundation Models

The block I'm most interested in this year. I watch it as a unit because each video builds on the previous one.

**[What's new in the Foundation Models framework](https://developer.apple.com/videos/play/wwdc2026/241/)**
Access to <span class="high">Private Cloud Compute</span>, integration with third-party and open source models, vision capabilities, context management APIs, <span class="high">built-in semantic search</span> and primitives for agentic experiences. The overview of Apple's main AI framework.

**[Build agentic app experiences with the Foundation Models framework](https://developer.apple.com/videos/play/wwdc2026/242/)**
Dynamic profiles, dynamic instructions, <span class="high">context management</span> and orchestration patterns between local and server models. The advanced layer on top of the previous video.

**[Bring an LLM provider to the Foundation Models framework](https://developer.apple.com/videos/play/wwdc2026/339/)**
Extending the framework by implementing a <span class="high">LanguageModelExecutor</span> for new models. Interacting with the session transcript, managing state, optimizing the KV cache and supporting custom segment types. The door to integrating your own model into Apple's stack.

**[Debug and profile agentic app experiences with Instruments](https://developer.apple.com/videos/play/wwdc2026/243/)**
How to debug and profile agentic experiences with <span class="high">Instruments</span>. Because when something fails in an agent, you need to know where and why.

**[Meet the Evaluations framework](https://developer.apple.com/videos/play/wwdc2026/298/)**
In a probabilistic world, unit tests aren't enough. <span class="high">Quantitative and qualitative metrics</span>, model judges, aggregate statistics to ensure AI features work reliably.

**[Create robust evaluations for agentic apps](https://developer.apple.com/videos/play/wwdc2026/299/)**
The <span class="high">advanced evaluations layer</span>: flows with tool calling, dynamic conditions, synthetic data generation, judges and dataset validation. The real work behind getting an agent to behave correctly.

**[Improve your prompts by hill-climbing with Evaluations](https://developer.apple.com/videos/play/wwdc2026/335/)**
Using the evaluation loop to improve prompts iteratively. The closing piece of the evaluations block.

**[Build AI-powered scripts with the fm CLI and Python SDK](https://developer.apple.com/videos/play/wwdc2026/334/)**
Scripts with the <span class="high">Foundation Models CLI</span> and Python SDK. Automation and prototyping outside the Swift environment.

---

### Block 4 — Siri and App Intents

The bridge between the app and the system's intelligence. I go from the conceptual to the practical.

**[Announcing Apple's next big step for Siri and iPhone](https://developer.apple.com/videos/play/wwdc2026/121/)**
The big announcement of the new Siri. The essential context before diving into the technical integration videos.

**[Discover new capabilities in the App Intents framework](https://developer.apple.com/videos/play/wwdc2026/345/)**
<span class="high">ValueRepresentation</span>, <span class="high">RelevantEntities</span>, <span class="high">EntityCollection</span>, <span class="high">SyncableEntity</span>, richer parameter types and long-running intents. What's new in the base framework.

**[Explore advanced App Intents features for Siri and Apple Intelligence](https://developer.apple.com/videos/play/wwdc2026/343/)**
Advanced techniques so Siri can interact with the app naturally: content discovery, <span class="high">semantic indexing</span>, structured search and connection with notifications and Now Playing.

**[Build intelligent Siri experiences with App Schemas](https://developer.apple.com/videos/play/wwdc2026/240/)**
Adopt <span class="high">App Schemas</span> so people can ask questions about app data and take actions through natural language. Practical example with calendar events and Spotlight.

**[Code-along: Make your app available to Siri](https://developer.apple.com/videos/play/wwdc2026/344/)**
The code-along of everything above: integrating <span class="high">App Intents</span> into a real calendar app, creating entities, triggering Siri actions and customizing response snippets.

**[Validate your App Intents adoption with AppIntentsTesting](https://developer.apple.com/videos/play/wwdc2026/295/)**
<span class="high">AppIntentsTesting</span>: validate intents with the same infrastructure used by Siri, Shortcuts and Spotlight. Execute intents, inspect results, test entities and queries without UI automation. The closing piece of the block — test what you've integrated.

---

### Block 5 — Core AI and ML

For anyone who wants to go beyond high-level frameworks and step into the model layer.

**[Meet Core AI](https://developer.apple.com/videos/play/wwdc2026/324/)**
The <span class="high">new framework</span> for deploying AI models on device: a full ecosystem from Python for conversion and optimization to the Swift API for inference. Deep integration with Xcode and ahead-of-time compilation.

**[Integrate on-device AI models into your app using Core AI](https://developer.apple.com/videos/play/wwdc2026/326/)**
A collection of open source models optimized for Apple silicon — <span class="high">Qwen</span>, <span class="high">Mistral</span>, <span class="high">SAM3</span> — and how to integrate them in a few lines of code. AOT compilation and on-device specialization.

**[Dive into Core AI model authoring and optimization](https://developer.apple.com/videos/play/wwdc2026/325/)**
Authoring and optimizing models with the Python tools in <span class="high">Core AI</span>. The deep layer for anyone who wants to control the full pipeline.

**[Optimize custom machine learning operations with Metal tensors](https://developer.apple.com/videos/play/wwdc2026/330/)**
The <span class="high">Metal Tensor API</span> and the <span class="high">MPP Tensor Ops</span> library. Create portable operations that take advantage of the Neural Accelerators on M5 and A19, build custom kernels for Core AI apps and work with quantized formats. The low-level layer to push performance to the limit.

**[Explore numerical computing in Swift with MLX](https://developer.apple.com/videos/play/wwdc2026/328/)**
MLX for <span class="high">numerical computing</span> in Swift. The primitives everything else in ML builds on.

**[Explore distributed inference and training with MLX](https://developer.apple.com/videos/play/wwdc2026/233/)**
Distributed inference and training with <span class="high">MLX</span>. Scale to multiple Macs.

**[Run local agentic AI on the Mac using MLX](https://developer.apple.com/videos/play/wwdc2026/232/)**
AI agents running <span class="high">locally with privacy</span>, low latency and offline. <span class="high">OpenCode</span>, integration with Xcode and techniques to scale across Macs.

**[Build with the new Apple Foundation Model on Private Cloud Compute](https://developer.apple.com/videos/play/wwdc2026/319/)**
Using Apple's new model on <span class="high">Private Cloud Compute</span>. The end of the spectrum: when the device isn't enough but privacy still comes first.

---

### Block 6 — Networking, services and infrastructure

Three videos that cover the communication and runtime layer: from the client to the service, and the infrastructure that runs them.

**[Build real-time apps and services with gRPC and Swift](https://developer.apple.com/videos/play/wwdc2026/265/)**
<span class="high">gRPC Swift</span> for real-time experiences: the open source RPC framework with bidirectional streaming, built on Swift concurrency. From the service definition in <span class="high">Protobuf</span> to production deployment. Protobuf messages are 50% smaller than JSON and the runtime is modern and safe.

**[Discover container machines](https://developer.apple.com/videos/play/wwdc2026/389/)**
<span class="high">Container machines</span> on Apple platforms. Infrastructure for development and deployment of Swift services.

**[Expand the capabilities of your Virtualization app](https://developer.apple.com/videos/play/wwdc2026/224/)**
New capabilities in macOS 27 for <span class="high">Virtualization</span> apps. Automating macOS guest setup at first boot, USB accessory passthrough, custom network topologies and port forwarding.

---

### Block 7 — Design and accessibility

The layer you don't see but that defines whether an app is good or not.

**[Principles of great design](https://developer.apple.com/videos/play/wwdc2026/250/)**
The foundational principles of Apple <span class="high">app design</span>. The conceptual frame before diving into concrete APIs.

**[Communicate your brand identity on iOS](https://developer.apple.com/videos/play/wwdc2026/251/)**
Express <span class="high">brand identity</span> on iOS with the new visual personalization tools.

**[Design intuitive search experiences](https://developer.apple.com/videos/play/wwdc2026/292/)**
<span class="high">Designing searches</span> that people understand and use. Patterns and antipatterns.

**[Craft clear names for features and labels in your app](https://developer.apple.com/videos/play/wwdc2026/290/)**
<span class="high">Naming features and labels</span>. One of those videos that seems minor and ends up being among the most practical.

**[Refine accessibility for custom controls](https://developer.apple.com/videos/play/wwdc2026/220/)**
<span class="high">Accessibility on custom controls</span>. How to make what you build work for everyone.

**[Modernize your AppKit app](https://developer.apple.com/videos/play/wwdc2026/289/)**
Modernizing AppKit to current macOS conventions. Input with <span class="high">control events</span> and gesture recognizers beyond tracking loops, keyboard navigation, state restoration, and new corner concentricity APIs to fit the macOS aesthetic.

---

### Block 8 — System integration

The APIs that put my app inside the system: surfaces like Live Activities, widgets, Lock Screen or CarPlay; integration with native apps (Workouts), Bluetooth accessories, and shortcuts. If the app lives beyond its own window, this block is relevant.

**[Live Activities essentials](https://developer.apple.com/videos/play/wwdc2026/223/)**
Fundamentals of <span class="high">Live Activities</span>: where they show up, the new landscape <span class="high">Dynamic Island</span> style, how to structure content and data, and how to trigger them in real time with ActivityKit and push notifications. The foundation if I'm going to use this API.

**[WidgetKit foundations](https://developer.apple.com/videos/play/wwdc2026/277/)**
The widget types, what makes them memorable, and how to keep them up to date. <span class="high">Personalization via App Intents</span> and dynamic styles. If the app needs to live outside its icon, start here.

**[Create live communication experiences](https://developer.apple.com/videos/play/wwdc2026/226/)**
<span class="high">LiveCommunicationKit</span> turns real-time communication apps into integrated experiences. Native conversation UI, full-screen presentation on Lock Screen, multitasking with Dynamic Island. Incoming, outgoing and group conversations.

**[Rev up your CarPlay app](https://developer.apple.com/videos/play/wwdc2026/212/)**
New features for audio, navigation and voice-driven conversation apps on <span class="high">CarPlay</span>. Video apps to play content in compatible vehicles when parked. Thumbnails, media info and voice controls.

**[Deliver workout insights with HealthKit workout zones](https://developer.apple.com/videos/play/wwdc2026/207/)**
<span class="high">HealthKit</span> with workout insights — heart-rate zones and cycling power zones. Built-in or custom zones, current zone and time in each zone to guide during and after training.

**[Find your accessory with Bluetooth Channel Sounding](https://developer.apple.com/videos/play/wwdc2026/369/)**
<span class="high">Channel Sounding</span> adds distance and direction to Bluetooth accessories. New Nearby Interaction and Core Bluetooth APIs and the required changes on the accessory. Optimized power consumption without losing responsiveness.

**[What's new in Shortcuts](https://developer.apple.com/videos/play/wwdc2026/310/)**
Building shortcuts with app content, new system automations, and the <span class="high">Use Model</span> feature to refine how an App Entity is presented to LLMs. Shortcuts that store rich information synchronized across devices.

**[LLM search using Core Spotlight](https://developer.apple.com/videos/play/wwdc2026/246/)**
Turning basic search into a <span class="high">RAG</span> system with <span class="high">SpotlightSearchTool</span> and LanguageModelSession. Integration with Core Spotlight, delegate-based hydration, PipelineStages for tasks like sentiment analysis. Real contextual search over the system index.

---

### Block 9 — Security and administration

Five videos that matter more than ever this year. With all the added AI, assuming that app integrity, prompt injection or user manipulation aren't your problem is a risk. And for apps living in managed environments — education, enterprise, fleet — the admin posture matters too.

**[Secure your app: mitigate risks to agentic features](https://developer.apple.com/videos/play/wwdc2026/347/)**
Evaluating threats from <span class="high">indirect prompt injection</span>: data exfiltration, unintended actions. System safeguards and best practices with App Intents and Foundation Models — user confirmations, safe prompt design, authentication. A must if I have agentic features.

**[Secure your apps with App Attest](https://developer.apple.com/videos/play/wwdc2026/201/)**
<span class="high">App Attest</span> against unauthorized modification and fraud. How attackers spoof data and skip checks, and how to defend. Generating and managing keys in the <span class="high">Secure Enclave</span>, validating attestations and assertions, and using the fraud metric to detect abuse.

**[Meet Trust Insights](https://developer.apple.com/videos/play/wwdc2026/379/)**
<span class="high">Trust Insights</span> uses privacy-preserving ML to detect when someone might be being manipulated into risky actions. Integration, signal interpretation and designing interventions that protect while respecting privacy.

**[What's new in managing Apple devices](https://developer.apple.com/videos/play/wwdc2026/206/)**
Updates to <span class="high">declarative device management</span>, Apple Business and Apple School Manager. Streamlining deployment, strengthening security and improving the managed fleet experience.

**[What's new in assessment on macOS](https://developer.apple.com/videos/play/wwdc2026/230/)**
<span class="high">Automatic Assessment Configuration</span> on macOS for education apps. APIs to create secure, configurable exam environments that incorporate more system features. Automatic prechecks and accessibility controls for a reliable exam experience.

---

### Block 10 — visionOS, RealityKit and spatial content

The largest block in the catalog. I only watch it if I'm working with Vision Pro or if I want to experiment with spatial scenes. If it's not my area, I leave it for later.

**[Build next-generation experiences with visionOS 27](https://developer.apple.com/videos/play/wwdc2026/287/)**
The <span class="high">visionOS 27 overview</span>: the different paths to build experiences — native Apple tools, immersive streaming from Mac or PC, third-party engines, porting iOS apps. Advances in 3D content creation, immersive media and object tracking. The video to start the block with.

**[Explore advances in RealityKit](https://developer.apple.com/videos/play/wwdc2026/279/)**
What's new in <span class="high">RealityKit</span>: interactive cloth simulations, <span class="high">NavMesh</span> pathfinding, mixed reality lighting, customizable reverb meshes for spatial audio. Better shading, character rendering and support for <span class="high">Gaussian splatting</span>.

**[Design immersive environments for visionOS apps and the spatial web](https://developer.apple.com/videos/play/wwdc2026/234/)**
Creating <span class="high">photorealistic environments</span> for visionOS apps, websites and SharePlay experiences. Design principles, reference capture, high-fidelity CG asset preparation and real-time effects like motion and lighting.

**[Iterate your spatial scenes faster with Reality Composer Pro 3](https://developer.apple.com/videos/play/wwdc2026/280/)**
What's new in <span class="high">Reality Composer Pro 3</span>: content, VFX, lighting and interactivity without leaving the editor. AI-assisted features integrated into the flow. The tool you'll live in if you build spatial content.

**[Extend Reality Composer Pro 3 functionality with Xcode](https://developer.apple.com/videos/play/wwdc2026/281/)**
Project-specific <span class="high">plugins</span> in Reality Composer Pro 3: custom components, custom systems, custom <span class="high">ScriptGraph</span> nodes. Full control over the spatial authoring workflow.

**[Discover the Spatial Preview framework](https://developer.apple.com/videos/play/wwdc2026/282/)**
The new <span class="high">Spatial Preview framework</span> sends content from Mac directly to visionOS. Live-syncing and bidirectional editing across platforms. The SpatialPreview API, device discovery, 2D/3D integration and new Quick Look capabilities.

**[Explore enhancements to visionOS object tracking](https://developer.apple.com/videos/play/wwdc2026/283/)**
Advances in <span class="high">object tracking</span> and spatial accessories. Tracking moving and handheld objects, new supported classes of spatial accessories, and how to build custom accessories to unlock unique interaction models.

**[Collaborate on structured 3D models in visionOS](https://developer.apple.com/videos/play/wwdc2026/284/)**
Structured 3D models in visionOS: <span class="high">USDZ</span> preparation, manipulating entities within hierarchical assemblies, inspecting with a cross-section cut plane. Exploded-view animations for design and collaboration on Vision Pro.

**[Discover USDKit and what's new in OpenUSD](https://developer.apple.com/videos/play/wwdc2026/285/)**
<span class="high">USDKit</span> in Swift, the new spatial preview API, enhanced spatial web. Updates to the <span class="high">OpenUSD</span> standard: accessibility, Gaussian splats, compressed geometry. Expanded USD editing and rendering tools in Preview for Mac.

**[Use foveated streaming to bring immersive content to visionOS](https://developer.apple.com/videos/play/wwdc2026/286/)**
<span class="high">Foveated streaming</span>: scenes rendered remotely to Vision Pro in maximum fidelity. Combines native capabilities with third-party streaming wirelessly, demonstrated with an <span class="high">OpenXR</span> scene and NVIDIA CloudXR. Dynamic foveated streaming without compromising privacy.

**[Explore immersive website environments in visionOS](https://developer.apple.com/videos/play/wwdc2026/320/)**
The new <span class="high">Immersive API</span> in JavaScript takes your website visitors into virtual environments on Vision Pro. Transitions from an inline model element, video docking, real-scale optimization. A few lines of code running on the web.

**[Supercharge your spatial workflows with Reality Composer Pro 3](https://developer.apple.com/videos/play/wwdc2026/393/)**
Rich interactivity and full visual effects inside Reality Composer Pro: <span class="high">Shader Graph</span> for materials, <span class="high">Animation Graph</span> for blending skeletal animations, <span class="high">Compute Graph</span> for particles. Script Graph for interactivity, Sequencer for events and Behavior Trees for NPCs.

**[Build live production tools for Apple Immersive Video](https://developer.apple.com/videos/play/wwdc2026/338/)**
Live production of <span class="high">Apple Immersive Video</span>. Packaging immersive video, spatial audio and scene metadata for IP transport with the <span class="high">SMPTE 2110</span> standard. Immersive Media Support, Video Toolbox and AVFoundation for real-time flows.

---

### Block 11 — Games and Metal

If I work on a game, this block is a mandatory stop. If not, I watch it out of curiosity because there are performance pieces that also apply to non-game apps.

**[Bringing Cyberpunk 2077 to Mac](https://developer.apple.com/videos/play/wwdc2026/356/)**
How CD PROJEKT RED brought <span class="high">Cyberpunk 2077 to Mac</span> taking advantage of Apple hardware, software and tools. Techniques applicable to other games. The <span class="high">For this Mac</span> preset that automatically optimizes settings to balance visual fidelity and framerate across the Mac lineup.

**[Speedrun your game port with agentic coding](https://developer.apple.com/videos/play/wwdc2026/357/)**
The new <span class="high">agentic skills</span> in Game Porting Toolkit 4 speed up porting. Adopting <span class="high">Metal 4</span>, integrating <span class="high">MetalFX</span>, tuning the game for Apple hardware. Agents that diagnose GPU rendering issues autonomously.

**[Make your game great with touch](https://developer.apple.com/videos/play/wwdc2026/358/)**
Convincing touch controls for games. Insights from indie to AAA devs, best practices, and how to take advantage of the <span class="high">Touch Controller framework</span> and Metal for optimal performance.

**[Design no-code games with Reality Composer Pro 3](https://developer.apple.com/videos/play/wwdc2026/252/)**
<span class="high">ScriptGraph</span> in Reality Composer Pro 3 for no-code 3D content. Visual nodes for animations, interactive moments, and integration with SwiftUI to add speech bubbles and UI to the experience.

**[Build real-time neural rendering pipelines with Metal](https://developer.apple.com/videos/play/wwdc2026/359/)**
ML integrated into the rendering pipeline with <span class="high">Metal 4</span>. <span class="high">MetalFX neural denoising</span> with insights from Maxon Redshift Live. Training and deploying a neural tone mapper inline with the ML command encoder, and the new tensor API for small networks inside your shaders.

**[Find and fix performance issues in your Metal games](https://developer.apple.com/videos/play/wwdc2026/388/)**
Hunting performance problems with Metal tools: <span class="high">Game Performance Overview</span> in Instruments, background traces with metalperftrace and Control Center, and the new <span class="high">StateReporting API</span> to correlate metrics with the game's runtime state. Hours of telemetry turned into actionable insights.

---

### Block 12 — Camera, photography and imaging

For apps with camera or image processing. Some videos are very specific (RAW, Center Stage), others apply even if I'm just displaying a preview.

**[What's new in image understanding](https://developer.apple.com/videos/play/wwdc2026/237/)**
Updated Vision framework and Foundation Models. The new <span class="high">tap-to-segment</span> request to segment images, Vision on watchOS, and image support in the Apple Foundation Model combined with OCR, barcode scanning and custom tools.

**[Best practices for integrating visual intelligence in your app](https://developer.apple.com/videos/play/wwdc2026/297/)**
How <span class="high">Visual Intelligence</span> transforms content discovery. Defining entities, processing images, handling multiple result types. Optimizing speed and relevance, and intents for direct actions like opening or playing content with a tap.

**[Build a responsive camera app that launches quickly](https://developer.apple.com/videos/play/wwdc2026/303/)**
Optimizing the full camera startup sequence — from launch to the <span class="high">first preview frame</span>. New APIs for faster launches, smooth rendering and sustained performance. So people never miss the moment.

**[Implement high resolution photo capture](https://developer.apple.com/videos/play/wwdc2026/304/)**
High-resolution photo capture with AVFoundation. The three options — <span class="high">RAW</span>, <span class="high">exposure-bracketed</span>, <span class="high">fully processed</span> — and when to use each one. Configuring 24MP and 48MP capture on Main, Tele and Ultra Wide cameras. Deferred photo processing so the app stays responsive even with rapid bursts.

**[Enhance RAW image processing with Core Image](https://developer.apple.com/videos/play/wwdc2026/305/)**
Version 9 of <span class="high">Core Image</span>'s RAW APIs: sharper detail, more defined color, Apple Neural Engine for performance. <span class="high">CIRAWFilter</span> to edit exposure, noise, sharpness and contrast. New CIImageProcessor APIs with fine control over tile sizing and buffers.

**[Support the Center Stage front camera in your iOS app](https://developer.apple.com/videos/play/wwdc2026/341/)**
<span class="high">Center Stage</span> with AVCapture APIs on the front camera of iPhone 17, 17 Pro and Air. Zoom and rotate, flexible framing for selfies and videos, everyone framed in group photos. Integration into video calls with auto-framing and real-time stabilization.

**[Create high quality images using Image Playground](https://developer.apple.com/videos/play/wwdc2026/375/)**
Image generation with <span class="high">Image Playground</span>. Generative model on <span class="high">Private Cloud Compute</span>, images in almost any style including photorealistic, specific dimensions, and modification through natural language and touch.

---

### Block 13 — Web and Safari

For web devs: what's new in WebKit and the new pieces of CSS and HTML that Safari premieres this year.

**[What's new in WebKit for Safari 27](https://developer.apple.com/videos/play/wwdc2026/204/)**
The overview of WebKit and <span class="high">Safari 27</span>: Grid Lanes, Customizable Select, HTML Model, Immersive Environments, the latest in Web Extensions. Over 1,000 engine improvements to make the web more reliable.

**[Get started with the HTML Model Element](https://developer.apple.com/videos/play/wwdc2026/215/)**
The <span class="high">model element</span> brings interactive 3D content to web pages on iOS, iPadOS, macOS and visionOS. Tools to create and optimize 3D assets, model element features, and where web standards in 3D are heading.

**[Create web extensions for Safari](https://developer.apple.com/videos/play/wwdc2026/216/)**
Build and test Safari <span class="high">web extensions</span> from scratch — without Xcode. Content blocking, page modification, native messaging and the permissions mode working together for a powerful, privacy-respecting experience.

**[Learn CSS Grid Lanes](https://developer.apple.com/videos/play/wwdc2026/314/)**
<span class="high">Grid Lanes</span> for adaptable web layouts with elements of varied shapes. Clean and flexible CSS, plus <span class="high">flow-tolerance</span> to refine accessibility without losing malleability.

**[Rediscover the HTML select element](https://developer.apple.com/videos/play/wwdc2026/315/)**
Full styling control over select menus on the web. New CSS <span class="high">appearance</span> value and new pseudo-elements, rich content inside options with new HTML possibilities. Selects tailored to the design system without giving up accessibility or robustness.

---

### Block 14 — StoreKit, App Store, subscriptions and Wallet

For everything that touches monetization and App Store Connect. If I sell anything in my app, this block matters.

**[What's new in Apple In-App Purchase](https://developer.apple.com/videos/play/wwdc2026/210/)**
The new <span class="high">monthly subscriptions with a 12-month commitment</span> as a more affordable option. Configure and test with App Store Connect, StoreKit APIs and Xcode testing. Improvements to offer code redemption and to the App Review experience.

**[Enhance your presence on the App Store](https://developer.apple.com/videos/play/wwdc2026/205/)**
Reimagining marketing on the App Store using images and videos in new places. New visual placements on the product page, search results and Apple Ads campaigns. The new <span class="high">Asset Library</span> centralizes assets and a tool lets you preview the product page before publishing.

**[What's new in Wallet](https://developer.apple.com/videos/play/wwdc2026/209/)**
New pass styles for rich designs. New barcode formats and a flexible pass actions API. <span class="high">Pass Designer</span> and <span class="high">Pass Builder</span> simplify designing, personalizing and distributing passes at scale.

**[Explore Retention Messaging in App Store Connect](https://developer.apple.com/videos/play/wwdc2026/309/)**
<span class="high">Retention Messaging</span> to reach subscribers before they cancel. Configure it in App Store Connect, add subscription offers, and use the API for real-time messaging and alternatives that encourage them to stay.

**[Unlock in-game content with StoreKit and Background Assets](https://developer.apple.com/videos/play/wwdc2026/378/)**
Native In-App Purchases in Unity with the new <span class="high">StoreKit plug-in</span>. Smaller download sizes with the <span class="high">Background Assets plug-in</span> delivering per-language packs. And a Steam Asset Converter to migrate existing builds.

**[Offer subscriptions to groups and organizations](https://developer.apple.com/videos/play/wwdc2026/391/)**
<span class="high">Group Purchases</span>: one subscriber buys multiple seats and invites others from the app. <span class="high">Volume Purchasing</span> via Apple Business and Apple School Manager puts your subscriptions in front of enterprise and education buyers who already purchase apps at scale.

---

### Block 15 — Music, audio and subtitles

For apps with multimedia content. There's a new framework this year (<span class="high">Music Understanding</span>) worth attention even if you don't build music apps.

**[Meet the Music Understanding framework](https://developer.apple.com/videos/play/wwdc2026/253/)**
The new <span class="high">Music Understanding</span> framework that analyzes audio across six dimensions, on-device: key, rhythm, structure, pace, instrument activity and loudness. Plus a sample app, Music Understanding Lab, to visualize results.

**[Integrate MusicKit into your app](https://developer.apple.com/videos/play/wwdc2026/254/)**
Apple Music inside your app with <span class="high">MusicKit</span>. Authorization, subscription, music selection, playback control and sharing songs across storefronts. New <span class="high">Music Picker</span> to browse the catalog and personal libraries. Differences between SystemMusicPlayer and ApplicationMusicPlayer.

**[Discover generated subtitles and subtitle styles](https://developer.apple.com/videos/play/wwdc2026/256/)**
<span class="high">Generated subtitles</span> on-device that transcribe or translate from another language. Caption style preview to customize and preview during playback. Implementation with AVKit, AVPlayerLayer and Media Accessibility.

**[Meet the Now Playing framework](https://developer.apple.com/videos/play/wwdc2026/312/)**
The new Swift <span class="high">Now Playing</span> framework connects your app's playback with system surfaces: Lock Screen, Control Center, Dynamic Island, CarPlay. Publish state, respond to commands via an observable API, and <span class="high">remote playback sessions</span> to render media on external devices.

---

### Block 16 — Accessibility, reading and text

The text and reading layer. This isn't just new APIs — it's how the app fits with each person's preferences.

**[Enhance the accessibility of your reading app](https://developer.apple.com/videos/play/wwdc2026/219/)**
Robust reading experiences for <span class="high">VoiceOver</span> and <span class="high">Speak Screen</span>. Intuitive text selection, clear navigation between lines and paragraphs, and continuous reading across elements and pages.

**[Prepare your tvOS apps for Dynamic Type](https://developer.apple.com/videos/play/wwdc2026/221/)**
<span class="high">Dynamic Type</span> on tvOS: implementing font scaling, adapting layouts for large sizes, optimizing grids and media-focused carousels. So any text size remains comfortable.

**[Elevate your app's text experience with TextKit](https://developer.apple.com/videos/play/wwdc2026/370/)**
Combining the convenience of built-in text views with the control of <span class="high">TextKit</span>. New APIs to extend UITextView and NSTextView with custom behaviors like line numbers or collapsible sections. TextKit architecture, caching and reuse policies for text attachments.

**[Unwrap PaperKit](https://developer.apple.com/videos/play/wwdc2026/372/)**
Canvas-based applications with <span class="high">PaperKit</span>. New data model APIs to access, create and modify markup elements. Custom controls, annotations, and best practices to integrate a full creative canvas.

**[Read between the strokes with PencilKit](https://developer.apple.com/videos/play/wwdc2026/203/)**
Handwriting recognition with the same technology behind Freeform and Notes. Recognition across many alphabets and languages, and new capabilities to integrate <span class="high">PencilKit</span> into more types of apps.

---

### Block 17 — Group Labs

The Group Labs were live Q&A sessions with Apple engineers and designers during the event week. Apple keeps them in the catalog even though the interactive session is over, so they serve as a quick reference for whichever area I'm working on. The official descriptions are essentially the same boilerplate, so I group them by topic with a one-line context.

- **Language core and main frameworks**
  - **[Swift Group Lab](https://developer.apple.com/videos/play/wwdc2026/8001/)** — Q&A on the week's Swift announcements.
  - **[SwiftUI Group Lab](https://developer.apple.com/videos/play/wwdc2026/8006/)** and **[SwiftUI Group Lab (second round)](https://developer.apple.com/videos/play/wwdc2026/8120/)** — Two Q&A sessions on the SwiftUI announcements.
  - **[SwiftUI for Beginners Group Lab](https://developer.apple.com/videos/play/wwdc2026/8002/)** — Q&A to get started with SwiftUI from zero.
  - **[SwiftData Group Lab](https://developer.apple.com/videos/play/wwdc2026/8017/)** — Q&A on the SwiftData announcements.
- **Xcode, performance and platforms**
  - **[Xcode Tips and Tricks Group Lab](https://developer.apple.com/videos/play/wwdc2026/8013/)** — Q&A to get the most out of Xcode.
  - **[Power and Performance Group Lab](https://developer.apple.com/videos/play/wwdc2026/8003/)** — Q&A on the power and performance announcements.
  - **[visionOS Group Lab](https://developer.apple.com/videos/play/wwdc2026/8004/)** — Q&A on the visionOS announcements.
  - **[watchOS Group Lab](https://developer.apple.com/videos/play/wwdc2026/8014/)** — Q&A on the watchOS announcements.
  - **[Safari and Web Technologies Group Lab](https://developer.apple.com/videos/play/wwdc2026/8015/)** — Q&A on the Safari and web technologies announcements.
- **Intelligence, ML and AI**
  - **[Apple Intelligence Group Lab](https://developer.apple.com/videos/play/wwdc2026/8011/)** — Q&A on the Apple Intelligence announcements.
  - **[Machine Learning & AI Group Lab](https://developer.apple.com/videos/play/wwdc2026/8016/)** — Q&A on the ML and AI announcements.
  - **[Coding Intelligence for Beginners Group Lab](https://developer.apple.com/videos/play/wwdc2026/8007/)** — Q&A to get started with coding intelligence.
  - **[Coding Intelligence, Machine Learning & AI Group Lab](https://developer.apple.com/videos/play/wwdc2026/8121/)** — Combined Q&A on coding intelligence, ML and AI.
- **Platform, distribution and design**
  - **[Accessibility Technologies Group Lab](https://developer.apple.com/videos/play/wwdc2026/8005/)** — Q&A on the accessibility announcements.
  - **[Privacy and Security Group Lab](https://developer.apple.com/videos/play/wwdc2026/8009/)** — Q&A on the privacy and security announcements.
  - **[App Store Connect Group Lab](https://developer.apple.com/videos/play/wwdc2026/8010/)** — Q&A on the App Store Connect announcements.
  - **[Camera and Photo Technologies Group Lab](https://developer.apple.com/videos/play/wwdc2026/8018/)** — Q&A on the camera and photography announcements.
  - **[Icon Composer for Beginners Group Lab](https://developer.apple.com/videos/play/wwdc2026/8012/)** — Q&A to get started with Icon Composer.

---

## My Result 🎯

With this order I skip the catalog chaos and start seeing results from the first week.

My summarized sequence:

- **Block 0** — The presentations
- **Block 1** — Swift and tooling
- **Block 2** — SwiftUI and persistence
- **Block 3** — Apple Intelligence and Foundation Models
- **Block 4** — Siri and App Intents
- **Block 5** — Core AI and ML
- **Block 6** — Networking, services and infrastructure
- **Block 7** — Design and accessibility
- **Block 8** — System integration
- **Block 9** — Security and administration
- **Block 10** — visionOS, RealityKit and spatial content
- **Block 11** — Games and Metal
- **Block 12** — Camera, photography and imaging
- **Block 13** — Web and Safari
- **Block 14** — StoreKit, App Store, subscriptions and Wallet
- **Block 15** — Music, audio and subtitles
- **Block 16** — Accessibility, reading and text
- **Block 17** — Group Labs

If you've been watching <span class="high">WWDC</span> for years you know the catalog never expires — the videos are available all year at [developer.apple.com](https://developer.apple.com/videos/all-videos/?collection=wwdc26). June is for the new stuff, the rest of the year for going deep. As I covered in [WWDC 26](/blog/wwdc26/), the technical sessions are the main course — and now I already have my own checklist to tick off as I go.

**Keep coding, keep running** 🏃‍♂️

---
