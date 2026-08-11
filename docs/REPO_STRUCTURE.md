# Repository Structure

```text
BLOCK-WATCHER-BY-HAI/
├── README.md
├── docs/
│   ├── PROJECT_BIBLE.md
│   ├── TECHNICAL_ARCHITECTURE.md
│   ├── PRODUCT_AND_UX.md
│   ├── BUSINESS_STREAMING_AND_COMMUNITY.md
│   ├── DESIGN_PROMPTS.md
│   ├── ROADMAP.md
│   └── REPO_STRUCTURE.md
└── supabase/
    └── schema.sql
```

## Intended Future Application Structure

When implementation begins, expand toward:

```text
apps/
  command-center/       # operator web application
  sponsor-portal/       # REVELV/business reporting
  community-portal/     # public Community Vitality view
  broadcast-control/    # Twitch/Maestro producer tools
packages/
  ui/                   # HAI design system
  domain/               # shared types and rules
  trigger-engine/       # trigger evaluation
  revelv/               # attribution/verification logic
  npc-runtime/          # NPC orchestration
  vision-adapter/       # NVIDIA/cloud/simulator interface
  analytics/            # aggregation and vitality metrics
supabase/
  migrations/
  functions/
  seed.sql
services/
  edge-agent/           # node-side inference/telemetry
  media-worker/         # clip/render processing
  stream-gateway/       # broadcast metadata/event routing
fixtures/
  recorded-video/
  synthetic-events/
infra/
  docker/
  monitoring/
tests/
  integration/
  trigger-rules/
  analytics/
```

The repository intentionally starts documentation-first because the project still contains product assumptions that should be validated before committing to a specific frontend framework, NVIDIA hardware topology, or streaming vendor architecture.
