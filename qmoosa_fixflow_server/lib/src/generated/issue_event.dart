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

/// Immutable audit trail and timeline event for issue lifecycle
abstract class IssueEvent
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  IssueEvent._({
    this.id,
    required this.issueId,
    required this.actorId,
    required this.actorName,
    required this.eventType,
    this.fromStatus,
    this.toStatus,
    this.message,
    required this.createdAt,
  });

  factory IssueEvent({
    int? id,
    required int issueId,
    required int actorId,
    required String actorName,
    required String eventType,
    String? fromStatus,
    String? toStatus,
    String? message,
    required DateTime createdAt,
  }) = _IssueEventImpl;

  factory IssueEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return IssueEvent(
      id: jsonSerialization['id'] as int?,
      issueId: jsonSerialization['issueId'] as int,
      actorId: jsonSerialization['actorId'] as int,
      actorName: jsonSerialization['actorName'] as String,
      eventType: jsonSerialization['eventType'] as String,
      fromStatus: jsonSerialization['fromStatus'] as String?,
      toStatus: jsonSerialization['toStatus'] as String?,
      message: jsonSerialization['message'] as String?,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = IssueEventTable();

  static const db = IssueEventRepository._();

  @override
  int? id;

  /// Target issue ID
  int issueId;

  /// User performing the action
  int actorId;

  /// Display name of the actor
  String actorName;

  /// Event type: CREATED, CLAIMED, STARTED, COMPLETED, VERIFIED, REOPENED, COMMENTED
  String eventType;

  /// Status prior to this event
  String? fromStatus;

  /// Status after this event
  String? toStatus;

  /// Narrative detail or comment text
  String? message;

  /// Timestamp of the event
  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [IssueEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  IssueEvent copyWith({
    int? id,
    int? issueId,
    int? actorId,
    String? actorName,
    String? eventType,
    String? fromStatus,
    String? toStatus,
    String? message,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'IssueEvent',
      if (id != null) 'id': id,
      'issueId': issueId,
      'actorId': actorId,
      'actorName': actorName,
      'eventType': eventType,
      if (fromStatus != null) 'fromStatus': fromStatus,
      if (toStatus != null) 'toStatus': toStatus,
      if (message != null) 'message': message,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'IssueEvent',
      if (id != null) 'id': id,
      'issueId': issueId,
      'actorId': actorId,
      'actorName': actorName,
      'eventType': eventType,
      if (fromStatus != null) 'fromStatus': fromStatus,
      if (toStatus != null) 'toStatus': toStatus,
      if (message != null) 'message': message,
      'createdAt': createdAt.toJson(),
    };
  }

  static IssueEventInclude include() {
    return IssueEventInclude._();
  }

  static IssueEventIncludeList includeList({
    _is.WhereExpressionBuilder<IssueEventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<IssueEventTable>? orderBy,
    _is.OrderByListBuilder<IssueEventTable>? orderByList,
    IssueEventInclude? include,
  }) {
    return IssueEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(IssueEvent.t),
      orderByList: orderByList?.call(IssueEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IssueEventImpl extends IssueEvent {
  _IssueEventImpl({
    int? id,
    required int issueId,
    required int actorId,
    required String actorName,
    required String eventType,
    String? fromStatus,
    String? toStatus,
    String? message,
    required DateTime createdAt,
  }) : super._(
         id: id,
         issueId: issueId,
         actorId: actorId,
         actorName: actorName,
         eventType: eventType,
         fromStatus: fromStatus,
         toStatus: toStatus,
         message: message,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [IssueEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  IssueEvent copyWith({
    Object? id = _Undefined,
    int? issueId,
    int? actorId,
    String? actorName,
    String? eventType,
    Object? fromStatus = _Undefined,
    Object? toStatus = _Undefined,
    Object? message = _Undefined,
    DateTime? createdAt,
  }) {
    return IssueEvent(
      id: id is int? ? id : this.id,
      issueId: issueId ?? this.issueId,
      actorId: actorId ?? this.actorId,
      actorName: actorName ?? this.actorName,
      eventType: eventType ?? this.eventType,
      fromStatus: fromStatus is String? ? fromStatus : this.fromStatus,
      toStatus: toStatus is String? ? toStatus : this.toStatus,
      message: message is String? ? message : this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class IssueEventUpdateTable extends _is.UpdateTable<IssueEventTable> {
  IssueEventUpdateTable(super.table);

  _is.ColumnValue<int, int> issueId(int value) => _is.ColumnValue(
    table.issueId,
    value,
  );

  _is.ColumnValue<int, int> actorId(int value) => _is.ColumnValue(
    table.actorId,
    value,
  );

  _is.ColumnValue<String, String> actorName(String value) => _is.ColumnValue(
    table.actorName,
    value,
  );

  _is.ColumnValue<String, String> eventType(String value) => _is.ColumnValue(
    table.eventType,
    value,
  );

  _is.ColumnValue<String, String> fromStatus(String? value) => _is.ColumnValue(
    table.fromStatus,
    value,
  );

  _is.ColumnValue<String, String> toStatus(String? value) => _is.ColumnValue(
    table.toStatus,
    value,
  );

  _is.ColumnValue<String, String> message(String? value) => _is.ColumnValue(
    table.message,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class IssueEventTable extends _is.Table<int?> {
  IssueEventTable({super.tableRelation}) : super(tableName: 'issue_event') {
    updateTable = IssueEventUpdateTable(this);
    issueId = _is.ColumnInt(
      'issueId',
      this,
    );
    actorId = _is.ColumnInt(
      'actorId',
      this,
    );
    actorName = _is.ColumnString(
      'actorName',
      this,
    );
    eventType = _is.ColumnString(
      'eventType',
      this,
    );
    fromStatus = _is.ColumnString(
      'fromStatus',
      this,
    );
    toStatus = _is.ColumnString(
      'toStatus',
      this,
    );
    message = _is.ColumnString(
      'message',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final IssueEventUpdateTable updateTable;

  /// Target issue ID
  late final _is.ColumnInt issueId;

  /// User performing the action
  late final _is.ColumnInt actorId;

  /// Display name of the actor
  late final _is.ColumnString actorName;

  /// Event type: CREATED, CLAIMED, STARTED, COMPLETED, VERIFIED, REOPENED, COMMENTED
  late final _is.ColumnString eventType;

  /// Status prior to this event
  late final _is.ColumnString fromStatus;

  /// Status after this event
  late final _is.ColumnString toStatus;

  /// Narrative detail or comment text
  late final _is.ColumnString message;

  /// Timestamp of the event
  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    issueId,
    actorId,
    actorName,
    eventType,
    fromStatus,
    toStatus,
    message,
    createdAt,
  ];
}

class IssueEventInclude extends _is.IncludeObject {
  IssueEventInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => IssueEvent.t;
}

class IssueEventIncludeList extends _is.IncludeList {
  IssueEventIncludeList._({
    _is.WhereExpressionBuilder<IssueEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(IssueEvent.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => IssueEvent.t;
}

class IssueEventRepository {
  const IssueEventRepository._();

  /// Returns a list of [IssueEvent]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<IssueEvent>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<IssueEventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<IssueEventTable>? orderBy,
    _is.OrderByListBuilder<IssueEventTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<IssueEvent>(
      where: where?.call(IssueEvent.t),
      orderBy: orderBy?.call(IssueEvent.t),
      orderByList: orderByList?.call(IssueEvent.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [IssueEvent] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<IssueEvent?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<IssueEventTable>? where,
    int? offset,
    _is.OrderByBuilder<IssueEventTable>? orderBy,
    _is.OrderByListBuilder<IssueEventTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<IssueEvent>(
      where: where?.call(IssueEvent.t),
      orderBy: orderBy?.call(IssueEvent.t),
      orderByList: orderByList?.call(IssueEvent.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [IssueEvent] by its [id] or null if no such row exists.
  Future<IssueEvent?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<IssueEvent>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [IssueEvent]s in the list and returns the inserted rows.
  ///
  /// The returned [IssueEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<IssueEvent>> insert(
    _is.DatabaseSession session,
    List<IssueEvent> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<IssueEvent>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [IssueEvent] and returns the inserted row.
  ///
  /// The returned [IssueEvent] will have its `id` field set.
  Future<IssueEvent> insertRow(
    _is.DatabaseSession session,
    IssueEvent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<IssueEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [IssueEvent]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [IssueEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<IssueEvent>> upsert(
    _is.DatabaseSession session,
    List<IssueEvent> rows, {
    required _is.ColumnSelections<IssueEventTable> conflictColumns,
    _is.ColumnSelections<IssueEventTable>? updateColumns,
    _is.WhereExpressionBuilder<IssueEventTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<IssueEvent>(
      rows,
      conflictColumns: conflictColumns(IssueEvent.t),
      updateColumns: updateColumns?.call(IssueEvent.t),
      updateWhere: updateWhere?.call(IssueEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [IssueEvent] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [IssueEvent] will have its `id` field set.
  Future<IssueEvent?> upsertRow(
    _is.DatabaseSession session,
    IssueEvent row, {
    required _is.ColumnSelections<IssueEventTable> conflictColumns,
    _is.ColumnSelections<IssueEventTable>? updateColumns,
    _is.WhereExpressionBuilder<IssueEventTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<IssueEvent>(
      row,
      conflictColumns: conflictColumns(IssueEvent.t),
      updateColumns: updateColumns?.call(IssueEvent.t),
      updateWhere: updateWhere?.call(IssueEvent.t),
      transaction: transaction,
    );
  }

  /// Updates all [IssueEvent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<IssueEvent>> update(
    _is.DatabaseSession session,
    List<IssueEvent> rows, {
    _is.ColumnSelections<IssueEventTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<IssueEvent>(
      rows,
      columns: columns?.call(IssueEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [IssueEvent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<IssueEvent> updateRow(
    _is.DatabaseSession session,
    IssueEvent row, {
    _is.ColumnSelections<IssueEventTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<IssueEvent>(
      row,
      columns: columns?.call(IssueEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [IssueEvent] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<IssueEvent?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<IssueEventUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<IssueEvent>(
      id,
      columnValues: columnValues(IssueEvent.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [IssueEvent]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<IssueEvent>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<IssueEventUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<IssueEventTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<IssueEventTable>? orderBy,
    _is.OrderByListBuilder<IssueEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<IssueEvent>(
      columnValues: columnValues(IssueEvent.t.updateTable),
      where: where(IssueEvent.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(IssueEvent.t),
      orderByList: orderByList?.call(IssueEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [IssueEvent]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<IssueEvent>> delete(
    _is.DatabaseSession session,
    List<IssueEvent> rows, {
    _is.OrderByBuilder<IssueEventTable>? orderBy,
    _is.OrderByListBuilder<IssueEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<IssueEvent>(
      rows,
      orderBy: orderBy?.call(IssueEvent.t),
      orderByList: orderByList?.call(IssueEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [IssueEvent].
  Future<IssueEvent> deleteRow(
    _is.DatabaseSession session,
    IssueEvent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<IssueEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<IssueEvent>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<IssueEventTable> where,
    _is.OrderByBuilder<IssueEventTable>? orderBy,
    _is.OrderByListBuilder<IssueEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<IssueEvent>(
      where: where(IssueEvent.t),
      orderBy: orderBy?.call(IssueEvent.t),
      orderByList: orderByList?.call(IssueEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<IssueEventTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<IssueEvent>(
      where: where?.call(IssueEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [IssueEvent] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<IssueEventTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<IssueEvent>(
      where: where(IssueEvent.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
