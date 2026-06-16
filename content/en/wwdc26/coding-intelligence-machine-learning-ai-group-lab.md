# Coding Intelligence, Machine Learning & AI Group Lab

> WWDC26 · Session 8121 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8121/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest announcements for coding intelligence, machine learning and AI. Conducted in English.

Shashank hosts a WWDC26 Group Lab on coding intelligence, machine learning and AI with Apple engineers Kevin (Xcode), Eric (Foundation Models), Steven (Evaluations), Raziel (Core AI), and Angelos (MLX). They cover how the new frameworks fit together, agentic Xcode workflows, on-device vs Private Cloud Compute trade-offs, and evaluation-driven development.

---

## Q&A

### 4:12 — [Choosing An ML Framework](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=252>)

**Q.** How should developers understand the roles of Core AI, Core ML and MLX, and decide which to use?

Raziel framed Apple's stack as a layered suite: start with Foundation Models for LLM use cases, drop down to Core AI for custom neural networks with production SLAs, and use MLX for power users, distributed inference and on-device training. Core ML remains for traditional ML like decision trees, but new neural work should move to Core AI. Eric added: for language tasks try the System Language Model first, validate with Evaluations, then escalate to Private Cloud Compute or plug a custom backend through the Language Model Protocol.

### 8:13 — [Context Window Size](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=493>)

**Q.** What is the on-device Foundation Models context window in iOS 27, and is it shared between input and output?

Eric confirmed the on-device context is still 4096 tokens, shared between input and output, while Private Cloud Compute offers 32K, also shared. Developers needing more can plug in MLX or Core AI models via the Language Model Protocol to reach much larger windows.

### 11:24 — [Background Inference](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=684>)

**Q.** Can Foundation Models run inside background tasks while the device is locked or the app is backgrounded?

Eric said yes, background execution is supported, but the OS may rate-limit you and surface a distinct rate-limit error to catch. On macOS foreground apps are not limited; quality of output is unchanged, only latency may differ.

### 13:05 — [Apple Intelligence Wait List](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=785>)

**Q.** What does the Apple Intelligence wait list mean in macOS 27, and does the beta include the AFM core advanced model?

Eric clarified the wait list applies only to Siri, not to Private Cloud Compute or the on-device language model. The beta does include AFM core advanced, used for voice features. He suggested bringing the question to the dedicated Apple Intelligence group lab.

### 14:30 — [Mixing Model Providers](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=870>)

**Q.** Can on-device, Private Cloud Compute and third-party providers be mixed in one agentic flow, and where are the privacy boundaries?

Eric pointed to the new Dynamic Profiles API and the 'Building agentic experiences with Foundation Models' session. Two patterns are recommended: Baton Pass shares full context across models, Phone a Friend issues an ephemeral sub-call so upstream context stays private. Profile modifiers let you trim, drop tool calls, or keep only the last N transcript entries when handing off to a smaller model.

### 20:10 — [Speech Personalization](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=1210>)

**Q.** Does iOS automatically personalize on-device speech-to-text for unusual names, or must the developer maintain a custom vocabulary?

The panel said speech frameworks were outside their expertise. Raziel explained that speech recognizers typically pair with a smaller personalization language model (e.g. trained on contacts) and Angelos suggested relying on the supported on-device recognizer first. Eric recommended posting on the developer forums where the relevant engineers are watching.

### 23:01 — [Teaching Agents Code Style](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=1381>)

**Q.** How can a local-LLM coding agent be taught the conventions and APIs of a complex codebase (visionOS, Metal, macros)?

Kevin emphasized search and learning: agents pick up style from existing code, and you can use a short AGENTS.md or CLAUDE.md that references larger style or architecture markdown files on demand. Encourage the agent to take notes and document assumptions per area. Angelos added that with each new model you should retry without all the scaffolding, and Kevin noted Xcode 27 ships ACP support so local providers like LM Studio plug in as full agents, plus simulator interaction and documentation search.

### 32:37 — [AI-Driven UI Testing](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=1957>)

**Q.** What practical steps integrate AI-assisted automated UI testing into Apple-platform workflows?

Kevin recommended a pyramid: thousands of fast unit tests, hundreds of integration tests, and only a handful of UI tests. New in Xcode 27, the agent can drive the simulator via taps, swipes, typing, screenshots and the accessibility tree, then write durable UI tests from what it learned, so the agent doesn't need to run every time.

