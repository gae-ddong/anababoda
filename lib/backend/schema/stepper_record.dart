import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StepperRecord extends FirestoreRecord {
  StepperRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "walkLog" field.
  int? _walkLog;
  int get walkLog => _walkLog ?? 0;
  bool hasWalkLog() => _walkLog != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "checked" field.
  bool? _checked;
  bool get checked => _checked ?? false;
  bool hasChecked() => _checked != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _walkLog = castToType<int>(snapshotData['walkLog']);
    _date = snapshotData['date'] as DateTime?;
    _checked = snapshotData['checked'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stepper');

  static Stream<StepperRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StepperRecord.fromSnapshot(s));

  static Future<StepperRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StepperRecord.fromSnapshot(s));

  static StepperRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StepperRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StepperRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StepperRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StepperRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StepperRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStepperRecordData({
  String? email,
  int? walkLog,
  DateTime? date,
  bool? checked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'walkLog': walkLog,
      'date': date,
      'checked': checked,
    }.withoutNulls,
  );

  return firestoreData;
}

class StepperRecordDocumentEquality implements Equality<StepperRecord> {
  const StepperRecordDocumentEquality();

  @override
  bool equals(StepperRecord? e1, StepperRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.walkLog == e2?.walkLog &&
        e1?.date == e2?.date &&
        e1?.checked == e2?.checked;
  }

  @override
  int hash(StepperRecord? e) =>
      const ListEquality().hash([e?.email, e?.walkLog, e?.date, e?.checked]);

  @override
  bool isValidKey(Object? o) => o is StepperRecord;
}
