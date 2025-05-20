import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosRecord extends FirestoreRecord {
  PedidosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "precioTotal" field.
  double? _precioTotal;
  double get precioTotal => _precioTotal ?? 0.0;
  bool hasPrecioTotal() => _precioTotal != null;

  // "correo" field.
  String? _correo;
  String get correo => _correo ?? '';
  bool hasCorreo() => _correo != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  bool hasTelefono() => _telefono != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "carritoProductos" field.
  List<DocumentReference>? _carritoProductos;
  List<DocumentReference> get carritoProductos => _carritoProductos ?? const [];
  bool hasCarritoProductos() => _carritoProductos != null;

  // "productos" field.
  List<String>? _productos;
  List<String> get productos => _productos ?? const [];
  bool hasProductos() => _productos != null;

  void _initializeFields() {
    _precioTotal = castToType<double>(snapshotData['precioTotal']);
    _correo = snapshotData['correo'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _telefono = snapshotData['telefono'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _carritoProductos = getDataList(snapshotData['carritoProductos']);
    _productos = getDataList(snapshotData['productos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Pedidos');

  static Stream<PedidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidosRecord.fromSnapshot(s));

  static Future<PedidosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidosRecord.fromSnapshot(s));

  static PedidosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PedidosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidosRecordData({
  double? precioTotal,
  String? correo,
  String? nombre,
  String? telefono,
  DateTime? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'precioTotal': precioTotal,
      'correo': correo,
      'nombre': nombre,
      'telefono': telefono,
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidosRecordDocumentEquality implements Equality<PedidosRecord> {
  const PedidosRecordDocumentEquality();

  @override
  bool equals(PedidosRecord? e1, PedidosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.precioTotal == e2?.precioTotal &&
        e1?.correo == e2?.correo &&
        e1?.nombre == e2?.nombre &&
        e1?.telefono == e2?.telefono &&
        e1?.fecha == e2?.fecha &&
        listEquality.equals(e1?.carritoProductos, e2?.carritoProductos) &&
        listEquality.equals(e1?.productos, e2?.productos);
  }

  @override
  int hash(PedidosRecord? e) => const ListEquality().hash([
        e?.precioTotal,
        e?.correo,
        e?.nombre,
        e?.telefono,
        e?.fecha,
        e?.carritoProductos,
        e?.productos
      ]);

  @override
  bool isValidKey(Object? o) => o is PedidosRecord;
}
