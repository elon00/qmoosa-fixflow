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
import 'package:serverpod/serverpod.dart' as _is;

/// Aggregated analytics object for facility operations
abstract class DashboardMetrics
    implements _is.SerializableModel, _is.ProtocolSerialization {
  DashboardMetrics._({
    required this.totalIssues,
    required this.openIssues,
    required this.assignedIssues,
    required this.inProgressIssues,
    required this.awaitingVerificationIssues,
    required this.resolvedIssues,
    required this.averageResolutionMinutes,
    required this.highPriorityCount,
    required this.criticalPriorityCount,
  });

  factory DashboardMetrics({
    required int totalIssues,
    required int openIssues,
    required int assignedIssues,
    required int inProgressIssues,
    required int awaitingVerificationIssues,
    required int resolvedIssues,
    required double averageResolutionMinutes,
    required int highPriorityCount,
    required int criticalPriorityCount,
  }) = _DashboardMetricsImpl;

  factory DashboardMetrics.fromJson(Map<String, dynamic> jsonSerialization) {
    return DashboardMetrics(
      totalIssues: jsonSerialization['totalIssues'] as int,
      openIssues: jsonSerialization['openIssues'] as int,
      assignedIssues: jsonSerialization['assignedIssues'] as int,
      inProgressIssues: jsonSerialization['inProgressIssues'] as int,
      awaitingVerificationIssues:
          jsonSerialization['awaitingVerificationIssues'] as int,
      resolvedIssues: jsonSerialization['resolvedIssues'] as int,
      averageResolutionMinutes:
          (jsonSerialization['averageResolutionMinutes'] as num).toDouble(),
      highPriorityCount: jsonSerialization['highPriorityCount'] as int,
      criticalPriorityCount: jsonSerialization['criticalPriorityCount'] as int,
    );
  }

  /// Total count of tracked issues
  int totalIssues;

  /// Open / unassigned issues
  int openIssues;

  /// Issues currently claimed by technicians
  int assignedIssues;

  /// Issues actively being repaired
  int inProgressIssues;

  /// Issues pending reporter inspection
  int awaitingVerificationIssues;

  /// Successfully verified and closed issues
  int resolvedIssues;

  /// Average turnaround time in minutes
  double averageResolutionMinutes;

  /// Count of high priority tickets
  int highPriorityCount;

  /// Count of critical / emergency tickets
  int criticalPriorityCount;

  /// Returns a shallow copy of this [DashboardMetrics]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  DashboardMetrics copyWith({
    int? totalIssues,
    int? openIssues,
    int? assignedIssues,
    int? inProgressIssues,
    int? awaitingVerificationIssues,
    int? resolvedIssues,
    double? averageResolutionMinutes,
    int? highPriorityCount,
    int? criticalPriorityCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DashboardMetrics',
      'totalIssues': totalIssues,
      'openIssues': openIssues,
      'assignedIssues': assignedIssues,
      'inProgressIssues': inProgressIssues,
      'awaitingVerificationIssues': awaitingVerificationIssues,
      'resolvedIssues': resolvedIssues,
      'averageResolutionMinutes': averageResolutionMinutes,
      'highPriorityCount': highPriorityCount,
      'criticalPriorityCount': criticalPriorityCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DashboardMetrics',
      'totalIssues': totalIssues,
      'openIssues': openIssues,
      'assignedIssues': assignedIssues,
      'inProgressIssues': inProgressIssues,
      'awaitingVerificationIssues': awaitingVerificationIssues,
      'resolvedIssues': resolvedIssues,
      'averageResolutionMinutes': averageResolutionMinutes,
      'highPriorityCount': highPriorityCount,
      'criticalPriorityCount': criticalPriorityCount,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _DashboardMetricsImpl extends DashboardMetrics {
  _DashboardMetricsImpl({
    required int totalIssues,
    required int openIssues,
    required int assignedIssues,
    required int inProgressIssues,
    required int awaitingVerificationIssues,
    required int resolvedIssues,
    required double averageResolutionMinutes,
    required int highPriorityCount,
    required int criticalPriorityCount,
  }) : super._(
         totalIssues: totalIssues,
         openIssues: openIssues,
         assignedIssues: assignedIssues,
         inProgressIssues: inProgressIssues,
         awaitingVerificationIssues: awaitingVerificationIssues,
         resolvedIssues: resolvedIssues,
         averageResolutionMinutes: averageResolutionMinutes,
         highPriorityCount: highPriorityCount,
         criticalPriorityCount: criticalPriorityCount,
       );

  /// Returns a shallow copy of this [DashboardMetrics]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  DashboardMetrics copyWith({
    int? totalIssues,
    int? openIssues,
    int? assignedIssues,
    int? inProgressIssues,
    int? awaitingVerificationIssues,
    int? resolvedIssues,
    double? averageResolutionMinutes,
    int? highPriorityCount,
    int? criticalPriorityCount,
  }) {
    return DashboardMetrics(
      totalIssues: totalIssues ?? this.totalIssues,
      openIssues: openIssues ?? this.openIssues,
      assignedIssues: assignedIssues ?? this.assignedIssues,
      inProgressIssues: inProgressIssues ?? this.inProgressIssues,
      awaitingVerificationIssues:
          awaitingVerificationIssues ?? this.awaitingVerificationIssues,
      resolvedIssues: resolvedIssues ?? this.resolvedIssues,
      averageResolutionMinutes:
          averageResolutionMinutes ?? this.averageResolutionMinutes,
      highPriorityCount: highPriorityCount ?? this.highPriorityCount,
      criticalPriorityCount:
          criticalPriorityCount ?? this.criticalPriorityCount,
    );
  }
}
