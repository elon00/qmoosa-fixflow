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

/// Core operational maintenance issue entity
abstract class Issue implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Issue._({
    this.id,
    required this.workspaceId,
    required this.reporterId,
    required this.reporterName,
    this.assignedUserId,
    this.assignedUserName,
    required this.title,
    required this.description,
    required this.category,
    required this.locationId,
    required this.locationName,
    required this.priority,
    required this.status,
    this.beforePhotoUrl,
    this.afterPhotoUrl,
    this.resolutionNote,
    required this.createdAt,
    required this.updatedAt,
    this.resolvedAt,
  });

  factory Issue({
    int? id,
    required int workspaceId,
    required int reporterId,
    required String reporterName,
    int? assignedUserId,
    String? assignedUserName,
    required String title,
    required String description,
    required String category,
    required int locationId,
    required String locationName,
    required String priority,
    required String status,
    String? beforePhotoUrl,
    String? afterPhotoUrl,
    String? resolutionNote,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? resolvedAt,
  }) = _IssueImpl;

  factory Issue.fromJson(Map<String, dynamic> jsonSerialization) {
    return Issue(
      id: jsonSerialization['id'] as int?,
      workspaceId: jsonSerialization['workspaceId'] as int,
      reporterId: jsonSerialization['reporterId'] as int,
      reporterName: jsonSerialization['reporterName'] as String,
      assignedUserId: jsonSerialization['assignedUserId'] as int?,
      assignedUserName: jsonSerialization['assignedUserName'] as String?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      locationId: jsonSerialization['locationId'] as int,
      locationName: jsonSerialization['locationName'] as String,
      priority: jsonSerialization['priority'] as String,
      status: jsonSerialization['status'] as String,
      beforePhotoUrl: jsonSerialization['beforePhotoUrl'] as String?,
      afterPhotoUrl: jsonSerialization['afterPhotoUrl'] as String?,
      resolutionNote: jsonSerialization['resolutionNote'] as String?,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
    );
  }

  static final t = IssueTable();

  static const db = IssueRepository._();

  @override
  int? id;

  /// Target workspace
  int workspaceId;

  /// User who submitted the report
  int reporterId;

  /// Reporter name cached for rapid feed rendering
  String reporterName;

  /// Assigned technician ID (null when OPEN)
  int? assignedUserId;

  /// Assigned technician display name
  String? assignedUserName;

  /// Concise issue headline
  String title;

  /// Detailed issue narrative
  String description;

  /// Category: Plumbing, Electrical, HVAC, Structural, Cleaning, Safety, IT
  String category;

  /// Associated facility location ID
  int locationId;

  /// Formatted location string (e.g., "Building A - Floor 2 - Room 204")
  String locationName;

  /// Priority level: Low, Medium, High, Critical
  String priority;

  /// State machine status: OPEN, ASSIGNED, IN_PROGRESS, AWAITING_VERIFICATION, RESOLVED, REOPENED
  String status;

  /// URL to the initial fault / damage photograph
  String? beforePhotoUrl;

  /// URL to the completion / repaired photograph
  String? afterPhotoUrl;

  /// Technician's closing explanation of work performed
  String? resolutionNote;

  /// Creation timestamp
  DateTime createdAt;

  /// Last state transition timestamp
  DateTime updatedAt;

  /// Timestamp when verified and closed
  DateTime? resolvedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Issue]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Issue copyWith({
    int? id,
    int? workspaceId,
    int? reporterId,
    String? reporterName,
    int? assignedUserId,
    String? assignedUserName,
    String? title,
    String? description,
    String? category,
    int? locationId,
    String? locationName,
    String? priority,
    String? status,
    String? beforePhotoUrl,
    String? afterPhotoUrl,
    String? resolutionNote,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? resolvedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Issue',
      if (id != null) 'id': id,
      'workspaceId': workspaceId,
      'reporterId': reporterId,
      'reporterName': reporterName,
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUserName != null) 'assignedUserName': assignedUserName,
      'title': title,
      'description': description,
      'category': category,
      'locationId': locationId,
      'locationName': locationName,
      'priority': priority,
      'status': status,
      if (beforePhotoUrl != null) 'beforePhotoUrl': beforePhotoUrl,
      if (afterPhotoUrl != null) 'afterPhotoUrl': afterPhotoUrl,
      if (resolutionNote != null) 'resolutionNote': resolutionNote,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Issue',
      if (id != null) 'id': id,
      'workspaceId': workspaceId,
      'reporterId': reporterId,
      'reporterName': reporterName,
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUserName != null) 'assignedUserName': assignedUserName,
      'title': title,
      'description': description,
      'category': category,
      'locationId': locationId,
      'locationName': locationName,
      'priority': priority,
      'status': status,
      if (beforePhotoUrl != null) 'beforePhotoUrl': beforePhotoUrl,
      if (afterPhotoUrl != null) 'afterPhotoUrl': afterPhotoUrl,
      if (resolutionNote != null) 'resolutionNote': resolutionNote,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  static IssueInclude include() {
    return IssueInclude._();
  }

  static IssueIncludeList includeList({
    _is.WhereExpressionBuilder<IssueTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<IssueTable>? orderBy,
    _is.OrderByListBuilder<IssueTable>? orderByList,
    IssueInclude? include,
  }) {
    return IssueIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Issue.t),
      orderByList: orderByList?.call(Issue.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IssueImpl extends Issue {
  _IssueImpl({
    int? id,
    required int workspaceId,
    required int reporterId,
    required String reporterName,
    int? assignedUserId,
    String? assignedUserName,
    required String title,
    required String description,
    required String category,
    required int locationId,
    required String locationName,
    required String priority,
    required String status,
    String? beforePhotoUrl,
    String? afterPhotoUrl,
    String? resolutionNote,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? resolvedAt,
  }) : super._(
         id: id,
         workspaceId: workspaceId,
         reporterId: reporterId,
         reporterName: reporterName,
         assignedUserId: assignedUserId,
         assignedUserName: assignedUserName,
         title: title,
         description: description,
         category: category,
         locationId: locationId,
         locationName: locationName,
         priority: priority,
         status: status,
         beforePhotoUrl: beforePhotoUrl,
         afterPhotoUrl: afterPhotoUrl,
         resolutionNote: resolutionNote,
         createdAt: createdAt,
         updatedAt: updatedAt,
         resolvedAt: resolvedAt,
       );

  /// Returns a shallow copy of this [Issue]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Issue copyWith({
    Object? id = _Undefined,
    int? workspaceId,
    int? reporterId,
    String? reporterName,
    Object? assignedUserId = _Undefined,
    Object? assignedUserName = _Undefined,
    String? title,
    String? description,
    String? category,
    int? locationId,
    String? locationName,
    String? priority,
    String? status,
    Object? beforePhotoUrl = _Undefined,
    Object? afterPhotoUrl = _Undefined,
    Object? resolutionNote = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? resolvedAt = _Undefined,
  }) {
    return Issue(
      id: id is int? ? id : this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      reporterId: reporterId ?? this.reporterId,
      reporterName: reporterName ?? this.reporterName,
      assignedUserId: assignedUserId is int?
          ? assignedUserId
          : this.assignedUserId,
      assignedUserName: assignedUserName is String?
          ? assignedUserName
          : this.assignedUserName,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      locationId: locationId ?? this.locationId,
      locationName: locationName ?? this.locationName,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      beforePhotoUrl: beforePhotoUrl is String?
          ? beforePhotoUrl
          : this.beforePhotoUrl,
      afterPhotoUrl: afterPhotoUrl is String?
          ? afterPhotoUrl
          : this.afterPhotoUrl,
      resolutionNote: resolutionNote is String?
          ? resolutionNote
          : this.resolutionNote,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
    );
  }
}

