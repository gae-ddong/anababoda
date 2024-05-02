import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaxbillRecord extends FirestoreRecord {
  TaxbillRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "cumulativeUsage" field.
  int? _cumulativeUsage;
  int get cumulativeUsage => _cumulativeUsage ?? 0;
  bool hasCumulativeUsage() => _cumulativeUsage != null;

  // "previousUsage" field.
  int? _previousUsage;
  int get previousUsage => _previousUsage ?? 0;
  bool hasPreviousUsage() => _previousUsage != null;

  // "clientNum" field.
  String? _clientNum;
  String get clientNum => _clientNum ?? '';
  bool hasClientNum() => _clientNum != null;

  // "taxMonth" field.
  String? _taxMonth;
  String get taxMonth => _taxMonth ?? '';
  bool hasTaxMonth() => _taxMonth != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _cumulativeUsage = castToType<int>(snapshotData['cumulativeUsage']);
    _previousUsage = castToType<int>(snapshotData['previousUsage']);
    _clientNum = snapshotData['clientNum'] as String?;
    _taxMonth = snapshotData['taxMonth'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('taxbill');

  static Stream<TaxbillRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaxbillRecord.fromSnapshot(s));

  static Future<TaxbillRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaxbillRecord.fromSnapshot(s));

  static TaxbillRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TaxbillRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaxbillRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaxbillRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaxbillRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaxbillRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaxbillRecordData({
  String? email,
  int? cumulativeUsage,
  int? previousUsage,
  String? clientNum,
  String? taxMonth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'cumulativeUsage': cumulativeUsage,
      'previousUsage': previousUsage,
      'clientNum': clientNum,
      'taxMonth': taxMonth,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaxbillRecordDocumentEquality implements Equality<TaxbillRecord> {
  const TaxbillRecordDocumentEquality();

  @override
  bool equals(TaxbillRecord? e1, TaxbillRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.cumulativeUsage == e2?.cumulativeUsage &&
        e1?.previousUsage == e2?.previousUsage &&
        e1?.clientNum == e2?.clientNum &&
        e1?.taxMonth == e2?.taxMonth;
  }

  @override
  int hash(TaxbillRecord? e) => const ListEquality().hash([
        e?.email,
        e?.cumulativeUsage,
        e?.previousUsage,
        e?.clientNum,
        e?.taxMonth
      ]);

  @override
  bool isValidKey(Object? o) => o is TaxbillRecord;
}
