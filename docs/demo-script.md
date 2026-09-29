# Qmoosa FixFlow Demo & Video Walkthrough Script

## Target Duration: 2 Minutes (120 Seconds)

### Timeline Breakdown

| Time | Visual Scene | Audio / Voiceover | Serverpod Feature Highlighted |
| :--- | :--- | :--- | :--- |
| **0:00 - 0:15** | Title Card: **Qmoosa FixFlow**<br>Side-by-side browser windows (Reporter on Left, Technician on Right). | "Facility maintenance requests routinely vanish into group chats, phone calls, and spreadsheets. Qmoosa FixFlow transforms them into accountable real-time workflows built entirely with Flutter and Serverpod 4." | Full-stack Dart architecture |
| **0:15 - 0:35** | **Window A (Reporter):**<br>Taps `+ Report Issue`, enters "Water leak under sink - 2nd Floor Kitchen", attaches photo, taps Submit. | "A building tenant reports an emergency leak with a photo and priority level. The Flutter app calls Serverpod's type-safe endpoint to store the issue and trigger server-side validation." | Type-safe Endpoint & PostgreSQL ORM |
| **0:35 - 0:50** | **Window B (Technician):**<br>Issue appears instantly in open queue.<br>Technician clicks **Claim Job**. | "Over on the technician console, the open job lands via Serverpod streaming. Technician Alex clicks Claim. Serverpod atomically assigns the task and guarantees concurrency control." | Atomic database updates & Concurrency control |
| **0:50 - 1:10** | **Window A & B Live Sync:**<br>Reporter's view updates immediately without page reload: *"Assigned to Alex"*. Technician clicks **Start Work**. | "Watch the reporter's screen update instantly in real time via Serverpod's persistent WebSocket stream—no manual refresh or polling required." | Serverpod Real-time Streaming |
| **1:10 - 1:30** | **Resolution:**<br>Technician attaches repair photo, enters resolution note, and taps **Mark Complete**. | "With the pipe fixed, the technician uploads completion proof and marks the issue complete. The status transitions to Awaiting Verification." | File Upload & Server State Machine |
| **1:30 - 1:45** | **Verification:**<br>Reporter inspects before/after photos side-by-side and taps **Confirm Fixed**. Status changes to **RESOLVED**. | "The reporter inspects the after-photo and confirms the fix. The entire lifecycle is sealed with an immutable audit timeline." | Immutable Audit Timeline |
| **1:45 - 2:00** | **Dashboard & Cloud Deployment:**<br>Show real-time facility metrics (Open: 0, In Progress: 0, Resolved: 1). Closing screen with repo link. | "From reporting to assignment, repair, and verification, Qmoosa FixFlow delivers real-time operations powered by Serverpod 4 and Serverpod Cloud." | Serverpod Cloud & Metrics |
