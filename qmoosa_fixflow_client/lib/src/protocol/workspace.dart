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

/// Workspace representing a facility, building complex, or operational group
abstract class Workspace
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Workspace._({
    this.id,
    required this.name,
    this.description,
    required this.createdAt,
  });

  factory Workspace({
    int? id,
    required String name,
    String? description,
    required DateTime createdAt,
  }) = _WorkspaceImpl;

  factory Workspace.fromJson(Map<String, dynamic> jsonSerialization) {
    return Workspace(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Name of the facility or workspace
  String name;

  /// Optional description
  String? description;

  /// Timestamp when the workspace was registered
  DateTime createdAt;

  /// Returns a shallow copy of this [Workspace]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Workspace copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Workspace',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Workspace',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WorkspaceImpl extends Workspace {
  _WorkspaceImpl({
    int? id,
    required String name,
    String? description,
    required DateTime createdAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Workspace]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Workspace copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    DateTime? createdAt,
  }) {
    return Workspace(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
