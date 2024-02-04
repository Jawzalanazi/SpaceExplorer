import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QuizezRecord extends FirestoreRecord {
  QuizezRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "prizelook" field.
  String? _prizelook;
  String get prizelook => _prizelook ?? '';
  bool hasPrizelook() => _prizelook != null;

  // "prizename" field.
  String? _prizename;
  String get prizename => _prizename ?? '';
  bool hasPrizename() => _prizename != null;

  // "haswon" field.
  bool? _haswon;
  bool get haswon => _haswon ?? false;
  bool hasHaswon() => _haswon != null;

  // "allprizes" field.
  List<int>? _allprizes;
  List<int> get allprizes => _allprizes ?? const [];
  bool hasAllprizes() => _allprizes != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  void _initializeFields() {
    _prizelook = snapshotData['prizelook'] as String?;
    _prizename = snapshotData['prizename'] as String?;
    _haswon = snapshotData['haswon'] as bool?;
    _allprizes = getDataList(snapshotData['allprizes']);
    _question = snapshotData['question'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizez');

  static Stream<QuizezRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizezRecord.fromSnapshot(s));

  static Future<QuizezRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizezRecord.fromSnapshot(s));

  static QuizezRecord fromSnapshot(DocumentSnapshot snapshot) => QuizezRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizezRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizezRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizezRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizezRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizezRecordData({
  String? prizelook,
  String? prizename,
  bool? haswon,
  String? question,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prizelook': prizelook,
      'prizename': prizename,
      'haswon': haswon,
      'question': question,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizezRecordDocumentEquality implements Equality<QuizezRecord> {
  const QuizezRecordDocumentEquality();

  @override
  bool equals(QuizezRecord? e1, QuizezRecord? e2) {
    const listEquality = ListEquality();
    return e1?.prizelook == e2?.prizelook &&
        e1?.prizename == e2?.prizename &&
        e1?.haswon == e2?.haswon &&
        listEquality.equals(e1?.allprizes, e2?.allprizes) &&
        e1?.question == e2?.question;
  }

  @override
  int hash(QuizezRecord? e) => const ListEquality()
      .hash([e?.prizelook, e?.prizename, e?.haswon, e?.allprizes, e?.question]);

  @override
  bool isValidKey(Object? o) => o is QuizezRecord;
}
