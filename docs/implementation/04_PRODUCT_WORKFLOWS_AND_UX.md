# Product Workflows, UX, Media, NPC and Interactive Commerce

## Design system (final HAI direction)
**Title:** BLOCK WATCH by HAI — The Civic Intelligence Operating System.
**Gradient:** midnight navy \`#071323\` → royal blue \`#123A72\` → sapphire \`#0B2A57\` → near-black \`#030814\`.
**Metallic electric green:** base \`#38FF8C\`, highlight \`#67FFAE\`, reflection \`#9DFFD1\`, dark metal \`#1D6A49\`.
The **specular light sweep** animation travels across limited active UI edges at ~8–15 second randomized intervals. Provide \`prefers-reduced-motion\` fallback and keep reading surfaces static. Avoid public-safety/security “police surveillance” visual styling and avoid oversaturating the entire screen.

## Application surfaces
- **Operator Command Center:** web desktop-first, responsive field view.
- **Business Pulse Portal:** business-specific market windows, campaigns, reports.
- **Civic/Public View:** published aggregates, method notes, projects, consent/feedback.
- **Broadcast Producer:** approved camera feeds, data-only scenes, NPC control, sponsorship, polls, chat moderation.
- **REVELV Portal:** billing evidence, deliverables, ad-serving reports, allocations.
- **Micro-Ad Lab:** ad intake, storyboard, assets, animation, review, placement.
- **HAI Command Chat:** context-aware assistant across authorized modules.

## Universal shell
Topbar: HAI identity, city/timezone filter, system health, search, user menu.
Left nav: Overview, Live Blocks, Digital Twin, Node Health, Trigger Grid, Business Pulse, Event Impact, Tourism Flow, Safety Review, Micro-Ad Lab, REVELV, NPC Dispatch, Twitch, Maestro, Community Vitality, Settings.
Main: page content with responsive grids.
Right: context drawer for filters, location and active campaign metadata.
Chat: collapsed launcher or expandable ~360–440px dock; can pin, resize or float; never obscures urgent notifications.
Bottom: node uptime, data freshness, active streams, inference health and verification status.

## Primary workflows with acceptance
### U1 — City operator checks evening activity
Open Live Blocks → select Pedro Clisante → compare 18:00–23:00 vs matched Fridays → examine hourly pedestrian/moto counts and coverage → export report. All chart/CSV numbers reconcile and display count type, sample window and data-quality grade.

### U2 — Merchant changes operating hours
Open Business Pulse → select allowed storefront zone → view Friday peak trend and recommendation confidence → record staffing/closing-hour test → report follow-up sales or staffing outcome voluntarily. System does not present predicted sales as observed sales.

### U3 — Event organizer assesses festival
Register event boundaries/time → freeze pre-event baseline → collect valid observations → compare to match periods → inspect peak/dispersal paths → produce event brief with caveats and sponsor outcomes.

### U4 — Property owner creates leasing evidence
Select verified corridor + allowed zone → compare comparable normalized observation periods → export branded PDF with date, coverage, algorithm version and methodology footnote. No unsupported property pricing estimate.

### U5 — Tourism office finds quiet blocks
Overlay attractions/events/footfall by zone → identify low-observed corridor → seek local on-site survey → propose wayfinding experiment → measure before/after. No inference of tourist identity from clothing or appearance.

### U6 — Operator reviews safety candidate
Computer vision marks a potential conflict → operator/qualified reviewer sees permitted/redacted clip → adds outcome/false-positive reason → traffic engineer reviews summary → report suggests engineering study, not punishment.

### U7 — Producer runs Peak Hour Predictor
Choose published aggregate source and eligible windows → open entry → lock entry at published time → settle automatically against verified hourly bins → show leaderboards, tie policy and source; no bets/wagers required.

### U8 — Merchant launches Micro-Ad Lab creative
Brand intake → rights/claims checks → choose format/characters → draft storyboard → review → export/approval → choose schedule/zone → simulate triggers → activate → reconciliation → report.

### U9 — Sponsor sees REVELV results
Campaign → active creatives → served showings → estimated audience by eligible channel where obtainable → interactions → redemptions → reconciled invoice and optional community allocation. Errors/void events recorded, not quietly deleted.

### U10 — Community member views impact
Public view → safe aggregates and Community Vitality explanation → view planned vs approved vs funded vs completed projects → submit feedback → follow decision log.

## Broadcast show formats
**BLOCK WATCH Live:** 30–60m weekly character-led urban intelligence show.
**State of the Block:** evidence-based local weekly recap.
**Intersection Games:** cross-town competitions with matched metric definitions and reviewed clips.
**Main & Madness:** evening/peak activity editorial (avoid encouraging risky behavior).
**Spotlight [Town/Street]:** local stories, small-business visibility.
**Crosstown Clash:** normalized comparisons rather than rewarding unsafe road behavior.
**Safety Sunday:** informative street safety and infrastructure proposals.

## Contest catalog
Peak Hour Predictor; Jaywalker Jackpot (reframe toward safe-crossing awareness; no individual shaming); Bike Surge Bet (avoid real-money gambling language); Safe Spotter Challenge; Red Light Royale; Rush Hour Rumble; Near Miss Madness (safety-education review); Wild Turn of the Week (public clip approval); Street Savant Showdown; Signal Sleuth; Block Buster Bonanza; Corner Count-Up; Traffic Pick'em; Neighborhood Knockout; Crosstown Clash; Intersection Idol.

Contest framework: objective metric, time range, ground truth source, lock window, scoring algorithm, ties, manual-review process, anti-bot controls, accessibility, age/eligibility compliance, sponsor disclosures, moderation and appeals. This project does **not** import Homeland Hunt prize-tier documents.

## NPC Dispatch
- **Old School Omar:** Sosúa, warm bilingual host, local context.
- **Hackensack Hank:** New Jersey local downtown commentary.
- **Hype Heather:** energetic contest emcee / show coordinator.
- **Network anchor:** optional future multi-city host.

Each NPC configuration: persona, language, pronunciation guide, fact grounding source, city scope, live/recorded status, sponsor approval, script tags, jokes permitted/prohibited, moderator override, safe reaction library, moderation outcomes.
AI dialogue does not make legally definitive claims about people seen on the street. No identifying descriptions of minors, alleged offenders, or vulnerable persons. Subtitles available and human producer can mute/stop the host.

## Trigger UX
Show rule eligibility distinctly from actual activation. Every trigger displays input metric, threshold, time window, cooldown, privacy policy, sponsor, last firing, dry-run result and disabled status. Preview in a sandbox with synthetic events before deploying.

## AR building experiences
Define separate distribution channels:
1. **Phone-based spatial AR:** content on approved facades within visitor device.
2. **Livestream composited AR:** graphics appear to online viewers only.
3. **Physical projection / LED:** real-world display that requires physical equipment, owner rights and permits.
Do not depict one as automatically implying the others. Heritage zones prioritize reversible, non-invasive AR. Starter experience: scan verified QR at participating gallery/café to open a specific branded animation and optional directions; measure consenting scan/redemption.

## Screen inventory for Figma/Claude
Core: Login, Overview, Live Blocks, Node Detail, Data Quality, Comparison, Business Pulse, Property Brief, Event Report, Tourism Heatmap, Safety Review, Sponsor Dashboard, Campaign Editor, Creative Storyboard, Trigger Builder, Trigger Simulator, REVELV Ledger, NPC Dispatch, Stream Producer, Maestro Experience, Civic Vitality, Civic Project, HAI Command Chat expanded/collapsed, Notification Center, Permissions, Role Management, Mobile Executive View.
Every screen includes loading, empty, errors, reduced motion, offline/stale data and localization states.

## Research/testing
Test five roles: local operator, small business owner, planner, producer and community visitor. Each needs 3 task-based scenarios, screen recording with consent, SUS or simple usability rubric, task-completion measurements and accessibility audit. Iterate design tokens and navigation from evidence, not aesthetic preference alone.
