# Machine Learning & AI Group Lab

> WWDC26 · Session 8016 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8016/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest machine learning and AI announcements. Conducted in English.

Shashank hosts Apple's Machine Learning & AI Group Lab with panelists Tao and Michael (Core AI), Marcus (Evaluations framework), Louie (Foundation Models), and Ronan (MLX). Topics span Foundation Models, Private Cloud Compute, Core AI, MLX, evaluations, and developer UX around AI.

---

## Q&A

### 4:43 — [On-Device vs PCC](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=283>)

**Q.** How should developers choose between the on-device Foundation Model and Private Cloud Compute for a given task?

Louie outlined the concrete differences: 4K context on-device vs 32K on PCC, offline availability on-device, and a new reasoning capability on the server model. Marcus recommended using the Evaluations framework to comparatively run the same feature against both models and check side-by-side reports in Xcode. They also noted dynamic profiles let you combine both models within a single feature, and Instruments now exposes Foundation Models metrics like roundtrip latency and token budgets.

### 9:21 — [Local LLM in Xcode](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=561>)

**Q.** Why does a Qwen MLX model served via open code ACP behave oddly in Xcode's agent mode, with leaked end tokens — is the chat template wrong?

The panel suspected a tokenizer/chat-template configuration issue, since leaked end tokens commonly appear when bringing new models into MLX or Core AI language model packages. They recommended filing an issue on the open-source MLX/Core AI language model GitHub repos or the developer forums, and pointed to this year's MLX session that demos open code with a Qwen model in Xcode.

### 12:20 — [Custom Models As Agents](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=740>)

**Q.** Can a local MLX-served model, or one you trained yourself, be used as a full coding agent in Xcode rather than just chat?

They clarified Core AI is inference-only (not training) and that bringing your own model into Xcode goes through the ACP agent mode rather than chat mode. MLX LM exposes a server Xcode can auto-detect; for Core AI models you'd need to write a conformance or contribute an OpenAI-compatible language server layer.

### 15:08 — [Detecting Model Updates](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=908>)

**Q.** Is there a runtime model version identifier so an eval suite can detect when Apple silently updates the on-device or PCC model?

Louie explained the on-device model only changes with OS updates, so OS version is the signal; the server model is more dynamic. The recommendation is to assume models will evolve and rerun your evaluations across beta OS versions, comparing runs to catch regressions, while avoiding overly word-specific prompts. Updates ship roughly twice a year and the beta period is the window to file feedback.

### 19:01 — [Background & Widgets](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=1141>)

**Q.** Can Foundation Models run from widgets, App Intents, or background tasks, and what rate or thermal limits apply?

Yes, the on-device model runs in background and widgets, but on iOS it may be rate-limited based on system load, foreground priority, and thermals — catch the specific error and retry later. macOS does not apply that rate limiting, though QoS still influences scheduling. Apps share a single in-memory copy of the system model.

### 21:25 — [Adapting Models To Apps](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=1285>)

**Q.** How can developers adapt or create models for their own app data and domain, e.g. stylized user profile images?

Michael suggested using Foundation Models to summarize app/user data into a prompt for an image generation model, optionally fine-tuning an open-source diffusion model brought in via Core AI. Ronan noted MLX supports fine-tuning many models, but Tao emphasized starting with in-context learning before going to full fine-tuning. Marcus pitched hill-climbing with the Evaluations framework — including a sample generator that produces synthetic text inputs you can pair with diffusion outputs to build datasets.

### 28:49 — [FM Use Case Fit](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=1729>)

**Q.** Which use cases suit the Foundation Models framework, and which should developers avoid?

Louie said content extraction and generation, especially with the new image input, are great fits; the model can't output images, so use a diffusion model for that. Michael cautioned against sub-millisecond or real-time per-frame workloads, where specialized APIs like Vision, Speech, or Translation are better. Shashank reminded that PCC's larger context now unlocks summarization and transformation cases that hit on-device context limits.

### 32:27 — [Learning AI/ML](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=1947>)

**Q.** Where should a beginner start to learn AI and ML, and what resources are recommended?

Marcus pointed to Swift Playgrounds' Intro to ML content (rock-paper-scissors image classifier) and noted Xcode now opens a playground in one click ideal for first Foundation Models calls. The panel encouraged project-based learning — build an app, then a model — leveraging AI agents as tutors, exploring PyTorch/MLX tutorials, and peeling back layers toward Hugging Face weights, Core AI, and MLX.

### 37:14 — [PyTorch To Core AI](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=2234>)

**Q.** Can everything expressible in PyTorch be imported into Core AI or the broader Apple ecosystem?