class IssueUpdateTable extends _is.UpdateTable<IssueTable> {
  IssueUpdateTable(super.table);

  _is.ColumnValue<int, int> workspaceId(int value) => _is.ColumnValue(
    table.workspaceId,
    value,
  );

  _is.ColumnValue<int, int> reporterId(int value) => _is.ColumnValue(
    table.reporterId,
    value,
  );

  _is.ColumnValue<String, String> reporterName(String value) => _is.ColumnValue(
    table.reporterName,
    value,
  );

  _is.ColumnValue<int, int> assignedUserId(int? value) => _is.ColumnValue(
    table.assignedUserId,
    value,
  );

  _is.ColumnValue<String, String> assignedUserName(String? value) =>
      _is.ColumnValue(
        table.assignedUserName,
        value,
      );

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<String, String> category(String value) => _is.ColumnValue(
    table.category,
    value,
  );

  _is.ColumnValue<int, int> locationId(int value) => _is.ColumnValue(
    table.locationId,
    value,
  );

  _is.ColumnValue<String, String> locationName(String value) => _is.ColumnValue(
    table.locationName,
    value,
  );

  _is.ColumnValue<String, String> priority(String value) => _is.ColumnValue(
    table.priority,
    value,
  );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<String, String> beforePhotoUrl(String? value) =>
      _is.ColumnValue(
        table.beforePhotoUrl,
        value,
      );

