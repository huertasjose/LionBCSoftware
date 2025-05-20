import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientesRecord extends FirestoreRecord {
  ClientesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_cliente" field.
  String? _idCliente;
  String get idCliente => _idCliente ?? '';
  bool hasIdCliente() => _idCliente != null;

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

  // "citasCliente" field.
  DocumentReference? _citasCliente;
  DocumentReference? get citasCliente => _citasCliente;
  bool hasCitasCliente() => _citasCliente != null;

  // "HistorialCompras" field.
  DocumentReference? _historialCompras;
  DocumentReference? get historialCompras => _historialCompras;
  bool hasHistorialCompras() => _historialCompras != null;

  // "ServicioRealizado" field.
  DocumentReference? _servicioRealizado;
  DocumentReference? get servicioRealizado => _servicioRealizado;
  bool hasServicioRealizado() => _servicioRealizado != null;

  void _initializeFields() {
    _idCliente = snapshotData['id_cliente'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _telefono = castToType<int>(snapshotData['telefono']);
    _email = snapshotData['email'] as String?;
    _direccion = snapshotData['direccion'] as String?;
    _citasCliente = snapshotData['citasCliente'] as DocumentReference?;
    _historialCompras = snapshotData['HistorialCompras'] as DocumentReference?;
    _servicioRealizado =
        snapshotData['ServicioRealizado'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Clientes');

  static Stream<ClientesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientesRecord.fromSnapshot(s));

  static Future<ClientesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientesRecord.fromSnapshot(s));

  static ClientesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientesRecordData({
  String? idCliente,
  String? nombre,
  int? telefono,
  String? email,
  String? direccion,
  DocumentReference? citasCliente,
  DocumentReference? historialCompras,
  DocumentReference? servicioRealizado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_cliente': idCliente,
      'nombre': nombre,
      'telefono': telefono,
      'email': email,
      'direccion': direccion,
      'citasCliente': citasCliente,
      'HistorialCompras': historialCompras,
      'ServicioRealizado': servicioRealizado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientesRecordDocumentEquality implements Equality<ClientesRecord> {
  const ClientesRecordDocumentEquality();

  @override
  bool equals(ClientesRecord? e1, ClientesRecord? e2) {
    return e1?.idCliente == e2?.idCliente &&
        e1?.nombre == e2?.nombre &&
        e1?.telefono == e2?.telefono &&
        e1?.email == e2?.email &&
        e1?.direccion == e2?.direccion &&
        e1?.citasCliente == e2?.citasCliente &&
        e1?.historialCompras == e2?.historialCompras &&
        e1?.servicioRealizado == e2?.servicioRealizado;
  }

  @override
  int hash(ClientesRecord? e) => const ListEquality().hash([
        e?.idCliente,
        e?.nombre,
        e?.telefono,
        e?.email,
        e?.direccion,
        e?.citasCliente,
        e?.historialCompras,
        e?.servicioRealizado
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientesRecord;
}
