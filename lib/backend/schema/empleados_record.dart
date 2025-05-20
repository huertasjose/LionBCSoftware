import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmpleadosRecord extends FirestoreRecord {
  EmpleadosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_empleado" field.
  String? _idEmpleado;
  String get idEmpleado => _idEmpleado ?? '';
  bool hasIdEmpleado() => _idEmpleado != null;

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

  // "rol" field.
  String? _rol;
  String get rol => _rol ?? '';
  bool hasRol() => _rol != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  void _initializeFields() {
    _idEmpleado = snapshotData['id_empleado'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _telefono = castToType<int>(snapshotData['telefono']);
    _email = snapshotData['email'] as String?;
    _direccion = snapshotData['direccion'] as String?;
    _rol = snapshotData['rol'] as String?;
    _estado = snapshotData['estado'] as String?;
    _imagen = snapshotData['imagen'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Empleados');

  static Stream<EmpleadosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmpleadosRecord.fromSnapshot(s));

  static Future<EmpleadosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmpleadosRecord.fromSnapshot(s));

  static EmpleadosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmpleadosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmpleadosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmpleadosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmpleadosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmpleadosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmpleadosRecordData({
  String? idEmpleado,
  String? nombre,
  int? telefono,
  String? email,
  String? direccion,
  String? rol,
  String? estado,
  String? imagen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_empleado': idEmpleado,
      'nombre': nombre,
      'telefono': telefono,
      'email': email,
      'direccion': direccion,
      'rol': rol,
      'estado': estado,
      'imagen': imagen,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmpleadosRecordDocumentEquality implements Equality<EmpleadosRecord> {
  const EmpleadosRecordDocumentEquality();

  @override
  bool equals(EmpleadosRecord? e1, EmpleadosRecord? e2) {
    return e1?.idEmpleado == e2?.idEmpleado &&
        e1?.nombre == e2?.nombre &&
        e1?.telefono == e2?.telefono &&
        e1?.email == e2?.email &&
        e1?.direccion == e2?.direccion &&
        e1?.rol == e2?.rol &&
        e1?.estado == e2?.estado &&
        e1?.imagen == e2?.imagen;
  }

  @override
  int hash(EmpleadosRecord? e) => const ListEquality().hash([
        e?.idEmpleado,
        e?.nombre,
        e?.telefono,
        e?.email,
        e?.direccion,
        e?.rol,
        e?.estado,
        e?.imagen
      ]);

  @override
  bool isValidKey(Object? o) => o is EmpleadosRecord;
}
