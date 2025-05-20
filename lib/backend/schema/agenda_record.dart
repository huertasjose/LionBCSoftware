import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendaRecord extends FirestoreRecord {
  AgendaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "day" field.
  DateTime? _day;
  DateTime? get day => _day;
  bool hasDay() => _day != null;

  // "hour" field.
  DateTime? _hour;
  DateTime? get hour => _hour;
  bool hasHour() => _hour != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "agendador" field.
  DocumentReference? _agendador;
  DocumentReference? get agendador => _agendador;
  bool hasAgendador() => _agendador != null;

  void _initializeFields() {
    _day = snapshotData['day'] as DateTime?;
    _hour = snapshotData['hour'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _agendador = snapshotData['agendador'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('agenda');

  static Stream<AgendaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgendaRecord.fromSnapshot(s));

  static Future<AgendaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgendaRecord.fromSnapshot(s));

  static AgendaRecord fromSnapshot(DocumentSnapshot snapshot) => AgendaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgendaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgendaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgendaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgendaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgendaRecordData({
  DateTime? day,
  DateTime? hour,
  DocumentReference? user,
  DocumentReference? agendador,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
      'hour': hour,
      'user': user,
      'agendador': agendador,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgendaRecordDocumentEquality implements Equality<AgendaRecord> {
  const AgendaRecordDocumentEquality();

  @override
  bool equals(AgendaRecord? e1, AgendaRecord? e2) {
    return e1?.day == e2?.day &&
        e1?.hour == e2?.hour &&
        e1?.user == e2?.user &&
        e1?.agendador == e2?.agendador;
  }

  @override
  int hash(AgendaRecord? e) =>
      const ListEquality().hash([e?.day, e?.hour, e?.user, e?.agendador]);

  @override
  bool isValidKey(Object? o) => o is AgendaRecord;
}
