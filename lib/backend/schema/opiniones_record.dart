import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OpinionesRecord extends FirestoreRecord {
  OpinionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mensaje" field.
  String? _mensaje;
  String get mensaje => _mensaje ?? '';
  bool hasMensaje() => _mensaje != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  void _initializeFields() {
    _mensaje = snapshotData['mensaje'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('opiniones');

  static Stream<OpinionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OpinionesRecord.fromSnapshot(s));

  static Future<OpinionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OpinionesRecord.fromSnapshot(s));

  static OpinionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OpinionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OpinionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OpinionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OpinionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OpinionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOpinionesRecordData({
  String? mensaje,
  DateTime? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mensaje': mensaje,
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class OpinionesRecordDocumentEquality implements Equality<OpinionesRecord> {
  const OpinionesRecordDocumentEquality();

  @override
  bool equals(OpinionesRecord? e1, OpinionesRecord? e2) {
    return e1?.mensaje == e2?.mensaje && e1?.fecha == e2?.fecha;
  }

  @override
  int hash(OpinionesRecord? e) =>
      const ListEquality().hash([e?.mensaje, e?.fecha]);

  @override
  bool isValidKey(Object? o) => o is OpinionesRecord;
}
