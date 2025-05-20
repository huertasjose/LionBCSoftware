import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductosVendidosRecord extends FirestoreRecord {
  ProductosVendidosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "producto_id" field.
  DocumentReference? _productoId;
  DocumentReference? get productoId => _productoId;
  bool hasProductoId() => _productoId != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "precio_unitario" field.
  double? _precioUnitario;
  double get precioUnitario => _precioUnitario ?? 0.0;
  bool hasPrecioUnitario() => _precioUnitario != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _productoId = snapshotData['producto_id'] as DocumentReference?;
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _precioUnitario = castToType<double>(snapshotData['precio_unitario']);
    _subtotal = castToType<double>(snapshotData['subtotal']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ProductosVendidos')
          : FirebaseFirestore.instance.collectionGroup('ProductosVendidos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ProductosVendidos').doc(id);

  static Stream<ProductosVendidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductosVendidosRecord.fromSnapshot(s));

  static Future<ProductosVendidosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProductosVendidosRecord.fromSnapshot(s));

  static ProductosVendidosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductosVendidosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductosVendidosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductosVendidosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductosVendidosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductosVendidosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductosVendidosRecordData({
  DocumentReference? productoId,
  int? cantidad,
  double? precioUnitario,
  double? subtotal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'producto_id': productoId,
      'cantidad': cantidad,
      'precio_unitario': precioUnitario,
      'subtotal': subtotal,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductosVendidosRecordDocumentEquality
    implements Equality<ProductosVendidosRecord> {
  const ProductosVendidosRecordDocumentEquality();

  @override
  bool equals(ProductosVendidosRecord? e1, ProductosVendidosRecord? e2) {
    return e1?.productoId == e2?.productoId &&
        e1?.cantidad == e2?.cantidad &&
        e1?.precioUnitario == e2?.precioUnitario &&
        e1?.subtotal == e2?.subtotal;
  }

  @override
  int hash(ProductosVendidosRecord? e) => const ListEquality()
      .hash([e?.productoId, e?.cantidad, e?.precioUnitario, e?.subtotal]);

  @override
  bool isValidKey(Object? o) => o is ProductosVendidosRecord;
}
