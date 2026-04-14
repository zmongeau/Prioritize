import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Where user rating information is
class RatingsRecord extends FirestoreRecord {
  RatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  // "Stars" field.
  int? _stars;
  int get stars => _stars ?? 0;
  bool hasStars() => _stars != null;

  // "Timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "UserID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  void _initializeFields() {
    _feedback = snapshotData['Feedback'] as String?;
    _stars = castToType<int>(snapshotData['Stars']);
    _timestamp = snapshotData['Timestamp'] as DateTime?;
    _userID = snapshotData['UserID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ratings');

  static Stream<RatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingsRecord.fromSnapshot(s));

  static Future<RatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingsRecord.fromSnapshot(s));

  static RatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingsRecordData({
  String? feedback,
  int? stars,
  DateTime? timestamp,
  String? userID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Feedback': feedback,
      'Stars': stars,
      'Timestamp': timestamp,
      'UserID': userID,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingsRecordDocumentEquality implements Equality<RatingsRecord> {
  const RatingsRecordDocumentEquality();

  @override
  bool equals(RatingsRecord? e1, RatingsRecord? e2) {
    return e1?.feedback == e2?.feedback &&
        e1?.stars == e2?.stars &&
        e1?.timestamp == e2?.timestamp &&
        e1?.userID == e2?.userID;
  }

  @override
  int hash(RatingsRecord? e) => const ListEquality()
      .hash([e?.feedback, e?.stars, e?.timestamp, e?.userID]);

  @override
  bool isValidKey(Object? o) => o is RatingsRecord;
}
