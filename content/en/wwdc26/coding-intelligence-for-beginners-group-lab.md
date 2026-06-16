# Coding Intelligence for Beginners Group Lab

> WWDC26 · Session 8007 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8007/)

---

## About

Join us online to ask questions, get advice, and follow the discussion about getting started with coding intelligence. Conducted in English.

Hosted by Angelica, this beginners-focused lab on Xcode's coding intelligence brings together Nathan (Xcode intelligence/agents team), Ken (Xcode team lead), Jerome (Developer Tools PM), and Kevin (engineering manager for Xcode AI tools). They field questions on agent workflows, local models, privacy, and getting started.

---

## Q&A

### 5:20 — [Discovering Slash Commands](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=320>)

**Q.** Where can a beginner learn the available slash commands like /plan?

Type <span class="high">/</span> in Xcode to see commands surfaced by the agent plus loaded skills, and ask the agent directly — it knows its own commands and can describe them. Experimenting reveals new workflows.

### 6:27 — [Xcode vs External Agents](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=387>)

**Q.** What unique advantages does Xcode's built-in coding intelligence offer versus external AI agents?

Xcode brings a curated tool set, project understanding, SDK/documentation tools, and validation tools including builds, code execution, and UI rendering. It also exposes Apple-ecosystem data (crash reports, localization), the preview system as an agent tool, and out-of-the-box planning mode and onboarding guidance.

### 10:32 — [Resource Usage Indicator](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=632>)

**Q.** Does Xcode 27 surface how much agent context or budget a request is consuming?

Not in the UI directly — ask the agent via a provider slash command. Providers typically expose two numbers: current context-window fill versus session cost. File a Feedback request if you'd like it surfaced elsewhere.

### 12:06 — [Cross-Project Context](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=726>)

**Q.** Can the agent access additional working directories or other local projects for cross-project references?

Files referenced in your Xcode workspace are visible to the agent automatically, and pasting external file paths lets it explore. Default permission prompting keeps you in control, and an experimental managed security mode gates actions at the file-system level.

### 15:05 — [Explain What Was Built](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=905>)

**Q.** Could coding intelligence offer an optional explanation/summary of what it just did so learners understand the code?

Ask the agent — it happily explains in any format (markdown, HTML reports). Configure an AGENTS.md to always append explanations, open a parallel conversation to ask questions while the main agent works, use plan mode to understand approach before code changes, and have it generate architecture docs that persist for future sessions.

### 21:16 — [Common Agent Mistakes](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=1276>)

**Q.** What common mistakes do coding assistants make that beginners struggle to catch?

Subtle assumption mismatches and unmaintainable implementations are the trickiest. Watch for 'cheating' — e.g., dismissing a failing test as a debug-only issue. Strong types, tests, and live issues give the agent fast feedback to self-correct before issues reach you.

### 24:24 — [Undo Agent Changes](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=1464>)

**Q.** Can Xcode provide a one-click undo for everything an agent changed, instead of relying on Git?

Xcode already tracks per-turn history when a Git repo is initialized in your project — open the history view, move the slider, and revert to the state before the last agent turn. You can also ask the agent to roll back specific changes. The panel strongly recommends keeping Git enabled even for solo projects.

### 29:04 — [Building AI Skills](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=1744>)

**Q.** How should an experienced iOS developer with little AI experience build agent-assisted development skills?

Start small with tasks you already know so you can compare results and build confidence. Teach the agent your conventions, use it as a planning aid if you're not ready to delegate code, and watch the 'Xcode Agents and You' session for workflow patterns. Try both top-down (describe the shape) and bottom-up (define interfaces, let it implement bodies) approaches.

### 34:15 — [Chat vs Agent Mode](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2055>)

**Q.** What are the differences between chat mode and agent mode, and why does a local LLM in chat mode underperform the demo?

Chat mode exposes ~10–15 tools; agent mode exposes ~60 plus command-line access, sub-agents, and context management — basically unlimited capability. Agents now operate for an hour or more independently versus chat's ~30-second turns. The panel encourages moving from chat to agents in Xcode 27.

### 38:01 — [Local Model Tradeoffs](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2281>)

**Q.** What capabilities are lost when using a local model instead of a cloud model — just speed/accuracy, or whole features?

The Xcode tool set is identical via ACP — local agents get the same tools. The real difference is raw model intelligence: cloud-hosted giant models outperform what fits on a laptop. Compensate with stronger guardrails — solid tests and validation loops keep smaller models on track.

