# Governance, Ethics, Risk Register, Procurement Controls

## First principle
**Local trust is a dependency, not a marketing benefit.** A public street is not equivalent to consent to be tracked or monetized. The system is designed for counts and aggregate movement patterns, not individual profiling.

## Legal gates
DR: obtain qualified counsel review for local privacy/data-protection law, municipalities, property filming rights, sign permits, telecom connectivity, advertising, commercial recordings and heritage-zone restrictions; don't assume US rules apply.
US/NJ: distinct legal review before Hackensack installations; consider state/local ordinances, consumer/privacy regulations, camera permissions, event notices and payment contest rules.
Twitch/Maestro: account capabilities and platform terms separately reviewed.
REVELV: advertising disclosures, financial/tax compliance, sponsor payout representations, contractual terms and accounting review.
Children: no recognition, profiling or targeting; avoid publishing identifiable clips.
No definitive legal approvals are claimed.

## Data protection inventory
- Aggregate counts: keep medium/long term under documented retention.
- Ephemeral detection/tracks: edge-only and shortest feasible lifetime.
- Raw video: disabled by default or strictly limited encrypted rolling buffer for necessary testing or permitted review; separate event evidence with approved retention.
- Redacted approved show feed: access-controlled rights and delay/blur where needed.
- Sponsor event ledger: business events no personal video identifiers.
- Consent-based QR/redemption: separate purpose, notice, optional account, limited storage.
- Accessibility/community feedback: handle as submitted information not tracking.

## Safety analytics safeguard
A “near miss” should be a **review candidate** using event thresholds (e.g., closing distance, time-to-collision, post-encroachment time) suitable for geometry and validated with human review. A camera cannot reliably establish intent or legal fault. Use public engineering summary only with sample sizes and exposure rate.

## Avoid harmful incentive design
Do not gamify real injuries, harassment of passersby, unsafe behavior, DUI/speeding, or public “offender” rankings. Replace contests that encourage waiting for near collisions with reviewed infrastructure-learning challenges. Never make a person who appears on camera a subject of individualized livestream ridicule.

## Risk register
| ID | Risk | Likelihood | Impact | Owner | Mitigation | Gate |
| --- | --- | --- | --- | --- | --- | --- |
| R01 | Missing permit/site authorization | Medium | Critical | Product/Legal | Written permission, legal assessment, lease/pole rights | G1 |
| R02 | Privacy/public trust loss | Medium | Critical | Privacy Lead | Aggregate-first, notices, zones/masking, feedback, minimization | G1 |
| R03 | CV night-time miscount | High | High | Technical | Stratified reference labeling, class-specific reports, manual fallback | G4 |
| R04 | False safety accusations | Medium | Critical | Traffic Engineer | Candidate-only labels, human review, methodology, no public person ID | G9 |
| R05 | Sponsor overstated ROI | High | High | Commercial | Separate served/click/redeemed/sales; defined contracts | G8 |
| R06 | Weak live viewership | High | Medium | Media | Scheduled NPC shows, clip funnel, experiments; analytics independently useful | G7 |
| R07 | Too many initial features | High | High | Product | Corridor MVP and staged gate releases | G0/G3 |
| R08 | Vendor dependency | Medium | High | Technical | Adapter pattern, simulator, benchmark and fallback | G4 |
| R09 | Insecure tenant data | Medium | Critical | Technical/Security | RLS, access isolation tests, audit, hardening | G3 |
| R10 | AR facade backlash | Medium | High | Community/AR | Heritage design review, owner rights, opt-in phone AR | G10 |
| R11 | Connectivity outage | High | Medium | Field | Buffers, coverage flags, fallback scenes, UPS | G4 |
| R12 | Slow sponsor renewals | Medium | High | Sales | Start paid experiments; unit economics, retention, evidence | G8 |
| R13 | Unclear financial allocations | Medium | Critical | Finance | Audited rules, escrow/bank controls as applicable, publish receipts | G9 |
| R14 | Cross-jurisdiction expansion | High | High | Legal | Independent NJ/DR requirements per site | G11 |
| R15 | Misleading development/growth stats | High | High | Analytics | Provenance, external confirmation, matched controls and caveats | G6/G9 |

## Data governance review template
Each new data field must document:
- Purpose and expected stakeholder value.
- Whether data contains personal information/sensitive inference.
- Data source and legal authority.
- Storage location and cross-border transfer.
- Retention/deletion.
- Access roles.
- Derived/public release form.
- Quality/confidence.
- User/community notice.
- Measurable risk and mitigation.
- Owner approval.

## Ad ethics
No street-camera face recognition, individual tracking to target sponsors, clothing-color personalization, identification of local “regulars,” or sponsor ads triggered by dangerous conduct. Trigger ads using aggregated time/volume/weather or explicit consensual user actions instead.

## Community dividend safeguards
Never advertise “a percentage donated” without approved percentage, actual revenue base, accountable funds, legal characterization, beneficiary governance and auditing. Projects labeled PROPOSED vs FUNDED vs COMPLETED, never mixed.

## Security acceptance
- Authenticated operator access checked server side.
- All API-exposed Supabase tables RLS reviewed; storage policies enforce role/ownership.
- No service role/secret keys in frontend.
- Explicit deny tests per role and tenant.
- Audit access to restricted media; ability to suspend compromised camera credentials.
- Disaster recovery and deletion drills.
- Responsible vulnerability reporting and incident response.
