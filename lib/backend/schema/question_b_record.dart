import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QuestionBRecord extends FirestoreRecord {
  QuestionBRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "Right" field.
  bool? _right;
  bool get right => _right ?? false;
  bool hasRight() => _right != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _right = snapshotData['Right'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('questionB')
          : FirebaseFirestore.instance.collectionGroup('questionB');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('questionB').doc(id);

  static Stream<QuestionBRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionBRecord.fromSnapshot(s));

  static Future<QuestionBRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionBRecord.fromSnapshot(s));

  static QuestionBRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionBRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionBRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionBRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionBRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionBRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionBRecordData({
  String? question,
  bool? right,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'Right': right,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionBRecordDocumentEquality implements Equality<QuestionBRecord> {
  const QuestionBRecordDocumentEquality();

  @override
  bool equals(QuestionBRecord? e1, QuestionBRecord? e2) {
    return e1?.question == e2?.question && e1?.right == e2?.right;
  }

  @override
  int hash(QuestionBRecord? e) =>
      const ListEquality().hash([e?.question, e?.right]);

  @override
  bool isValidKey(Object? o) => o is QuestionBRecord;
}
