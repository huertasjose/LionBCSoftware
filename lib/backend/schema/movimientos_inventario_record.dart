import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MovimientosInventarioRecord extends FirestoreRecord {
  MovimientosInventarioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_movimiento" field.
  String? _idMovimiento;
  String get idMovimiento => _idMovimiento ?? '';
  bool hasIdMovimiento() => _idMovimiento != null;

  // "producto_id" field.
  DocumentReference? _productoId;
  DocumentReference? get productoId => _productoId;
  bool hasProductoId() => _productoId != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "notas" field.
  String? _notas;
  String get notas => _notas ?? '';
  bool hasNotas() => _notas != null;

  void _initializeFields() {
    _idMovimiento = snapshotData['id_movimiento'] as String?;
    _productoId = snapshotData['producto_id'] as DocumentReference?;
    _tipo = snapshotData['tipo'] as String?;
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _fecha = snapshotData['fecha'] as DateTime?;
    _notas = snapshotData['notas'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MovimientosInventario');

  static Stream<MovimientosInventarioRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => MovimientosInventarioRecord.fromSnapshot(s));

  static Future<MovimientosInventarioRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MovimientosInventarioRecord.fromSnapshot(s));

  static MovimientosInventarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MovimientosInventarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MovimientosInventarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MovimientosInventarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MovimientosInventarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MovimientosInventarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMovimientosInventarioRecordData({
  String? idMovimiento,
  DocumentReference? productoId,
  String? tipo,
  int? cantidad,
  DateTime? fecha,
  String? notas,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_movimiento': idMovimiento,
      'producto_id': productoId,
      'tipo': tipo,
      'cantidad': cantidad,
      'fecha': fecha,
      'notas': notas,
    }.withoutNulls,
  );

  return firestoreData;
}

class MovimientosInventarioRecordDocumentEquality
    implements Equality<MovimientosInventarioRecord> {
  const MovimientosInventarioRecordDocumentEquality();

  @override
  bool equals(
      MovimientosInventarioRecord? e1, MovimientosInventarioRecord? e2) {
    return e1?.idMovimiento == e2?.idMovimiento &&
        e1?.productoId == e2?.productoId &&
        e1?.tipo == e2?.tipo &&
        e1?.cantidad == e2?.cantidad &&
        e1?.fecha == e2?.fecha &&
        e1?.notas == e2?.notas;
  }

  @override
  int hash(MovimientosInventarioRecord? e) => const ListEquality().hash([
        e?.idMovimiento,
        e?.productoId,
        e?.tipo,
        e?.cantidad,
        e?.fecha,
        e?.notas
      ]);

  @override
  bool isValidKey(Object? o) => o is MovimientosInventarioRecord;
}
