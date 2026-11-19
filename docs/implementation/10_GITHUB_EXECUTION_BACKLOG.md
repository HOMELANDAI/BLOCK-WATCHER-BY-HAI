# GitHub Execution Backlog and Sprint Organization

## Roadmap management
The repository stores architecture and product requirements. GitHub Issues are the execution layer. Use:
- **EPIC:** high-level phase objective and release gate.
- **STORY:** user-facing/testable behavior.
- **TASK:** engineering, legal, field, business or production implementation.
- **SPIKE:** timeboxed research/benchmark before irreversible commitment.
- **ADR:** architecture decision record with considered alternatives.

### Task templates
\`\`\`md
## User/business need
## Input/data source
## In scope / Out of scope
## Dependencies / Risk & privacy
## Implementation steps
## Acceptance tests
## Evidence/link to demo
## Owner / Estimate
## Release gate
\`\`\`

## Epics P0–P11
**P0 Market feasibility:** town scorecard, stakeholder interviews, market decision, price validation.
**P1 Governance:** permissions, privacy/legal review, site design, community notice, contracts.
**P2 Measurement:** metric dictionary, ground-truth labels, QA, confidence and study design.
**P3 Platform:** migrations, RLS, device auth, ingest, rollups, simulator, observability.
**P4 Vision/NVIDIA:** provider abstraction, benchmark, edge deployment, labeling regression.
**P5 Console:** design system, live dashboard, reports, HAI Command chat, accessible UX.
**P6 Intelligence products:** Business Pulse, property brief, Event Impact, Tourism Flow, retail hypotheses, feedback outcomes.
**P7 Media:** NPC, show formats, Twitch/OBS, contest logic, Maestro feasibility, moderation.
**P8 Ads/REVELV:** HAI Micro-Ad Lab, clients, campaign rules, delivery ledger, sponsor reporting, paid pilots.
**P9 Civic:** safety review, vitality metrics, before/after, impact and fund policy.
**P10 Spatial:** approved AR facade, tourism trail, digital twin and visualization.
**P11 Scaling:** second city, node kit, SOP, unit economics, partner kit, deployment reproducibility.

## Suggested milestone sequence
- **M1 — Validated Corridor and Rights:** G0–G2
- **M2 — Private Data MVP:** G3–G4
- **M3 — Intelligence Dashboard:** G5–G6
- **M4 — Viewer/Sponsor Proof:** G7–G8
- **M5 — Civic Evidence:** G9
- **M6 — Spatial and Replication:** G10–G11

## Sample sprint slices
Sprint 1: site scorecard, metric dictionary draft, synthetic event contract.
Sprint 2: Supabase local setup, schema migration + restrictive RLS, role fixtures.
Sprint 3: ingest dedupe, 15m rollups, coverage flags.
Sprint 4: operator dashboard, synthetic calibration report.
Sprint 5: vendor-neutral CV adapter and labeled-scene benchmark.
Sprint 6: Business Pulse report and first stakeholder usability test.
Sprint 7: Twitch data-driven show and NPC safe script library.
Sprint 8: sponsor campaign schema, trigger simulator and REVELV ledger.
Only schedule a sprint when upstream approvals and staff capacity support it.

## Board columns
**Backlog → Ready → In Progress → Needs Review → Testing → Blocked → Done.**
For blocked tickets, capture blocking party, next decision and target; do not move to Done until acceptance evidence is recorded.

## RACI
Product sponsor: accountable for prioritization and merchant/civic partnerships.
Technical lead: accountable for security and system releases.
Privacy/local counsel: consulted/approver for capture/recording and data agreements.
Traffic engineer: reviewer of safety publications.
Field partner: responsible for site installation/maintenance.
Broadcast producer: responsible for show, NPC moderation and sponsorship.
Community panel: consulted on public-purpose and reinvestment.
Financial reviewer: signs off paid sponsorship splits and civic allocation.

## Planning assumptions
A two-person core team cannot simultaneously build reliable CV, secure multi-tenant SaaS, AI animation, Twitch/OBS production, spatial AR and municipal rollout. Contract specialized help, defer full digital twin, and measure resource use after each gate. Do not declare dates until resourcing, permits and first pilot sponsor are secured.

## Decision records to create
ADR-001 Camera/vision vs human survey; ADR-002 Supabase project structure and tenancy; ADR-003 NVIDIA vs CPU/cloud; ADR-004 Viewer feed privacy; ADR-005 Twitch and Maestro adapter; ADR-006 REVELV “verified impression” definition; ADR-007 Street AR vs physical projection rights; ADR-008 Legal scope DR vs NJ; ADR-009 Civic dividend accounting.
