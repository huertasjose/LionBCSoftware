// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductoStruct extends FFFirebaseStruct {
  ProductoStruct({
    String? nombre,
    double? precio,
    int? cantidad,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombre = nombre,
        _precio = precio,
        _cantidad = cantidad,
        super(firestoreUtilData);

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  set precio(double? val) => _precio = val;

  void incrementPrecio(double amount) => precio = precio + amount;

  bool hasPrecio() => _precio != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  set cantidad(int? val) => _cantidad = val;

  void incrementCantidad(int amount) => cantidad = cantidad + amount;

  bool hasCantidad() => _cantidad != null;

  static ProductoStruct fromMap(Map<String, dynamic> data) => ProductoStruct(
        nombre: data['nombre'] as String?,
        precio: castToType<double>(data['precio']),
        cantidad: castToType<int>(data['cantidad']),
      );

  static ProductoStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProductoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nombre': _nombre,
        'precio': _precio,
        'cantidad': _cantidad,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'precio': serializeParam(
          _precio,
          ParamType.double,
        ),
        'cantidad': serializeParam(
          _cantidad,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProductoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductoStruct(
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        precio: deserializeParam(
          data['precio'],
          ParamType.double,
          false,
        ),
        cantidad: deserializeParam(
          data['cantidad'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProductoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductoStruct &&
        nombre == other.nombre &&
        precio == other.precio &&
        cantidad == other.cantidad;
  }

  @override
  int get hashCode => const ListEquality().hash([nombre, precio, cantidad]);
}

ProductoStruct createProductoStruct({
  String? nombre,
  double? precio,
  int? cantidad,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductoStruct(
      nombre: nombre,
      precio: precio,
      cantidad: cantidad,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductoStruct? updateProductoStruct(
  ProductoStruct? producto, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    producto
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductoStructData(
  Map<String, dynamic> firestoreData,
  ProductoStruct? producto,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (producto == null) {
    return;
  }
  if (producto.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && producto.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productoData = getProductoFirestoreData(producto, forFieldValue);
  final nestedData = productoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = producto.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductoFirestoreData(
  ProductoStruct? producto, [
  bool forFieldValue = false,
]) {
  if (producto == null) {
    return {};
  }
  final firestoreData = mapToFirestore(producto.toMap());

  // Add any Firestore field values
  producto.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductoListFirestoreData(
  List<ProductoStruct>? productos,
) =>
    productos?.map((e) => getProductoFirestoreData(e, true)).toList() ?? [];
