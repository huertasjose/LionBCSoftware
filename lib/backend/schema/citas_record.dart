import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitasRecord extends FirestoreRecord {
  CitasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_cita" field.
  String? _idCita;
  String get idCita => _idCita ?? '';
  bool hasIdCita() => _idCita != null;

  // "cliente_id" field.
  DocumentReference? _clienteId;
  DocumentReference? get clienteId => _clienteId;
  bool hasClienteId() => _clienteId != null;

  // "empleado_id" field.
  DocumentReference? _empleadoId;
  DocumentReference? get empleadoId => _empleadoId;
  bool hasEmpleadoId() => _empleadoId != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "servicio_id" field.
  DocumentReference? _servicioId;
  DocumentReference? get servicioId => _servicioId;
  bool hasServicioId() => _servicioId != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "isConfirmByBarber" field.
  bool? _isConfirmByBarber;
  bool get isConfirmByBarber => _isConfirmByBarber ?? false;
  bool hasIsConfirmByBarber() => _isConfirmByBarber != null;

  // "isDone" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  bool hasIsDone() => _isDone != null;

  // "barbero" field.
  String? _barbero;
  String get barbero => _barbero ?? '';
  bool hasBarbero() => _barbero != null;

  // "nombreCliente" field.
  String? _nombreCliente;
  String get nombreCliente => _nombreCliente ?? '';
  bool hasNombreCliente() => _nombreCliente != null;

  // "correoCliente" field.
  String? _correoCliente;
  String get correoCliente => _correoCliente ?? '';
  bool hasCorreoCliente() => _correoCliente != null;

  // "hora" field.
  String? _hora;
  String get hora => _hora ?? '';
  bool hasHora() => _hora != null;

  // "telefonoCliente" field.
  String? _telefonoCliente;
  String get telefonoCliente => _telefonoCliente ?? '';
  bool hasTelefonoCliente() => _telefonoCliente != null;

  // "usuarioReferencia" field.
  DocumentReference? _usuarioReferencia;
  DocumentReference? get usuarioReferencia => _usuarioReferencia;
  bool hasUsuarioReferencia() => _usuarioReferencia != null;

  // "servicio" field.
  String? _servicio;
  String get servicio => _servicio ?? '';
  bool hasServicio() => _servicio != null;

  void _initializeFields() {
    _idCita = snapshotData['id_cita'] as String?;
    _clienteId = snapshotData['cliente_id'] as DocumentReference?;
    _empleadoId = snapshotData['empleado_id'] as DocumentReference?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _servicioId = snapshotData['servicio_id'] as DocumentReference?;
    _estado = snapshotData['estado'] as String?;
    _isConfirmByBarber = snapshotData['isConfirmByBarber'] as bool?;
    _isDone = snapshotData['isDone'] as bool?;
    _barbero = snapshotData['barbero'] as String?;
    _nombreCliente = snapshotData['nombreCliente'] as String?;
    _correoCliente = snapshotData['correoCliente'] as String?;
    _hora = snapshotData['hora'] as String?;
    _telefonoCliente = snapshotData['telefonoCliente'] as String?;
    _usuarioReferencia =
        snapshotData['usuarioReferencia'] as DocumentReference?;
    _servicio = snapshotData['servicio'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Citas');

  static Stream<CitasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitasRecord.fromSnapshot(s));

  static Future<CitasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitasRecord.fromSnapshot(s));

  static CitasRecord fromSnapshot(DocumentSnapshot snapshot) => CitasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitasRecordData({
  String? idCita,
  DocumentReference? clienteId,
  DocumentReference? empleadoId,
  DateTime? fecha,
  DocumentReference? servicioId,
  String? estado,
  bool? isConfirmByBarber,
  bool? isDone,
  String? barbero,
  String? nombreCliente,
  String? correoCliente,
  String? hora,
  String? telefonoCliente,
  DocumentReference? usuarioReferencia,
  String? servicio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_cita': idCita,
      'cliente_id': clienteId,
      'empleado_id': empleadoId,
      'fecha': fecha,
      'servicio_id': servicioId,
      'estado': estado,
      'isConfirmByBarber': isConfirmByBarber,
      'isDone': isDone,
      'barbero': barbero,
      'nombreCliente': nombreCliente,
      'correoCliente': correoCliente,
      'hora': hora,
      'telefonoCliente': telefonoCliente,
      'usuarioReferencia': usuarioReferencia,
      'servicio': servicio,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitasRecordDocumentEquality implements Equality<CitasRecord> {
  const CitasRecordDocumentEquality();

  @override
  bool equals(CitasRecord? e1, CitasRecord? e2) {
    return e1?.idCita == e2?.idCita &&
        e1?.clienteId == e2?.clienteId &&
        e1?.empleadoId == e2?.empleadoId &&
        e1?.fecha == e2?.fecha &&
        e1?.servicioId == e2?.servicioId &&
        e1?.estado == e2?.estado &&
        e1?.isConfirmByBarber == e2?.isConfirmByBarber &&
        e1?.isDone == e2?.isDone &&
        e1?.barbero == e2?.barbero &&
        e1?.nombreCliente == e2?.nombreCliente &&
        e1?.correoCliente == e2?.correoCliente &&
        e1?.hora == e2?.hora &&
        e1?.telefonoCliente == e2?.telefonoCliente &&
        e1?.usuarioReferencia == e2?.usuarioReferencia &&
        e1?.servicio == e2?.servicio;
  }

  @override
  int hash(CitasRecord? e) => const ListEquality().hash([
        e?.idCita,
        e?.clienteId,
        e?.empleadoId,
        e?.fecha,
        e?.servicioId,
        e?.estado,
        e?.isConfirmByBarber,
        e?.isDone,
        e?.barbero,
        e?.nombreCliente,
        e?.correoCliente,
        e?.hora,
        e?.telefonoCliente,
        e?.usuarioReferencia,
        e?.servicio
      ]);

  @override
  bool isValidKey(Object? o) => o is CitasRecord;
}
