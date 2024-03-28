import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "footprint" field.
  int? _footprint;
  int get footprint => _footprint ?? 0;
  bool hasFootprint() => _footprint != null;

  // "coupon" field.
  int? _coupon;
  int get coupon => _coupon ?? 0;
  bool hasCoupon() => _coupon != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "attendance" field.
  bool? _attendance;
  bool get attendance => _attendance ?? false;
  bool hasAttendance() => _attendance != null;

  // "shop" field.
  bool? _shop;
  bool get shop => _shop ?? false;
  bool hasShop() => _shop != null;

  // "taxBills" field.
  bool? _taxBills;
  bool get taxBills => _taxBills ?? false;
  bool hasTaxBills() => _taxBills != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "addr" field.
  String? _addr;
  String get addr => _addr ?? '';
  bool hasAddr() => _addr != null;

  // "footprintLog" field.
  int? _footprintLog;
  int get footprintLog => _footprintLog ?? 0;
  bool hasFootprintLog() => _footprintLog != null;

  // "result" field.
  double? _result;
  double get result => _result ?? 0.0;
  bool hasResult() => _result != null;

  // "walkLog" field.
  double? _walkLog;
  double get walkLog => _walkLog ?? 0.0;
  bool hasWalkLog() => _walkLog != null;

  // "giftcard" field.
  int? _giftcard;
  int get giftcard => _giftcard ?? 0;
  bool hasGiftcard() => _giftcard != null;

  // "discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  bool hasDiscount() => _discount != null;

  // "date_check" field.
  int? _dateCheck;
  int get dateCheck => _dateCheck ?? 0;
  bool hasDateCheck() => _dateCheck != null;

  // "date_start" field.
  DateTime? _dateStart;
  DateTime? get dateStart => _dateStart;
  bool hasDateStart() => _dateStart != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _location = snapshotData['location'] as LatLng?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _footprint = castToType<int>(snapshotData['footprint']);
    _coupon = castToType<int>(snapshotData['coupon']);
    _photoUrl = snapshotData['photo_url'] as String?;
    _attendance = snapshotData['attendance'] as bool?;
    _shop = snapshotData['shop'] as bool?;
    _taxBills = snapshotData['taxBills'] as bool?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _addr = snapshotData['addr'] as String?;
    _footprintLog = castToType<int>(snapshotData['footprintLog']);
    _result = castToType<double>(snapshotData['result']);
    _walkLog = castToType<double>(snapshotData['walkLog']);
    _giftcard = castToType<int>(snapshotData['giftcard']);
    _discount = castToType<int>(snapshotData['discount']);
    _dateCheck = castToType<int>(snapshotData['date_check']);
    _dateStart = snapshotData['date_start'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? displayName,
  String? email,
  String? uid,
  int? age,
  LatLng? location,
  DateTime? createdTime,
  int? footprint,
  int? coupon,
  String? photoUrl,
  bool? attendance,
  bool? shop,
  bool? taxBills,
  String? phoneNumber,
  String? addr,
  int? footprintLog,
  double? result,
  double? walkLog,
  int? giftcard,
  int? discount,
  int? dateCheck,
  DateTime? dateStart,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'email': email,
      'uid': uid,
      'age': age,
      'location': location,
      'created_time': createdTime,
      'footprint': footprint,
      'coupon': coupon,
      'photo_url': photoUrl,
      'attendance': attendance,
      'shop': shop,
      'taxBills': taxBills,
      'phone_number': phoneNumber,
      'addr': addr,
      'footprintLog': footprintLog,
      'result': result,
      'walkLog': walkLog,
      'giftcard': giftcard,
      'discount': discount,
      'date_check': dateCheck,
      'date_start': dateStart,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.displayName == e2?.displayName &&
        e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.age == e2?.age &&
        e1?.location == e2?.location &&
        e1?.createdTime == e2?.createdTime &&
        e1?.footprint == e2?.footprint &&
        e1?.coupon == e2?.coupon &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.attendance == e2?.attendance &&
        e1?.shop == e2?.shop &&
        e1?.taxBills == e2?.taxBills &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.addr == e2?.addr &&
        e1?.footprintLog == e2?.footprintLog &&
        e1?.result == e2?.result &&
        e1?.walkLog == e2?.walkLog &&
        e1?.giftcard == e2?.giftcard &&
        e1?.discount == e2?.discount &&
        e1?.dateCheck == e2?.dateCheck &&
        e1?.dateStart == e2?.dateStart;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.email,
        e?.uid,
        e?.age,
        e?.location,
        e?.createdTime,
        e?.footprint,
        e?.coupon,
        e?.photoUrl,
        e?.attendance,
        e?.shop,
        e?.taxBills,
        e?.phoneNumber,
        e?.addr,
        e?.footprintLog,
        e?.result,
        e?.walkLog,
        e?.giftcard,
        e?.discount,
        e?.dateCheck,
        e?.dateStart
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
