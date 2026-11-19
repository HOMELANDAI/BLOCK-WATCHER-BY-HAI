# Full Phased Implementation Plan
**Use with:** [Executive Charter](00_EXECUTIVE_CHARTER.md), [Technical Blueprint](03_TECHNICAL_BLUEPRINT.md), [Measurement Specification](02_MEASUREMENT_AND_DATA_DICTIONARY.md), [Pilot Playbook](08_PILOT_PLAYBOOK.md), and [Risk Register](07_GOVERNANCE_RISK_AND_PRIVACY.md).

## Working cadence, ownership, and decision rights
Start with a **2-person HAI core team** and buy specialized services as needed. Roles are responsibilities, not claims that employees exist:
- **Product/Creative Lead:** vision, municipal/business partnerships, NPC show format, priorities, sponsor offers, acceptance.
- **Technical Lead:** Supabase, data schema, APIs, edge inference, telemetry, security, integrations.
- **Contracted privacy/local counsel:** legal rights, privacy, advertising, permitting, retention, transfer requirements.
- **Contracted traffic engineer:** interpretation of risk/conflict metrics and intervention claims.
- **Local field partner:** camera access, maintenance, signage, stakeholder relations, event coordination.
- **On-demand creators:** AI animation, AR, localization, voice, editing, motion branding.
- **Community review panel:** residents, shops, disability/walkability voices, tourism and civic stakeholders.

All work is GitHub-issue tracked. One epic per phase, small tasks beneath; dependencies are gates rather than assumed completions. Weekly technical review, biweekly stakeholder review, monthly stop/go review.

### Phase P0 — Select the right market and validate demand
**Objective:** establish a scored, defensible bustling-small-town pilot candidate.

**Work packages**
- P0-01 Build weighted market scorecard: foot-traffic density per block, events, day/night activity, mixed mobility, business count, tourism, public/private cooperation, camera access, connectivity, security risk.
- P0-02 Walk/survey three candidate corridors; interview minimum 10 local businesses and 3 civic/event stakeholders.
- P0-03 Select one 50–200m *candidate* corridor and explicit measurement boundaries.
- P0-04 Define 3 high-value decisions operators will make from data; record buyer willingness to pay, not merely expressions of interest.
- P0-05 Perform alternatives comparison: human counts vs existing sensors vs installed cameras vs recorded feed.

**Artifacts:** market scorecard, interview notes, baseline assumptions, pilot ROI hypothesis, selected corridor.
**Gate G0:** sponsors and partners express measurable demand; install path appears feasible; no reliance on unsanctioned cameras.
**Fail response:** switch to timeboxed event measurement or desk research before buying equipment.

### Phase P1 — Legal, privacy, public trust and field design
**Objective:** earn permission to measure and communicate with the public before operating.

**Work packages**
- P1-01 Map public/private rights: pole, facade, electricity, network, street views, public displays, signage, historic preservation, municipality.
- P1-02 Commission Dominican Republic-specific legal/privacy review for Sosúa/Puerto Plata; separate NJ/US counsel review before Hackensack deployment.
- P1-03 Define capture zones, masks/exclusion zones, aggregate thresholds, retention limits, restricted clips, public feed delay/redaction rules.
- P1-04 Develop community information notice and complaint/feedback channel in Spanish and English.
- P1-05 Validate camera heights/angles for occlusion, night visibility, rain, headlights, motorcycles and pedestrians.
- P1-06 Threat model: misuse of camera footage, stalking, sponsor targeting, unsafe viewer clip culture, compromised edge nodes.

**Artifacts:** site survey, permissions register, privacy impact assessment, data minimization matrix, incident escalation plan.
**Gate G1:** written permission for pilot equipment and public notices; privacy/security approver signs pilot configuration.
**Fail response:** use staged or permissioned prerecorded footage in non-public development.

### Phase P2 — Measurement design, source data and calibration
**Objective:** determine what is measured, not guessed.

