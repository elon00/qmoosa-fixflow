# About Qmoosa FixFlow

> **Real problems. Real assignments. Real-time resolution.**

---

## 1. Executive Summary

**Qmoosa FixFlow** is a modern facility maintenance coordination and issue-resolution platform engineered for physical spaces: apartment communities, commercial offices, universities, coworking spaces, hospitals, and light manufacturing plants.

It transforms chaotic, unstructured maintenance requests sent via group messages and spreadsheets into an accountable, transparent, real-time lifecycle:

$$\mathbf{Report} \longrightarrow \mathbf{Assign} \longrightarrow \mathbf{Fix} \longrightarrow \mathbf{Verify}$$

By unifying **Flutter** on the frontend with **Serverpod 4** on the backend, Qmoosa FixFlow guarantees end-to-end type safety, atomic state transitions, persistent audit trails, and instantaneous WebSockets synchronization across all participants.

---

## 2. The Operational Problem

In physical operations, maintenance coordination breaks down across three distinct friction points:

1. **Information Loss at Intake:**
   When an occupant discovers a leaking radiator or faulty fire door, they message a generic building chat or call reception. Key details—exact room numbers, photos of the model plate, and severity—are missing or buried.

2. **Assignment Ambiguity & Dispatch Chaos:**
   Maintenance managers copy details into spreadsheets or assign tasks verbally. Technicians don't know who has claimed what. Either two technicians show up to fix the same fixture, or both assume the other is handling it, leaving the issue unresolved for weeks.

3. **The "Black Hole" of Resolution:**
   Reporters are left wondering whether anyone is working on their ticket. Technicians mark items "done" on paper without photo evidence. Disputes arise over whether the repair was actually completed properly.

---

## 3. How Qmoosa FixFlow Solves It

| Feature Dimension | WhatsApp & Calls | Jira / Zendesk | **Qmoosa FixFlow** |
| :--- | :--- | :--- | :--- |
| **Intake Speed** | High (but unstructured) | Slow (complex ITIL fields) | **Fast (Photo + Location + 1-Tap Submit)** |
| **Real-Time Visibility** | None | Polling / Email alerts | **Sub-second WebSocket Streaming** |
| **Dispatch & Claiming** | Chaotic verbal calls | Manual manager triage | **Self-serve atomic claiming + Manager view** |
| **Verification Gate** | None (assumed done) | Manager closed | **Reporter before/after photo verification** |
| **Field Offline Support** | Partial (messages pending) | Web-dependent | **Built-in SQLite cache with auto-sync** |
| **Architectural Stack** | Proprietary | Heavy REST/SaaS | **Type-safe Dart (Flutter + Serverpod 4)** |

---

## 4. User Personas

### Persona A: Sarah (The Reporter / Tenant)
- **Profile:** 3rd-floor resident at Sunset Heights Apartments.
- **Pain Point:** Water leaking beneath the kitchen sink. Previously called the superintendent three times with no response.
- **FixFlow Experience:** Snaps a photo, selects *"Plumbing"* and *"Kitchen"*, sets priority to *"High"*, and taps submit. Receives a live notification 4 minutes later: *"Technician Alex claimed this issue."* Once repaired, Sarah inspects the after-photo and confirms completion with one tap.

### Persona B: Alex (The Facility Technician)
- **Profile:** Lead technician servicing 120 residential units.
- **Pain Point:** Overloaded with disorganized phone calls while on a ladder. Unclear priorities.
- **FixFlow Experience:** Opens the Technician Queue, sees the new plumbing issue at the top, and taps *"Claim Job"*. His claim is atomically locked by Serverpod so no other tech can duplicate work. After replacing the gasket, he snaps a photo of the dry pipe, notes *"Replaced seal and tested pressure"*, and taps *"Mark Complete"*.

### Persona C: Elena (The Operations Director)
- **Profile:** Regional facilities manager overseeing 4 commercial hubs.
- **Pain Point:** Inability to measure MTTR (Mean Time to Resolution) or technician workloads across buildings.
- **FixFlow Experience:** FixFlow's live dashboard displays aggregated analytics: open issues, active assignments, average resolution time, and verification satisfaction rates.

---

## 5. Why Serverpod 4 is the Ideal Foundation

Traditional tech stacks split frontend and backend across different languages (e.g., TypeScript/Go backend + Flutter frontend), requiring continuous maintenance of REST API schemas, JSON serializers, and WebSocket protocols.

Serverpod 4 unlocks full-stack Dart:
1. **Unified Language & Types:** Models defined once in YAML are compiled into typed Dart classes for both the server and Flutter client.
2. **First-Class Streaming:** WebSockets streaming is a native primitive, eliminating external messaging brokers for core real-time feeds.
3. **Embedded PostgreSQL:** Streamlined developer experience with instant local database spin-up.
4. **Resilient Scheduling:** Future calls handle background escalation reminders natively in the database.
5. **Offline SQLite Engine:** Serverpod 4's client database architecture allows field personnel to work in disconnected environments without data loss.

---

## 6. Project Team & Hackathon Mission

Built with passion for the **Build Something Real** hackathon celebrating the release of **Serverpod 4.0**, **Serverpod Cloud**, and **App Studio**.

- **Lead Developer:** Martin Luther ([@elon00](https://github.com/elon00))
- **Source Repository:** [github.com/elon00/qmoosa-fixflow](https://github.com/elon00/qmoosa-fixflow)
- **Target Deployment:** Serverpod Cloud & Flutter Web
- **License:** Open Source (MIT)
