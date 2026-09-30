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

/// Physical facility location (room, floor, wing)
abstract class FacilityLocation
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  FacilityLocation._({
    this.id,
    required this.workspaceId,
    required this.name,
    required this.building,
    required this.floor,
    required this.room,
  });

  factory FacilityLocation({
    int? id,
    required int workspaceId,
    required String name,
    required String building,
    required String floor,
    required String room,
  }) = _FacilityLocationImpl;

  factory FacilityLocation.fromJson(Map<String, dynamic> jsonSerialization) {
    return FacilityLocation(
      id: jsonSerialization['id'] as int?,
      workspaceId: jsonSerialization['workspaceId'] as int,
      name: jsonSerialization['name'] as String,
      building: jsonSerialization['building'] as String,
      floor: jsonSerialization['floor'] as String,
      room: jsonSerialization['room'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Target workspace
  int workspaceId;

  /// Common location name (e.g. "Server Room B2", "Unit 401")
  String name;

  /// Building designation
  String building;

  /// Floor number or code
  String floor;

  /// Room number or identifier
  String room;

  /// Returns a shallow copy of this [FacilityLocation]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  FacilityLocation copyWith({
    int? id,
    int? workspaceId,
    String? name,
    String? building,
    String? floor,
    String? room,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FacilityLocation',
      if (id != null) 'id': id,
      'workspaceId': workspaceId,
      'name': name,
      'building': building,
      'floor': floor,
      'room': room,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FacilityLocation',
      if (id != null) 'id': id,
      'workspaceId': workspaceId,
      'name': name,
      'building': building,
      'floor': floor,
      'room': room,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FacilityLocationImpl extends FacilityLocation {
  _FacilityLocationImpl({
    int? id,
    required int workspaceId,
    required String name,
    required String building,
    required String floor,
    required String room,
  }) : super._(
         id: id,
         workspaceId: workspaceId,
         name: name,
         building: building,
         floor: floor,
         room: room,
       );

  /// Returns a shallow copy of this [FacilityLocation]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  FacilityLocation copyWith({
    Object? id = _Undefined,
    int? workspaceId,
    String? name,
    String? building,
    String? floor,
    String? room,
  }) {
    return FacilityLocation(
      id: id is int? ? id : this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      name: name ?? this.name,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      room: room ?? this.room,
    );
  }
}
