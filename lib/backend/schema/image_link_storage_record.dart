import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageLinkStorageRecord extends FirestoreRecord {
  ImageLinkStorageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "card_image" field.
  List<String>? _cardImage;
  List<String> get cardImage => _cardImage ?? const [];
  bool hasCardImage() => _cardImage != null;

  // "banner_image" field.
  List<String>? _bannerImage;
  List<String> get bannerImage => _bannerImage ?? const [];
  bool hasBannerImage() => _bannerImage != null;

  void _initializeFields() {
    _cardImage = getDataList(snapshotData['card_image']);
    _bannerImage = getDataList(snapshotData['banner_image']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ImageLinkStorage');

  static Stream<ImageLinkStorageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImageLinkStorageRecord.fromSnapshot(s));

  static Future<ImageLinkStorageRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ImageLinkStorageRecord.fromSnapshot(s));

  static ImageLinkStorageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ImageLinkStorageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImageLinkStorageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImageLinkStorageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImageLinkStorageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImageLinkStorageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImageLinkStorageRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ImageLinkStorageRecordDocumentEquality
    implements Equality<ImageLinkStorageRecord> {
  const ImageLinkStorageRecordDocumentEquality();

  @override
  bool equals(ImageLinkStorageRecord? e1, ImageLinkStorageRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.cardImage, e2?.cardImage) &&
        listEquality.equals(e1?.bannerImage, e2?.bannerImage);
  }

  @override
  int hash(ImageLinkStorageRecord? e) =>
      const ListEquality().hash([e?.cardImage, e?.bannerImage]);

  @override
  bool isValidKey(Object? o) => o is ImageLinkStorageRecord;
}
