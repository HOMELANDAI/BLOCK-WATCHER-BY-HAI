# Integrations, Operations and Deployment Playbooks

## Technology selection gates
Implement only as validated. The items below are possibilities, not connected production systems.

### NVIDIA
- **Metropolis / DeepStream:** candidate accelerated multi-stream vision pipelines and tracking; independently test accuracy, latency, container support, hardware compatibility and licensing using 2026-relevant official docs. DeepStream documentation currently labels SDK 9.2 as default: https://docs.nvidia.com/deepstream/
- **Jetson:** potential edge device; choose hardware only after actual stream count, power/temperature and ruggedness benchmarks.
- **RTX workstation:** development inference and creative rendering; not necessarily street-side deployment.
- **Omniverse / related 3D:** optional future simulation and digital-twin presentation; no shortcut to geographic ground truth.
- **NVIDIA adapter** must allow recorded-video/CPU mode for test and provider substitution.

### Supabase
- **Postgres:** multi-tenant relational storage, aggregates, rule/version history and ledger.
- **Auth:** operator, sponsor, analyst, producer and civic roles.
- **Storage:** private clips, approved creative, NPC assets, ad previews; approved public deliverables separate.
- **Realtime:** live dashboard aggregates and alerts; throttle sensor streams.
- **Edge Functions:** secured sponsor/webhook integration, campaign state changes, signed actions. Not frame-by-frame video inference.
- **Security:** RLS and ownership, public schemas, signed storage URLs, logs, grants, validated membership. Current docs: https://supabase.com/docs/guides/database/postgres/row-level-security
- **Upgrade gate:** check Supabase changelog before CLI changes; Nov 2026 CLI v3 includes a change to default local targeting: https://supabase.com/changelog.md

### Twitch + OBS
- OBS scene architecture: base feed (permissioned and delayed/blurred where necessary), clean data mode, NPC scene, contest scene, intermission, sponsor scene, recap, fallback/offline.
- Audio tracks, moderation, access token handling, stream disconnect, manual override.
- Official Twitch API/EventSub/webhooks and chat-driven commands only after validation. Label sponsored content, follow community guidelines and API terms.
- Treat Twitch as discovery, community and clips—not guaranteed audience.

### Maestro
- Validate what is available on selected account/plan: embedded/live video, overlays, poll/reward widgets, analytics export, SDK/API and webhooks.
- Implement adapter capability probing; degrade to links/QR if direct overlay features unavailable.
- Treat Maestro as controlled interactive experience and optional professional sponsor destination, not guaranteed API capability without confirmation.

### WebAR/Spatial
- Geospatial QR/marker anchor permits and device tracking.
- Optional AUKI-style spatial domain interoperability should be evaluated under a separate technical proof-of-concept before any dependency.
- Physical building projection requires actual equipment, property/municipal permission and historical-zone review.
- Offer low-tech QR landing page for unsupported AR devices.

### Local communities
- Chamber/business association + merchants (survey, letters of support).
- Municipal stakeholder (project awareness, permits, traffic study interpretation).
- Tourism operators/event organizers (calendar and measurement).
- Independent transport engineer (safety risk).
- Creator workforce (NPC localization, micro-ads).

## Pilot physical-site checklist
Site ID/address authorized; street-zone geometry; camera field of view; privacy masks; mounting license; weather protection; power; network; UPS; edge compute enclosure; device access controls; signage; time synchronization; test clips; local maintenance contact; safety/incident escalation; removal plan.

## Operator SOP
**Start of shift:** check node health, time sync, valid window coverage, alarm queue, sponsor campaign eligibility, scene choices, active permits.
**During operation:** monitor staleness, count anomaly, content safety, manual sponsor override and incident handling.
**End of shift:** close observations, daily rollups, reconciled showings, uptime report, logs and approved summary.
**Data incident:** isolate access, stop affected broadcast, preserve necessary evidence securely, invoke response plan and legal notifications as applicable.
**Device outage:** mark invalid interval, disable count/trigger propagation, display “DATA UNAVAILABLE,” queue retry; do not show fabricated zero.
**Platform outage:** switch to data-only safe scene, pause sponsored completion verification, preserve audit log, reconcile afterward.

## Release and CI/CD
- Branch/review checks.
- Migration dry-run.
- Unit/integration/E2E tests.
- RLS and tenant-access negative tests.
- Trigger replay and idempotency tests.
- Data-quality regression with annotated fixtures.
- Accessibility and reduced motion test.
- Secret/dependency scans.
- Deployment approval and rollback point.
- Release version with schema/method versions.

## Monitoring
Technical: CPU/GPU/temperature, bandwidth, FPS, dropped frames, event ingestion lag, DB write/queue failures, Realtime clients, storage costs, backups, job recovery.
Business: valid observation hours, sponsor activation health, paid deployments, render delivery failures, business report generation.
Trust: privacy incidents, audit access, policy exceptions, clip removal requests, false-positive review ratio.

## Disaster recovery
Retain backed-up data and clear loss tolerances, conduct quarterly recovery exercises for staging/pilot, document restore order (auth/memberships, campaigns, raw private assets where retained, event ledger, aggregates), verify consistency after restoration. Payments and ad credits require reconciliation before resuming.

## Service levels (proposals)
- Data freshness labelled; “live” only when recent and connected.
- Error and missing-window labels explicit.
- Operator escalation within pilot-team working schedule; no 24/7 SLA before staffing.
- On-site service responsibility contract for hardware.
- External sensor/camera API revocation handled with degraded safe mode.

## Deployment procurement checklist
Before committing vendor spend, benchmark three options: human/manual periodic counts; generic edge or cloud vision; NVIDIA accelerated edge. Select by actual data quality, cost per valid observation hour, heat/power/network performance, serviceability, maintenance and replacement availability in Dominican Republic.
