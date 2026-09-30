import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Real-time streaming endpoint utilizing Serverpod WebSocket connections.
class ActivityStreamEndpoint extends Endpoint {
  /// Stream live issue events and state changes for a given workspace.
  Stream<Issue> watchWorkspace(Session session, int workspaceId) async* {
    final stream = session.messages.createStream<Issue>(
      'workspace_${workspaceId}_issues',
    );

    await for (final issue in stream) {
      yield issue;
    }
  }
}
