# Apple Intelligence Group Lab

> WWDC26 · Session 8011 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8011/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest Apple Intelligence announcements. Conducted in English.

Ernie hosts the Apple Intelligence Group Lab with panelists Matt and Louie (Foundation Models), James and Dan (App Intents and Siri), and Rob (Evaluation Framework). The session covers App Intents schemas, the new Siri AI, Foundation Models (on-device and Private Cloud Compute), and the Evaluation Framework.

---

## Q&A

### 1:42 — [Learning Resources](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=102>)

**Q.** What Apple resources help learn the new APIs and design changes in iOS 27?

WWDC session videos, the dedicated sample section of the documentation, technical articles, and revamped App Intents and Foundation Models docs. Sessions from prior years also help build foundational App Intents knowledge.

### 3:18 — [Schemas Not Matching](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=198>)

**Q.** If my app doesn't fit any predefined schema types, should I use the closest one or skip schemas entirely?

Pick and choose schemas that match your app's capabilities and combine them with custom App Intents for anything else. For Siri AI integration you must adopt at least one schema; consider the generic system.search or system.open schemas, and App Shortcuts for hero phrases.

### 7:07 — [No Matching Domain](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=427>)

**Q.** My entities don't map to any predefined domain — how do I get to agentic Siri today and prepare for the future?

Adopt whichever schema fragments fit, even partially. Conforming entities to a schema and donating them via Spotlight still unlocks Siri AI for asking about content and using the new view annotation APIs.

### 8:23 — [App-To-App Invocation](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=503>)

**Q.** Can a third-party app act as its own orchestrator and invoke another app's intents directly?

No — the system orchestrator routes cross-app actions, keeping data sandboxed for privacy. Use the new Transferable API to explicitly export or import data between apps with clear boundaries.

### 10:26 — [Multi-Turn Conversations](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=626>)

**Q.** Can my app participate in multi-turn Siri conversations in iOS 27, or only discrete actions?

Yes — App Schemas enable follow-ups and natural questions about your entities. A large language model processes input, so users can phrase requests flexibly and Siri picks the right action.

### 12:15 — [Mixing Schemas](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=735>)

**Q.** Can I mix non-schema entities and intents matching different schemas across domains in one app?

Absolutely yes — schemas are designed to be picked and combined across domains, and they coexist with App Shortcuts and in-app search. The expectation is a holistic mix tailored to your app.

### 13:32 — [Background Work Budget](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=812>)

**Q.** Is there a practical time/work budget for Foundation Models during a background wake?

Foreground requests are unthrottled, but background requests can be throttled under system load. Catch the rate-limited error from the on-device model and retry later.

### 14:40 — [Throttling Errors](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=880>)

**Q.** Which error types signal Foundation Models throttling, and which are retryable?

The new LanguageModelError covers common cases like rate limiting and refusals. The PCC model also exposes a quota usage property and throws a quota exhaustion error you can handle per-prompt.

### 16:09 — [Guardrail Violations](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=969>)

**Q.** How can I avoid frequent guardrailViolation errors on prompts that seem fine?

Use the Evaluation Framework's model judge with a safety rubric to score prompts, and consider letting the larger PCC model judge edge cases. Guardrails exist to prevent unsafe responses, so iterate on prompt wording.

### 17:43 — [Video Input](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1063>)

**Q.** Can Foundation Models reason over video, or is multimodal input limited to still images?

The framework supports image input on both the on-device and PCC models, with PCC also offering reasoning depth controls. For video, build a tool that uses Vision and other frameworks to extract a text/transcript description and feed it to the model; the Language Model Protocol's custom segments allow extending beyond built-in modalities.

### 21:53 — [Schema Advantage](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1313>)

**Q.** Do App Intents schemas give an advantage over custom intents for Siri AI discovery?

It's not about advantage — schemas are how Siri AI reasons about your actions and entities, and Apple has done the training and sample-phrase work so you get consistent cross-app behavior. Bonus: schemas let you delete code Apple now handles for you, and intent donations help Siri learn user habits.

### 26:07 — [Photorealistic Images](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1567>)

**Q.** Can Image Playground generate photorealistic images inside my app?

Yes — use <span class="high">ImagePlaygroundStyle.all</span>. The photorealistic style runs on Private Cloud Compute and is covered in a WWDC session this year.

### 27:08 — [IndexEntity Vs Schemas](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1628>)

**Q.** How does IndexEntity differ from schema-defined entities like the books schema?

Schemas define the shape of content; IndexEntity indexes that content into the system's semantic index so Siri AI can retrieve it. They complement each other — conform to a schema and to IndexEntity for the best Siri experience, and Apple handles the Spotlight key mappings for you.

### 30:09 — [Evaluations For Research](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1809>)

**Q.** Can the Evaluation Framework be used for academic research and peer-reviewed metrics?

Yes — it's designed for any stochastic system, not just LLMs, including classical ML models. You iterate over input samples, run evaluators, and export JSON reports; synthetic data generation, hill climbing, and Xcode/Instruments visuals all help.

### 33:17 — [Siri And CarPlay](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=1997>)

**Q.** Can Siri understand on-screen context on CarPlay and perform actions like 'play song on row 2 column 1'?

On-screen context uses NSUserActivity and new view annotation APIs on iPhone, iPad, Mac, and visionOS. For CarPlay-specific capabilities, file a Feedback Assistant enhancement request — driver safety constraints apply.

### 35:39 — [App Intents On HomePod](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2139>)

**Q.** Can App Intents work with HomePod given there's no HomePod beta?

