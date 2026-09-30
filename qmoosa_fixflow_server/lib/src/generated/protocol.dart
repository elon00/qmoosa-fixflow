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
import 'package:qmoosa_fixflow_server/src/generated/issue.dart' as _ic0dwcfm;
import 'package:qmoosa_fixflow_server/src/generated/issue_event.dart'
    as _i3h6rj0e;
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
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

class Protocol extends _is.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    _isp.TableDefinition(
      name: 'facility_location',
      dartName: 'FacilityLocation',
      schema: 'public',
      module: 'qmoosa_fixflow',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'workspaceId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'building',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'floor',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'room',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'issue',
      dartName: 'Issue',
      schema: 'public',
      module: 'qmoosa_fixflow',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'workspaceId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'reporterId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'reporterName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'assignedUserId',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'assignedUserName',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'category',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'locationId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'locationName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'priority',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'beforePhotoUrl',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'afterPhotoUrl',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'resolutionNote',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'resolvedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'issue_attachment',
      dartName: 'IssueAttachment',
      schema: 'public',
      module: 'qmoosa_fixflow',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'issueId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'uploadedBy',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'fileUrl',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'attachmentType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'fileName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'issue_event',
      dartName: 'IssueEvent',
      schema: 'public',
      module: 'qmoosa_fixflow',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'issueId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'actorId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'actorName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'eventType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'fromStatus',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'toStatus',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'message',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'user_profile',
      dartName: 'UserProfile',
      schema: 'public',
      module: 'qmoosa_fixflow',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'authUserId',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'displayName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'email',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'role',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'workspaceId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'avatarUrl',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'workspace',
      dartName: 'Workspace',
      schema: 'public',
      module: 'qmoosa_fixflow',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    ..._iais.Protocol.targetTableDefinitions,
    ..._iacs.Protocol.targetTableDefinitions,
    ..._isp.Protocol.targetTableDefinitions,
  ];

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
      } on _is.DeserializationClassNameNotFoundException catch (_) {
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
    if (t == _is.getType<_isp0ke21.DashboardMetrics?>()) {
      return (data != null ? _isp0ke21.DashboardMetrics.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iqk6blq9.FacilityLocation?>()) {
      return (data != null ? _iqk6blq9.FacilityLocation.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_irjwwbq9.FixFlowException?>()) {
      return (data != null ? _irjwwbq9.FixFlowException.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i58ul4bz.Issue?>()) {
      return (data != null ? _i58ul4bz.Issue.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i72153m6.IssueAttachment?>()) {
      return (data != null ? _i72153m6.IssueAttachment.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ipzzltaw.IssueEvent?>()) {
      return (data != null ? _ipzzltaw.IssueEvent.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iv4p93xy.SimulateResult?>()) {
      return (data != null ? _iv4p93xy.SimulateResult.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_isk96bw6.TriageResult?>()) {
      return (data != null ? _isk96bw6.TriageResult.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ir2mn8w1.UserProfile?>()) {
      return (data != null ? _ir2mn8w1.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_io6eoug6.Workspace?>()) {
      return (data != null ? _io6eoug6.Workspace.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_ic0dwcfm.Issue>) {
      return (data as List).map((e) => deserialize<_ic0dwcfm.Issue>(e)).toList()
          as T;
    }
    if (t == List<_i3h6rj0e.IssueEvent>) {
      return (data as List)
              .map((e) => deserialize<_i3h6rj0e.IssueEvent>(e))
              .toList()
          as T;
    }
    try {
      return _iais.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacs.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _isp.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
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
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
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
      return _iais.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacs.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _isp.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iais.Protocol().registerHostProtocol('qmoosa_fixflow', this);
    _iacs.Protocol().registerHostProtocol('qmoosa_fixflow', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _iqk6blq9.FacilityLocation:
        return _iqk6blq9.FacilityLocation.t;
      case _i58ul4bz.Issue:
        return _i58ul4bz.Issue.t;
      case _i72153m6.IssueAttachment:
        return _i72153m6.IssueAttachment.t;
      case _ipzzltaw.IssueEvent:
        return _ipzzltaw.IssueEvent.t;
      case _ir2mn8w1.UserProfile:
        return _ir2mn8w1.UserProfile.t;
      case _io6eoug6.Workspace:
        return _io6eoug6.Workspace.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

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
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
