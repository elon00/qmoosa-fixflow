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

/// Core operational maintenance issue entity
abstract class Issue
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Issue._({
    this.id,
    required this.workspaceId,
    required this.reporterId,
    required this.reporterName,
    this.assignedUserId,
    this.assignedUserName,
    required this.title,
    required this.description,
    required this.category,
    required this.locationId,
    required this.locationName,
    required this.priority,
    required this.status,
    this.beforePhotoUrl,
    this.afterPhotoUrl,
    this.resolutionNote,
    required this.createdAt,
    required this.updatedAt,
    this.resolvedAt,
  });

  factory Issue({
    int? id,
    required int workspaceId,
    required int reporterId,
    required String reporterName,
    int? assignedUserId,
    String? assignedUserName,
    required String title,
    required String description,
    required String category,
    required int locationId,
    required String locationName,
    required String priority,
    required String status,
    String? beforePhotoUrl,
    String? afterPhotoUrl,
    String? resolutionNote,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? resolvedAt,
  }) = _IssueImpl;

  factory Issue.fromJson(Map<String, dynamic> jsonSerialization) {
    return Issue(
      id: jsonSerialization['id'] as int?,
      workspaceId: jsonSerialization['workspaceId'] as int,
      reporterId: jsonSerialization['reporterId'] as int,
      reporterName: jsonSerialization['reporterName'] as String,
      assignedUserId: jsonSerialization['assignedUserId'] as int?,
      assignedUserName: jsonSerialization['assignedUserName'] as String?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      locationId: jsonSerialization['locationId'] as int,
      locationName: jsonSerialization['locationName'] as String,
      priority: jsonSerialization['priority'] as String,
      status: jsonSerialization['status'] as String,
      beforePhotoUrl: jsonSerialization['beforePhotoUrl'] as String?,
      afterPhotoUrl: jsonSerialization['afterPhotoUrl'] as String?,
      resolutionNote: jsonSerialization['resolutionNote'] as String?,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['resolvedAt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Target workspace
  int workspaceId;

  /// User who submitted the report
  int reporterId;

  /// Reporter name cached for rapid feed rendering
  String reporterName;

  /// Assigned technician ID (null when OPEN)
  int? assignedUserId;

  /// Assigned technician display name
  String? assignedUserName;

  /// Concise issue headline
  String title;

  /// Detailed issue narrative
  String description;

  /// Category: Plumbing, Electrical, HVAC, Structural, Cleaning, Safety, IT
  String category;

  /// Associated facility location ID
  int locationId;

  /// Formatted location string (e.g., "Building A - Floor 2 - Room 204")
  String locationName;

  /// Priority level: Low, Medium, High, Critical
  String priority;

  /// State machine status: OPEN, ASSIGNED, IN_PROGRESS, AWAITING_VERIFICATION, RESOLVED, REOPENED
  String status;

  /// URL to the initial fault / damage photograph
  String? beforePhotoUrl;

  /// URL to the completion / repaired photograph
  String? afterPhotoUrl;

  /// Technician's closing explanation of work performed
  String? resolutionNote;

  /// Creation timestamp
  DateTime createdAt;

  /// Last state transition timestamp
  DateTime updatedAt;

  /// Timestamp when verified and closed
  DateTime? resolvedAt;

  /// Returns a shallow copy of this [Issue]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Issue copyWith({
    int? id,
    int? workspaceId,
    int? reporterId,
    String? reporterName,
    int? assignedUserId,
    String? assignedUserName,
    String? title,
    String? description,
    String? category,
    int? locationId,
    String? locationName,
    String? priority,
    String? status,
    String? beforePhotoUrl,
    String? afterPhotoUrl,
    String? resolutionNote,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? resolvedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Issue',
      if (id != null) 'id': id,
      'workspaceId': workspaceId,
      'reporterId': reporterId,
      'reporterName': reporterName,
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUserName != null) 'assignedUserName': assignedUserName,
      'title': title,
      'description': description,
      'category': category,
      'locationId': locationId,
      'locationName': locationName,
      'priority': priority,
      'status': status,
      if (beforePhotoUrl != null) 'beforePhotoUrl': beforePhotoUrl,
      if (afterPhotoUrl != null) 'afterPhotoUrl': afterPhotoUrl,
      if (resolutionNote != null) 'resolutionNote': resolutionNote,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Issue',
      if (id != null) 'id': id,
      'workspaceId': workspaceId,
      'reporterId': reporterId,
      'reporterName': reporterName,
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUserName != null) 'assignedUserName': assignedUserName,
      'title': title,
      'description': description,
      'category': category,
      'locationId': locationId,
      'locationName': locationName,
      'priority': priority,
      'status': status,
      if (beforePhotoUrl != null) 'beforePhotoUrl': beforePhotoUrl,
      if (afterPhotoUrl != null) 'afterPhotoUrl': afterPhotoUrl,
      if (resolutionNote != null) 'resolutionNote': resolutionNote,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IssueImpl extends Issue {
  _IssueImpl({
    int? id,
    required int workspaceId,
    required int reporterId,
    required String reporterName,
    int? assignedUserId,
    String? assignedUserName,
    required String title,
    required String description,
    required String category,
    required int locationId,
    required String locationName,
    required String priority,
    required String status,
    String? beforePhotoUrl,
    String? afterPhotoUrl,
    String? resolutionNote,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? resolvedAt,
  }) : super._(
         id: id,
         workspaceId: workspaceId,
         reporterId: reporterId,
         reporterName: reporterName,
         assignedUserId: assignedUserId,
         assignedUserName: assignedUserName,
         title: title,
         description: description,
         category: category,
         locationId: locationId,
         locationName: locationName,
         priority: priority,
         status: status,
         beforePhotoUrl: beforePhotoUrl,
         afterPhotoUrl: afterPhotoUrl,
         resolutionNote: resolutionNote,
         createdAt: createdAt,
         updatedAt: updatedAt,
         resolvedAt: resolvedAt,
       );

  /// Returns a shallow copy of this [Issue]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Issue copyWith({
    Object? id = _Undefined,
    int? workspaceId,
    int? reporterId,
    String? reporterName,
    Object? assignedUserId = _Undefined,
    Object? assignedUserName = _Undefined,
    String? title,
    String? description,
    String? category,
    int? locationId,
    String? locationName,
    String? priority,
    String? status,
    Object? beforePhotoUrl = _Undefined,
    Object? afterPhotoUrl = _Undefined,
    Object? resolutionNote = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? resolvedAt = _Undefined,
  }) {
    return Issue(
      id: id is int? ? id : this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      reporterId: reporterId ?? this.reporterId,
      reporterName: reporterName ?? this.reporterName,
      assignedUserId: assignedUserId is int?
          ? assignedUserId
          : this.assignedUserId,
      assignedUserName: assignedUserName is String?
          ? assignedUserName
          : this.assignedUserName,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      locationId: locationId ?? this.locationId,
      locationName: locationName ?? this.locationName,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      beforePhotoUrl: beforePhotoUrl is String?
          ? beforePhotoUrl
          : this.beforePhotoUrl,
      afterPhotoUrl: afterPhotoUrl is String?
          ? afterPhotoUrl
          : this.afterPhotoUrl,
      resolutionNote: resolutionNote is String?
          ? resolutionNote
          : this.resolutionNote,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
    );
  }
}
