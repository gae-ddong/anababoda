import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FootprintsLogRecord extends FirestoreRecord {
  FootprintsLogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "from" field.
  String? _from;
  String get from => _from ?? '';
  bool hasFrom() => _from != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "footLog" field.
  int? _footLog;
  int get footLog => _footLog ?? 0;
  bool hasFootLog() => _footLog != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _from = snapshotData['from'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _footLog = castToType<int>(snapshotData['footLog']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('footprintsLog');

  static Stream<FootprintsLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FootprintsLogRecord.fromSnapshot(s));

  static Future<FootprintsLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FootprintsLogRecord.fromSnapshot(s));

  static FootprintsLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FootprintsLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FootprintsLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FootprintsLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FootprintsLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FootprintsLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFootprintsLogRecordData({
  String? email,
  String? from,
  DateTime? time,
  int? footLog,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'from': from,
      'time': time,
      'footLog': footLog,
    }.withoutNulls,
  );

  return firestoreData;
}

class FootprintsLogRecordDocumentEquality
    implements Equality<FootprintsLogRecord> {
  const FootprintsLogRecordDocumentEquality();

  @override
  bool equals(FootprintsLogRecord? e1, FootprintsLogRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.from == e2?.from &&
        e1?.time == e2?.time &&
        e1?.footLog == e2?.footLog;
  }

  @override
  int hash(FootprintsLogRecord? e) =>
      const ListEquality().hash([e?.email, e?.from, e?.time, e?.footLog]);

  @override
  bool isValidKey(Object? o) => o is FootprintsLogRecord;
}
