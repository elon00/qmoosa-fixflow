# Qmoosa FixFlow Architecture Specification

## 1. System Overview

Qmoosa FixFlow is an end-to-end facility issue-resolution platform constructed on top of the **Serverpod 4** framework and **Flutter**.

```
┌────────────────────────────────────────────────────────┐
│                   Flutter Client Layer                 │
│  - Reporter Portal (Issue Intake, Photo, Verification) │
│  - Technician Dispatch (Feed, Claiming, Work Proof)    │
│  - Real-time Subscriptions (Serverpod Streaming)       │
│  - Offline Cache & Local Sync (SQLite Engine)          │
└───────────────────────────┬────────────────────────────┘
                            │ Serverpod Client (gRPC/WebSockets)
                            ▼
┌────────────────────────────────────────────────────────┐
│                   Serverpod 4 Backend                  │
│  - Auth Module: Session tokens, password hashing       │
│  - Issue Endpoint: CRUD & Server-side state machine    │
│  - Assignment Endpoint: Atomic claim concurrency       │
│  - Stream Endpoint: Real-time broadcast channels       │
│  - Attachment Service: Photo upload & validation       │
│  - Future Calls: Scheduled reminder & audit engine     │
└─────────────┬──────────────────────────┬───────────────┘
              │                          │
              ▼                          ▼
      PostgreSQL Database          Asset Storage
```

---

## 2. Serverpod 4 Data Models

All server entities are defined in `.spy.yaml` schemas in `qmoosa_fixflow_server/lib/src/models`:

### 1. `UserProfile`
Represents an authenticated participant with role-based access.
```yaml
class: UserProfile
table: user_profile
fields:
  authUserId: int
  displayName: String
  role: String # reporter | technician | manager
  workspaceId: int, relation(parent=Workspace)
  createdAt: DateTime
```

### 2. `Workspace`
Multi-tenant isolation for buildings, offices, or facilities.
```yaml
class: Workspace
table: workspace
fields:
  name: String
  createdAt: DateTime
```

### 3. `FacilityLocation`
Physical context where an issue occurred.
```yaml
class: FacilityLocation
table: facility_location
fields:
  workspaceId: int, relation(parent=Workspace)
  name: String
  building: String
  floor: String
  room: String
```

### 4. `Issue`
Core operational unit.
```yaml
class: Issue
table: issue
fields:
  workspaceId: int, relation(parent=Workspace)
  reporterId: int, relation(parent=UserProfile)
  assignedUserId: int?, relation(parent=UserProfile)
  title: String
  description: String
  category: String # Plumbing, Electrical, HVAC, Cleaning, Security, IT
  locationId: int, relation(parent=FacilityLocation)
  priority: String # Low, Medium, High, Critical
  status: String # OPEN, ASSIGNED, IN_PROGRESS, AWAITING_VERIFICATION, RESOLVED, REOPENED
  createdAt: DateTime
  updatedAt: DateTime
  resolvedAt: DateTime?
```

### 5. `IssueEvent`
Audit trail and real-time activity timeline.
```yaml
class: IssueEvent
table: issue_event
fields:
  issueId: int, relation(parent=Issue)
  actorId: int, relation(parent=UserProfile)
  eventType: String # CREATED, CLAIMED, STARTED, COMPLETED, VERIFIED, REOPENED
  fromStatus: String?
  toStatus: String?
  message: String?
  createdAt: DateTime
```

### 6. `IssueAttachment`
Photographic evidence before and after repair.
```yaml
class: IssueAttachment
table: issue_attachment
fields:
  issueId: int, relation(parent=Issue)
  uploadedBy: int, relation(parent=UserProfile)
  fileUrl: String
  attachmentType: String # BEFORE_PHOTO, AFTER_PHOTO, INVOICE
  createdAt: DateTime
```

---

## 3. Server-Enforced State Machine

The client is never trusted to set the issue status arbitrarily. All transitions require server authorization:

```
  ┌────────────────────────────────────────────────────────┐
  │                        OPEN                            │
  └──────────────────────────┬─────────────────────────────┘
                             │ Technician claims job
                             ▼
  ┌────────────────────────────────────────────────────────┐
  │                      ASSIGNED                          │
  └──────────────────────────┬─────────────────────────────┘
                             │ Technician starts work
                             ▼
  ┌────────────────────────────────────────────────────────┐
  │                    IN PROGRESS                         │◄───────────┐
  └──────────────────────────┬─────────────────────────────┘            │
                             │ Technician completes work & evidence     │ Reporter
                             ▼                                          │ reopens
  ┌────────────────────────────────────────────────────────┐            │
  │               AWAITING VERIFICATION                    ├────────────┘
  └──────────────────────────┬─────────────────────────────┘
                             │ Reporter verifies resolution
                             ▼
  ┌────────────────────────────────────────────────────────┐
  │                      RESOLVED                          │
  └────────────────────────────────────────────────────────┘
```

### Concurrency Protection on Claiming
To prevent race conditions where two technicians claim the same issue at the same time:
1. The backend runs an atomic check-and-set query inside a database transaction:
   `UPDATE issue SET assigned_user_id = $techId, status = 'ASSIGNED' WHERE id = $issueId AND assigned_user_id IS NULL;`
2. If the update affects 0 rows, Serverpod returns a typed `IssueAlreadyClaimedException`.

---

## 4. Real-time Streaming Architecture

1. Clients connect to the `StreamingEndpoint` over WebSockets.
2. When any status transition or comment occurs:
   - Serverpod persists the `IssueEvent` in PostgreSQL.
   - Serverpod publishes the event to the topic `workspace_<id>_issues`.
   - All subscribed Flutter clients receive typed updates immediately without manual polling.

---

## 5. Scheduled Background Jobs (Serverpod Future Calls)

- **`IssueReminderCall`**: Scheduled 24 hours after assignment if no status change to `IN_PROGRESS` has occurred. Sends an escalation notice to the workspace manager.
- **`VerificationReminderCall`**: Scheduled 12 hours after an issue is marked `AWAITING_VERIFICATION` to remind the reporter to inspect and confirm the fix.
