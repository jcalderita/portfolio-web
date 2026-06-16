# Privacy and Security Group Lab

> WWDC26 · Session 8009 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8009/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest privacy and security announcements. Conducted in English.

Host David (WWDR technology evangelist) moderates a privacy and security panel with Apple engineers Yosh, Katie, Dan, Rohit, and Emily, covering agentic AI risks, Private Cloud Compute, telemetry, passkeys, and protecting sensitive data on device.

---

## Q&A

### 2:59 — [Prompt Injection Defense](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=179>)

**Q.** How does Apple prevent its models from being hijacked via prompt injection?

Dan explained that agentic AI introduces indirect prompt injection risks — the "lethal trifecta" of private data access, action capability, and untrusted context. Apple combines deterministic mitigations (like user confirmation prompts) with probabilistic ones (like spotlighting untrusted content in prompts), and points to a dedicated WWDC session on securing agentic features.

### 5:10 — [PCC vs Third-Party Models](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=310>)

**Q.** When an app sends user data to Private Cloud Compute or to a third-party model via the language model protocol, what happens to that data and what must developers disclose?

Emily noted PCC's stateless computation and non-targetability guarantees only apply to Apple's PCC paths — not to third-party APIs like Anthropic or Google. Data sent to PCC is used only to fulfill the request, isn't visible to Apple, and the volume is wiped on every reboot. Rohit added developers must read third-party terms and clearly communicate to users how their data is handled.

### 8:20 — [Nutrition Label Scope](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=500>)

**Q.** For privacy nutrition labels, does data a third-party processor handles on my behalf count as data I collect?

Katie clarified developers are responsible for declaring all data collected from their app, regardless of whether it's sent to their own servers or a third-party service. That means understanding what third parties do with the data and representing the full picture to users.

### 9:33 — [Xcode Agentic Coding Risks](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=573>)

**Q.** What security risks come with Xcode's new agentic coding features and how should developers mitigate them?

Dan said Apple applies a secure-by-design approach across Siri, Safari, and Xcode agentic features. Xcode specifically lets you allow-list common tools that callers may invoke when Xcode acts as an MCP server, with mitigations tailored to each use case.

### 10:49 — [PCC Architecture](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=649>)

**Q.** What's the core architecture behind Private Cloud Compute, and how is it mathematically verifiable?

Emily pointed to the in-depth PCC security guide on apple.com and described the stateless, verifiable platform. Apple requires two attestations from two separate hardware vendors, isolates risky parsing (e.g. image diffusion for spatial reframing) in extra-sandboxed nodes, and publishes a Virtual Research Environment so anyone — eligible for Apple Security Bounty — can verify claims against the exact software running on Apple's servers. Compromised nodes produce different attestations and are automatically rejected by client devices.

### 17:21 — [Auditing Your Own App](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=1041>)

**Q.** Are there new ways to audit my own app's privacy and security, especially when using SwiftData with CloudKit?

Katie suggested using generative AI coding assistants to review your privacy/security guarantees and identify where to adopt more private APIs like out-of-process pickers. Dan highlighted that frameworks (Network framework with post-quantum TLS cipher suites, CloudKit) are secure-by-default. Yosh stressed thinking about inputs you trust and where you vent collected data as the two foundational security questions.

### 22:26 — [Beginner Frameworks](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=1346>)

**Q.** For developers starting on Apple platforms, which privacy and security frameworks should we focus on first?

The panel recommended CloudKit for sync, Keychain and CryptoKit for on-device secrets, and passkeys for authentication. Above all, practice data minimization — don't collect what you don't need, use out-of-process pickers for photos/contacts/location, and pick the right Keychain Data Protection class (e.g. after-first-unlock vs always available). For telemetry, consider rotating/session identifiers, aggregation, and tools like differential privacy and private federated learning.

### 28:16 — [Protecting Journal Data](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=1696>)

**Q.** How should I protect highly sensitive SwiftData content like journal entries while still supporting search and CloudKit sync?

Yosh recommended encrypting with a Keychain key set to a strict Data Protection class (e.g. only-when-unlocked, optionally biometric-gated), applying matching file-protection classes on disk, and using CKRecord encrypted values so Advanced Data Protection users get end-to-end encryption across devices. Dan added there's a Data Protection class that keeps data available for a bounded window after lock, giving background processes time to index before the key is locked again.

### 31:22 — [Xcode Offline VM](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=1882>)

**Q.** Can Xcode's AI coding features run inside an air-gapped VM with no internet?

Dan said existing code completion is fully on-device and works offline, but features integrating external models like Claude or OpenAI Codex inherently require network access.

### 32:12 — [New Siri Privacy](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=1932>)

