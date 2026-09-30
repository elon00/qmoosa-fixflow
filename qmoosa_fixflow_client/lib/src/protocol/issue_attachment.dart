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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

/// Evidence attachment (photographs, receipts, work orders)
abstract class IssueAttachment
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
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
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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

  /// Returns a shallow copy of this [IssueAttachment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
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

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
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
  @_isc.useResult
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
