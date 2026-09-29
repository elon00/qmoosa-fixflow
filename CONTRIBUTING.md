# Contributing to Qmoosa FixFlow

We welcome contributions to Qmoosa FixFlow for the **Build Something Real** hackathon and beyond!

## Development Guidelines

1. **Serverpod 4 Conventions**:
   - Define data models in `qmoosa_fixflow_server/lib/src/models/*.spy.yaml`.
   - Run `serverpod generate` after any model or endpoint changes.
   - Enforce business logic, state machines, and permission validation on the server endpoints, never trusting raw client input.

2. **Code Quality**:
   - Run `dart format .` before committing.
   - Ensure all analyzer checks pass: `dart analyze` and `flutter analyze`.
   - Never commit sensitive secrets or `config/passwords.yaml`.

3. **Submitting Changes**:
   - Open a feature branch or PR against `main`.
   - Ensure CI pipeline workflows pass successfully.
