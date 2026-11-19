# Technical Blueprint — Data, Edge, NVIDIA, Supabase and Command Center
## Stack and architecture decisions
**Candidate implementation stack** (not committed implementation): TypeScript frontend (Next.js or Vite React decision ADR), API/BFF, Supabase Postgres/Auth/Realtime/Storage/Edge Functions, containerized ingestion/vision workers, optional NVIDIA DeepStream/Jetson acceleration, OBS broadcast, Twitch adapter, Maestro adapter subject to vendor validation, optional WebAR/spatial provider, and future 3D city renderer.

**Rationale:** UI and sponsor flows require responsive real-time event display and role-aware data. The vision worker is not appropriate as a latency-sensitive Supabase Edge Function: use device/server inference, aggregate at ingest, and store mostly counts/events. Supabase Edge Functions handle authorization, secure webhooks and orchestration. The design is portable between local and cloud inference.

## System topology
\`\`\`text
[Approved cameras / manual counts / event calendars / QR]
            |
       [Edge Agent]  ---- telemetry / local encrypted short ring buffer
            |
    Vendor-neutral VisionProvider
       NVIDIA DeepStream/Jetson | CPU simulator | managed provider
            |
     detection/tracking/ROI counter
            |
  signed metadata events (NO IDENTITY)
            |
   [Ingestion API] -- schema validate, dedupe, rate limit, clock sync
            |
 [Private Event Queue / durable buffering]
     |         |            |
 Rollups    Trigger Rules  Review Queue
     |         |            |
 [Supabase Postgres] [Storage private] [audit]
     |                       |
 [RLS authenticated APIs] [safe public aggregate publication]
     |
 [Command Center] [Business Portal] [Civic Public] [Media Control]
     |                  |
 [Twitch/OBS adapter] [Maestro capability-gated adapter]
     |
  [REVELV verified delivery ledger] -> [auditable economic reports]
\`\`\`

## Repository target layout
\`\`\`text
apps/
  command-center/           operations + collapsible HAI chat
  business-portal/          tenant-limited sponsor campaigns & reports
  civic-portal/             aggregate city dashboard & methodology
  broadcast-console/        NPC/script overlays, review, destinations
packages/
  domain/                   domain contracts, Zod schemas, measurement units
  ui/                       blue/green tokens, accessible controls
  analytics/                robust aggregations, data coverage, comparisons
  trigger-engine/           deterministic rules/cooldown/dedupe
  revelv/                   ad-event ledger & reconciliation
  vision-contract/          provider interface, count & health events
  npc/                      grounded scripts, moderation, localization
  report-templates/         bilingual partner reports, methods & revisions
services/
  ingress/                  secure device and partner ingestion
  cv-worker/                non-browser inference, NVIDIA optional
  rollup-worker/            windows & long-term aggregates
  media-worker/             permitted clips, safe blur/redaction
  broadcast-gateway/        platform adapters
supabase/
  migrations/               versioned migrations, RLS & indices
  functions/                token-bound webhook/authorization actions
  seed/                     fictional district/synthetic demo data
infra/
  local/                    compose/fixtures/health probes
  deploy/                   config/secret management/alerts/backup
tests/
  contracts/
  rls/
  integration/
  e2e/
  synthetic-vision/
docs/
  implementation/
\`\`\`

## Source contracts
Normalized event fields: schema_version, event_id (UUID), source_id, node_id, zone_id, event_type, occurred_at UTC, received_at UTC, time-source offset, algorithm/version, camera calibration version, count_delta/aggregate amount, class, direction, coverage_fraction, confidence band, data_quality, evidence_ref restricted where approved, privacy_scope, payload.

**Idempotency:** unique event_id per upstream producer; duplicate delivery never inflates count. Large events should be buffered and replayed after connectivity failures. Raw public endpoints never accept unverified claims of device identity.

## Data model
**Public reference:** cities, districts, corridors, zones, public-reports, public-methodology, approved-projects.
**Restricted operational:** sites, camera_nodes, calibration, telemetry, coverage_windows, movement_observations, mobility_counts, conflict_candidates, adjudications, source_version.
**Commercial:** organizations, memberships, businesses, brands, campaigns, creatives, rights_approvals, placements, eligible_trigger_rules, trigger_events, showings, ad_verifications, interactions, redemptions, invoices, revenue_allocations.
**Media:** broadcast_sessions, scene_cues, npc_profiles, npc_script_templates, moderation_audits, polls, participant_badges and channel adapters.
**Civic:** event_calendar, site-interventions, matched_baselines, vitality_metric_versions, civic_projects, decisions, grants and impact_review.
**Security:** privacy_requests, audit_events, user_role_assignments, access_reviews, retention_jobs.

Use Postgres timestamps UTC and time-zone-aware reporting (Dominican Republic vs America/New_York). Determine canonical counting zones once and lock versioned boundaries before comparisons.

## Supabase implementation requirements
1. Review currently supported Supabase CLI and breaking changelog; CLI v3 requires explicit host-targeting review before commands.
2. Create local/staging project; migrations via installed CLI version and commands verified with \`--help\`.
3. Enable RLS on **every exposed table**; tenant membership tables in non-exposed schema or RLS-protected. No broad \`TO authenticated USING(true)\` on tenant tables.
4. Authorization from server-validated membership/claims, not user-editable metadata; careful refresh invalidation.
5. Store secrets only in protected environment/vault, never in client bundles. Use narrow service roles on backend only.
6. Keep private raw footage/frames and ad customer assets in isolated storage buckets; use short-lived signed URLs.
7. Public aggregates must be precomputed, suppression-thresholded and separately accessible through secure views/APIs (security_invoker where applicable).
8. Test cross-tenant SELECT/INSERT/UPDATE/DELETE, bucket policies, token expiry, view exposure, webhook signatures and invalid client role.
9. Enable backups, restore drills, storage lifecycle rules and cost monitoring.
10. Realtime for operator status and time-bucket summaries; do not broadcast high-volume per-frame detections to every browser.

### Example auth matrix
| Role | Street aggregates | Raw clips | Own sponsor campaigns | Other sponsors | Safety review | Civic funds |
|---|---|---|---|---|---|---|
| Public | approved coarse only | no | no | no | published summary | published audited |
| Business | approved + its market | no | yes | no | no | published |
| Creator | approved + assigned | restricted approved clips | assigned assets | no | no | published |
| Analyst | approved/role specific | gated | no | no | authorized aggregate | summary |
| Operator | governed internal | limited approved | controls | audited needed | review with role | no approval by default |
| Civic reviewer | approved + contract scoped | separately authorized | no | no | gated | report |
| Admin | controlled with audit | exceptional governed | admin | admin | no unrestricted bypass | separate finance signoff |

## Trigger rules
Deterministic engine inputs: valid count/event + zone + time + schedule + sponsor permission + privacy flags.
Outputs: eligible ad cue, NPC cue, QR offer, civic information, metrics audit. All rules support 1) debounce window, 2) cooldown, 3) frequency cap, 4) conflict resolution, 5) off switch, 6) simulation and backtest.
**Prohibit** individual identification, “recognize my brand-colored clothing” tracking, personalized camera-facing offers, and vehicle-specific alcohol promotions. Triggers should mostly be location/time/aggregate conditions.

## REVELV measurement truth
Keep distinct:
1. Eligible trigger
2. Scheduled placement
3. Creative-render start
4. Render-complete / duration reached
5. Concurrent-viewer estimate (platform dependent)
6. Click / QR / command
7. Merchant redemption
8. Verified sales (external opt-in)
Never infer viewer human attention from a rendering event or physical foot traffic from streamer count.

## Vision provider contract
\`\`\`ts
interface VisionProvider {
  health(): Promise<Health>;
  process(input: PermittedStreamRef, config: CalibrationConfig): AsyncIterable<AggregateObservation>;
  benchmark(fixture: LabeledFixture): Promise<MeasurementQuality>;
}
\`\`\`
Do not require any facial recognition or stable identity beyond a short-lived ephemeral tracking identifier needed for counts. Do not export raw per-person tracks outside secure edge analytics.

## NVIDIA proof-of-concept
Current NVIDIA docs describe DeepStream SDK 9.2 and distinguish supported dGPU/X86 and Jetson paths. Pin images/libraries **after hardware compatibility checks**, not from sample text. Benchmark: CPU-only baseline, DeepStream optimized, cloud GPU. Compare accuracy and total cost/1000 valid observation hours, GPU watts, memory, recovery, model availability, container lifecycle, licensing and vendor support. Source: https://docs.nvidia.com/deepstream/

NVIDIA Omniverse is a future optional digital-twin path; a 3D map or game-engine preview is not evidence a physical sensor is linked. Treat rendering separately from analytics accuracy.

## HAI Command AI chat
Collapsible/pinnable/resizable dock. Read-only tools first: select district, explain peak hour, compare periods, generate brief, locate node outage; return visible citations/metric version and confidence. Later operational tools (ad scheduling, camera actions, financial disbursement) require authenticated roles and a second explicit user confirmation. No autonomous changes to physical street controls.

## Broadcast connectors
Twitch: official allowed APIs, EventSub/chat/polls, OBS overlays, moderation, token refresh and rate limits. Avoid assuming advertising overlays in extensions are universally permitted; legal/platform review needed.
Maestro: validate customer plan, API/SDK availability, embed/events/click capability, rights and analytics exports by proof-of-concept. Feature flag each unverified control.

## Operational quality
Service SLOs (pilot hypotheses): ingestion p95 under 10s for aggregate updates; dashboards visibly mark staleness beyond 30s; daily report completion 99%; camera uptime target 95%; recovery from disconnect without double counting. Log trace_id, no PII in error logs, monitor node temperature/bandwidth/backlog, and alert operators on missing data.

## Environment progression
- Local with synthetic no-camera events.
- Staging with consented/recorded footage and seeded fake brands.
- Permissioned private field pilot with capped retention.
- Public launch only after security/legal/safety gates.
- Repeat-site template built after QA and unit-economics proof.
