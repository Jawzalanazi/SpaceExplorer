import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QuestionCRecord extends FirestoreRecord {
  QuestionCRecord._(
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
          ? parent.collection('questionC')
          : FirebaseFirestore.instance.collectionGroup('questionC');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('questionC').doc(id);

  static Stream<QuestionCRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionCRecord.fromSnapshot(s));

  static Future<QuestionCRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionCRecord.fromSnapshot(s));

  static QuestionCRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionCRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionCRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionCRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionCRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionCRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionCRecordData({
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

class QuestionCRecordDocumentEquality implements Equality<QuestionCRecord> {
  const QuestionCRecordDocumentEquality();

  @override
  bool equals(QuestionCRecord? e1, QuestionCRecord? e2) {
    return e1?.question == e2?.question && e1?.right == e2?.right;
  }

  @override
  int hash(QuestionCRecord? e) =>
      const ListEquality().hash([e?.question, e?.right]);

  @override
  bool isValidKey(Object? o) => o is QuestionCRecord;
}
