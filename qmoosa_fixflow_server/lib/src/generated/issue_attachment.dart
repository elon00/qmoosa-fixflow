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

/// Evidence attachment (photographs, receipts, work orders)
abstract class IssueAttachment
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  IssueAttachment._({
    this.id,
    required this.issueId,
    required this.uploadedBy,
    required this.fileUrl,
    required this.attachmentType,
    required this.fileName,
    required this.createdAt,
  });

  factory IssueAttachment({
    int? id,
    required int issueId,
    required int uploadedBy,
    required String fileUrl,
    required String attachmentType,
    required String fileName,
    required DateTime createdAt,
  }) = _IssueAttachmentImpl;

  factory IssueAttachment.fromJson(Map<String, dynamic> jsonSerialization) {
    return IssueAttachment(
      id: jsonSerialization['id'] as int?,
      issueId: jsonSerialization['issueId'] as int,
      uploadedBy: jsonSerialization['uploadedBy'] as int,
      fileUrl: jsonSerialization['fileUrl'] as String,
      attachmentType: jsonSerialization['attachmentType'] as String,
      fileName: jsonSerialization['fileName'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = IssueAttachmentTable();

  static const db = IssueAttachmentRepository._();

  @override
  int? id;

  /// Target issue ID
  int issueId;

  /// User who uploaded the file
  int uploadedBy;

  /// Storage URL
  String fileUrl;

  /// Attachment role: BEFORE_PHOTO, AFTER_PHOTO, INVOICE, DOCUMENT
  String attachmentType;

  /// Original filename
  String fileName;

  /// Upload timestamp
  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [IssueAttachment]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  IssueAttachment copyWith({
    int? id,
    int? issueId,
    int? uploadedBy,
    String? fileUrl,
    String? attachmentType,
    String? fileName,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'IssueAttachment',
      if (id != null) 'id': id,
      'issueId': issueId,
      'uploadedBy': uploadedBy,
      'fileUrl': fileUrl,
      'attachmentType': attachmentType,
      'fileName': fileName,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'IssueAttachment',
      if (id != null) 'id': id,
      'issueId': issueId,
      'uploadedBy': uploadedBy,
      'fileUrl': fileUrl,
      'attachmentType': attachmentType,
      'fileName': fileName,
      'createdAt': createdAt.toJson(),
    };
  }

  static IssueAttachmentInclude include() {
    return IssueAttachmentInclude._();
  }

  static IssueAttachmentIncludeList includeList({
    _is.WhereExpressionBuilder<IssueAttachmentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<IssueAttachmentTable>? orderBy,
    _is.OrderByListBuilder<IssueAttachmentTable>? orderByList,
    IssueAttachmentInclude? include,
  }) {
    return IssueAttachmentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(IssueAttachment.t),
      orderByList: orderByList?.call(IssueAttachment.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IssueAttachmentImpl extends IssueAttachment {
  _IssueAttachmentImpl({
    int? id,
    required int issueId,
    required int uploadedBy,
    required String fileUrl,
    required String attachmentType,
    required String fileName,
    required DateTime createdAt,
  }) : super._(
         id: id,
         issueId: issueId,
         uploadedBy: uploadedBy,
         fileUrl: fileUrl,
         attachmentType: attachmentType,
         fileName: fileName,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [IssueAttachment]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  IssueAttachment copyWith({
    Object? id = _Undefined,
    int? issueId,
    int? uploadedBy,
    String? fileUrl,
    String? attachmentType,
    String? fileName,
    DateTime? createdAt,
  }) {
    return IssueAttachment(
      id: id is int? ? id : this.id,
      issueId: issueId ?? this.issueId,
      uploadedBy: uploadedBy ?? this.uploadedBy,
      fileUrl: fileUrl ?? this.fileUrl,
      attachmentType: attachmentType ?? this.attachmentType,
      fileName: fileName ?? this.fileName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class IssueAttachmentUpdateTable extends _is.UpdateTable<IssueAttachmentTable> {
  IssueAttachmentUpdateTable(super.table);

  _is.ColumnValue<int, int> issueId(int value) => _is.ColumnValue(
    table.issueId,
    value,
  );

  _is.ColumnValue<int, int> uploadedBy(int value) => _is.ColumnValue(
    table.uploadedBy,
    value,
  );

  _is.ColumnValue<String, String> fileUrl(String value) => _is.ColumnValue(
    table.fileUrl,
    value,
  );

  _is.ColumnValue<String, String> attachmentType(String value) =>
      _is.ColumnValue(
        table.attachmentType,
        value,
      );

  _is.ColumnValue<String, String> fileName(String value) => _is.ColumnValue(
    table.fileName,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class IssueAttachmentTable extends _is.Table<int?> {
  IssueAttachmentTable({super.tableRelation})
    : super(tableName: 'issue_attachment') {
    updateTable = IssueAttachmentUpdateTable(this);
    issueId = _is.ColumnInt(
      'issueId',
      this,
    );
    uploadedBy = _is.ColumnInt(
      'uploadedBy',
      this,
    );
    fileUrl = _is.ColumnString(
      'fileUrl',
      this,
    );
    attachmentType = _is.ColumnString(
      'attachmentType',
      this,
    );
    fileName = _is.ColumnString(
      'fileName',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final IssueAttachmentUpdateTable updateTable;

  /// Target issue ID
  late final _is.ColumnInt issueId;

  /// User who uploaded the file
  late final _is.ColumnInt uploadedBy;

  /// Storage URL
  late final _is.ColumnString fileUrl;

  /// Attachment role: BEFORE_PHOTO, AFTER_PHOTO, INVOICE, DOCUMENT
  late final _is.ColumnString attachmentType;

  /// Original filename
  late final _is.ColumnString fileName;

  /// Upload timestamp
  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    issueId,
    uploadedBy,
    fileUrl,
    attachmentType,
    fileName,
    createdAt,
  ];
}

class IssueAttachmentInclude extends _is.IncludeObject {
  IssueAttachmentInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => IssueAttachment.t;
}

class IssueAttachmentIncludeList extends _is.IncludeList {
  IssueAttachmentIncludeList._({
    _is.WhereExpressionBuilder<IssueAttachmentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(IssueAttachment.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => IssueAttachment.t;
}

class IssueAttachmentRepository {
  const IssueAttachmentRepository._();

  /// Returns a list of [IssueAttachment]s matching the given query parameters.
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
  Future<List<IssueAttachment>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<IssueAttachmentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<IssueAttachmentTable>? orderBy,
    _is.OrderByListBuilder<IssueAttachmentTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<IssueAttachment>(
      where: where?.call(IssueAttachment.t),
      orderBy: orderBy?.call(IssueAttachment.t),
      orderByList: orderByList?.call(IssueAttachment.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [IssueAttachment] matching the given query parameters.
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
  Future<IssueAttachment?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<IssueAttachmentTable>? where,
    int? offset,
    _is.OrderByBuilder<IssueAttachmentTable>? orderBy,
    _is.OrderByListBuilder<IssueAttachmentTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<IssueAttachment>(
      where: where?.call(IssueAttachment.t),
      orderBy: orderBy?.call(IssueAttachment.t),
      orderByList: orderByList?.call(IssueAttachment.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [IssueAttachment] by its [id] or null if no such row exists.
  Future<IssueAttachment?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<IssueAttachment>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [IssueAttachment]s in the list and returns the inserted rows.
  ///
  /// The returned [IssueAttachment]s will have their `id` fields set.
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
  Future<List<IssueAttachment>> insert(
    _is.DatabaseSession session,
    List<IssueAttachment> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<IssueAttachment>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [IssueAttachment] and returns the inserted row.
  ///
  /// The returned [IssueAttachment] will have its `id` field set.
  Future<IssueAttachment> insertRow(
    _is.DatabaseSession session,
    IssueAttachment row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<IssueAttachment>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [IssueAttachment]s in the list and returns the resulting rows.
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
  /// The returned [IssueAttachment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<IssueAttachment>> upsert(
    _is.DatabaseSession session,
    List<IssueAttachment> rows, {
    required _is.ColumnSelections<IssueAttachmentTable> conflictColumns,
    _is.ColumnSelections<IssueAttachmentTable>? updateColumns,
    _is.WhereExpressionBuilder<IssueAttachmentTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<IssueAttachment>(
      rows,
      conflictColumns: conflictColumns(IssueAttachment.t),
      updateColumns: updateColumns?.call(IssueAttachment.t),
      updateWhere: updateWhere?.call(IssueAttachment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [IssueAttachment] and returns the resulting row.
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
  /// The returned [IssueAttachment] will have its `id` field set.
  Future<IssueAttachment?> upsertRow(
    _is.DatabaseSession session,
    IssueAttachment row, {
    required _is.ColumnSelections<IssueAttachmentTable> conflictColumns,
    _is.ColumnSelections<IssueAttachmentTable>? updateColumns,
    _is.WhereExpressionBuilder<IssueAttachmentTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<IssueAttachment>(
      row,
      conflictColumns: conflictColumns(IssueAttachment.t),
      updateColumns: updateColumns?.call(IssueAttachment.t),
      updateWhere: updateWhere?.call(IssueAttachment.t),
      transaction: transaction,
    );
  }

  /// Updates all [IssueAttachment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<IssueAttachment>> update(
    _is.DatabaseSession session,
    List<IssueAttachment> rows, {
    _is.ColumnSelections<IssueAttachmentTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<IssueAttachment>(
      rows,
      columns: columns?.call(IssueAttachment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [IssueAttachment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<IssueAttachment> updateRow(
    _is.DatabaseSession session,
    IssueAttachment row, {
    _is.ColumnSelections<IssueAttachmentTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<IssueAttachment>(
      row,
      columns: columns?.call(IssueAttachment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [IssueAttachment] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<IssueAttachment?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<IssueAttachmentUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<IssueAttachment>(
      id,
      columnValues: columnValues(IssueAttachment.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [IssueAttachment]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<IssueAttachment>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<IssueAttachmentUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<IssueAttachmentTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<IssueAttachmentTable>? orderBy,
    _is.OrderByListBuilder<IssueAttachmentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<IssueAttachment>(
      columnValues: columnValues(IssueAttachment.t.updateTable),
      where: where(IssueAttachment.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(IssueAttachment.t),
      orderByList: orderByList?.call(IssueAttachment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [IssueAttachment]s in the list and returns the deleted rows.
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
  Future<List<IssueAttachment>> delete(
    _is.DatabaseSession session,
    List<IssueAttachment> rows, {
    _is.OrderByBuilder<IssueAttachmentTable>? orderBy,
    _is.OrderByListBuilder<IssueAttachmentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<IssueAttachment>(
      rows,
      orderBy: orderBy?.call(IssueAttachment.t),
      orderByList: orderByList?.call(IssueAttachment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [IssueAttachment].
  Future<IssueAttachment> deleteRow(
    _is.DatabaseSession session,
    IssueAttachment row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<IssueAttachment>(
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
  Future<List<IssueAttachment>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<IssueAttachmentTable> where,
    _is.OrderByBuilder<IssueAttachmentTable>? orderBy,
    _is.OrderByListBuilder<IssueAttachmentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<IssueAttachment>(
      where: where(IssueAttachment.t),
      orderBy: orderBy?.call(IssueAttachment.t),
      orderByList: orderByList?.call(IssueAttachment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<IssueAttachmentTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<IssueAttachment>(
      where: where?.call(IssueAttachment.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [IssueAttachment] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<IssueAttachmentTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<IssueAttachment>(
      where: where(IssueAttachment.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
