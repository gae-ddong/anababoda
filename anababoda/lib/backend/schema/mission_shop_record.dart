import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MissionShopRecord extends FirestoreRecord {
  MissionShopRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "createdTimeS" field.
  DateTime? _createdTimeS;
  DateTime? get createdTimeS => _createdTimeS;
  bool hasCreatedTimeS() => _createdTimeS != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _createdTimeS = snapshotData['createdTimeS'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('missionShop');

  static Stream<MissionShopRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MissionShopRecord.fromSnapshot(s));

  static Future<MissionShopRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MissionShopRecord.fromSnapshot(s));

  static MissionShopRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MissionShopRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MissionShopRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MissionShopRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MissionShopRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MissionShopRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMissionShopRecordData({
  String? email,
  DateTime? createdTimeS,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'createdTimeS': createdTimeS,
    }.withoutNulls,
  );

  return firestoreData;
}

class MissionShopRecordDocumentEquality implements Equality<MissionShopRecord> {
  const MissionShopRecordDocumentEquality();

  @override
  bool equals(MissionShopRecord? e1, MissionShopRecord? e2) {
    return e1?.email == e2?.email && e1?.createdTimeS == e2?.createdTimeS;
  }

  @override
  int hash(MissionShopRecord? e) =>
      const ListEquality().hash([e?.email, e?.createdTimeS]);

  @override
  bool isValidKey(Object? o) => o is MissionShopRecord;
}
