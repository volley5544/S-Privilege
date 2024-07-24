import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuildVersionRecord extends FirestoreRecord {
  BuildVersionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "android_version" field.
  String? _androidVersion;
  String get androidVersion => _androidVersion ?? '';
  bool hasAndroidVersion() => _androidVersion != null;

  // "ios_version" field.
  String? _iosVersion;
  String get iosVersion => _iosVersion ?? '';
  bool hasIosVersion() => _iosVersion != null;

  void _initializeFields() {
    _androidVersion = snapshotData['android_version'] as String?;
    _iosVersion = snapshotData['ios_version'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BuildVersion');

  static Stream<BuildVersionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BuildVersionRecord.fromSnapshot(s));

  static Future<BuildVersionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BuildVersionRecord.fromSnapshot(s));

  static BuildVersionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BuildVersionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BuildVersionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BuildVersionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BuildVersionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BuildVersionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBuildVersionRecordData({
  String? androidVersion,
  String? iosVersion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'android_version': androidVersion,
      'ios_version': iosVersion,
    }.withoutNulls,
  );

  return firestoreData;
}

class BuildVersionRecordDocumentEquality
    implements Equality<BuildVersionRecord> {
  const BuildVersionRecordDocumentEquality();

  @override
  bool equals(BuildVersionRecord? e1, BuildVersionRecord? e2) {
    return e1?.androidVersion == e2?.androidVersion &&
        e1?.iosVersion == e2?.iosVersion;
  }

  @override
  int hash(BuildVersionRecord? e) =>
      const ListEquality().hash([e?.androidVersion, e?.iosVersion]);

  @override
  bool isValidKey(Object? o) => o is BuildVersionRecord;
}