The new Siri AI ships on iPhone, iPad, Mac, and visionOS — not HomePod. Existing App Shortcuts continue to work on HomePod.

### 36:20 — [watchOS Parity](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2180>)

**Q.** Will watchOS App Intent responses match iOS one-to-one?

Test across every device including AirPods. Use the full/supporting dialogue modes so spoken-only contexts get a more verbose response while screen contexts can be concise, and use the new App Intents testing framework to automate this.

### 38:32 — [Image Playground Offline](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2312>)

**Q.** Does Image Playground now require internet for PCC, or fall back gracefully?

Image Playground now requires an internet connection because it uses the PCC server-based model; there is no on-device fallback.

### 39:06 — [Most Excited Features](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2346>)

**Q.** What is each panelist most excited about in Apple Intelligence this year?

Rob: in-call intelligence like extracting flight confirmation numbers. James: App Intents testing (Venkatesh's session) for CI-friendly unit and UI tests. Louie: PCC access from one line of code with no API keys (joked with a fake book). Dan: the new Siri AI ecosystem and semantic index integration. Matt: the extensible Language Model Protocol bringing any model under one API.

### 45:37 — [Why Hard-Coded Schemas](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2737>)

**Q.** Why hard-coded schemas instead of a dynamic skills/markdown approach like GPT or Claude?

Schemas guarantee consistency, privacy, and safety — users learn how Siri behaves in a domain and it transfers across apps adopting that schema. They also enable built-in confirmation flows (e.g., sending money, shared calendar events) via new entity ownership APIs, and let Apple handle localization across many locales.

### 49:25 — [Tool Call Evaluation](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=2965>)

**Q.** Can the Evaluation Framework verify whether my tools are being called?

Yes — feed the LanguageModelSession transcript into a tool call evaluator with assertions about which tools were called, in what order, with which property values. It's a deep expectation system that returns a report.

### 51:17 — [Semantic Entropy](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3077>)

**Q.** How does the framework mitigate semantic entropy when passing context between on-device and PCC models?

Use dynamic profiles (agent-like switching on the same transcript) with declarative history-transform modifiers to balance context. The new Foundation Models Utilities package provides summarization to compact transcripts when moving to a smaller context size; evaluations help validate the tradeoffs.

### 53:00 — [Evaluations Without FM](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3180>)

**Q.** Do I have to use Foundation Models to use the Evaluation Framework?

No — you can evaluate any stochastic system. Some evaluators (like tool call) currently need a Foundation Models transcript, but generic transforms from other model providers are coming.

### 53:52 — [Cross-App Retrieval](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3232>)

**Q.** Can one of my apps retrieve another of my apps' Spotlight-donated entities via the spotlight search tool?

Retrieval is sandboxed to each app. For sharing data across apps from the same developer, use the Transferable protocol with progressive-fidelity formats, opting in only to what you want to share.

### 55:46 — [Interchangeable Entities](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3346>)

**Q.** Are schema-bound entities like file and photo interchangeable via Transferable?

Yes — Transferable lets you declare multiple data transformations (text, file, photo), even dynamically by payload type, so a message can be exported as a photo into any photo-schema-adopting app. There's also a FileEntity protocol for file-based formats.

### 57:42 — [Close-Match Schemas](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3462>)

**Q.** Is it acceptable to use a close-match schema like <span class="high">messages.MessagesPerson</span> for a generic contacts list?

Yes — pick the schemas that fit, even partially. Unicorn Chat uses the messages person schema this way. Fall back to system.search or App Shortcuts when no schema fits, accepting that App Shortcuts need your own sample phrases.

### 1:00:04 — [Token Limits](<https://developer.apple.com/videos/play/wwdc2026/8011/?time=3604>)

**Q.** With image input added, are there new constraints on prompt or instruction tokens for the on-device model?

On-device stays at 4,096 tokens; an image consumes roughly 200 tokens (measurable in Instruments). PCC offers 32K. New token-count APIs in 26.4 help, and being precise with instructions plus examples gets more out of the smaller model — use evaluations and hill climbing to tune.

---

## Highlights

- Foundation Models gains Private Cloud Compute access (32K context) alongside the on-device model (4,096 tokens) with new image input support
- Language Model Protocol makes the framework extensible — bring any model, declare capabilities like vision, and define custom segments for modalities like video
- App Schemas across domains (messages, calendar, system.search, system.open) handle phrases, localization, and confirmation flows so you write less code
- Transferable protocol controls bidirectional, opt-in data sharing between apps with progressive fidelity formats
- Evaluation Framework supports model-judge safety rubrics, tool-call evaluators, synthetic data, hill climbing, and Xcode/Instruments visualization
- New App Intents testing framework enables CI-friendly unit and UI tests; dynamic profiles plus Foundation Models Utilities help manage transcripts across context-size changes

---

## Related sessions

- [Explore advanced App Intents features for Siri and Apple Intelligence](<https://developer.apple.com/videos/play/wwdc2026/343/>)
- [What’s new in image understanding](<https://developer.apple.com/videos/play/wwdc2026/237/>)
- [Get to know App Intents](<https://developer.apple.com/videos/play/wwdc2025/244/>)
- [Create high-quality images using Image Playground](<https://developer.apple.com/videos/play/wwdc2026/375/>)
- [Validate your App Intents adoption with AppIntentsTesting](<https://developer.apple.com/videos/play/wwdc2026/295/>)
- [Explore new advances in App Intents](<https://developer.apple.com/videos/play/wwdc2025/275/>)

---
