import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceRecord extends FirestoreRecord {
  AttendanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "dateCheck" field.
  int? _dateCheck;
  int get dateCheck => _dateCheck ?? 0;
  bool hasDateCheck() => _dateCheck != null;

  // "checkSeven" field.
  bool? _checkSeven;
  bool get checkSeven => _checkSeven ?? false;
  bool hasCheckSeven() => _checkSeven != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _dateCheck = castToType<int>(snapshotData['dateCheck']);
    _checkSeven = snapshotData['checkSeven'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendance');

  static Stream<AttendanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceRecord.fromSnapshot(s));

  static Future<AttendanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceRecord.fromSnapshot(s));

  static AttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceRecordData({
  String? email,
  DateTime? startDate,
  int? dateCheck,
  bool? checkSeven,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'startDate': startDate,
      'dateCheck': dateCheck,
      'checkSeven': checkSeven,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendanceRecordDocumentEquality implements Equality<AttendanceRecord> {
  const AttendanceRecordDocumentEquality();

  @override
  bool equals(AttendanceRecord? e1, AttendanceRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.startDate == e2?.startDate &&
        e1?.dateCheck == e2?.dateCheck &&
        e1?.checkSeven == e2?.checkSeven;
  }

  @override
  int hash(AttendanceRecord? e) => const ListEquality()
      .hash([e?.email, e?.startDate, e?.dateCheck, e?.checkSeven]);

  @override
  bool isValidKey(Object? o) => o is AttendanceRecord;
}
