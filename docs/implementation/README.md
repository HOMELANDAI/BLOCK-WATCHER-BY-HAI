# BLOCK WATCH by HAI — Execution Handbook (v1)

A structured supplement to the original [Project Bible](../PROJECT_BIBLE.md) and [Roadmap](../ROADMAP.md). This handbook incorporates the later **bustling small-town analytics** thesis and converts the full BLOCK WATCH ecosystem into an approval-gated implementation program.

## Read in order
1. [Executive Charter](00_EXECUTIVE_CHARTER.md) — mission, market types, non-goals and feasibility.
2. [Phased Master Implementation](01_PHASED_MASTER_IMPLEMENTATION.md) — P0–P11, work packages, deliverables, gates.
3. [Measurement and Data Dictionary](02_MEASUREMENT_AND_DATA_DICTIONARY.md) — defensible counts and economic/civic reporting.
4. [Technical Blueprint](03_TECHNICAL_BLUEPRINT.md) — architecture, Supabase, NVIDIA adapters and production system.
5. [Product and UX](04_PRODUCT_WORKFLOWS_AND_UX.md) — role-based journeys, visual identity, NPC/media/AR.
6. [Commercial and Civic Model](05_COMMERCIAL_AND_CIVIC_MODEL.md) — buyer value, sponsor pricing hypotheses and reinvestment.
7. [Integrations and Deployment](06_INTEGRATIONS_AND_DEPLOYMENT.md) — field, platform and vendor deployment.
8. [Governance/Risk/Privacy](07_GOVERNANCE_RISK_AND_PRIVACY.md) — safeguards and legal decisions.
9. [Pedro Clisante Pilot Playbook](08_PILOT_PLAYBOOK.md) — real-world pilot work order.
10. [QA and Acceptance](09_QA_ACCEPTANCE_AND_TEST_MATRIX.md) — testable release standards.
11. [GitHub Backlog](10_GITHUB_EXECUTION_BACKLOG.md) — epics, sprints, project board and decisions.

## Essential planning rules
- **Three market categories:** quiet, growing, bustling; prioritize compact high-activity corridors.
- **One backend, three products:** Media, Intelligence and Civic; supported by REVELV and HAI Micro-Ad Lab.
- **Analytics before showbiz:** high-quality measurement creates value independent of viewership.
- **One reliable node before ten impressive renderings.**
- **No person-level surveillance by default:** aggregate counts, limited footage, human safety review.
- **No unsupported economic claims:** footfall isn't unique visitors, an impression isn't a customer, and observed growth is not causal proof.
- **Approval gates control release:** site rights, counting quality, secure tenancy, sponsor verification, civic evaluation.
- **Project status today:** planning/architecture; the repository does not imply actual street cameras, NVIDIA hardware, a connected Supabase instance, an active REVELV payment engine, or platform APIs are already live.

## Primary sources consulted for implementation feasibility
- [Supabase changelog](https://supabase.com/changelog.md) — includes Nov 2026 CLI v3 host-default change.
- [Supabase RLS documentation](https://supabase.com/docs/guides/database/postgres/row-level-security).
- [NVIDIA DeepStream documentation](https://docs.nvidia.com/deepstream/) — default documentation SDK 9.2 as of check.
- External vendors' APIs/permissions must still be tested in target account and legal jurisdiction before enabling.

## Implementation decision point
Start with **P0 interviews, site selection and P1 rights/privacy** while **P2/P3** progress using fictional or consented data. The first product milestone is not a polished 3D city; it is a credible weekly street-analytics report that a merchant or civic partner can actually use.
