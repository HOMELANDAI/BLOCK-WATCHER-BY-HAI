# Technical Architecture

## Baseline HomelandAI Backend

BLOCK WATCH uses the standard HAI backend direction:

- **Supabase Database** — relational operational data and analytics metadata
- **Supabase Auth** — operators, businesses, creators, civic partners, admins
- **Supabase Edge Functions** — secure orchestration, trigger evaluation, webhooks, campaign logic
- **Supabase Realtime** — live counters, node status, trigger events, dashboards
- **Supabase Storage** — images, clips, NPC assets, playlist/visual assets, ad creative, gateway media cards

## Logical Architecture

```text
Cameras / Sensors / External Data
            |
            v
     Edge Processing Layer
            |
   detections + telemetry
            |
            v
      Ingestion Gateway
            |
    ---------------------
    |         |         |
    v         v         v
Analytics  Trigger   Media/Clip
Pipeline   Engine    Pipeline
    |         |         |
    -------- Supabase ---
              |
      Realtime Event Bus
              |
  --------------------------------
  |       |        |       |      |
  v       v        v       v      v
Operator Sponsor Community Twitch Maestro
Console  Portal   Portal   Layer  Layer
```

## Suggested Core Tables

- `cities`
- `districts`
- `streets`
- `intersections`
- `nodes`
- `cameras`
- `node_health_events`
- `observation_windows`
- `traffic_counts`
- `pedestrian_counts`
- `mobility_counts`
- `conflict_event_candidates`
- `heatmap_cells`
- `triggers`
- `trigger_rules`
- `trigger_events`
- `businesses`
- `sponsors`
- `campaigns`
- `creatives`
- `placements`
- `verified_impressions`
- `interactions`
- `redemptions`
- `npc_profiles`
- `npc_assignments`
- `broadcast_sessions`
- `viewer_actions`
- `badges`
- `viewer_badges`
- `community_projects`
- `community_allocations`
- `audit_events`

## Event Envelope

All machine and interaction events should normalize to a common envelope:

```json
{
  "event_id": "uuid",
  "event_type": "traffic.count.updated",
  "occurred_at": "ISO-8601",
  "city_id": "uuid",
  "district_id": "uuid",
  "node_id": "uuid",
  "source": "edge-ai",
  "confidence": 0.96,
  "payload": {},
  "privacy_class": "aggregate",
  "schema_version": 1
}
```

## Edge AI

The edge layer should emit structured metadata whenever possible instead of continuously uploading full-resolution video. Raw footage can remain local or be retained selectively under explicit policy.

Candidate functions:

- Detection
- Multi-object tracking
- Region-of-interest counting
- Direction estimation
- Dwell estimation
- Crowd density
- Clip marking
- Basic anomaly/conflict candidate generation

## NVIDIA Adapter

Create a vendor adapter rather than hard-coding NVIDIA dependencies.

```text
VisionProvider
  infer(frame)
  track(stream)
  health()
  capabilities()
```

Possible implementations:

- NVIDIA accelerated provider
- Cloud inference provider
- CPU fallback
- Recorded-video simulator

This permits testing without expensive edge hardware and reduces vendor lock-in.

## Trigger Engine

A trigger rule should contain:

- Source event
- Conditions
- Location scope
- Schedule
- Cooldown
- Priority
- Sponsor eligibility
- Creative eligibility
- Privacy restrictions
- Output action(s)

Example:

```json
{
  "name": "Dinner Footfall Sponsor",
  "source": "pedestrian.density",
  "conditions": {"gte": 35},
  "schedule": "17:00-21:00",
  "cooldown_seconds": 900,
  "actions": ["overlay.show", "revelv.verify"]
}
```

## REVELV Attribution Model

Every delivery event should connect:

`campaign → creative → placement → trigger → showing → interaction → redemption`

This chain provides auditable sponsor reporting without claiming causal sales lift unless the evidence supports it.

## API Domains

Suggested API boundaries:

- `/geo`
- `/nodes`
- `/analytics`
- `/triggers`
- `/campaigns`
- `/creative`
- `/revelv`
- `/npc`
- `/broadcast`
- `/community`
- `/admin`

## Realtime Channels

Examples:

- `city:{id}:traffic`
- `node:{id}:health`
- `broadcast:{id}:events`
- `campaign:{id}:delivery`
- `district:{id}:vitality`

## Roles

- Platform Admin
- City/District Operator
- Broadcast Producer
- Analyst
- Sponsor/Business
- Creator
- Civic Partner
- Viewer

Use Supabase Row Level Security to ensure businesses only access their campaigns and authorized aggregate data.

## Privacy Controls

- Aggregate-first storage
- Configurable retention
- Redaction pipeline where raw clips are retained
- Role-based access
- Signed media URLs
- Immutable audit trail for sensitive access
- No default identity recognition requirement

## Observability

Monitor:

- Camera uptime
- Edge device temperature/load
- Inference latency
- Stream FPS
- Event queue latency
- Trigger success/failure
- Realtime connection health
- Sponsor delivery failures
- Storage consumption
- Broadcast health

## Deployment Environments

- `local` — simulator and recorded footage
- `staging` — non-public test district
- `pilot` — limited real-world deployment
- `production` — approved public operations

Never require live street cameras for core developer workflows; maintain synthetic and recorded test fixtures.
