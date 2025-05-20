import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DisponibilidadCitaRecord extends FirestoreRecord {
  DisponibilidadCitaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Day" field.
  DateTime? _day;
  DateTime? get day => _day;
  bool hasDay() => _day != null;

  // "listHours" field.
  List<DateTime>? _listHours;
  List<DateTime> get listHours => _listHours ?? const [];
  bool hasListHours() => _listHours != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "barber" field.
  DocumentReference? _barber;
  DocumentReference? get barber => _barber;
  bool hasBarber() => _barber != null;

  void _initializeFields() {
    _day = snapshotData['Day'] as DateTime?;
    _listHours = getDataList(snapshotData['listHours']);
    _user = snapshotData['user'] as DocumentReference?;
    _barber = snapshotData['barber'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('disponibilidadCita');

  static Stream<DisponibilidadCitaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DisponibilidadCitaRecord.fromSnapshot(s));

  static Future<DisponibilidadCitaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DisponibilidadCitaRecord.fromSnapshot(s));

  static DisponibilidadCitaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DisponibilidadCitaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DisponibilidadCitaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DisponibilidadCitaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DisponibilidadCitaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DisponibilidadCitaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDisponibilidadCitaRecordData({
  DateTime? day,
  DocumentReference? user,
  DocumentReference? barber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Day': day,
      'user': user,
      'barber': barber,
    }.withoutNulls,
  );

  return firestoreData;
}

class DisponibilidadCitaRecordDocumentEquality
    implements Equality<DisponibilidadCitaRecord> {
  const DisponibilidadCitaRecordDocumentEquality();

  @override
  bool equals(DisponibilidadCitaRecord? e1, DisponibilidadCitaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.day == e2?.day &&
        listEquality.equals(e1?.listHours, e2?.listHours) &&
        e1?.user == e2?.user &&
        e1?.barber == e2?.barber;
  }

  @override
  int hash(DisponibilidadCitaRecord? e) =>
      const ListEquality().hash([e?.day, e?.listHours, e?.user, e?.barber]);

  @override
  bool isValidKey(Object? o) => o is DisponibilidadCitaRecord;
}
