# Measurement Framework, Data Dictionary and Analytical Products
## Guiding rule
**No denominator, no conclusion.** Distinguish observations, estimates, forecasts and externally verified business/civic outcomes. Document camera coverage, population/vehicle-class definition and confidence for every visualization.

## Unit hierarchy
- **Camera/node:** source of signals; not synonymous with an intersection.
- **Region of interest (ROI):** georeferenced observed zone with documented blind spots.
- **Crossing line:** direction-oriented virtual line; one entity crossing may generate a movement count.
- **Interval:** 1-minute raw aggregate for internal use, 15-minute/hour/day publication windows.
- **Location/time panel:** comparability unit such as a 50m frontage between 18:00–19:00 on Fridays.
- **Event:** start/end time, affected zone, weather, crowd dispersal, known schedule.
- **Intervention:** public-realm action, completion date, baseline period, matched follow-up.

## Reference metric catalog
| Metric | Definition | Typical source | Required caveat |
| --- | --- | --- | --- |
| Pedestrian crossings | Deduplicated tracks crossing configured boundary in interval | Vision | Not unique humans or purchases |
| Directional pedestrian flow | Crossings by direction/line | Vision | A person can cross more than once |
| Vehicle crossings | Classified vehicles crossing boundary | Vision | Camera occlusion and count duplication |
| Scooter/motorbike volume | Tracks classified into configured mobility classes | Vision + labeled ground truth | Frequent vehicle-class confusion at night |
| Bicycle flow | Bicycle crossings | Vision | Disambiguate from motorbikes |
| Peak interval | Highest valid count in a specified bucket/day | Aggregation | Specify bin size and coverage |
| Density proxy | Observed person detections / calibrated area or area-time | Vision | Not citywide population or crowd mood |
| Dwell proxy | Aggregate time tracks remain inside a zone | Ephemeral tracking | Not individual person history |
| Conflict candidate | Geometry/trajectory-based possible near interaction | Vision + review | Not crash and not proof of blame |
| Exposure-normalized conflict rate | Reviewed candidates / relevant movements * 10,000 | Analytics | Sample size and interval reliability |
| Event lift | Difference from matched comparison period | Aggregation + event calendar | Association only unless experiment supports attribution |
| Zone share | Observed movements at zone / sum of comparable observed zones | Aggregation | Avoid overlapping zone double-counts |
| Sensor coverage | Valid minutes / scheduled observational minutes | Node telemetry | Missing data is not zero |
| Ad showing | Creative actually started and met logged display criteria | REVELV | Not necessarily a human view |
| Verified ad interaction | Consent-based click, QR scan, chat or redemption | First-party engagement | Does not equal revenue |
| Sales uplift | Client-reported or POS-linked delta under signed data arrangement | External business data | Attribution needs control |
| Civic vitality index | Published formula of clearly named input signals | Aggregated metrics | Requires consistent composition & versioning |

## Do not conflate
1. **Crossing count ≠ unique visitors.** The same resident moving in both directions may be counted multiple times.
2. **Higher footfall ≠ revenue increase.** Conversion, spend, merchant data and confounders matter.
3. **Tourism “visitor” ≠ identifiable nationality.** Do not infer residency or nationality from images.
4. **Conflict candidate ≠ accident forecast.** Review and exposure normalisation required.
5. **Observed road behavior ≠ legal offense.** Do not auto-label passersby or score individuals.
6. **Verified display ≠ verified ad impression.** Distinguish render logs, concurrent viewers and attention.

## Ground-truth QA
- Manually label stratified clips by scene type: daytime, nighttime, weekend, rain, high pedestrian density, occluded sidewalk, festivals, stationary vehicles.
- At least two raters adjudicate a defined subset. Keep disagreement log.
- Evaluate by mobility class and camera separately.
- Compute MAE/MAPE or absolute count error for windows; per-class precision/recall for detection; tracking ID switch rate; ROI crossing duplication.
- Confidence intervals for event lift and trends with small samples; no fabricated significance.
- Flag windows as valid, degraded, missing, manually corrected, or excluded.
- Implement coverage-weighted trend reporting (or exclude invalid windows consistently).

