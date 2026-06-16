# App Store Connect Group Lab

> WWDC26 · Session 8010 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8010/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest App Store Connect announcements. Conducted in English.

Laurel hosts the App Store Connect Group Lab with panelists Jeff, Lydia, Nick, Shobi, and Dave covering submissions, TestFlight, analytics, the App Store Connect API, and new WWDC26 features.

---

## Q&A

### 2:41 — [Overlooked ASC APIs](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=161>)

**Q.** Which App Store Connect APIs or capabilities are underused but worth adopting?

Build delivery and upload APIs automate the full TestFlight loop end-to-end, and combining TestFlight feedback APIs with webhooks lets teams auto-create tickets in their own systems. The Power and Performance reports API is also underutilized for understanding real-device storage and CPU behavior.

### 4:20 — [Accessibility Nutrition Labels](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=260>)

**Q.** How do you signal a game is hearing-accessible when there are no captions because there's no sound?

Only check labels that truthfully apply — don't claim captions if there aren't any. Use the app description and app previews to communicate accessibility value propositions to the audiences you want to reach.

### 5:44 — [Subscription App Rejections](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=344>)

**Q.** What commonly causes first-time subscription rejections and how do you respond quickly?

Preparation is key: test on real devices, exercise IAP in sandbox, and put demo credentials and reviewer notes in the submission. The new enhanced submission flow with IAP improves reviewer communication, and after a rejection use App Store Connect's response feature to have a dialogue rather than just resubmitting.

### 8:33 — [Retention Messaging Analytics](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=513>)

**Q.** Will analytics show impressions, save rate, and cancel-flow revisits for retention messages?

Yes — analytics will report how many users saw the retention page, how many proceeded to cancel, and how many stayed subscribed, so developers can A/B test messaging and plan offers.

### 9:41 — [ASC API Security Mistakes](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=581>)

**Q.** What security mistakes do developers make with App Store Connect API integrations?

Never hardcode private keys into repos or ship them in clients; treat them as server-only. Revoke keys when a third-party service is no longer used, scope permissions tightly, and use the users-and-access APIs to audit account membership.

### 11:47 — [Auto vs Manual Updates](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=707>)

**Q.** Can analytics distinguish organic/manual updates from background auto-updates?

Yes — the breakdown isn't in the dashboard but is in the downloadable analytics reports, which include a column splitting auto-update from manual updates.

### 12:30 — [Per-App API Keys](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=750>)

**Q.** Can a team API key be scoped to only a subset of apps for CI uploads?

Team keys grant access to all apps and can't be scoped per-app. The workaround is individual user keys, which inherit that user's role and app access — useful, but watch out for keys disappearing when a user leaves.

### 14:42 — [Per-Platform Names](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=882>)

**Q.** Can name and subtitle differ per platform under Universal Purchase?

No — name, subtitle, age rating and genre are shared across platforms because Universal Purchase carries the app between them. Descriptions, however, can be tailored per platform, so platform-specific feature mentions belong there.

### 16:06 — [Retention Localization](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=966>)

**Q.** Does retention messaging support localization and should we localize it?

Yes, localization is supported and you should localize retention messages to match your app's existing localizations so users don't experience a jarring English fallback mid-flow.

### 17:02 — [App Description Density](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1022>)

**Q.** Is dense copy actually a best practice for App Store descriptions?

Lead with what users care about rather than cramming text. Use Custom Product Pages and Product Page Optimization to test variants, and lean on the new product page header video/images plus previews to convey meaning visually.

### 18:55 — [TestFlight Best Practices](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1135>)

**Q.** What are best practices for internal vs external TestFlight testing?

Start with internal TestFlight for your dev and QA teams via App Store Connect users, then move to external TestFlight (up to 10,000 testers) after beta app review. Create separate internal groups for QA, localization, and leadership, and find external testers in topical communities and forums.

### 22:23 — [API Key Hygiene](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1343>)

**Q.** What advice on vending, scoping, and storing App Store Connect API keys?

Keys belong on your server, never in client apps, and they don't expire so they need active management. Use lower-privilege roles where possible, use individual keys for experimentation, and only promote to a team-wide key for production automation.

### 24:09 — [Shared Names Across Apps](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1449>)

**Q.** Can the same product name be used on separate Mac and iOS/visionOS app records with different bundle IDs?

No — names must stay unique across records. The recommended path is to consolidate onto one app record with Universal Purchase, which also unlocks more upcoming cross-platform features in Xcode and App Store Connect.

### 25:46 — [First Submission Essentials](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1546>)

**Q.** What's most important for a first-time submission with user auth and third-party API keys?

Thoroughly test the app and its third-party integrations and make sure backend services are production-ready. Treat any user-supplied keys with privacy care, and include demo account credentials in the App Review notes.

### 27:14 — [Paid-to-Freemium Restoration](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1634>)

**Q.** How do I verify purchase-restoration code for users who bought v1 when moving to a freemium model?

Use the StoreKit 2 App Transaction API to detect the original purchased app version and grant entitlements. Test via Xcode and TestFlight, and use sandbox accounts in App Store Connect to exercise different countries and reset purchase state.

### 30:00 — [Publishing First App](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1800>)

**Q.** What's the best way to learn the step-by-step procedure to publish your first iOS app?

Use the developer.apple.com resources: WWDC sessions (including older years), the Apple Developer Pathways, the App Store Connect Help guides with per-page instructions, and the Getting Started with TestFlight tech talk.

### 32:07 — [Increasing App Visibility](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=1927>)

**Q.** How can I increase visibility for my app on the App Store?

Invest in creative assets — screenshots, previews, and the new product page header image/video. Use In-App Events, Custom Product Pages tied to keywords, submit a feature nomination to the editorial team, and use the App Store Connect app's shareable moments for launches and updates.

