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

/// Physical facility location (room, floor, wing)
abstract class FacilityLocation
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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

  static final t = FacilityLocationTable();

  static const db = FacilityLocationRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [FacilityLocation]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static FacilityLocationInclude include() {
    return FacilityLocationInclude._();
  }

  static FacilityLocationIncludeList includeList({
    _is.WhereExpressionBuilder<FacilityLocationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FacilityLocationTable>? orderBy,
    _is.OrderByListBuilder<FacilityLocationTable>? orderByList,
    FacilityLocationInclude? include,
  }) {
    return FacilityLocationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FacilityLocation.t),
      orderByList: orderByList?.call(FacilityLocation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class FacilityLocationUpdateTable
    extends _is.UpdateTable<FacilityLocationTable> {
  FacilityLocationUpdateTable(super.table);

  _is.ColumnValue<int, int> workspaceId(int value) => _is.ColumnValue(
    table.workspaceId,
    value,
  );

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<String, String> building(String value) => _is.ColumnValue(
    table.building,
    value,
  );

  _is.ColumnValue<String, String> floor(String value) => _is.ColumnValue(
    table.floor,
    value,
  );

  _is.ColumnValue<String, String> room(String value) => _is.ColumnValue(
    table.room,
    value,
  );
}

class FacilityLocationTable extends _is.Table<int?> {
  FacilityLocationTable({super.tableRelation})
    : super(tableName: 'facility_location') {
    updateTable = FacilityLocationUpdateTable(this);
    workspaceId = _is.ColumnInt(
      'workspaceId',
      this,
    );
    name = _is.ColumnString(
      'name',
      this,
    );
    building = _is.ColumnString(
      'building',
      this,
    );
    floor = _is.ColumnString(
      'floor',
      this,
    );
    room = _is.ColumnString(
      'room',
      this,
    );
  }

  late final FacilityLocationUpdateTable updateTable;

  /// Target workspace
  late final _is.ColumnInt workspaceId;

  /// Common location name (e.g. "Server Room B2", "Unit 401")
  late final _is.ColumnString name;

  /// Building designation
  late final _is.ColumnString building;

  /// Floor number or code
  late final _is.ColumnString floor;

  /// Room number or identifier
  late final _is.ColumnString room;

  @override
  List<_is.Column> get columns => [
    id,
    workspaceId,
    name,
    building,
    floor,
    room,
  ];
}

class FacilityLocationInclude extends _is.IncludeObject {
  FacilityLocationInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => FacilityLocation.t;
}

class FacilityLocationIncludeList extends _is.IncludeList {
  FacilityLocationIncludeList._({
    _is.WhereExpressionBuilder<FacilityLocationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FacilityLocation.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => FacilityLocation.t;
}

class FacilityLocationRepository {
  const FacilityLocationRepository._();

  /// Returns a list of [FacilityLocation]s matching the given query parameters.
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
  Future<List<FacilityLocation>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FacilityLocationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FacilityLocationTable>? orderBy,
    _is.OrderByListBuilder<FacilityLocationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<FacilityLocation>(
      where: where?.call(FacilityLocation.t),
      orderBy: orderBy?.call(FacilityLocation.t),
      orderByList: orderByList?.call(FacilityLocation.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [FacilityLocation] matching the given query parameters.
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
  Future<FacilityLocation?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FacilityLocationTable>? where,
    int? offset,
    _is.OrderByBuilder<FacilityLocationTable>? orderBy,
    _is.OrderByListBuilder<FacilityLocationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<FacilityLocation>(
      where: where?.call(FacilityLocation.t),
      orderBy: orderBy?.call(FacilityLocation.t),
      orderByList: orderByList?.call(FacilityLocation.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [FacilityLocation] by its [id] or null if no such row exists.
  Future<FacilityLocation?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<FacilityLocation>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [FacilityLocation]s in the list and returns the inserted rows.
  ///
  /// The returned [FacilityLocation]s will have their `id` fields set.
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
  Future<List<FacilityLocation>> insert(
    _is.DatabaseSession session,
    List<FacilityLocation> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<FacilityLocation>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [FacilityLocation] and returns the inserted row.
  ///
  /// The returned [FacilityLocation] will have its `id` field set.
  Future<FacilityLocation> insertRow(
    _is.DatabaseSession session,
    FacilityLocation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<FacilityLocation>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [FacilityLocation]s in the list and returns the resulting rows.
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
  /// The returned [FacilityLocation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FacilityLocation>> upsert(
    _is.DatabaseSession session,
    List<FacilityLocation> rows, {
    required _is.ColumnSelections<FacilityLocationTable> conflictColumns,
    _is.ColumnSelections<FacilityLocationTable>? updateColumns,
    _is.WhereExpressionBuilder<FacilityLocationTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<FacilityLocation>(
      rows,
      conflictColumns: conflictColumns(FacilityLocation.t),
      updateColumns: updateColumns?.call(FacilityLocation.t),
      updateWhere: updateWhere?.call(FacilityLocation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [FacilityLocation] and returns the resulting row.
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
  /// The returned [FacilityLocation] will have its `id` field set.
  Future<FacilityLocation?> upsertRow(
    _is.DatabaseSession session,
    FacilityLocation row, {
    required _is.ColumnSelections<FacilityLocationTable> conflictColumns,
    _is.ColumnSelections<FacilityLocationTable>? updateColumns,
    _is.WhereExpressionBuilder<FacilityLocationTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<FacilityLocation>(
      row,
      conflictColumns: conflictColumns(FacilityLocation.t),
      updateColumns: updateColumns?.call(FacilityLocation.t),
      updateWhere: updateWhere?.call(FacilityLocation.t),
      transaction: transaction,
    );
  }

  /// Updates all [FacilityLocation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FacilityLocation>> update(
    _is.DatabaseSession session,
    List<FacilityLocation> rows, {
    _is.ColumnSelections<FacilityLocationTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<FacilityLocation>(
      rows,
      columns: columns?.call(FacilityLocation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [FacilityLocation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<FacilityLocation> updateRow(
    _is.DatabaseSession session,
    FacilityLocation row, {
    _is.ColumnSelections<FacilityLocationTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<FacilityLocation>(
      row,
      columns: columns?.call(FacilityLocation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FacilityLocation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<FacilityLocation?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<FacilityLocationUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<FacilityLocation>(
      id,
      columnValues: columnValues(FacilityLocation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [FacilityLocation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FacilityLocation>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<FacilityLocationUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<FacilityLocationTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FacilityLocationTable>? orderBy,
    _is.OrderByListBuilder<FacilityLocationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<FacilityLocation>(
      columnValues: columnValues(FacilityLocation.t.updateTable),
      where: where(FacilityLocation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FacilityLocation.t),
      orderByList: orderByList?.call(FacilityLocation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [FacilityLocation]s in the list and returns the deleted rows.
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
  Future<List<FacilityLocation>> delete(
    _is.DatabaseSession session,
    List<FacilityLocation> rows, {
    _is.OrderByBuilder<FacilityLocationTable>? orderBy,
    _is.OrderByListBuilder<FacilityLocationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<FacilityLocation>(
      rows,
      orderBy: orderBy?.call(FacilityLocation.t),
      orderByList: orderByList?.call(FacilityLocation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [FacilityLocation].
  Future<FacilityLocation> deleteRow(
    _is.DatabaseSession session,
    FacilityLocation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FacilityLocation>(
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
  Future<List<FacilityLocation>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FacilityLocationTable> where,
    _is.OrderByBuilder<FacilityLocationTable>? orderBy,
    _is.OrderByListBuilder<FacilityLocationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<FacilityLocation>(
      where: where(FacilityLocation.t),
      orderBy: orderBy?.call(FacilityLocation.t),
      orderByList: orderByList?.call(FacilityLocation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FacilityLocationTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<FacilityLocation>(
      where: where?.call(FacilityLocation.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [FacilityLocation] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FacilityLocationTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<FacilityLocation>(
      where: where(FacilityLocation.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
