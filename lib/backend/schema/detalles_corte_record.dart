import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetallesCorteRecord extends FirestoreRecord {
  DetallesCorteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_detalle" field.
  String? _idDetalle;
  String get idDetalle => _idDetalle ?? '';
  bool hasIdDetalle() => _idDetalle != null;

  // "transaccion_id" field.
  DocumentReference? _transaccionId;
  DocumentReference? get transaccionId => _transaccionId;
  bool hasTransaccionId() => _transaccionId != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "venta_id" field.
  DocumentReference? _ventaId;
  DocumentReference? get ventaId => _ventaId;
  bool hasVentaId() => _ventaId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idDetalle = snapshotData['id_detalle'] as String?;
    _transaccionId = snapshotData['transaccion_id'] as DocumentReference?;
    _tipo = snapshotData['tipo'] as String?;
    _monto = castToType<double>(snapshotData['monto']);
    _ventaId = snapshotData['venta_id'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('DetallesCorte')
          : FirebaseFirestore.instance.collectionGroup('DetallesCorte');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('DetallesCorte').doc(id);

  static Stream<DetallesCorteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DetallesCorteRecord.fromSnapshot(s));

  static Future<DetallesCorteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DetallesCorteRecord.fromSnapshot(s));

  static DetallesCorteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DetallesCorteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DetallesCorteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DetallesCorteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DetallesCorteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DetallesCorteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDetallesCorteRecordData({
  String? idDetalle,
  DocumentReference? transaccionId,
  String? tipo,
  double? monto,
  DocumentReference? ventaId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_detalle': idDetalle,
      'transaccion_id': transaccionId,
      'tipo': tipo,
      'monto': monto,
      'venta_id': ventaId,
    }.withoutNulls,
  );

  return firestoreData;
}

class DetallesCorteRecordDocumentEquality
    implements Equality<DetallesCorteRecord> {
  const DetallesCorteRecordDocumentEquality();

  @override
  bool equals(DetallesCorteRecord? e1, DetallesCorteRecord? e2) {
    return e1?.idDetalle == e2?.idDetalle &&
        e1?.transaccionId == e2?.transaccionId &&
        e1?.tipo == e2?.tipo &&
        e1?.monto == e2?.monto &&
        e1?.ventaId == e2?.ventaId;
  }

  @override
  int hash(DetallesCorteRecord? e) => const ListEquality()
      .hash([e?.idDetalle, e?.transaccionId, e?.tipo, e?.monto, e?.ventaId]);

  @override
  bool isValidKey(Object? o) => o is DetallesCorteRecord;
}
