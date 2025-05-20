import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarritoRecord extends FirestoreRecord {
  CarritoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "productos" field.
  List<String>? _productos;
  List<String> get productos => _productos ?? const [];
  bool hasProductos() => _productos != null;

  // "Producto" field.
  DocumentReference? _producto;
  DocumentReference? get producto => _producto;
  bool hasProducto() => _producto != null;

  void _initializeFields() {
    _cantidad = castToType<int>(snapshotData['Cantidad']);
    _precio = castToType<double>(snapshotData['precio']);
    _email = snapshotData['email'] as String?;
    _productos = getDataList(snapshotData['productos']);
    _producto = snapshotData['Producto'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Carrito');

  static Stream<CarritoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarritoRecord.fromSnapshot(s));

  static Future<CarritoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarritoRecord.fromSnapshot(s));

  static CarritoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarritoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarritoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarritoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarritoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarritoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarritoRecordData({
  int? cantidad,
  double? precio,
  String? email,
  DocumentReference? producto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Cantidad': cantidad,
      'precio': precio,
      'email': email,
      'Producto': producto,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarritoRecordDocumentEquality implements Equality<CarritoRecord> {
  const CarritoRecordDocumentEquality();

  @override
  bool equals(CarritoRecord? e1, CarritoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cantidad == e2?.cantidad &&
        e1?.precio == e2?.precio &&
        e1?.email == e2?.email &&
        listEquality.equals(e1?.productos, e2?.productos) &&
        e1?.producto == e2?.producto;
  }

  @override
  int hash(CarritoRecord? e) => const ListEquality()
      .hash([e?.cantidad, e?.precio, e?.email, e?.productos, e?.producto]);

  @override
  bool isValidKey(Object? o) => o is CarritoRecord;
}
