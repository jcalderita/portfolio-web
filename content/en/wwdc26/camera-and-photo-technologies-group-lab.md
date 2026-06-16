# Camera and Photo Technologies Group Lab

> WWDC26 · Session 8018 · [Watch full video](https://developer.apple.com/videos/play/wwdc2026/8018/)

---

## About

Join us online for a deep dive into WWDC26 with Apple engineers and designers to ask questions, get advice, and follow the discussion about the week's biggest announcements for camera and photo technologies. Conducted in English.

Hosted by Sergei with panelists Matt (Photos Frameworks), Brad (camera software), Ivan (still capture pipeline), David (file format/compression/RAW), and Jake (camera performance). The lab covers AVFoundation capture, PhotoKit, RAW/HDR pipelines, and the new iPhone 17 pro video APIs.

---

## Q&A

### 5:38 — [AI Edit Metadata](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=338>)

**Q.** When Spatial Reframe or Cleanup edits a photo in iOS 27, is any metadata or content credential written to indicate AI editing?

Yes — the file's IPTC metadata (alongside EXIF) is updated and reflects which AI edit (Spatial Reframe or Cleanup) was applied. The Photos app's info panel also surfaces this information after a swipe-up.

### 6:55 — [Keywords API](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=415>)

**Q.** Photos now supports keywords on iOS — is there an API for third-party apps to read or edit them?

Keywords are surfaced in the Photos info panel and persisted into IPTC metadata on export, but there is no PhotoKit-level API yet to fetch or query assets by keyword.

### 7:50 — [Thumbnail Loading](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=470>)

**Q.** What's the most performant way to load image thumbnails for a lazy grid that animates into a full-resolution detail view?

On Core Graphics, open images with the thumbnail option so it uses an embedded thumbnail or decodes a scaled-down version. On Core Image, request a scale factor when opening the image so it downscales as early as possible in the pipeline.

### 9:34 — [Deferred Start Race](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=574>)

**Q.** Can Deferred Start cause users to miss a shot if they tap capture before the photo output has finished attaching?

Yes, that's the risk of pushing initialization out. Pair Deferred Start with <span class="high">isResponsiveCaptureEnabled = true</span> on the photo output so the system buffers and queues the shot even before the output is fully ready. Covered in this year's session 'Build a responsive camera app that launches quickly'.

### 11:04 — [Live Depth Bokeh](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=664>)

**Q.** What's the best way to obtain the depth map plus image for both viewfinder and captured stills to render a 3D bokeh effect?

For preview, use an AVCaptureDepthDataOutput synchronized with the video stream via AVCaptureDataOutputSynchronizer; for stills, enable <span class="high">depthDataDeliveryEnabled</span> on AVCapturePhotoSettings and use Core Image filters with the captured depth. A shortcut for preview-only effects is enabling Cinematic video capture on the device input with a video preview layer.

### 13:39 — [Quality Vs Manual](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=819>)

**Q.** With <span class="high">photoQualityPrioritization</span> set to quality, manual exposure/ISO settings get overridden — can you know the final exposure ahead of time?

No. Quality and balanced modes use fusion algorithms that drive their own exposures, so manual settings are ignored in photo mode. If you need manual shutter/ISO preserved, use speed prioritization. This was covered in this year's session on resolving capture settings.

### 16:28 — [Original Resource Choice](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=988>)

**Q.** What is PHAsset's <span class="high">originalResourceChoice</span> for, and where can we learn more?

It's a new API surfacing the long-standing RAW+JPEG behavior: it controls which resource (the RAW or the compressed image) is treated as the original for edits and derivatives. Related APIs live on PHContentEditingInput and PHAssetChangeRequest for toggling which resource is original.

### 18:02 — [Linear Bayer Preview](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=1082>)

**Q.** Will iOS 27 expose a linear scene-referred preview stream for Bayer capture that matches CIRAWFilter's DNG conversion without tone mapping?

Not today. The only scene-referred linear path in capture is the Log/Log2 format. Raw frames from camera capture carry metadata incompatible with CIRAWFilter's expectations, but the team likes the idea and encourages a Feedback Assistant request.

### 20:18 — [Capture App Tips](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=1218>)

**Q.** What are the must-have recommendations for an app whose entire identity is its capture experience?

Prioritize fast launch, Responsive Capture, and Deferred Processing so users don't miss the moment. Don't run AVCaptureSession on the main thread — use a dedicated serial queue and start from sample code. Decide whether you're pro or playful, differentiate clearly, and integrate well with PhotoKit permissions and save flows.

### 25:42 — [AV Sync Streaming](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=1542>)

**Q.** What's the optimal way to stream audio and video simultaneously without drift?

Prefer a single AVCaptureSession with both audio and video device inputs plus their data outputs — the session synchronizes them onto a shared timeline. If you must use a different audio API like AU Remote I/O, use CMClock and <span class="high">CMSyncConvertTime</span> to map video timestamps onto the audio clock (audio drift is more perceptible than video drift). Carry those PTSs over the network and let AVPlayer or <span class="high">AVSampleBufferDisplayLayer</span> handle playback sync.

### 29:46 — [ProRAW Vs Bayer](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=1786>)

**Q.** Why can ProRAW deliver 48MP from a quad-Bayer sensor while native Bayer raw output is limited to binned resolution?

ProRAW is debayered, fused, and linearized RGB, so sensor layout doesn't matter at output. A 48MP raw from a quad-Bayer sensor would be Quad Bayer, not Bayer, and shipping it requires an ecosystem of decoders (CIRAWFilter etc.) plus debayering algorithms for quad sensors — much harder than classic Bayer. File feedback if you want it.

### 32:51 — [ISO Gain Maps](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=1971>)

**Q.** What's the recommended way to generate and write ISO-conformant gain maps and gain-map metadata for HEIC and JPEG on iOS?

Watch the WWDC talk from two years ago by David Hayward covering Core Graphics and Core Image APIs for gain-map input and output. A third path is reading the gain-map specifications Apple added to the HEIF and JPEG specs directly — both are clearly documented.

### 35:18 — [Deferred Vs Prepare](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2118>)

**Q.** How do Deferred Start and the photo output's <span class="high">setPreparedPhotoSettingsArray</span> compose — does preparation pass through deferral?

They're orthogonal. Deferred Start only delays building non-preview branches of the capture graph to get preview running fast; prepared settings tell the photo output the worst-case settings so it can pre-allocate. You can still call prepared settings after preview is up, and quality prioritization will still slow launch if you don't defer.

### 37:57 — [Asset Ratings API](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2277>)

**Q.** Does adjusting PHAsset's new rating property require a PHLibraryChangeRequest?

Use PHAssetChangeRequest — it exposes the rating property with an enum of unset and values 1–5.

### 38:30 — [Picker File Type](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2310>)

**Q.** Is there a native way to keep the original file type (PNG, JPEG, etc.) when importing from PhotosPicker instead of getting PNG?

Specify the UTType explicitly when configuring the Transferable rather than relying on the default image type. The picker may also convert formats (e.g. RAW) when the user has restricted captions or location. Apple's PhotosPicker sample code from a prior session walks through this.

### 39:53 — [Adjustments Plist](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2393>)

**Q.** Is the format of the Photos app's adjustments plist documented, and can exported adjustments be re-imported?

No — there's no documented format and no API to decode or re-import that plist. File a Feedback Assistant request if you need it.

### 40:51 — [Common Mistakes](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2451>)

**Q.** What are the biggest mistakes developers make when building camera-heavy iPhone apps?

Running AVCaptureSession on the main thread (it blocks during reconfiguration — use a dedicated serial queue) and skipping <span class="high">beginConfiguration</span>/<span class="high">commitConfiguration</span> when changing multiple properties (each setter would otherwise re-evaluate the graph). Also, don't use AVCaptureVideoDataOutput just to render preview — AVCaptureVideoPreviewLayer is far more efficient unless you need to touch the buffers.

### 43:45 — [Zoom And Pan](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2625>)

**Q.** What's the closest-to-native way to implement smooth zoom, scroll and pan on a large photo without pixelation?

Use Core Image (and CIRAWFilter for RAW) — it caches throughout the decode pipeline and only recomputes the visible region of interest, so panning and zooming stay smooth even on 100MP images.

### 46:45 — [Visual Intelligence Limits](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2805>)

**Q.** Are there usage limits on the visual intelligence camera feature, and does it affect picture quality?

There's no on-device limit on how often you can use it, but captures go to the intelligence app, not the user's library, and are saved at screen resolution/aspect ratio — not full photo-mode quality. There is a cap on how many conversational queries you can make about a given photo.

### 47:42 — [Spatial Reframe API](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2862>)

**Q.** Can developers tap into the Spatial Reframe 3D reconstruction pipeline, or is it Photos-only?

No developer API — Spatial Reframe is locked to Photos. ARKit offers some 3D scene capture and reconstruction primitives, and on Pro phones you can use the LiDAR-backed AVCaptureDevice or the TrueDepth front camera for depth-based captures. File feedback for the reframe pipeline.

### 48:54 — [Rotation Handling](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=2934>)

**Q.** When will the system handle camera rotation automatically across iOS, iPadOS and macOS — getting it right is painful?

The system can't infer intent, so apps must still handle it, but AVCaptureDeviceRotationCoordinator (added in recent years) gives you the right preview or horizon-level rotation angle. You can also set <span class="high">videoRotationAngle</span> on the connection: video buffers get physically rotated, photos use EXIF, movies use track metadata. The 'Support the Center Stage front camera in your iOS app' session covers this for iPhone 17's new front-camera orientation.

### 52:12 — [24MP With Depth](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=3132>)

**Q.** Can you capture 24MP photos together with depth data using the deferred photo capture pipeline?

Yes. Opt into full processing (24MP requires it), set <span class="high">maxPhotoDimensions</span> to a 24MP size supported by the device, choose quality prioritization, and enable depth data delivery — the deferred capture will then include depth.

### 53:37 — [Multicam On IPhone](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=3217>)

**Q.** Can a Group Lab-style multi-iPhone streaming setup be built with public APIs, and which ones?

Yes — last year's pro video APIs make it practical. Use Locked Frame Duration for rock-solid frame rate, external Genlock (e.g. via Blackmagic Pro Dock) to synchronize multiple iPhones, and the new time code generation/output for clean alignment in Final Cut. This week's AVProVideoStorage API also gives deterministic write speeds for ProRes captures.

### 56:52 — [Underrated New API](<https://developer.apple.com/videos/play/wwdc2026/8018/?time=3412>)

**Q.** Is there a niche new API worth highlighting that hasn't gotten much attention?

AVProVideoStorage — a pre-allocated file for ProRes capture that guarantees frame-rate-safe writes even on older or fragmented devices, with a built-in settings UI for user-controlled allocation. Also flagged: the new ML-based RAW 9 engine for debayering and denoising third-party RAWs, covered in David Hayward's Core Image session.

---

## Highlights

- Pair Deferred Start with <span class="high">isResponsiveCaptureEnabled</span> to avoid missed shots during fast launch — see 'Build a responsive camera app that launches quickly'.
- AI edits (Spatial Reframe, Cleanup) update IPTC metadata and surface in the Photos info panel; no API yet to read or set keywords from third-party apps.
- Use AVCaptureDataOutputSynchronizer with depth + video, or enable Cinematic video capture on the device input for live bokeh previews.
- For A/V sync, prefer a single AVCaptureSession; otherwise reconcile clocks with <span class="high">CMSyncConvertTime</span> and keep audio as the master timeline.
- Pro video stack: Locked Frame Duration, Genlock via Blackmagic Pro Dock, time-code output, and the new AVProVideoStorage for deterministic ProRes writes.
- Use AVCaptureDeviceRotationCoordinator and <span class="high">videoRotationAngle</span> — see 'Support the Center Stage front camera in your iOS app' for iPhone 17's reoriented front cam.
- 24MP + depth requires opting into full processing, setting <span class="high">maxPhotoDimensions</span>, quality prioritization, and <span class="high">depthDataDeliveryEnabled</span>.

---

## Related sessions

- [Build a responsive camera app that launches quickly](<https://developer.apple.com/videos/play/wwdc2026/303/>)
- [Create a more responsive camera experience](<https://developer.apple.com/videos/play/wwdc2023/10105/>)
- [Implement high resolution photo capture](<https://developer.apple.com/videos/play/wwdc2026/304/>)
- [Capture cinematic video in your app](<https://developer.apple.com/videos/play/wwdc2025/319/>)
- [Support HDR images in your app](<https://developer.apple.com/videos/play/wwdc2023/10181/>)
- [Support the Center Stage front camera in your iOS app](<https://developer.apple.com/videos/play/wwdc2026/341/>)
- [Enhance RAW image processing with Core Image](<https://developer.apple.com/videos/play/wwdc2026/305/>)

---