  _is.ColumnValue<String, String> afterPhotoUrl(String? value) =>
      _is.ColumnValue(
        table.afterPhotoUrl,
        value,
      );

  _is.ColumnValue<String, String> resolutionNote(String? value) =>
      _is.ColumnValue(
        table.resolutionNote,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(
        table.updatedAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> resolvedAt(DateTime? value) =>
      _is.ColumnValue(
        table.resolvedAt,
        value,
      );
}

class IssueTable extends _is.Table<int?> {
  IssueTable({super.tableRelation}) : super(tableName: 'issue') {
    updateTable = IssueUpdateTable(this);
    workspaceId = _is.ColumnInt(
      'workspaceId',
      this,
    );
    reporterId = _is.ColumnInt(
      'reporterId',
      this,
    );
    reporterName = _is.ColumnString(
      'reporterName',
      this,
    );
    assignedUserId = _is.ColumnInt(
      'assignedUserId',
      this,
    );
    assignedUserName = _is.ColumnString(
      'assignedUserName',
      this,
    );
    title = _is.ColumnString(
      'title',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    category = _is.ColumnString(
      'category',
      this,
    );
    locationId = _is.ColumnInt(
      'locationId',
      this,
    );
    locationName = _is.ColumnString(
      'locationName',
      this,
    );
    priority = _is.ColumnString(
      'priority',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    beforePhotoUrl = _is.ColumnString(
      'beforePhotoUrl',
      this,
    );
    afterPhotoUrl = _is.ColumnString(
      'afterPhotoUrl',
      this,
    );
    resolutionNote = _is.ColumnString(
      'resolutionNote',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _is.ColumnDateTime(
      'updatedAt',
      this,
    );
    resolvedAt = _is.ColumnDateTime(
      'resolvedAt',
      this,
    );
  }

  late final IssueUpdateTable updateTable;

  /// Target workspace
  late final _is.ColumnInt workspaceId;

  /// User who submitted the report
  late final _is.ColumnInt reporterId;

  /// Reporter name cached for rapid feed rendering
  late final _is.ColumnString reporterName;

  /// Assigned technician ID (null when OPEN)
  late final _is.ColumnInt assignedUserId;

  /// Assigned technician display name
  late final _is.ColumnString assignedUserName;

  /// Concise issue headline
  late final _is.ColumnString title;

  /// Detailed issue narrative
  late final _is.ColumnString description;

  /// Category: Plumbing, Electrical, HVAC, Structural, Cleaning, Safety, IT
  late final _is.ColumnString category;

  /// Associated facility location ID
  late final _is.ColumnInt locationId;

  /// Formatted location string (e.g., "Building A - Floor 2 - Room 204")
  late final _is.ColumnString locationName;

  /// Priority level: Low, Medium, High, Critical
  late final _is.ColumnString priority;

  /// State machine status: OPEN, ASSIGNED, IN_PROGRESS, AWAITING_VERIFICATION, RESOLVED, REOPENED
  late final _is.ColumnString status;

  /// URL to the initial fault / damage photograph
  late final _is.ColumnString beforePhotoUrl;

  /// URL to the completion / repaired photograph
  late final _is.ColumnString afterPhotoUrl;

  /// Technician's closing explanation of work performed
  late final _is.ColumnString resolutionNote;

  /// Creation timestamp
  late final _is.ColumnDateTime createdAt;

  /// Last state transition timestamp
  late final _is.ColumnDateTime updatedAt;

  /// Timestamp when verified and closed
  late final _is.ColumnDateTime resolvedAt;

  @override
  List<_is.Column> get columns => [
    id,
    workspaceId,
    reporterId,
    reporterName,
    assignedUserId,
    assignedUserName,
    title,
    description,
    category,
    locationId,
    locationName,
    priority,
    status,
    beforePhotoUrl,
    afterPhotoUrl,
    resolutionNote,
    createdAt,
    updatedAt,
    resolvedAt,
  ];
}

class IssueInclude extends _is.IncludeObject {
  IssueInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Issue.t;
}

class IssueIncludeList extends _is.IncludeList {
  IssueIncludeList._({
    _is.WhereExpressionBuilder<IssueTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Issue.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Issue.t;
}

class IssueRepository {
  const IssueRepository._();

  /// Returns a list of [Issue]s matching the given query parameters.
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
  Future<List<Issue>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<IssueTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<IssueTable>? orderBy,
    _is.OrderByListBuilder<IssueTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Issue>(
      where: where?.call(Issue.t),
      orderBy: orderBy?.call(Issue.t),
      orderByList: orderByList?.call(Issue.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Issue] matching the given query parameters.
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
  Future<Issue?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<IssueTable>? where,
    int? offset,
    _is.OrderByBuilder<IssueTable>? orderBy,
    _is.OrderByListBuilder<IssueTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Issue>(
      where: where?.call(Issue.t),
      orderBy: orderBy?.call(Issue.t),
      orderByList: orderByList?.call(Issue.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Issue] by its [id] or null if no such row exists.
  Future<Issue?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Issue>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Issue]s in the list and returns the inserted rows.
  ///
  /// The returned [Issue]s will have their `id` fields set.
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
  Future<List<Issue>> insert(
    _is.DatabaseSession session,
    List<Issue> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Issue>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Issue] and returns the inserted row.
  ///
  /// The returned [Issue] will have its `id` field set.
  Future<Issue> insertRow(
    _is.DatabaseSession session,
    Issue row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Issue>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Issue]s in the list and returns the resulting rows.
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
  /// The returned [Issue]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Issue>> upsert(
    _is.DatabaseSession session,
    List<Issue> rows, {
    required _is.ColumnSelections<IssueTable> conflictColumns,
    _is.ColumnSelections<IssueTable>? updateColumns,
    _is.WhereExpressionBuilder<IssueTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Issue>(
      rows,
      conflictColumns: conflictColumns(Issue.t),
      updateColumns: updateColumns?.call(Issue.t),
      updateWhere: updateWhere?.call(Issue.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Issue] and returns the resulting row.
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
  /// The returned [Issue] will have its `id` field set.
  Future<Issue?> upsertRow(
    _is.DatabaseSession session,
    Issue row, {
    required _is.ColumnSelections<IssueTable> conflictColumns,
    _is.ColumnSelections<IssueTable>? updateColumns,
    _is.WhereExpressionBuilder<IssueTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Issue>(
      row,
      conflictColumns: conflictColumns(Issue.t),
      updateColumns: updateColumns?.call(Issue.t),
      updateWhere: updateWhere?.call(Issue.t),
      transaction: transaction,
    );
  }

  /// Updates all [Issue]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Issue>> update(
    _is.DatabaseSession session,
    List<Issue> rows, {
    _is.ColumnSelections<IssueTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Issue>(
      rows,
      columns: columns?.call(Issue.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Issue]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Issue> updateRow(
    _is.DatabaseSession session,
    Issue row, {
    _is.ColumnSelections<IssueTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Issue>(
      row,
      columns: columns?.call(Issue.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Issue] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Issue?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<IssueUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Issue>(
      id,
      columnValues: columnValues(Issue.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Issue]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Issue>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<IssueUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<IssueTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<IssueTable>? orderBy,
    _is.OrderByListBuilder<IssueTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Issue>(
      columnValues: columnValues(Issue.t.updateTable),
      where: where(Issue.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Issue.t),
      orderByList: orderByList?.call(Issue.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Issue]s in the list and returns the deleted rows.
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
  Future<List<Issue>> delete(
    _is.DatabaseSession session,
    List<Issue> rows, {
    _is.OrderByBuilder<IssueTable>? orderBy,
    _is.OrderByListBuilder<IssueTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Issue>(
      rows,
      orderBy: orderBy?.call(Issue.t),
      orderByList: orderByList?.call(Issue.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Issue].
  Future<Issue> deleteRow(
    _is.DatabaseSession session,
    Issue row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Issue>(
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
  Future<List<Issue>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<IssueTable> where,
    _is.OrderByBuilder<IssueTable>? orderBy,
    _is.OrderByListBuilder<IssueTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Issue>(
      where: where(Issue.t),
      orderBy: orderBy?.call(Issue.t),
      orderByList: orderByList?.call(Issue.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<IssueTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Issue>(
      where: where?.call(Issue.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Issue] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<IssueTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Issue>(
      where: where(Issue.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