## Town economic products
### B1 — Business Pulse
What are weekday/weekend peak windows? Which observed trends justify adjusting hours/staffing? Show comparable historical baselines, not only today's count.
**Output:** 1-page business action brief with confidence, owner action and follow-up outcome.

### B2 — Property and leasing fact sheet
Footfall for a precise frontage/zone, normalized to available observed time; comparative peers; seasonality; nearby events.
**Output:** verified method disclosure; site dashboard. Do not imply market valuation or lease pricing is objectively proven.

### B3 — Event economics and dispersal
At least 4 comparable non-event periods if practical; overlap/confounding analysis; traffic mix, directional shifts, sponsor scan/redemption, merchant self-reports.
**Output:** pre/during/post charts, adjusted interpretation, vendor-placement recommendations.

### B4 — Tourism pathway and “quiet street” hypothesis
Map known visitor attractions and aggregate route density; compare public wayfinding opportunities; include on-street surveys for motivation.
**Output:** wayfinding/accessibility experiment. No conclusions about tourist identity derived from cameras.

### B5 — Retail recruitment hypothesis
Combine independent business inventory, voluntary consumer survey, property vacancy, observed footfall and available third-party market data.
**Output:** qualitative/quantitative gap list, not camera-derived predictions of consumer demand.

### B6 — Grants and civic briefs
Publish reproducible baseline, problem evidence, engagement process, options, engineer review, counterfactual assumptions and proposed monitoring.
**Output:** grant annex and evidence tables; do not claim grants are assured.

### B7 — Safety and infrastructure
Separate count-based crossing exposure and reviewed candidate conflicts. A trained transport engineer interprets time-to-collision (TTC), post-encroachment time (PET), context and intervention alternatives.
**Output:** prioritized *assessment requests*, not automated regulatory decisions.

### B8 — Community longitudinal archive
Create versioned annual district snapshots: observed mobility, event calendar, business openings (independently sourced), public works, digital interactions, civic projects and data-method changes.
**Output:** “State of the Block” report. Avoid combining incompatible sensors/definitions without adjustment.

## Community Vitality subindices (proposed, not validated)
- **Movement vitality:** stable crossings and dwell proxy normalized for coverage.
- **Commerce proxy:** footfall plus verified campaign response and consented business outcome samples.
- **Tourism accessibility:** route distribution, signage scan rate, attraction discoverability survey.
- **Walkability/safety:** engineer-reviewed conditions and exposure-normalized conflict candidates.
- **Cultural activity:** public event counts, attendance estimate methodology and approved AR engagement.
- **Creator economy:** contracted local creative hours, training completions, payments verified by ledger.
- **Reinvestment:** audited amount disbursed and actual completed project receipts.

Never publish a single composite “city score” without explaining inputs, weights, uncertainty, revisions, and who approved it.

## Analytical methodology for “before/after”
1. State hypothesis (e.g., new lighting affects nighttime pedestrian routing).
2. Freeze baseline window *before intervention* and collect weather, holidays, events, construction, sensor change logs.
3. Choose matching comparison street or same-street comparison periods.
4. Define effect measure and uncertainty and minimum observation power.
5. Mark interruptions from node downtime.
6. Record implementation date and intervention fidelity.
7. Report adjusted and raw results; independently review claims.

## Data provenance fields
Every metric result should carry: metric_id, version, zone_id, start/end UTC, local_tz, aggregation_bucket, observed_minutes, scheduled_minutes, exclusion_reason, source_node_ids, algorithm_version, validation_run_id, value, uncertainty, publication_scope, generated_at.

## Example without inventing local results
**Illustrative hypothetical:** If Friday counts from a pilot show 2,900 crossing events 20:00–21:00 and 1,600 crossing events 18:00–19:00, the defensible conclusion is that this measured boundary saw more crossings in the later interval. It is not evidence that 1,300 more people visited or that customer revenue increased.
