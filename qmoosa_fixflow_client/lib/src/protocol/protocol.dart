/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:qmoosa_fixflow_client/src/protocol/issue.dart' as _ih161s0c;
import 'package:qmoosa_fixflow_client/src/protocol/issue_event.dart'
    as _ihw0pllu;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'dashboard_metrics.dart' as _isp0ke21;
import 'facility_location.dart' as _iqk6blq9;
import 'fixflow_exception.dart' as _irjwwbq9;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'issue.dart' as _i58ul4bz;
import 'issue_attachment.dart' as _i72153m6;
import 'issue_event.dart' as _ipzzltaw;
import 'simulate_result.dart' as _iv4p93xy;
import 'triage_result.dart' as _isk96bw6;
import 'user_profile.dart' as _ir2mn8w1;
import 'workspace.dart' as _io6eoug6;
export 'dashboard_metrics.dart';
export 'facility_location.dart';
export 'fixflow_exception.dart';
export 'greetings/greeting.dart';
export 'issue.dart';
export 'issue_attachment.dart';
export 'issue_event.dart';
export 'simulate_result.dart';
export 'triage_result.dart';
export 'user_profile.dart';
export 'workspace.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _isp0ke21.DashboardMetrics) {
      return _isp0ke21.DashboardMetrics.fromJson(data) as T;
    }
    if (t == _iqk6blq9.FacilityLocation) {
      return _iqk6blq9.FacilityLocation.fromJson(data) as T;
    }
    if (t == _irjwwbq9.FixFlowException) {
      return _irjwwbq9.FixFlowException.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _i58ul4bz.Issue) {
      return _i58ul4bz.Issue.fromJson(data) as T;
    }
    if (t == _i72153m6.IssueAttachment) {
      return _i72153m6.IssueAttachment.fromJson(data) as T;
    }
    if (t == _ipzzltaw.IssueEvent) {
      return _ipzzltaw.IssueEvent.fromJson(data) as T;
    }
    if (t == _iv4p93xy.SimulateResult) {
      return _iv4p93xy.SimulateResult.fromJson(data) as T;
    }
    if (t == _isk96bw6.TriageResult) {
      return _isk96bw6.TriageResult.fromJson(data) as T;
    }
    if (t == _ir2mn8w1.UserProfile) {
      return _ir2mn8w1.UserProfile.fromJson(data) as T;
    }
    if (t == _io6eoug6.Workspace) {
      return _io6eoug6.Workspace.fromJson(data) as T;
    }
    if (t == _isc.getType<_isp0ke21.DashboardMetrics?>()) {
      return (data != null ? _isp0ke21.DashboardMetrics.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iqk6blq9.FacilityLocation?>()) {
      return (data != null ? _iqk6blq9.FacilityLocation.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_irjwwbq9.FixFlowException?>()) {
      return (data != null ? _irjwwbq9.FixFlowException.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i58ul4bz.Issue?>()) {
      return (data != null ? _i58ul4bz.Issue.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i72153m6.IssueAttachment?>()) {
      return (data != null ? _i72153m6.IssueAttachment.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ipzzltaw.IssueEvent?>()) {
      return (data != null ? _ipzzltaw.IssueEvent.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iv4p93xy.SimulateResult?>()) {
      return (data != null ? _iv4p93xy.SimulateResult.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_isk96bw6.TriageResult?>()) {
      return (data != null ? _isk96bw6.TriageResult.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ir2mn8w1.UserProfile?>()) {
      return (data != null ? _ir2mn8w1.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_io6eoug6.Workspace?>()) {
      return (data != null ? _io6eoug6.Workspace.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_ih161s0c.Issue>) {
      return (data as List).map((e) => deserialize<_ih161s0c.Issue>(e)).toList()
          as T;
    }
    if (t == List<_ihw0pllu.IssueEvent>) {
      return (data as List)
              .map((e) => deserialize<_ihw0pllu.IssueEvent>(e))
              .toList()
          as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _isp0ke21.DashboardMetrics => 'DashboardMetrics',
      _iqk6blq9.FacilityLocation => 'FacilityLocation',
      _irjwwbq9.FixFlowException => 'FixFlowException',
      _izw8z7ou.Greeting => 'Greeting',
      _i58ul4bz.Issue => 'Issue',
      _i72153m6.IssueAttachment => 'IssueAttachment',
      _ipzzltaw.IssueEvent => 'IssueEvent',
      _iv4p93xy.SimulateResult => 'SimulateResult',
      _isk96bw6.TriageResult => 'TriageResult',
      _ir2mn8w1.UserProfile => 'UserProfile',
      _io6eoug6.Workspace => 'Workspace',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'qmoosa_fixflow.',
        '',
      );
    }

    switch (data) {
      case _isp0ke21.DashboardMetrics():
        return 'DashboardMetrics';
      case _iqk6blq9.FacilityLocation():
        return 'FacilityLocation';
      case _irjwwbq9.FixFlowException():
        return 'FixFlowException';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _i58ul4bz.Issue():
        return 'Issue';
      case _i72153m6.IssueAttachment():
        return 'IssueAttachment';
      case _ipzzltaw.IssueEvent():
        return 'IssueEvent';
      case _iv4p93xy.SimulateResult():
        return 'SimulateResult';
      case _isk96bw6.TriageResult():
        return 'TriageResult';
      case _ir2mn8w1.UserProfile():
        return 'UserProfile';
      case _io6eoug6.Workspace():
        return 'Workspace';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'DashboardMetrics') {
      return deserialize<_isp0ke21.DashboardMetrics>(data['data']);
    }
    if (dataClassName == 'FacilityLocation') {
      return deserialize<_iqk6blq9.FacilityLocation>(data['data']);
    }
    if (dataClassName == 'FixFlowException') {
      return deserialize<_irjwwbq9.FixFlowException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'Issue') {
      return deserialize<_i58ul4bz.Issue>(data['data']);
    }
    if (dataClassName == 'IssueAttachment') {
      return deserialize<_i72153m6.IssueAttachment>(data['data']);
    }
    if (dataClassName == 'IssueEvent') {
      return deserialize<_ipzzltaw.IssueEvent>(data['data']);
    }
    if (dataClassName == 'SimulateResult') {
      return deserialize<_iv4p93xy.SimulateResult>(data['data']);
    }
    if (dataClassName == 'TriageResult') {
      return deserialize<_isk96bw6.TriageResult>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_ir2mn8w1.UserProfile>(data['data']);
    }
    if (dataClassName == 'Workspace') {
      return deserialize<_io6eoug6.Workspace>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('qmoosa_fixflow', this);
    _iacc.Protocol().registerHostProtocol('qmoosa_fixflow', this);
  }

  @override
  String getModuleName() => 'qmoosa_fixflow';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
