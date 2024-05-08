import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TumblrRecord extends FirestoreRecord {
  TumblrRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uploadDate" field.
  DateTime? _uploadDate;
  DateTime? get uploadDate => _uploadDate;
  bool hasUploadDate() => _uploadDate != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _uploadDate = snapshotData['uploadDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tumblr');

  static Stream<TumblrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TumblrRecord.fromSnapshot(s));

  static Future<TumblrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TumblrRecord.fromSnapshot(s));

  static TumblrRecord fromSnapshot(DocumentSnapshot snapshot) => TumblrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TumblrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TumblrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TumblrRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TumblrRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTumblrRecordData({
  String? email,
  DateTime? uploadDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'uploadDate': uploadDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class TumblrRecordDocumentEquality implements Equality<TumblrRecord> {
  const TumblrRecordDocumentEquality();

  @override
  bool equals(TumblrRecord? e1, TumblrRecord? e2) {
    return e1?.email == e2?.email && e1?.uploadDate == e2?.uploadDate;
  }

  @override
  int hash(TumblrRecord? e) =>
      const ListEquality().hash([e?.email, e?.uploadDate]);

  @override
  bool isValidKey(Object? o) => o is TumblrRecord;
}
