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

/// User profile for reporters, technicians, and facility managers
abstract class UserProfile
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  UserProfile._({
    this.id,
    this.authUserId,
    required this.displayName,
    required this.email,
    required this.role,
    required this.workspaceId,
    this.avatarUrl,
    required this.createdAt,
  });

  factory UserProfile({
    int? id,
    int? authUserId,
    required String displayName,
    required String email,
    required String role,
    required int workspaceId,
    String? avatarUrl,
    required DateTime createdAt,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfile(
      id: jsonSerialization['id'] as int?,
      authUserId: jsonSerialization['authUserId'] as int?,
      displayName: jsonSerialization['displayName'] as String,
      email: jsonSerialization['email'] as String,
      role: jsonSerialization['role'] as String,
      workspaceId: jsonSerialization['workspaceId'] as int,
      avatarUrl: jsonSerialization['avatarUrl'] as String?,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Serverpod Auth User ID
  int? authUserId;

  /// Human-readable display name
  String displayName;

  /// User email address
  String email;

  /// Role: 'reporter', 'technician', or 'manager'
  String role;

  /// Associated workspace
  int workspaceId;

  /// Avatar image URL or initial placeholder
  String? avatarUrl;

  /// Account creation timestamp
  DateTime createdAt;

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  UserProfile copyWith({
    int? id,
    int? authUserId,
    String? displayName,
    String? email,
    String? role,
    int? workspaceId,
    String? avatarUrl,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      if (authUserId != null) 'authUserId': authUserId,
      'displayName': displayName,
      'email': email,
      'role': role,
      'workspaceId': workspaceId,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      if (authUserId != null) 'authUserId': authUserId,
      'displayName': displayName,
      'email': email,
      'role': role,
      'workspaceId': workspaceId,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    int? id,
    int? authUserId,
    required String displayName,
    required String email,
    required String role,
    required int workspaceId,
    String? avatarUrl,
    required DateTime createdAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         displayName: displayName,
         email: email,
         role: role,
         workspaceId: workspaceId,
         avatarUrl: avatarUrl,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  UserProfile copyWith({
    Object? id = _Undefined,
    Object? authUserId = _Undefined,
    String? displayName,
    String? email,
    String? role,
    int? workspaceId,
    Object? avatarUrl = _Undefined,
    DateTime? createdAt,
  }) {
    return UserProfile(
      id: id is int? ? id : this.id,
      authUserId: authUserId is int? ? authUserId : this.authUserId,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      role: role ?? this.role,
      workspaceId: workspaceId ?? this.workspaceId,
      avatarUrl: avatarUrl is String? ? avatarUrl : this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