**Work packages**
- P2-01 Define roadway regions of interest, crossing lines, time buckets and deduplication logic.
- P2-02 Separate *counts* from *unique visits*; define directional crossing, occupancy, dwell proxy, peak interval, exposure-normalized conflict candidates.
- P2-03 Create reference-labeling guidelines and manual count protocol across day/night, weekday/weekend, rain/event/no-event.
- P2-04 Define seasonal baseline and representative sampling; factor camera uptime and occlusion into published coverage.
- P2-05 Define confidence/data-quality flags, manual review procedures and invalidation rules.
- P2-06 Define A/B or matched-control methodology for events, advertising and infrastructure studies.

**Artifacts:** metric dictionary, QA reference dataset, test plan, weekly quality report.
**Gate G2:** sample sizes and acceptance tolerances defined in advance; metrics can be reproduced from raw logs.

### Phase P3 — Core platform and secure infrastructure
**Objective:** deploy a local/staging architecture before any public capture.

**Work packages**
- P3-01 Choose monorepo tooling; establish branch protection, CI, lint/test/typecheck, secrets scanning, infrastructure config.
- P3-02 Create Supabase project *only when project ownership and billing are authorized*; configure Database, Auth, Realtime, Storage, Edge Functions.
- P3-03 Implement DB migrations, tenant/membership policy, RLS, grants, backup/restore and safe public aggregates.
- P3-04 Build ingestion gateway with signed device identity, event schema validation, idempotency, retry/dead-letter handling.
- P3-05 Store time-bucketed metrics; implement rollups, audit logs and operator exports.
- P3-06 Add simulator emitting deterministic movement events for UI and trigger tests.
- P3-07 Implement monitoring: device uptime, inference failures, event latency, stale data, cost meters.

**Artifacts:** deployable local/staging service, migrations, test suite, staging dashboards, runbook.
**Gate G3:** no privileged keys in browser; cross-tenant deny tests pass; replay duplicates do not inflate counts; restore drill succeeds.

### Phase P4 — Computer vision + optional NVIDIA
**Objective:** turn permissioned video into reliable aggregate metadata.

**Work packages**
- P4-01 Design vendor-neutral VideoAnalyticsProvider interface.
- P4-02 Compare OpenCV/CPU/cloud baseline against current NVIDIA Metropolis/DeepStream/Jetson path using *same* ground-truth clips.
- P4-03 Build ingest → detection → tracking → crossing aggregation; track each vehicle class without identity persistence.
- P4-04 Handle low light, wet streets, stopped traffic, bicycles vs motos, dense occlusion, variable FPS and camera motion.
- P4-05 Benchmark throughput, GPU load, power/network failure, maintenance, hardware replacement.
- P4-06 Human-review conflict event candidates; consult transportation engineer for TTC/PET suitability and limitations.

**Artifacts:** benchmark report, version-pinned inference build, telemetry, known-failures catalog.
**Gate G4:** accuracy thresholds met for approved metrics; no raw personally identifying metadata in public analytics; sustained observation uptime reaches pilot SLA.
**Fail response:** narrow classes/coverage or switch to human-assisted counting before making safety claims.

### Phase P5 — Operator intelligence console
**Objective:** reliable decision support, not just attractive graphics.

**Work packages**
- P5-01 Build RBAC login, city/district selector, node health, 15-minute and hourly counts, confidence and coverage labels.
- P5-02 Build dashboard trend/peak report and controlled historical comparison filters.
- P5-03 Develop anomaly review queue, exportable CSV/PDF summary, report approval/versioning.
- P5-04 Implement navy-to-royal-blue HAI OS theme with metallic electric-green *specular light sweep*, reduced-motion mode and accessibility checks.
- P5-05 Add collapsible HAI Command chat: first release query templates/rule-based analytics; require approvals for operational changes.
- P5-06 Add audit trail showing which metric and filter generated each report.

**Artifacts:** usable operator UI, weekly report template, demo videos, training guide.
**Gate G5:** representative operator completes critical tasks unassisted; every public number displays time window and coverage.