### 35:43 — [Vision Vs Foundation Models](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=2143>)

**Q.** With Foundation Models now accepting images, when should developers still use the Vision framework for image tasks?

Eric recommended the 'What's new in image understanding' session and drew the line as: use Vision for well-defined, repeatable detection like specific objects or segmentation because it's optimized and testable. Use Foundation Models when the task needs semantic understanding or natural-language prompts, and note new built-in tools like a barcode reader and OCR. He compared Foundation Models to a 3D printer versus Vision's production line.

### 39:44 — [Managing Token Budgets](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=2384>)

**Q.** What are best practices for managing prompt size, tools and context on token-limited on-device LLMs?

Eric highlighted new APIs: context-size and token-counting symbols added in 26.4, plus <span class="high">response.usage</span> reporting input, output, cached and reasoning tokens. The open-source Foundation Models Utilities repo ships a SummarizeHistory modifier and profile modifiers to drop tool calls after use or keep only the last N entries. Steven added that Evaluations is the way to decide how aggressively to summarize, and Angelos noted reasoning tokens are the first thing to drop and newer attention architectures (sliding-window, linear) behave better on long context.

### 51:38 — [Guardrail Refusals](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=3098>)

**Q.** How can developers prevent guardrail refusals on emotionally intense but legitimate prompts, and distinguish refusals from other errors?

Eric explained the System Language Model exposes a 'permissive content transformations' option that relaxes input-side guardrails. Refusal errors (model declining in natural language) are separate from guardrail errors (a moderation model flagging input/output) and can be caught independently. Guardrails were retrained this year with far fewer false positives; otherwise developers can ship their own model like Qwen.

### 54:25 — [Apple's Evaluation Philosophy](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=3265>)

**Q.** What is Apple's guiding philosophy for AI evaluation?

Steven described evaluation-driven development: start with the eval, treat it as the living specification of your feature, include edge cases and headroom, and borrow the education concept of formative assessment to keep learning where the model falls short. The framework supports starting from a small curated dataset, expanding it synthetically, running configurations side by side and hill-climbing on results.

### 57:27 — [Sharing Models Across Apps](<https://developer.apple.com/videos/play/wwdc2026/8121/?time=3447>)

**Q.** Can different apps on iPhone share the same model weights to save storage?

Raziel said no in general: sandboxing, resource contention and use-case-specific quantization choices make cross-app sharing impractical. Core AI's model caching can share resources within an App Group (same developer). Angelos noted true cross-app sharing would require a system service with integrity guarantees, not just a shared download.

---

## Highlights

- Language Model Protocol lets you swap in MLX, Core AI, Google or Anthropic backends behind the Foundation Models API; Foundation Models framework is going open source.
- Dynamic Profiles plus profile modifiers (drop tool calls, keep last N entries, summarize history) coordinate handoffs between on-device, PCC and third-party models — see 'Building agentic experiences with Foundation Models'.
- On-device context remains 4096 tokens shared input/output; PCC offers 32K; <span class="high">response.usage</span> now reports input, output, cached and reasoning tokens.
- Foundation Models Utilities is a new open-source repo with building blocks like <span class="high">SummarizeHistory</span>; new built-in tools include barcode reading and OCR.
- Xcode 27 adds ACP support for local agents (LM Studio, Ollama), simulator interaction (tap, swipe, screenshots, accessibility tree) and documentation search for grounding on new APIs.
- Evaluations framework supports model-judge evaluators, synthetic dataset expansion and side-by-side compare; use it to choose between on-device vs PCC and tune summarization strategies.

---

## Related sessions

- [What’s new in the Foundation Models framework](<https://developer.apple.com/videos/play/wwdc2026/241/>)
- [What’s new in image understanding](<https://developer.apple.com/videos/play/wwdc2026/237/>)
- [Bring an LLM provider to the Foundation Models framework](<https://developer.apple.com/videos/play/wwdc2026/339/>)
- [Explore distributed inference and training with MLX](<https://developer.apple.com/videos/play/wwdc2026/233/>)
- [Apple Intelligence Group Lab](<https://developer.apple.com/videos/play/wwdc2026/8011/>)

---
