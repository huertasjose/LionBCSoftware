import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductosRecord extends FirestoreRecord {
  ProductosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_producto" field.
  String? _idProducto;
  String get idProducto => _idProducto ?? '';
  bool hasIdProducto() => _idProducto != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "precio_compra" field.
  double? _precioCompra;
  double get precioCompra => _precioCompra ?? 0.0;
  bool hasPrecioCompra() => _precioCompra != null;

  // "precio_venta" field.
  double? _precioVenta;
  double get precioVenta => _precioVenta ?? 0.0;
  bool hasPrecioVenta() => _precioVenta != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  bool hasStock() => _stock != null;

  // "proveedor_id" field.
  DocumentReference? _proveedorId;
  DocumentReference? get proveedorId => _proveedorId;
  bool hasProveedorId() => _proveedorId != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "proveedorNombre" field.
  String? _proveedorNombre;
  String get proveedorNombre => _proveedorNombre ?? '';
  bool hasProveedorNombre() => _proveedorNombre != null;

  // "categorias" field.
  List<String>? _categorias;
  List<String> get categorias => _categorias ?? const [];
  bool hasCategorias() => _categorias != null;

  void _initializeFields() {
    _idProducto = snapshotData['id_producto'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _precioCompra = castToType<double>(snapshotData['precio_compra']);
    _precioVenta = castToType<double>(snapshotData['precio_venta']);
    _stock = castToType<int>(snapshotData['stock']);
    _proveedorId = snapshotData['proveedor_id'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _proveedorNombre = snapshotData['proveedorNombre'] as String?;
    _categorias = getDataList(snapshotData['categorias']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Productos');

  static Stream<ProductosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductosRecord.fromSnapshot(s));

  static Future<ProductosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductosRecord.fromSnapshot(s));

  static ProductosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductosRecordData({
  String? idProducto,
  String? nombre,
  String? descripcion,
  double? precioCompra,
  double? precioVenta,
  int? stock,
  DocumentReference? proveedorId,
  String? image,
  String? proveedorNombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_producto': idProducto,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio_compra': precioCompra,
      'precio_venta': precioVenta,
      'stock': stock,
      'proveedor_id': proveedorId,
      'image': image,
      'proveedorNombre': proveedorNombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductosRecordDocumentEquality implements Equality<ProductosRecord> {
  const ProductosRecordDocumentEquality();

  @override
  bool equals(ProductosRecord? e1, ProductosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idProducto == e2?.idProducto &&
        e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.precioCompra == e2?.precioCompra &&
        e1?.precioVenta == e2?.precioVenta &&
        e1?.stock == e2?.stock &&
        e1?.proveedorId == e2?.proveedorId &&
        e1?.image == e2?.image &&
        e1?.proveedorNombre == e2?.proveedorNombre &&
        listEquality.equals(e1?.categorias, e2?.categorias);
  }

  @override
  int hash(ProductosRecord? e) => const ListEquality().hash([
        e?.idProducto,
        e?.nombre,
        e?.descripcion,
        e?.precioCompra,
        e?.precioVenta,
        e?.stock,
        e?.proveedorId,
        e?.image,
        e?.proveedorNombre,
        e?.categorias
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductosRecord;
}
