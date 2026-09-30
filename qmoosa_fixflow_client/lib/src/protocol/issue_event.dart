/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _isc;

/// Immutable audit trail and timeline event for issue lifecycle
abstract class IssueEvent
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  IssueEvent._({
    this.id,
    required this.issueId,
    required this.actorId,
    required this.actorName,
    required this.eventType,
    this.fromStatus,
    this.toStatus,
    this.message,
    required this.createdAt,
  });

  factory IssueEvent({
    int? id,
    required int issueId,
    required int actorId,
    required String actorName,
    required String eventType,
    String? fromStatus,
    String? toStatus,
    String? message,
    required DateTime createdAt,
  }) = _IssueEventImpl;

  factory IssueEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return IssueEvent(
      id: jsonSerialization['id'] as int?,
      issueId: jsonSerialization['issueId'] as int,
      actorId: jsonSerialization['actorId'] as int,
      actorName: jsonSerialization['actorName'] as String,
      eventType: jsonSerialization['eventType'] as String,
      fromStatus: jsonSerialization['fromStatus'] as String?,
      toStatus: jsonSerialization['toStatus'] as String?,
      message: jsonSerialization['message'] as String?,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Target issue ID
  int issueId;

  /// User performing the action
  int actorId;

  /// Display name of the actor
  String actorName;

  /// Event type: CREATED, CLAIMED, STARTED, COMPLETED, VERIFIED, REOPENED, COMMENTED
  String eventType;

  /// Status prior to this event
  String? fromStatus;

  /// Status after this event
  String? toStatus;

  /// Narrative detail or comment text
  String? message;

  /// Timestamp of the event
  DateTime createdAt;

  /// Returns a shallow copy of this [IssueEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  IssueEvent copyWith({
    int? id,
    int? issueId,
    int? actorId,
    String? actorName,
    String? eventType,
    String? fromStatus,
    String? toStatus,
    String? message,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'IssueEvent',
      if (id != null) 'id': id,
      'issueId': issueId,
      'actorId': actorId,
      'actorName': actorName,
      'eventType': eventType,
      if (fromStatus != null) 'fromStatus': fromStatus,
      if (toStatus != null) 'toStatus': toStatus,
      if (message != null) 'message': message,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'IssueEvent',
      if (id != null) 'id': id,
      'issueId': issueId,
      'actorId': actorId,
      'actorName': actorName,
      'eventType': eventType,
      if (fromStatus != null) 'fromStatus': fromStatus,
      if (toStatus != null) 'toStatus': toStatus,
      if (message != null) 'message': message,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IssueEventImpl extends IssueEvent {
  _IssueEventImpl({
    int? id,
    required int issueId,
    required int actorId,
    required String actorName,
    required String eventType,
    String? fromStatus,
    String? toStatus,
    String? message,
    required DateTime createdAt,
  }) : super._(
         id: id,
         issueId: issueId,
         actorId: actorId,
         actorName: actorName,
         eventType: eventType,
         fromStatus: fromStatus,
         toStatus: toStatus,
         message: message,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [IssueEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  IssueEvent copyWith({
    Object? id = _Undefined,
    int? issueId,
    int? actorId,
    String? actorName,
    String? eventType,
    Object? fromStatus = _Undefined,
    Object? toStatus = _Undefined,
    Object? message = _Undefined,
    DateTime? createdAt,
  }) {
    return IssueEvent(
      id: id is int? ? id : this.id,
      issueId: issueId ?? this.issueId,
      actorId: actorId ?? this.actorId,
      actorName: actorName ?? this.actorName,
      eventType: eventType ?? this.eventType,
      fromStatus: fromStatus is String? ? fromStatus : this.fromStatus,
      toStatus: toStatus is String? ? toStatus : this.toStatus,
      message: message is String? ? message : this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