### Phase P6 — Small-business, property, tourism and event intelligence
**Objective:** prove analytics lead to practical action in a bustling town.

**Work packages**
- P6-01 Launch Business Pulse: likely peak windows, staffing/inventory planning prompts, promotion timing from observed trends.
- P6-02 Launch Property/Leasing Evidence: normalized exposure metrics, site comparison cards, measurement method disclaimers.
- P6-03 Launch Event Impact: pre/during/post comparisons, control-week matching, crowd dispersal and vendor corridor changes.
- P6-04 Launch Tourism Flow: pedestrian routes (aggregate), wayfinding gaps, activity distribution, destination-card scan results.
- P6-05 Launch Site-Opportunity Hypotheses: potential service gaps validated by business inventories, not inferred solely from cameras.
- P6-06 Collect post-action outcome reports directly from willing merchants; separate verified results from anecdotes.
- P6-07 Provide locality-level private stakeholder reports and safely aggregated public summaries.

**Artifacts:** 4 decision templates, 3 business case studies, 1 event brief, stakeholder feedback.
**Gate G6:** users can articulate a decision changed by data; reports avoid claims about individual customers, actual sales or tourist identity absent confirming evidence.

### Phase P7 — Media and NPC pilot
**Objective:** test if an intelligent block can hold an audience.

**Work packages**
- P7-01 Configure OBS scenes/overlays for data cards, NPC host, contests, annotations and sponsor slots.
- P7-02 Old School Omar live script library: bilingual guidelines, measured-fact grounding, comedic boundaries and manual override.
- P7-03 Twitch EventSub + API integration for authorized chat/polls/channel-point mechanics.
- P7-04 Pilot 30–60 minute weekly show, Peak Hour Predictor and Street Savant, then short highlights.
- P7-05 Design an optional Maestro-specific interactive prototype after capabilities, contract and integration feasibility are verified.
- P7-06 Establish moderation and privacy-first clipping; no named individuals or victim-centered near-miss sensationalism.

**Artifacts:** broadcast rundown, overlays, NPC scripts, audience reporting.
**Gate G7:** at least four episodes measured; engagement/return-viewer metrics beat defined baseline; no unresolved privacy or platform-policy incidents.

### Phase P8 — HAI Micro-Ad Lab and REVELV pilot
**Objective:** sell creative outcomes with independently verifiable delivery.

**Work packages**
- P8-01 Formalize four creative service tiers and production costs; use prior concept pricing as **hypotheses**.
- P8-02 Build sponsor intake/asset licensing/creative review and approval workflow.
- P8-03 Implement campaigns, placements, scheduled triggers, cooldowns, consent-based QR, redemptions.
- P8-04 Build REVELV append-only showing/verification/interaction ledger with rule version, timestamps and reconciliation.
- P8-05 Publish sponsor reports that distinguish view starts, actual served overlays, clicks, scans, redemptions and attributable sales when independently tracked.
- P8-06 Run 3–10 pilot sponsor programs and capture comparative results and staff effort.
- P8-07 Implement split controls and accounting only after legal/financial review; do not represent tentative community revenue shares as funded.

**Artifacts:** creative briefs, samples, ledger spec, sponsor portal, tested invoice/reconciliation procedure.
**Gate G8:** paying/committed customers, cost-covered fulfillment model, auditable delivery and documented sponsor satisfaction.

### Phase P9 — Civic value, safety and reinvestment
**Objective:** help the community make demonstrably better decisions.

**Work packages**
- P9-01 Produce exposure-normalized crosswalk, directional, and conflict-candidate reports with engineer review.
- P9-02 Design intervention registry: lighting, signs, crossings, taxi staging, outdoor seating, accessibility, public realm.
- P9-03 Create baseline + comparable after-period plan, with caveats for event schedule, weather and tourism seasonality.
- P9-04 Publish Community Vitality Scorecard; ensure each index is composed of defined, reproducible metrics.
- P9-05 Write and approve the Civic Dividend policy: eligibility, allocation, project votes, disbursement authority, audit.
- P9-06 Create public method notes and citizen appeal/feedback route.