Michael said if a model is exportable from PyTorch and uses core ATen ops, Core AI converts it straightforwardly; unusual ops can be handled via custom lowerings or custom Metal kernels for performance. Ronan noted MLX's API is very similar to PyTorch, and Hugging Face hosts 10,000+ MLX-converted models for easy experimentation. AI coding agents and skills can help port between PyTorch, MLX, and Core AI representations.

### 42:56 — [FM Unavailable UX](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=2576>)

**Q.** What's the best UX when Foundation Models aren't available, and can we pre-warm to reduce first-request latency?

Louie confirmed a prewarm API loads the on-device model into memory before the user taps, and an availability API lets you detect unsupported devices or Apple Intelligence being off. For unavailable cases, the new Language Model Protocol lets you swap in MLX, Core AI, or server-hosted models. Shashank stressed gracefully guiding the user — e.g. prompt to enable Apple Intelligence, or hide the entry point entirely rather than show an error.

### 46:59 — [Core ML To Core AI](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=2819>)

**Q.** How and when should developers migrate from Core ML to Core AI — do they have to wait for users to update to iOS 27?

Michael clarified there's no call to migrate: Core ML is still supported and remains the right choice for decision trees and sub-millisecond models. Core AI is where Apple invests for modern generative models; treat the move like adopting any new OS-gated API, gated by your user base. For existing generative experiences on Core ML, Core AI is the recommended path going forward.

### 49:02 — [Max On-Device Model](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=2942>)

**Q.** What's the largest local model you can ship in an app before you should consider Private Cloud Compute?

Michael gave a rule of thumb of roughly under 2 GB on iOS to stay a good platform citizen, with macOS limited mainly by available memory profiled in Instruments. Quantization (covered in this year's Core AI session) lets you push toward ~6B-parameter LLMs in that envelope, with evaluations guiding tolerable accuracy loss. On macOS you can scale model size to device class, and a new session shows linking four Mac Studios over Thunderbolt 5 to run very large models with MLX.

### 53:34 — [When To Use AI](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=3214>)

**Q.** How do you decide when AI should actively help the user versus stay out of the way?

Shashank argued against doing AI for AI's sake — start from the user experience you want and reach for a model only if it closes a real gap. Marcus suggested prototyping side quests and then validating with evaluations and user stories before committing. Louie and Ronan framed AI as one tool among many — ideally invisible, helping users get from A to B faster rather than getting in the way.

### 58:38 — [Custom LLM Backend](<https://developer.apple.com/videos/play/wwdc2026/8016/?time=3518>)

**Q.** For apps supporting older iPhones with a self-hosted LLM backend, is wrapping it in a custom language model provider on iOS 27 the recommended path?

Louie confirmed the new Language Model Protocol is exactly the right approach, giving one unified Swift API for prompting, tool calling, and generable output across any model. Apple ships an open-source utilities package with an implementation matching the typical OpenAI chat-completions request shape, alongside MLX and Core AI packages. Selecting between system and custom models then becomes a simple <span class="high">if</span>-statement while the rest of your code stays identical.

---

## Highlights

- Foundation Models framework now has a Language Model Protocol — plug in MLX, Core AI, server, or OpenAI-compatible models behind one Swift API.
- On-device model: 4K context, offline, OS-bundled; PCC server model: 32K context with new reasoning levels.
- Evaluations framework in Xcode supports comparative reports across models — including non-LLM systems like diffusion or upscalers — with a built-in sample generator for synthetic inputs.
- Foundation Models Instruments adds roundtrip latency, token budgets, and more; availability and prewarm APIs help handle unsupported devices and cold-start latency.
- Core AI ships open-source export recipes, Swift runtime utilities, ahead-of-time compilation for large models, and agentic skills for coding agents.
- MLX adds GPU/URX writer support for M5 and Thunderbolt 5 RDMA — a session demos four Mac Studios running ~100B-parameter models; rule of thumb stays under ~2 GB on iOS.
- Core ML is not deprecated — keep it for decision trees and sub-millisecond models; Core AI is the path for modern generative workloads.
- File issues at developer.apple.com/forums and feedback.apple.com; check the Dynamic Profiles and MLX sessions for hands-on examples.

---

## Related sessions

- [Run local agentic AI on the Mac using MLX](<https://developer.apple.com/videos/play/wwdc2026/232/>)
- [What’s new in image understanding](<https://developer.apple.com/videos/play/wwdc2026/237/>)
- [Dive into Core AI model authoring and optimization](<https://developer.apple.com/videos/play/wwdc2026/325/>)
- [Explore distributed inference and training with MLX](<https://developer.apple.com/videos/play/wwdc2026/233/>)
- [Explore prompt design & safety for on-device foundation models](<https://developer.apple.com/videos/play/wwdc2025/248/>)

---

