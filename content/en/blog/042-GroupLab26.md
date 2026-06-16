---
title: WWDC26 Group Labs
slug: wwdc26-group-labs
date: 2026-06-17
description: WWDC26 Group Labs are live Q&A sessions with Apple engineers. I share what I discovered and where to find my transcribed notes by topic.
tags: Swift, Conference
cover: GroupLab26
coverDescription: Illustration inspired by Apple's official Group Lab covers, featuring Jorge's animated character icon over a circle with the text "Jorge's Group Lab Guide WWDC26".
publish: true
---
---
## My Problem 🤔

When I published my [WWDC26 video guide](/blog/wwdc26-videos/), I devoted Block 17 to the <span class="high">Group Labs</span> with barely a line of context per session. The reason was simple: Apple's official descriptions are practically identical to one another —"Join us to dive deeper into WWDC26 with Apple engineers"— and they say nothing useful about what was actually discussed inside.

What I didn't share back then is that, before writing that block, I had started watching the Group Labs and got a surprise. They are not passive sessions. They are live Q&A rounds between real developers and engineers from the Apple team, and the quality of the questions and answers is very different from that of regular sessions. In ordinary sessions, Apple shows what it wants to show. In the Group Labs, developers ask what they really need to know, and the engineers answer directly.

The problem is that this content is practically invisible. There are no transcripts, no index, no way to search inside the video. If you don't sit down and watch the whole session, you don't know what it covers.

I started taking notes. One session, then another, and I ended up with eighteen.

---
## My Solution 🧩

I decided to transcribe and structure the content of each Group Lab: the topics asked about, the exact timecode, the summarized answer and which engineers took part. The goal was to have something searchable, something that would let me jump straight to the minute I care about instead of digging blindly through the video.

Before the list, three examples of what came up inside and that you won't find in any main session:

- In the <span class="high">Swift Group Lab</span>, the language team explained why they would have designed concurrency differently if they were starting today, and what changed in Swift 6.2 to fix the model.
- In the <span class="high">SwiftUI Group Lab</span>, the engineers broke down when to use <span class="high">AnyView</span>, how <span class="high">DynamicProperty</span> runs before <span class="high">body</span>, and why conditionals inside lazy containers are an antipattern.
- In the <span class="high">Apple Intelligence Group Lab</span>, the team explained the real differences between <span class="high">App Schemas</span> and <span class="high">IndexEntity</span>, and the current limits of video support in Foundation Models.

Here are all the available sessions, with a direct link to the official video:

### Language and data

- **[Swift Group Lab](/wwdc26/swift-group-lab/)** — Concurrency, performance, SwiftPM and language features.
- **[SwiftData Group Lab](/wwdc26/swiftdata-group-lab/)** — ResultsObserver, HistoryObserver, the new Codable, CloudKit sync, migrations and concurrency.

### SwiftUI

- **[SwiftUI Group Lab - Part 1](/wwdc26/swiftui-group-lab-part-1/)** — Liquid Glass, data flow, layout performance and AnyView.
- **[SwiftUI Group Lab - Part 2](/wwdc26/swiftui-group-lab-part-2/)** — ForEach with large collections, NavigationTransition, Liquid Glass on buttons and adaptive layouts.
- **[SwiftUI for Beginners Group Lab](/wwdc26/swiftui-for-beginners-group-lab/)** — SwiftUI vs cross-platform, @State internals and learning paths.

### Tooling and performance

- **[Xcode Tips and Tricks Group Lab](/wwdc26/xcode-tips-and-tricks-group-lab/)** — How to get the most out of Xcode 27.
- **[Power and Performance Group Lab](/wwdc26/power-and-performance-group-lab/)** — Instrumentation, MetricKit and performance in production.

### Platforms and web

- **[visionOS Group Lab](/wwdc26/visionos-group-lab/)** — Camera access, immersive debugging, USD export and spatial accessories.
- **[watchOS Group Lab](/wwdc26/watchos-group-lab/)** — Foundation Models on Watch, transitioning from iOS and on-device debugging.
- **[Safari and Web Technologies Group Lab](/wwdc26/safari-and-web-technologies-group-lab/)** — WebKit, CSS Grid Lanes, Web Extensions and more.

### Intelligence, ML and AI

- **[Apple Intelligence Group Lab](/wwdc26/apple-intelligence-group-lab/)** — Foundation Models, App Schemas, Siri and Evaluations.
- **[Machine Learning & AI Group Lab](/wwdc26/machine-learning-ai-group-lab/)** — Foundation Models, Private Cloud Compute, Core AI, MLX and evaluations.
- **[Coding Intelligence for Beginners Group Lab](/wwdc26/coding-intelligence-for-beginners-group-lab/)** — Slash commands, Xcode versus external agents and context across projects.
- **[Coding Intelligence, Machine Learning & AI Group Lab](/wwdc26/coding-intelligence-machine-learning-ai-group-lab/)** — Core AI vs Core ML vs MLX, context windows and background inference.

### Quality and distribution

- **[Accessibility Technologies Group Lab](/wwdc26/accessibility-technologies-group-lab/)** — VoiceOver, Dynamic Type and accessibility in custom controls.
- **[Privacy and Security Group Lab](/wwdc26/privacy-and-security-group-lab/)** — App Attest, Trust Insights and secure design of agentic features.
- **[Camera and Photo Technologies Group Lab](/wwdc26/camera-and-photo-technologies-group-lab/)** — AVFoundation, RAW capture and Center Stage.
- **[App Store Connect Group Lab](/wwdc26/app-store-connect-group-lab/)** — In-App Purchase, subscriptions and StoreKit.

---
## My Result 🎯

The value of the Group Labs is not in the official descriptions —it's inside. Developer questions surface the use cases Apple doesn't cover in the main sessions: the bugs the team acknowledges, the design decisions they explain off the record, the patterns they recommend in practice and not in marketing.

If you already have my [video guide](/blog/wwdc26-videos/) as a map of the catalog, the Group Labs are the layer on top: where Apple engineers really talk about what they built.

**Keep coding, keep running** 🏃‍♂️

---
