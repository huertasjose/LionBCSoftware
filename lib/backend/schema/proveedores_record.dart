import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProveedoresRecord extends FirestoreRecord {
  ProveedoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_proveedor" field.
  String? _idProveedor;
  String get idProveedor => _idProveedor ?? '';
  bool hasIdProveedor() => _idProveedor != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "telefono" field.
  int? _telefono;
  int get telefono => _telefono ?? 0;
  bool hasTelefono() => _telefono != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  void _initializeFields() {
    _idProveedor = snapshotData['id_proveedor'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _telefono = castToType<int>(snapshotData['telefono']);
    _email = snapshotData['email'] as String?;
    _direccion = snapshotData['direccion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Proveedores');

  static Stream<ProveedoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProveedoresRecord.fromSnapshot(s));

  static Future<ProveedoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProveedoresRecord.fromSnapshot(s));

  static ProveedoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProveedoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProveedoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProveedoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProveedoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProveedoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProveedoresRecordData({
  String? idProveedor,
  String? nombre,
  int? telefono,
  String? email,
  String? direccion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_proveedor': idProveedor,
      'nombre': nombre,
      'telefono': telefono,
      'email': email,
      'direccion': direccion,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProveedoresRecordDocumentEquality implements Equality<ProveedoresRecord> {
  const ProveedoresRecordDocumentEquality();

  @override
  bool equals(ProveedoresRecord? e1, ProveedoresRecord? e2) {
    return e1?.idProveedor == e2?.idProveedor &&
        e1?.nombre == e2?.nombre &&
        e1?.telefono == e2?.telefono &&
        e1?.email == e2?.email &&
        e1?.direccion == e2?.direccion;
  }

  @override
  int hash(ProveedoresRecord? e) => const ListEquality()
      .hash([e?.idProveedor, e?.nombre, e?.telefono, e?.email, e?.direccion]);

  @override
  bool isValidKey(Object? o) => o is ProveedoresRecord;
}
