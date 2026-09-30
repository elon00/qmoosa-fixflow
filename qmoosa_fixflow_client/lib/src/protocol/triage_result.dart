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

/// Result object returned by the Multimodal AI Agentic Triage engine
abstract class TriageResult
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  TriageResult._({
    required this.suggestedCategory,
    required this.suggestedPriority,
    required this.confidence,
    required this.reasoning,
    required this.immediateActions,
  });

  factory TriageResult({
    required String suggestedCategory,
    required String suggestedPriority,
    required double confidence,
    required String reasoning,
    required List<String> immediateActions,
  }) = _TriageResultImpl;

  factory TriageResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return TriageResult(
      suggestedCategory: jsonSerialization['suggestedCategory'] as String,
      suggestedPriority: jsonSerialization['suggestedPriority'] as String,
      confidence: (jsonSerialization['confidence'] as num).toDouble(),
      reasoning: jsonSerialization['reasoning'] as String,
      immediateActions: _itkr0xvo.Protocol().deserialize<List<String>>(
        jsonSerialization['immediateActions'],
      ),
    );
  }

  /// Suggested maintenance category (Plumbing, Electrical, HVAC, Structural, Safety, IT)
  String suggestedCategory;

  /// Suggested urgency priority (Low, Medium, High, Critical)
  String suggestedPriority;

  /// Confidence score between 0.0 and 1.0
  double confidence;

  /// Reasoning explanation from the agentic classifier
  String reasoning;

  /// Recommended safety or containment steps
  List<String> immediateActions;

  /// Returns a shallow copy of this [TriageResult]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  TriageResult copyWith({
    String? suggestedCategory,
    String? suggestedPriority,
    double? confidence,
    String? reasoning,
    List<String>? immediateActions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TriageResult',
      'suggestedCategory': suggestedCategory,
      'suggestedPriority': suggestedPriority,
      'confidence': confidence,
      'reasoning': reasoning,
      'immediateActions': immediateActions.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TriageResult',
      'suggestedCategory': suggestedCategory,
      'suggestedPriority': suggestedPriority,
      'confidence': confidence,
      'reasoning': reasoning,
      'immediateActions': immediateActions.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _TriageResultImpl extends TriageResult {
  _TriageResultImpl({
    required String suggestedCategory,
    required String suggestedPriority,
    required double confidence,
    required String reasoning,
    required List<String> immediateActions,
  }) : super._(
         suggestedCategory: suggestedCategory,
         suggestedPriority: suggestedPriority,
         confidence: confidence,
         reasoning: reasoning,
         immediateActions: immediateActions,
       );

  /// Returns a shallow copy of this [TriageResult]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  TriageResult copyWith({
    String? suggestedCategory,
    String? suggestedPriority,
    double? confidence,
    String? reasoning,
    List<String>? immediateActions,
  }) {
    return TriageResult(
      suggestedCategory: suggestedCategory ?? this.suggestedCategory,
      suggestedPriority: suggestedPriority ?? this.suggestedPriority,
      confidence: confidence ?? this.confidence,
      reasoning: reasoning ?? this.reasoning,
      immediateActions:
          immediateActions ?? this.immediateActions.map((e0) => e0).toList(),
    );
  }
}
