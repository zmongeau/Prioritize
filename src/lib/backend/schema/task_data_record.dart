import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskDataRecord extends FirestoreRecord {
  TaskDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "due_date" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "priority" field.
  int? _priority;
  int get priority => _priority ?? 0;
  bool hasPriority() => _priority != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  bool hasLabel() => _label != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _completed = snapshotData['completed'] as bool?;
    _dueDate = snapshotData['due_date'] as DateTime?;
    _priority = castToType<int>(snapshotData['priority']);
    _label = snapshotData['label'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TaskData');

  static Stream<TaskDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaskDataRecord.fromSnapshot(s));

  static Future<TaskDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaskDataRecord.fromSnapshot(s));

  static TaskDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TaskDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaskDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaskDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaskDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaskDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaskDataRecordData({
  DocumentReference? user,
  String? title,
  String? description,
  bool? completed,
  DateTime? dueDate,
  int? priority,
  String? label,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'title': title,
      'description': description,
      'completed': completed,
      'due_date': dueDate,
      'priority': priority,
      'label': label,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaskDataRecordDocumentEquality implements Equality<TaskDataRecord> {
  const TaskDataRecordDocumentEquality();

  @override
  bool equals(TaskDataRecord? e1, TaskDataRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.completed == e2?.completed &&
        e1?.dueDate == e2?.dueDate &&
        e1?.priority == e2?.priority &&
        e1?.label == e2?.label;
  }

  @override
  int hash(TaskDataRecord? e) => const ListEquality().hash([
        e?.user,
        e?.title,
        e?.description,
        e?.completed,
        e?.dueDate,
        e?.priority,
        e?.label
      ]);

  @override
  bool isValidKey(Object? o) => o is TaskDataRecord;
}
