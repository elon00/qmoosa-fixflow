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

/// Custom serializable exception for FixFlow business logic violations
abstract class FixFlowException
    implements
        _is.SerializableException,
        _is.SerializableModel,
        _is.ProtocolSerialization {
  FixFlowException._({
    required this.message,
    this.statusCode,
  });

  factory FixFlowException({
    required String message,
    int? statusCode,
  }) = _FixFlowExceptionImpl;

  factory FixFlowException.fromJson(Map<String, dynamic> jsonSerialization) {
    return FixFlowException(
      message: jsonSerialization['message'] as String,
      statusCode: jsonSerialization['statusCode'] as int?,
    );
  }

  /// User-facing error message
  String message;

  /// HTTP status code equivalent
  int? statusCode;

  /// Returns a shallow copy of this [FixFlowException]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  FixFlowException copyWith({
    String? message,
    int? statusCode,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FixFlowException',
      'message': message,
      if (statusCode != null) 'statusCode': statusCode,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FixFlowException',
      'message': message,
      if (statusCode != null) 'statusCode': statusCode,
    };
  }

  @override
  String toString() {
    return 'FixFlowException(message: $message, statusCode: $statusCode)';
  }
}

class _Undefined {}

class _FixFlowExceptionImpl extends FixFlowException {
  _FixFlowExceptionImpl({
    required String message,
    int? statusCode,
  }) : super._(
         message: message,
         statusCode: statusCode,
       );

  /// Returns a shallow copy of this [FixFlowException]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  FixFlowException copyWith({
    String? message,
    Object? statusCode = _Undefined,
  }) {
    return FixFlowException(
      message: message ?? this.message,
      statusCode: statusCode is int? ? statusCode : this.statusCode,
    );
  }
}
