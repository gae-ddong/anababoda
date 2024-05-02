import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransportRecord extends FirestoreRecord {
  TransportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "transportDate" field.
  DateTime? _transportDate;
  DateTime? get transportDate => _transportDate;
  bool hasTransportDate() => _transportDate != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _transportDate = snapshotData['transportDate'] as DateTime?;
    _price = castToType<int>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transport');

  static Stream<TransportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransportRecord.fromSnapshot(s));

  static Future<TransportRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransportRecord.fromSnapshot(s));

  static TransportRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransportRecordData({
  String? email,
  DateTime? transportDate,
  int? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'transportDate': transportDate,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransportRecordDocumentEquality implements Equality<TransportRecord> {
  const TransportRecordDocumentEquality();

  @override
  bool equals(TransportRecord? e1, TransportRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.transportDate == e2?.transportDate &&
        e1?.price == e2?.price;
  }

  @override
  int hash(TransportRecord? e) =>
      const ListEquality().hash([e?.email, e?.transportDate, e?.price]);

  @override
  bool isValidKey(Object? o) => o is TransportRecord;
}
