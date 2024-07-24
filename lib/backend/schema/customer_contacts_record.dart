import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerContactsRecord extends FirestoreRecord {
  CustomerContactsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "contacts_name" field.
  List<String>? _contactsName;
  List<String> get contactsName => _contactsName ?? const [];
  bool hasContactsName() => _contactsName != null;

  // "contact_is_called" field.
  List<bool>? _contactIsCalled;
  List<bool> get contactIsCalled => _contactIsCalled ?? const [];
  bool hasContactIsCalled() => _contactIsCalled != null;

  // "contacts_number" field.
  List<String>? _contactsNumber;
  List<String> get contactsNumber => _contactsNumber ?? const [];
  bool hasContactsNumber() => _contactsNumber != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "customer_phone_number" field.
  String? _customerPhoneNumber;
  String get customerPhoneNumber => _customerPhoneNumber ?? '';
  bool hasCustomerPhoneNumber() => _customerPhoneNumber != null;

  // "operating_system" field.
  String? _operatingSystem;
  String get operatingSystem => _operatingSystem ?? '';
  bool hasOperatingSystem() => _operatingSystem != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "id_card" field.
  String? _idCard;
  String get idCard => _idCard ?? '';
  bool hasIdCard() => _idCard != null;

  // "vehicle_registration" field.
  String? _vehicleRegistration;
  String get vehicleRegistration => _vehicleRegistration ?? '';
  bool hasVehicleRegistration() => _vehicleRegistration != null;

  void _initializeFields() {
    _contactsName = getDataList(snapshotData['contacts_name']);
    _contactIsCalled = getDataList(snapshotData['contact_is_called']);
    _contactsNumber = getDataList(snapshotData['contacts_number']);
    _createdDate = snapshotData['created_date'] as DateTime?;
    _customerPhoneNumber = snapshotData['customer_phone_number'] as String?;
    _operatingSystem = snapshotData['operating_system'] as String?;
    _name = snapshotData['name'] as String?;
    _idCard = snapshotData['id_card'] as String?;
    _vehicleRegistration = snapshotData['vehicle_registration'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CustomerContacts');

  static Stream<CustomerContactsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerContactsRecord.fromSnapshot(s));

  static Future<CustomerContactsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CustomerContactsRecord.fromSnapshot(s));

  static CustomerContactsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerContactsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerContactsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerContactsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerContactsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerContactsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerContactsRecordData({
  DateTime? createdDate,
  String? customerPhoneNumber,
  String? operatingSystem,
  String? name,
  String? idCard,
  String? vehicleRegistration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_date': createdDate,
      'customer_phone_number': customerPhoneNumber,
      'operating_system': operatingSystem,
      'name': name,
      'id_card': idCard,
      'vehicle_registration': vehicleRegistration,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerContactsRecordDocumentEquality
    implements Equality<CustomerContactsRecord> {
  const CustomerContactsRecordDocumentEquality();

  @override
  bool equals(CustomerContactsRecord? e1, CustomerContactsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.contactsName, e2?.contactsName) &&
        listEquality.equals(e1?.contactIsCalled, e2?.contactIsCalled) &&
        listEquality.equals(e1?.contactsNumber, e2?.contactsNumber) &&
        e1?.createdDate == e2?.createdDate &&
        e1?.customerPhoneNumber == e2?.customerPhoneNumber &&
        e1?.operatingSystem == e2?.operatingSystem &&
        e1?.name == e2?.name &&
        e1?.idCard == e2?.idCard &&
        e1?.vehicleRegistration == e2?.vehicleRegistration;
  }

  @override
  int hash(CustomerContactsRecord? e) => const ListEquality().hash([
        e?.contactsName,
        e?.contactIsCalled,
        e?.contactsNumber,
        e?.createdDate,
        e?.customerPhoneNumber,
        e?.operatingSystem,
        e?.name,
        e?.idCard,
        e?.vehicleRegistration
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomerContactsRecord;
}
