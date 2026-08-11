# Product & UX Specification

## Product Shell

Desktop command-center layout:

```text
+--------------------------------------------------------------+
| Global Command Bar                                           |
+----------+------------------------------------+---------------+
|          |                                    |               |
| Left Nav | Main Workspace                     | Context       |
|          |                                    | Panel         |
|          |                                    |               |
|          |                                    | HAI Command   |
|          |                                    | Chat          |
+----------+------------------------------------+---------------+
| System Status Bar                                            |
+--------------------------------------------------------------+
```

## Navigation

1. Overview
2. Live Blocks
3. Digital Twin
4. Block Watch Nodes
5. Trigger Grid
6. Micro-Ad Lab
7. REVELV
8. Community Dashboard
9. Business Partners
10. Creator Studio
11. NPC Dispatch
12. Twitch Control
13. Maestro Control
14. NVIDIA Vision
15. Analytics
16. Infrastructure
17. Settings

## HAI Command Chat

Collapsible, resizable, pinnable AI command panel.

Capabilities:

- Natural-language analytics
- Map queries
- Campaign generation
- Sponsor performance summaries
- Infrastructure recommendations
- Report generation
- Camera/node search
- Digital twin navigation
- Creative ideation

Example commands:

- Show the busiest measured intersection today.
- Compare pedestrian activity this Friday with last Friday.
- Create an AR concept for this participating cafe.
- Which sponsor placements underperformed?
- Show all nodes with degraded health.
- Summarize this district's Community Vitality changes.

## Visual System

### Background

Deep navy → royal blue → sapphire → near-black navy.

### Accent

Metallic electric green.

### Signature Motion

A restrained **specular light sweep / traveling highlight** across active metallic-green borders and HAI verification elements. It should resemble light crossing polished automotive or aerospace trim, not a neon pulse.

Recommended behavior:

- Slow
- Subtle
- 8–15 second randomized recurrence
- Primarily active/verified states
- Reduced-motion accessibility fallback

### Materials

- Smoked glass
- Titanium
- Graphite
- Brushed metal
- Carbon-fiber-inspired texture

## Key Screens

### Overview

At-a-glance:

- Active nodes
- Current traffic
- Pedestrian count
- Stream status
- Active triggers
- Sponsor deliveries
- Community activity
- Alerts

### Live Blocks

Large live feed plus aggregate analytics, heatmap, trigger state, active sponsor zone, and NPC status.

### Digital Twin

3D district view with selectable layers:

- Mobility
- Pedestrians
- Safety
- Commerce
- Sponsors
- AR
- Nodes
- Community projects

### Trigger Grid

Rule builder plus real-time trigger event stream.

### Micro-Ad Lab

- Client selector
- Brand kit
- Asset library
- Prompt workspace
- Storyboard
- Timeline
- NPC library
- Motion preview
- Render queue
- Deployment targets
- Approval state

### REVELV

- Verified deliveries
- Campaign pacing
- Interaction funnel
- Redemptions
- Sponsor spend
- Community allocation
- Audit trail

### Community Dashboard

Community Vitality Metrics and visible local projects.

### NPC Dispatch

Each NPC card shows:

- Name
- City
- Voice state
- Current assignment
- Sponsor queue
- Dialogue queue
- Broadcast destination
- Performance

### Twitch Control

- Stream status
- Scenes
- Chat
- Polls
- Predictions
- Sponsor queue
- NPC queue
- Clip markers

### Maestro Control

- Interactive overlays
- Offers
- Rewards
- Leaderboards
- Viewer actions
- Premium experiences
- Sponsor reporting

## Responsive Strategy

### Ultra-wide
Full command center.

### Laptop
Collapsible context panel.

### Tablet
Operations console; map/video first.

### Mobile
Executive companion: alerts, approvals, sponsor performance, node status, stream controls. Do not force full digital-twin authoring onto mobile.

## Accessibility

- WCAG-conscious contrast
- Reduced motion
- Keyboard navigation
- Non-color status indicators
- Screen-reader labels
- Spanish/English localization from the beginning
