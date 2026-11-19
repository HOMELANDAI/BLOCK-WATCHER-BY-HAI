# QA, Acceptance Tests, and Quality Evidence
## Quality is a deliverable
A phase is not “done” because a mockup exists or a tool invocation succeeds. It requires evidence. Each test record includes ID, component, fixture/source, requirement, method, expected result, actual result, approver, timestamp and release SHA.

## Functional test matrix
| ID | Area | Test | Expected result |
| --- | --- | --- | --- |
| QA-001 | Ingest | Post same valid event twice | exactly one counted |
| QA-002 | Ingest | Event clock skew/future timestamp | quarantined or corrected with logged rule |
| QA-003 | Ingest | Device disconnected for 15m | missing coverage, never fabricated zero |
| QA-004 | Analytics | Sum 1m buckets to 15m and hourly | reconciles with known synthetic data |
| QA-005 | Analytics | Overnight 23:00–02:00 local | timezone/reporting date correct |
| QA-006 | Analytics | Camera calibration changed mid-week | comparability warning / version filter |
| QA-007 | Vision | Scooter vs bicycle after dark | class-specific benchmark reported |
| QA-008 | Vision | Dense group crosses one line | track dedupe vs annotated truth |
| QA-009 | Vision | Stationary vehicle in region | no recurring false crossing |
| QA-010 | Safety | Unreviewed conflict candidate | not displayed as confirmed incident |
| QA-011 | Security | Sponsor A queries sponsor B campaigns | denied |
| QA-012 | Security | Public attempts private clip storage | denied |
| QA-013 | Security | Client supplies service role secret | never exposed, server rejects invalid |
| QA-014 | Trigger | Eligible threshold breached repeatedly | cooldown/frequency caps honored |
| QA-015 | Trigger | No valid observation interval | no activation |
| QA-016 | Trigger | Disable a sponsor campaign | associated new triggers stop |
| QA-017 | REVELV | Trigger eligible but creative not served | no served impression counted |
| QA-018 | REVELV | Retry webhook repeatedly | one showing/interaction record |
| QA-019 | REVELV | Post campaign click without redemption | click, not sale |
| QA-020 | Business | Generate site report | verified coverage+dates+methods |
| QA-021 | Tourism | Compare non-overlapping monitored zones | uses common observation timeframe |
| QA-022 | Media | NPC receives unverified “accident” | safe uncertainty wording or silence |
| QA-023 | Media | Broadcast loses camera rights/feed | safe branded data-only fallback |
| QA-024 | Viewer | Contest starts/locks/settles | transparent source, locks and tie rules |
| QA-025 | UI | HAI chat collapsed and reopened | keyboard usable, context preserved locally |
| QA-026 | UI | Reduced-motion enabled | shimmer stops, meaning unchanged |
| QA-027 | Civic | Proposed grant amount shown | never as actual funded amount |
| QA-028 | Privacy | Video expiry job executes | retention and audit records confirm |
| QA-029 | Reliability | Node offline during peak | dashboard freshness alert; reports adjust |
| QA-030 | Recovery | Restore test DB snapshot | RLS and ledger reconcile |

## Pre-registered numerical goals (adjust after calibration)
- Validated motion counting: target ≥90% per approved principal class on independent representative scenes; evaluate worst-case strata separately.
- Pilot scheduled observation uptime: target ≥95%.
- Event ingest dedupe: 100% on deterministically repeated test events.
- Sponsor showing reconciliation: ≥99% on accepted test data.
- RLS: 100% tenant-isolation negative tests pass.
- Human review: 100% published conflict/safety report samples signed by qualified review role.
- Interface: ≥80% first-time critical-task completion in structured test.
- Broadcast learning: run at least four comparable shows; capture viewers/returning engagement rather than claiming virality.
- Commercial: at least 3 independently paying/committed sponsors; record gross margin and support cost.
- Civic: one reproducible before/after or baseline study accepted by local stakeholder for further evaluation.

## Additional acceptance evidence
**Security:** policy matrix, signed review, secret scan, credential rotation/restore drill, audit logs.
**Privacy:** impact review, camera mask samples, deletion proof, complaint response test, rights inventory.
**Operations:** maintenance SOP, network/power contingency, alerts, trained operator walkthrough.
**Economics:** staffing hours, hardware capex, monthly connectivity, render cost, sponsor costs and renewal status.
**Accessibility:** mobile, keyboard, screenreader, contrast and reduced motion tests.
**Localization:** Spanish/English, Dominican location labels and time-zone behavior.

## Definition of Ready for tasks
Owner, decision value, source of truth, dependency, privacy classification, acceptance criteria, test fixture and estimate all specified.

## Definition of Done for tasks
Code/document committed; peer-reviewed; tests/evidence linked; access and risk review; user-facing claim and data provenance checked; staging demonstration; release note/rollback captured. Do not use “done” for a planned service not deployed.

## Outcome experiments
- Business schedule experiment: voluntarily compare staffing/cost or conversion before/after advice with merchant records.
- Festival analysis: matched event and non-event intervals, weather/event calendar adjustments, observed vs estimated counts labelled.
- Safety intervention: specialist engineering input and comparable baselines; any crash reduction claims need independent crash records.
- Sponsor creative: compare animated vs static creative for consented audience with verified delivery and actual redemption, not merely clicks.
- Public trust: short survey and opt-in community meeting; track objections and changes made.
