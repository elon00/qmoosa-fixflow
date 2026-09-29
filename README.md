# Qmoosa FixFlow
> **Real problems. Real assignments. Real-time resolution.**

Built with **Flutter** + **Serverpod 4** + **PostgreSQL** + **Serverpod Cloud** for the **Build Something Real Hackathon**.

[![CI Pipeline](https://github.com/elon00/qmoosa-fixflow/actions/workflows/ci.yml/badge.svg)](https://github.com/elon00/qmoosa-fixflow/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Serverpod: 4.0](https://img.shields.io/badge/Serverpod-4.0-blueviolet.svg)](https://serverpod.dev)
[![GitHub Repository](https://img.shields.io/badge/GitHub-elon00%2Fqmoosa--fixflow-181717.svg?logo=github)](https://github.com/elon00/qmoosa-fixflow)

---

## 🌟 Quick Links & Testing Ports

| Target | URL / Port | Purpose |
| :--- | :--- | :--- |
| **GitHub Repository** | [https://github.com/elon00/qmoosa-fixflow](https://github.com/elon00/qmoosa-fixflow) | Official Hackathon Source Code & Specs |
| **Flutter Web Client** | `http://localhost:8081` | Interactive Frontend (Desktop, Tablet & Mobile layout) |
| **Serverpod 4 API** | `http://localhost:8080` | Backend API, Type-safe Endpoints & WebSocket Server |
| **Serverpod Web Insights** | `http://localhost:8082` | Webhook & Insights Dashboard |
| **Interactive Test Sandbox**| `http://localhost:8081/#/sandbox` | One-click simulation suite & scenario testing |

---

## 1. About Qmoosa FixFlow

### 1.1 The Origin & Vision
Every physical environment—from residential apartment complexes and academic campuses to tech hubs, hospital wings, and industrial centers—suffers from the same fundamental breakdown: **maintenance communication fragmentation**. 

When a ceiling pipe bursts or an access badge scanner fails:
- Reports are sent via informal WhatsApp messages, voice calls, or paper sticky notes.
- Maintenance managers copy details into ad-hoc spreadsheets.
- Technicians lack visibility into who has claimed which job, leading to duplicate visits or neglected tickets.
- The person who reported the failure is kept in the dark, constantly messaging: *"Has anyone looked at this yet?"*

**Qmoosa FixFlow** was created to eliminate this operational friction through a single, elegant lifecycle:
$$\mathbf{Report} \longrightarrow \mathbf{Assign} \longrightarrow \mathbf{Fix} \longrightarrow \mathbf{Verify}$$

Every action is backed by an immutable audit trail, atomic concurrency protection, and instant real-time synchronization.

---

### 1.2 Target Operational Domains
- **Multifamily Housing & Residential:** Tenants report HVAC, plumbing, or lighting failures with immediate photo context.
- **Corporate Offices & Coworking Hubs:** Facility teams triage workstation, meeting room AV, and electrical maintenance.
- **University Campuses:** Students and staff report classroom, dormitory, and laboratory infrastructure bugs.
- **Hotels & Hospitality:** Housekeeping and front desk dispatch urgent room repairs before guest check-in.
- **Industrial Facilities:** Machine operators flag equipment alerts for shift mechanics.

---

### 1.3 Core Product Principles
1. **Zero Client Trust:** The client never dictates state. All permissions, transitions, and validations execute server-side in Serverpod.
2. **Real-Time by Default:** No manual refresh buttons. State changes broadcast instantaneously across all connected devices via WebSockets.
3. **Accountability via Proof:** Resolving a ticket requires resolution notes and verifiable completion photography.
4. **Resilient Field Operations:** Built with Serverpod 4's offline SQLite foundation to support technicians working in signal-dead basements.

---

## 2. Serverpod 4 Architecture & Capabilities

Qmoosa FixFlow is built natively around Serverpod 4's modern full-stack Dart architecture:

```
┌────────────────────────────────────────────────────────┐
│                        Flutter                         │
│  Reporter UI  │  Technician UI  │  Dashboard Analytics  │
│  Live Timeline│  Photo Evidence │  Local Offline Cache  │
└───────────────────────────┬────────────────────────────┘
                            │ Generated Serverpod Client (gRPC/WebSockets)
                            ▼
┌────────────────────────────────────────────────────────┐
│                      Serverpod 4                       │
│  • Auth Module (Email/Pass & Sessions)                 │
│  • IssueEndpoint (Type-Safe CRUD & State Transitions)   │
│  • AssignmentEndpoint (Atomic Claiming & Concurrency)  │
│  • ActivityStreamEndpoint (Real-Time WebSocket Streams) │
│  • AttachmentEndpoint (Direct File Upload & Evidence)  │
│  • ReminderScheduler (Serverpod Future Calls)          │
│  • Embedded Postgres & Client-Side SQLite Database     │
└─────────────┬──────────────────────────┬───────────────┘
              │                          │
              ▼                          ▼
    PostgreSQL Database            Asset Storage
```

### Judge-Visible Serverpod Showcase

| Serverpod 4 Feature | Role in Qmoosa FixFlow | Demo Visibility |
| :--- | :--- | :--- |
| **Type-Safe Endpoints** | Flutter calls auto-generated client methods (`issue.claimIssue()`, `issue.createIssue()`) | High |
| **PostgreSQL ORM** | Models persisted across relational tables (`UserProfile`, `Workspace`, `Issue`, `IssueEvent`) | High |
| **Real-Time Streaming** | Streaming endpoints broadcast live status transitions across all connected clients via WebSockets | **Very High (Core Demo)** |
| **Authentication Module** | Native Serverpod auth handling sessions and user profiles | High |
| **File Storage** | Direct upload pipelines for before/after photo evidence | High |
| **Future Calls** | Scheduled background tasks for overdue issue reminders and verification alerts | Medium |
| **Embedded PostgreSQL** | Zero-friction local development without mandatory external Docker daemon | Architectural |
| **Client Database & Offline Sync** | SQLite local caching for field technicians in low-connectivity zones | Differentiation |

---

## 3. Issue State Machine

All status transitions are strictly enforced by the server backend to guarantee operational integrity:

```
    ┌──────────┐
    │   OPEN   │
    └────┬─────┘
         │ Technician Claim (Atomic check-and-set)
         ▼
    ┌──────────┐
    │ ASSIGNED │
    └────┬─────┘
         │ Start Work
         ▼
 ┌───────────────┐
 │  IN PROGRESS  │◄─────────────┐
 └───────┬───────┘              │
         │ Complete + Evidence  │ Reopened
         ▼                      │
┌────────────────────────┐      │
│ AWAITING VERIFICATION  ├──────┘
└────────┬───────────────┘
         │ Reporter Verification
         ▼
    ┌──────────┐
    │ RESOLVED │
    └──────────┘
```

---

## 4. Full Feature Testing & Sandbox Guide

### 4.1 Testing in the Interactive Sandbox
For judges and testers evaluating Qmoosa FixFlow, the application includes a dedicated **Interactive Sandbox Suite**:

1. Open your browser to `http://localhost:8081/#/sandbox`.
2. The sandbox lets you run one-click simulations with live state verification:

- **Scenario 1: The Golden Loop (E2E Workflow)**
  - Taps *Simulate Full Lifecycle*.
  - An issue is reported (*"Water leak in B2 Server Room"*).
  - Assigned atomically to *Technician Alex*.
  - Status updates to `IN_PROGRESS`.
  - Fix evidence photo is uploaded and status updates to `AWAITING_VERIFICATION`.
  - Reporter verifies the fix, sealing the ticket as `RESOLVED`.
  
- **Scenario 2: Race Condition Stress Test (Atomic Concurrency)**
  - Fires simultaneous claim requests from Technician A and Technician B for the exact same ticket.
  - Verifies that Serverpod's atomic transaction grants the job to exactly one technician and gracefully throws `IssueAlreadyClaimedException` for the second.

- **Scenario 3: Serverpod Future Calls (Scheduled Background Reminders)**
  - Schedules a 24-hour overdue reminder.
  - Demonstrates Serverpod's persistent future call queue surviving restarts.

- **Scenario 4: Field Technician Offline Mode**
  - Simulates offline mode by toggling network connectivity.
  - Edits a ticket locally into the client SQLite cache.
  - Restores network and triggers synchronization.

---

### 4.2 Two-Window Live Demo (The "Wow" Test)
To experience the real-time Serverpod streaming capabilities:
1. Open **Browser Window A** on `http://localhost:8081` and log in as **Reporter** (`reporter@fixflow.dev`).
2. Open **Browser Window B** in an incognito window and log in as **Technician** (`technician@fixflow.dev`).
3. In Window A: Submit a new issue with a photo.
4. Watch Window B: The issue pops up immediately in the queue via WebSocket streaming.
5. In Window B: Click **Claim Job**.
6. Watch Window A: Without refreshing or polling, the reporter's screen updates instantly to: *"Assigned to Alex"*.

---

## 5. Localhost Setup & Installation

### Prerequisites
- [Flutter](https://flutter.dev) (3.44+)
- [Dart SDK](https://dart.dev) (3.12+)
- [Serverpod CLI 4.0](https://docs.serverpod.dev)

### Step 1: Clone the Repository
```bash
git clone https://github.com/elon00/qmoosa-fixflow.git
cd qmoosa-fixflow
```

### Step 2: Start the Serverpod Backend
```bash
cd qmoosa_fixflow_server
serverpod start
```
*Serverpod will spin up the embedded PostgreSQL database and start listening on port 8080.*

### Step 3: Run the Flutter Client
```bash
# In a separate terminal
cd qmoosa_fixflow_flutter
flutter run -d chrome --web-port 8081
```

---

## 6. Repository Layout

```
qmoosa-fixflow/
├── qmoosa_fixflow_flutter/      # Flutter frontend (Mobile, Desktop, Web)
├── qmoosa_fixflow_client/       # Generated Serverpod client library
├── qmoosa_fixflow_server/       # Serverpod backend application
│   ├── lib/
│   │   ├── src/
│   │   │   ├── endpoints/       # Issue, Assignment, Stream, Dashboard endpoints
│   │   │   ├── models/          # .spy.yaml data definitions
│   │   │   └── future_calls/    # Scheduled reminder tasks
│   │   └── server.dart
│   └── test/                    # Server unit & integration tests
├── docs/                        # Architecture & Demo specifications
│   ├── architecture.md
│   ├── demo-script.md
│   └── about.md
├── .github/workflows/           # CI/CD automation
│   └── ci.yml
├── README.md
├── LICENSE
└── CONTRIBUTING.md
```

---

## 7. Submission Checklist & Rubric Mapping

- [x] **Does it work (30%):** Complete end-to-end golden workflow verified from Report through Resolution.
- [x] **Use of Serverpod stack (25%):** Endpoints, ORM, WebSockets streaming, Auth, File storage, Future Calls, and SQLite.
- [x] **Craft & technical creativity (25%):** Server-enforced state machine, atomic claim concurrency, and responsive UI.
- [x] **Usefulness (20%):** Solves real facility coordination breakdowns for buildings, offices, and campuses.

---

## 8. License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