**Q.** How does the new Siri protect privacy and security, e.g. avoiding leaking private context to apps?

Katie and Emily explained Siri runs as much on device as possible, with on-device sandboxing and entitlements restricting which process can collect prompt context. When the larger Apple Foundation Model is needed, requests go to PCC under its full guarantees, with multi-turn round-trips that still honor on-device TCC prompts. Rohit added that data sent to third-party apps via Siri is minimized to just what the query requires.

### 37:50 — [Siri MDM Controls](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=2270>)

**Q.** Will Siri get new configurable MDM policies?

Dan confirmed yes — existing MDM controls for Siri still apply, and he encouraged enterprises to file Feedback with specific configuration needs. He flagged Safari's new automatic password-change feature as especially useful for small businesses without SSO.

### 38:59 — [Safari ITP Updates](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=2339>)

**Q.** Any new Safari Intelligent Tracking Prevention enhancements this year?

Katie said Apple continues investing in ITP year over year. No specific new features were called out for this release; she pointed developers to webkit.org for details.

### 39:53 — [Conveying Trust](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=2393>)

**Q.** How do you credibly convey that an app is private and secure without sounding like security theater?

The panel recommended accurate App Privacy nutrition labels, in-app transparency about what data you hold, and articulating concrete privacy assurances as a north star. Dan warned against marketing terms like "bank-grade encryption" and advised leaning into Apple-native experiences (passkeys, Sign in with Apple, Accessory Setup Kit). Emily noted Apple publishes PCC source code as a transparency model. David emphasized purpose strings and asking for permission contextually at the moment of value, not at launch.

### 47:59 — [Career Starting Points](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=2879>)

**Q.** As a cybersecurity student, which Apple frameworks and concepts should I learn first?

Dan recommended starting with the Apple Platform Security Guide and the security.apple.com blog (Memory Integrity Enforcement, iMessage PQ3, kernel memory allocation posts) along with the bug bounty program. Yosh added that for low-level work, learn binary exploitation and reverse engineering; for networking, learn how TLS and the internet actually work — security comes down to deeply understanding how systems work.

### 50:34 — [Passkey Lifecycle](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=3034>)

**Q.** How does Apple handle stale, revoked, or invalid passkeys in the Passwords app?

David pointed to the new Signal API, which lets relying parties notify the OS that credentials have changed so updates can be reflected. Passkeys evolve through a cross-company standards body Apple participates in.

### 51:44 — [Secrets In Memory](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=3104>)

**Q.** On macOS, should developers encrypt secrets in RAM or are platform protections enough?

Yosh said start with Hardened Runtime, which blocks other processes and debuggers from reading your memory. For short-lived secrets, destruction beats encryption — wipe tokens once used. Dan added CryptoKit zeroizes key-backing memory for you, which the Swift runtime won't guarantee otherwise, and keys can be bound to the Secure Enclave so they're non-exportable even if the app is compromised.

### 55:41 — [Telemetry Balance](<https://developer.apple.com/videos/play/wwdc2026/8009/?time=3341>)

**Q.** How do you balance useful development telemetry against user privacy?

Katie framed it around Apple's privacy pillars: data minimization (do you need fine-grained timestamps or can you aggregate?), on-device processing, transparency and control, and security of what you do collect. Rohit warned that even non-aggregated time series can leak behavioral patterns (e.g. alarm telemetry revealing wake-up times) and noted minimization also saves bandwidth. Dan stressed that user opt-outs must be technically enforced and that deleting data is itself a security control.

---

## Highlights

- PCC enforces two attestations from two separate hardware vendors per node, with a public Virtual Research Environment eligible for Apple Security Bounty.
- Use Keychain Data Protection classes (e.g. only-when-unlocked, biometric ACL) plus CKRecord encrypted values for end-to-end encrypted CloudKit sync under Advanced Data Protection.
- Adopt passkeys from day one — pair with the new Signal API to notify relying parties of credential lifecycle changes.
- On macOS, enable Hardened Runtime and use CryptoKit (which zeroizes key memory); bind keys to the Secure Enclave to make them non-exportable.
- Network framework defaults to post-quantum TLS cipher suites in iOS 26 with no code changes required.
- Use out-of-process pickers, Accessory Setup Kit, and contextual purpose strings instead of broad up-front permission prompts; declare all collected data — including via third-party processors — in App Privacy nutrition labels.
- Resources: Apple Platform Security Guide, security.apple.com blog, PCC security guide on apple.com, and the WWDC session on securing agentic features.

---

## Related sessions

- [Secure your app: mitigate risks to agentic features](<https://developer.apple.com/videos/play/wwdc2026/347/>)

---