### 40:33 — [Local LLM Beyond Chat](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2433>)

**Q.** Can a local LLM (e.g., MLX LM server) be wired into a full agent flow rather than just chat mode?

Yes — use ACP support with open-source agents like OpenCode that support local models. ACP is also how enterprises plug in custom back-end harnesses while keeping the Xcode experience.

### 41:25 — [Code Privacy](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2485>)

**Q.** What happens to my code's privacy when a third-party LLM accesses it through Xcode? Can it train on my code?

Apple is not in the loop — requests go directly to the provider you configured. Training and retention are governed by that provider's terms; check their account settings to opt out of training. The only exception is feedback reports you explicitly submit to Apple.

### 43:38 — [Offline AI Workflows](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2618>)

**Q.** What's the best way to work with AI in Xcode while offline without top-tier hardware?

Use MLX to run the largest viable local model (see the 'Run local agentic AI on Mac using MLX' session). Lean on strong guardrails — unit tests the agent must pass keep small models honest. Pre-plan with a big cloud model before going offline, let local agents execute and document assumptions, then verify with a large model when you reconnect.

### 46:13 — [Why Stay In Xcode](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2773>)

**Q.** After using Claude Code in the terminal heavily, what am I missing by not using Xcode?

Xcode offers a non-linear, visually rich experience — an artifacts panel showing evolving changes alongside the conversation, rich markdown, previews, and full Xcode context (open files, schemes, Git history, crash data, Instruments, device hub). The terminal is fine too; it doesn't have to be all-or-nothing.

### 49:19 — [Local Model Selection](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=2959>)

**Q.** How do I balance speed, accuracy, and privacy when choosing a local model in Xcode 27?

Try them — benchmarks help but ultimately 'vibes' matter. Build your own scorecard of cases that matter for your project and rerun as new models drop. Bigger isn't always better; you can swap models per task and keep multiple loaded on a capable Mac.

### 52:25 — [Foundation Models As Agent](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=3145>)

**Q.** To avoid sharing code with Anthropic/OpenAI/Google, can Foundation Models drive the Xcode agent?

Use local agents with local models via ACP — the 'Run local agentic AI on Mac using MLX' session covers the path. Even a single M5 Mac is capable; a Mac Studio array can host very large models.

### 53:13 — [Beginner Overview](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=3193>)

**Q.** Is there a beginner's overview document — a map of the topic — rather than hands-on tutorials?

The 'Xcode Agents and You' session has illustrative diagrams of what the agent is doing. Plan mode is a low-risk way to inspect the agent's approach. Techniques transfer across IDEs, so community resources and provider docs apply. Don't overthink it — try it.

### 58:06 — [New API Awareness](<https://developer.apple.com/videos/play/wwdc2026/8007/?time=3486>)

**Q.** How do we ensure the agent knows about brand-new APIs announced at WWDC?

Xcode ships a documentation tool with a model-optimized index that downloads with Xcode and updates as a separate asset. The agent taps it when an API is unfamiliar. Xcode also ships specialist skills (e.g., the new iOS 27 resizability feature). This works regardless of provider — Claude, Codex, Gemini, or local.

---

## Highlights

- Use AGENTS.md to persist conventions like 'always summarize what you did' so the agent behaves consistently across turns.
- Enable Git on every project — Xcode 27 tracks per-turn history and exposes a slider to revert to the state before the last agent turn.
- ACP support means open-source agents (OpenCode, Claude Code, Codex, Gemini) get the same ~60 Xcode tools as built-in flows, including with local MLX-hosted models.
- Watch 'Xcode Agents and You' for workflow patterns and 'Run local agentic AI on Mac using MLX' for local model setup.
- Plan mode lets you inspect and steer the agent's approach before any code changes hit your project.
- Xcode's documentation tool ships a model-optimized index that updates as a separate asset, so agents know new WWDC APIs regardless of which provider/model you use.
- Apple is not in the request loop — privacy/training policies are governed by your model provider's terms; configure opt-outs in your provider account.

---

## Related sessions

- [Run local agentic AI on the Mac using MLX](<https://developer.apple.com/videos/play/wwdc2026/232/>)
- [Code-along: Experiment with coding intelligence in Xcode 26](<https://developer.apple.com/videos/play/meet-with-apple/268/>)

---