**Artifacts:** civic insight report, change-measurement protocol, community scorecard, funded-project ledger (when genuine).
**Gate G9:** civic partner review, expert interpretation, accessible public publication and governance approval.

### Phase P10 — Spatial AR and digital twin
**Objective:** prove one permitted facade ad and one meaningful 3D corridor visualization.

**Work packages**
- P10-01 Inventory permitted buildings/markers and heritage constraints.
- P10-02 Build one smartphone WebAR or approved spatial anchor interaction; clearly distinguish in-app overlay from a literal outdoor projection.
- P10-03 Test localization, lighting, occlusion, device compatibility, fallback links and content expiration.
- P10-04 Build 3D visualization with map alignment, counters, node health, events and sponsored spaces.
- P10-05 Add planned-vs-installed annotations; no imaginary AR billboards shown as active inventory.
- P10-06 Integrate tourism walking trail and QR/AR metrics with consent.

**Artifacts:** field-tested AR station, digital twin demonstrator, asset/performance budget.
**Gate G10:** device-validated alignment and heritage/advertising permissions; measurable useful visitor interaction.

### Phase P11 — Replication, commercialization and second-market test
**Objective:** turn bespoke pilot into deployable system.

**Work packages**
- P11-01 Package Node Kit, commissioning checklist, calibration procedure, edge image, connectivity matrix.
- P11-02 Publish deployment playbook, SOP, safety/privacy checklist, bilingual communications.
- P11-03 Test with contrasting secondary market (e.g., Hackensack), *after independent local legal/permit review*.
- P11-04 Compare model accuracy and merchant economics by city, climate, culture and layout.
- P11-05 Price subscriptions/services using actual costs and renewals.
- P11-06 Establish maintenance commitments, support SLAs, equipment replacement, disaster recovery, annual audit plan.

**Artifacts:** repeatable installation kit, second-site report, unit-economics dashboard, partnership agreement templates.
**Gate G11:** positive or explicitly justified unit economics, repeatable deployment quality, and partner support demonstrated.

## Workstream Dependencies
- P0 → P1 → P2 → P3/P4 → P5 → P6.
- P4 metadata + G1 privacy approval required before public stream or sponsor trigger.
- P5 stable counts precede predictions/forecasts.
- P6 measurement definitions precede civic economic claims.
- P7 format validation precedes scaled media spend.
- P8 delivery evidence precedes revenue-share automation.
- P9 safety review precedes public safety rankings.
- P10 permissions precede installing AR markers or projecting onto heritage buildings.
- P11 only after G4, G6, G8 and G9 have written outcomes.

## Program-level Stop/Go Metrics (provisional; calibrate during P2)
- **Measurement:** ≥90% counting accuracy on independently labeled samples per key class, including low-light slice; disclose class failures.
- **Reliability:** ≥95% pilot observation-window availability, with explicitly excluded planned outages.
- **Event:** delivery log reconciles ≥99% of accepted events; dedupe verified.
- **Security:** 100% critical RLS role-isolation tests pass; no high-severity open findings.
- **Usability:** ≥80% first-time operator critical-task success in facilitated testing.
- **Business:** ≥3 pilot sponsors willing to pay or sign an objectively priced trial, plus 3 stakeholder decisions documented.
- **Media:** 4+ scheduled episodes with meaningful retention/engagement measurements; no audience guarantee.
- **Civic:** ≥1 locally reviewed recommendation with baseline and credible remeasurement plan.

These are starting acceptance hypotheses, not verified current results. Define exact numerator/denominator and sample sizes in P2.

## Approval/Version Controls
Every phase must ship: (1) working artifact, (2) test evidence, (3) owner sign-off, (4) risk update, (5) release notes, (6) next-gate decision. Track outcome as PROPOSED, IN_PROGRESS, TESTED, APPROVED, or RELEASED.
