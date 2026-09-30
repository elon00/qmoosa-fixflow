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
import 'package:qmoosa_fixflow_client/src/protocol/protocol.dart' as _itkr0xvo;
import 'package:serverpod_client/serverpod_client.dart' as _isc;

/// Result output for automated sandbox test scenarios
abstract class SimulateResult
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  SimulateResult._({
    required this.success,
    required this.scenario,
    required this.summary,
    required this.logs,
    required this.executionTimeMs,
  });

  factory SimulateResult({
    required bool success,
    required String scenario,
    required String summary,
    required List<String> logs,
    required int executionTimeMs,
  }) = _SimulateResultImpl;

  factory SimulateResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return SimulateResult(
      success: _isc.BoolJsonExtension.fromJson(jsonSerialization['success']),
      scenario: jsonSerialization['scenario'] as String,
      summary: jsonSerialization['summary'] as String,
      logs: _itkr0xvo.Protocol().deserialize<List<String>>(
        jsonSerialization['logs'],
      ),
      executionTimeMs: jsonSerialization['executionTimeMs'] as int,
    );
  }

  /// Whether the simulated scenario passed completely
  bool success;

  /// Name of the simulated scenario
  String scenario;

  /// High-level summary of outcome
  String summary;

  /// Detailed step-by-step logs from the Serverpod engine
  List<String> logs;

  /// Wall-clock execution time in milliseconds
  int executionTimeMs;

  /// Returns a shallow copy of this [SimulateResult]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  SimulateResult copyWith({
    bool? success,
    String? scenario,
    String? summary,
    List<String>? logs,
    int? executionTimeMs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SimulateResult',
      'success': success,
      'scenario': scenario,
      'summary': summary,
      'logs': logs.toJson(),
      'executionTimeMs': executionTimeMs,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SimulateResult',
      'success': success,
      'scenario': scenario,
      'summary': summary,
      'logs': logs.toJson(),
      'executionTimeMs': executionTimeMs,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _SimulateResultImpl extends SimulateResult {
  _SimulateResultImpl({
    required bool success,
    required String scenario,
    required String summary,
    required List<String> logs,
    required int executionTimeMs,
  }) : super._(
         success: success,
         scenario: scenario,
         summary: summary,
         logs: logs,
         executionTimeMs: executionTimeMs,
       );

  /// Returns a shallow copy of this [SimulateResult]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  SimulateResult copyWith({
    bool? success,
    String? scenario,
    String? summary,
    List<String>? logs,
    int? executionTimeMs,
  }) {
    return SimulateResult(
      success: success ?? this.success,
      scenario: scenario ?? this.scenario,
      summary: summary ?? this.summary,
      logs: logs ?? this.logs.map((e0) => e0).toList(),
      executionTimeMs: executionTimeMs ?? this.executionTimeMs,
    );
  }
}
