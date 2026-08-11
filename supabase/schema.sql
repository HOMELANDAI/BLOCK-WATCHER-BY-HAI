-- BLOCK WATCH by HAI
-- Conceptual Supabase/Postgres starter schema.
-- Review privacy, retention, indexing, RLS, and jurisdictional requirements before production.

create extension if not exists pgcrypto;

create table if not exists cities (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  country_code text not null,
  timezone text not null,
  created_at timestamptz not null default now()
);

create table if not exists districts (
  id uuid primary key default gen_random_uuid(),
  city_id uuid not null references cities(id) on delete cascade,
  name text not null,
  slug text not null,
  created_at timestamptz not null default now(),
  unique(city_id, slug)
);

create table if not exists intersections (
  id uuid primary key default gen_random_uuid(),
  district_id uuid not null references districts(id) on delete cascade,
  name text not null,
  latitude double precision,
  longitude double precision,
  created_at timestamptz not null default now()
);

create table if not exists nodes (
  id uuid primary key default gen_random_uuid(),
  intersection_id uuid references intersections(id) on delete set null,
  name text not null,
  status text not null default 'offline' check (status in ('online','processing','degraded','offline','verified')),
  provider text,
  last_seen_at timestamptz,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists observation_windows (
  id uuid primary key default gen_random_uuid(),
  node_id uuid not null references nodes(id) on delete cascade,
  window_start timestamptz not null,
  window_end timestamptz not null,
  metric text not null,
  value numeric not null,
  confidence numeric,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists observation_node_time_idx
  on observation_windows(node_id, window_start desc);

create table if not exists businesses (
  id uuid primary key default gen_random_uuid(),
  district_id uuid references districts(id) on delete set null,
  name text not null,
  category text,
  status text not null default 'prospect',
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists campaigns (
  id uuid primary key default gen_random_uuid(),
  business_id uuid not null references businesses(id) on delete cascade,
  name text not null,
  status text not null default 'draft',
  starts_at timestamptz,
  ends_at timestamptz,
  budget numeric,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists creatives (
  id uuid primary key default gen_random_uuid(),
  campaign_id uuid not null references campaigns(id) on delete cascade,
  name text not null,
  creative_type text not null,
  storage_path text,
  approval_status text not null default 'draft',
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists trigger_rules (
  id uuid primary key default gen_random_uuid(),
  district_id uuid not null references districts(id) on delete cascade,
  name text not null,
  source_event text not null,
  conditions jsonb not null default '{}'::jsonb,
  actions jsonb not null default '[]'::jsonb,
  cooldown_seconds integer not null default 0,
  enabled boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists trigger_events (
  id uuid primary key default gen_random_uuid(),
  trigger_rule_id uuid references trigger_rules(id) on delete set null,
  node_id uuid references nodes(id) on delete set null,
  occurred_at timestamptz not null default now(),
  confidence numeric,
  payload jsonb not null default '{}'::jsonb
);

create table if not exists verified_impressions (
  id uuid primary key default gen_random_uuid(),
  campaign_id uuid not null references campaigns(id) on delete cascade,
  creative_id uuid references creatives(id) on delete set null,
  trigger_event_id uuid references trigger_events(id) on delete set null,
  channel text not null,
  shown_at timestamptz not null default now(),
  duration_ms integer,
  verification jsonb not null default '{}'::jsonb
);

create table if not exists npc_profiles (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  home_market text,
  persona jsonb not null default '{}'::jsonb,
  enabled boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists broadcast_sessions (
  id uuid primary key default gen_random_uuid(),
  district_id uuid references districts(id) on delete set null,
  title text not null,
  platform text not null,
  starts_at timestamptz,
  ends_at timestamptz,
  status text not null default 'scheduled',
  metadata jsonb not null default '{}'::jsonb
);

create table if not exists community_projects (
  id uuid primary key default gen_random_uuid(),
  district_id uuid not null references districts(id) on delete cascade,
  name text not null,
  category text not null,
  status text not null default 'proposed',
  budget numeric,
  funded_amount numeric not null default 0,
  description text,
  created_at timestamptz not null default now()
);

create table if not exists audit_events (
  id uuid primary key default gen_random_uuid(),
  actor_id uuid,
  event_type text not null,
  entity_type text,
  entity_id uuid,
  payload jsonb not null default '{}'::jsonb,
  occurred_at timestamptz not null default now()
);

-- Production requirement: enable RLS and create policies per role before exposing tables to clients.
