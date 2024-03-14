import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DateRecord extends FirestoreRecord {
  DateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createdTimeA" field.
  DateTime? _createdTimeA;
  DateTime? get createdTimeA => _createdTimeA;
  bool hasCreatedTimeA() => _createdTimeA != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "createdTimeS" field.
  DateTime? _createdTimeS;
  DateTime? get createdTimeS => _createdTimeS;
  bool hasCreatedTimeS() => _createdTimeS != null;

  // "createdTimeW" field.
  DateTime? _createdTimeW;
  DateTime? get createdTimeW => _createdTimeW;
  bool hasCreatedTimeW() => _createdTimeW != null;

  void _initializeFields() {
    _createdTimeA = snapshotData['createdTimeA'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _createdTimeS = snapshotData['createdTimeS'] as DateTime?;
    _createdTimeW = snapshotData['createdTimeW'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('date');

  static Stream<DateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DateRecord.fromSnapshot(s));

  static Future<DateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DateRecord.fromSnapshot(s));

  static DateRecord fromSnapshot(DocumentSnapshot snapshot) => DateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDateRecordData({
  DateTime? createdTimeA,
  String? email,
  DateTime? createdTimeS,
  DateTime? createdTimeW,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdTimeA': createdTimeA,
      'email': email,
      'createdTimeS': createdTimeS,
      'createdTimeW': createdTimeW,
    }.withoutNulls,
  );

  return firestoreData;
}

class DateRecordDocumentEquality implements Equality<DateRecord> {
  const DateRecordDocumentEquality();

  @override
  bool equals(DateRecord? e1, DateRecord? e2) {
    return e1?.createdTimeA == e2?.createdTimeA &&
        e1?.email == e2?.email &&
        e1?.createdTimeS == e2?.createdTimeS &&
        e1?.createdTimeW == e2?.createdTimeW;
  }

  @override
  int hash(DateRecord? e) => const ListEquality()
      .hash([e?.createdTimeA, e?.email, e?.createdTimeS, e?.createdTimeW]);

  @override
  bool isValidKey(Object? o) => o is DateRecord;
}
