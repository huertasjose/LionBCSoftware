import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VentasRecord extends FirestoreRecord {
  VentasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_venta" field.
  String? _idVenta;
  String get idVenta => _idVenta ?? '';
  bool hasIdVenta() => _idVenta != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "clientes_id" field.
  DocumentReference? _clientesId;
  DocumentReference? get clientesId => _clientesId;
  bool hasClientesId() => _clientesId != null;

  // "empleado_id" field.
  DocumentReference? _empleadoId;
  DocumentReference? get empleadoId => _empleadoId;
  bool hasEmpleadoId() => _empleadoId != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "metodo_pago" field.
  String? _metodoPago;
  String get metodoPago => _metodoPago ?? '';
  bool hasMetodoPago() => _metodoPago != null;

  void _initializeFields() {
    _idVenta = snapshotData['id_venta'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _clientesId = snapshotData['clientes_id'] as DocumentReference?;
    _empleadoId = snapshotData['empleado_id'] as DocumentReference?;
    _total = castToType<double>(snapshotData['total']);
    _metodoPago = snapshotData['metodo_pago'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ventas');

  static Stream<VentasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VentasRecord.fromSnapshot(s));

  static Future<VentasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VentasRecord.fromSnapshot(s));

  static VentasRecord fromSnapshot(DocumentSnapshot snapshot) => VentasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VentasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VentasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VentasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VentasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVentasRecordData({
  String? idVenta,
  DateTime? fecha,
  DocumentReference? clientesId,
  DocumentReference? empleadoId,
  double? total,
  String? metodoPago,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_venta': idVenta,
      'fecha': fecha,
      'clientes_id': clientesId,
      'empleado_id': empleadoId,
      'total': total,
      'metodo_pago': metodoPago,
    }.withoutNulls,
  );

  return firestoreData;
}

class VentasRecordDocumentEquality implements Equality<VentasRecord> {
  const VentasRecordDocumentEquality();

  @override
  bool equals(VentasRecord? e1, VentasRecord? e2) {
    return e1?.idVenta == e2?.idVenta &&
        e1?.fecha == e2?.fecha &&
        e1?.clientesId == e2?.clientesId &&
        e1?.empleadoId == e2?.empleadoId &&
        e1?.total == e2?.total &&
        e1?.metodoPago == e2?.metodoPago;
  }

  @override
  int hash(VentasRecord? e) => const ListEquality().hash([
        e?.idVenta,
        e?.fecha,
        e?.clientesId,
        e?.empleadoId,
        e?.total,
        e?.metodoPago
      ]);

  @override
  bool isValidKey(Object? o) => o is VentasRecord;
}
