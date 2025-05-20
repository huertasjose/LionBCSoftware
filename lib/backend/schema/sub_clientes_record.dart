import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubClientesRecord extends FirestoreRecord {
  SubClientesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Citas" field.
  DocumentReference? _citas;
  DocumentReference? get citas => _citas;
  bool hasCitas() => _citas != null;

  // "HistorialCompras" field.
  DocumentReference? _historialCompras;
  DocumentReference? get historialCompras => _historialCompras;
  bool hasHistorialCompras() => _historialCompras != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _citas = snapshotData['Citas'] as DocumentReference?;
    _historialCompras = snapshotData['HistorialCompras'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SubClientes')
          : FirebaseFirestore.instance.collectionGroup('SubClientes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SubClientes').doc(id);

  static Stream<SubClientesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubClientesRecord.fromSnapshot(s));

  static Future<SubClientesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubClientesRecord.fromSnapshot(s));

  static SubClientesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubClientesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubClientesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubClientesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubClientesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubClientesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubClientesRecordData({
  DocumentReference? citas,
  DocumentReference? historialCompras,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Citas': citas,
      'HistorialCompras': historialCompras,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubClientesRecordDocumentEquality implements Equality<SubClientesRecord> {
  const SubClientesRecordDocumentEquality();

  @override
  bool equals(SubClientesRecord? e1, SubClientesRecord? e2) {
    return e1?.citas == e2?.citas &&
        e1?.historialCompras == e2?.historialCompras;
  }

  @override
  int hash(SubClientesRecord? e) =>
      const ListEquality().hash([e?.citas, e?.historialCompras]);

  @override
  bool isValidKey(Object? o) => o is SubClientesRecord;
}