### 33:58 — [Universal App Binaries](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2038>)

**Q.** Does a universal app need a separate binary per platform?

You ship distinct binaries per platform you target (iOS, macOS, watchOS, etc.) with per-platform metadata, but you don't need the full set up front. Start with iOS, make it available on macOS and visionOS, and add native platform-specific binaries later as you adopt their capabilities.

### 35:49 — [Review Notes Language](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2149>)

**Q.** Should app review notes be in English or the developer's native language?

App Review has broad language coverage and routinely reviews in many languages, so notes in your primary language are fine. English is acceptable too but not required.

### 37:07 — [New ASC Workflows](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2227>)

**Q.** Which new App Store Connect workflows from this year should automation-heavy developers revisit?

Check out the major analytics update on the web — over 100 new subscription/IAP metrics with strong visualizations not in the API. Also revisit Game Center entity submissions, IAP in the enhanced submission flow, and the expanded Offer Code APIs for consumables and non-consumables.

### 38:54 — [Common Rejection Reasons](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2334>)

**Q.** What are the most common reasons apps get rejected?

Bugs and crashes from insufficient device testing, incomplete reviewer information (especially missing demo credentials), and not meeting category-specific App Review Guidelines (kids, crypto, etc.). Get more eyes on it via TestFlight before submitting — simulators don't catch everything.

### 42:16 — [Pre-Upload Validation](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2536>)

**Q.** Which metadata/capability checks only happen post-upload, and will more move into Xcode?

Validation runs throughout the pipeline and the team continuously tries to surface issues earlier, including warnings (not just errors). Use Xcode's validate-app-before-delivery step to catch problems pre-upload, and embrace continuous delivery to find issues fast.

### 44:13 — [Organizing TestFlight Builds](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2653>)

**Q.** Can TestFlight builds be organized into streams for parallel feature branches?

Yes — use TestFlight groups (internal and external) to control which testers see which builds. Create groups per branch (e.g., 2.0 feature work vs 1.x bugfix), and pair with Xcode Cloud to automatically distribute branch builds to the matching group.

### 46:52 — [Price Change Delay](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2812>)

**Q.** Why is there a multi-day delay before in-app purchase price changes take effect?

The delay exists so the new price can propagate and go live simultaneously across all time zones worldwide as the day rolls over.

### 47:33 — [Merging Country Apps](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2853>)

**Q.** How do you merge per-country app listings into a single listing?

Pick the flagship app record to persist, update the others with a final release directing users to download the new app, and give users time before forcing migration. Keep the old code around for security/bug fixes during the transition, and use analytics sessions-by-version to track migration.

### 49:58 — [New Analytics Dashboard](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=2998>)

**Q.** What's in the new App Store analytics dashboard and how do you get the most value?

The biggest update in 10+ years adds 100+ metrics focused on IAP and subscriptions, tying App Store search/browse/Today Tab sources to downstream purchase and renewal so you can see the full customer journey. New benchmarks let you see where you over- or underperform, with a guide and video available.

### 52:27 — [Feature Nominations](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3147>)

**Q.** Tips for a successful App Store feature nomination?

Lead with an interesting or novel app and strong art — including the new product page assets — to stand out from crowded categories. Nominate again for updates not just launches, and tell the story behind the app or developer since featuring sometimes centers on the creator.

### 54:24 — [Least-Privilege 3rd Party Keys](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3264>)

**Q.** What's the least-privileged API key role to recommend for third-party tools?

For analytics-only tools the Sales role is the lowest-privilege fit. Developer role allows build upload and internal TestFlight, and Marketing role can edit metadata and events — neither can release a new version.

### 55:51 — [Live Analytics via API](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3351>)

**Q.** Can the API expose the last-24-hours analytics that the UI shows?

No — the API updates on a daily cadence (with weekly and monthly aggregates), while Sales and Trends in the UI is where you'd go for the last 24 hours. It's the same data, just a different cadence.

### 57:11 — [Organic CPP Impact](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3431>)

**Q.** How do you measure incremental visibility/downloads from an organic-search Custom Product Page without keyword data?

In App Analytics, filter the CPP's performance by source type to isolate App Store search. If you don't run Apple Ads, that's purely organic; if you do, separate CPPs for ads vs organic let you tease the two apart.

### 58:14 — [Phased Release Progress](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3494>)

**Q.** Can you see the current release's phased rollout progress while preparing a new version?

Yes — open the in-distribution version's page in App Store Connect and click into Phased Release Rollout to see what day of the cycle you're on, even while a new version is being prepared.

### 59:19 — [Geospatial App Review](<https://developer.apple.com/videos/play/wwdc2026/8010/?time=3559>)

**Q.** How do you pass App Review for a geospatial AR app that requires a specific location?

Include a recorded demo of the location-specific experience with your submission, and use internal then external TestFlight to gather feedback. Also consider offering some functionality for users who aren't at the location.

---

## Highlights

- Enhanced submission flow now covers In-App Purchases alongside app content and In-App Events
- StoreKit 2 App Transaction API lets you detect a user's originally purchased app version for restoration
- TestFlight feedback APIs plus webhooks enable auto-ticketing into your own bug tracker
- Filter Custom Product Page performance by source type in App Analytics to isolate organic App Store search
- Use Xcode's Validate App before delivery, and watch warnings (not just errors) in pipeline validation
- Spring App Analytics update added 100+ IAP/subscription metrics and new benchmarks with a dedicated guide and video
- Submit feedback at feedbackassistant.apple.com and ask follow-ups at developer.apple.com/forums

---

## Related sessions

- [Get started with TestFlight](<https://developer.apple.com/videos/play/tech-talks/110343/>)

---
