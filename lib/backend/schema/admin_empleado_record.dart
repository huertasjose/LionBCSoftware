import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminEmpleadoRecord extends FirestoreRecord {
  AdminEmpleadoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_asistencia" field.
  String? _idAsistencia;
  String get idAsistencia => _idAsistencia ?? '';
  bool hasIdAsistencia() => _idAsistencia != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "hora_entrada" field.
  DateTime? _horaEntrada;
  DateTime? get horaEntrada => _horaEntrada;
  bool hasHoraEntrada() => _horaEntrada != null;

  // "hora_salida" field.
  DateTime? _horaSalida;
  DateTime? get horaSalida => _horaSalida;
  bool hasHoraSalida() => _horaSalida != null;

  // "servicioscompletados" field.
  String? _servicioscompletados;
  String get servicioscompletados => _servicioscompletados ?? '';
  bool hasServicioscompletados() => _servicioscompletados != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idAsistencia = snapshotData['id_asistencia'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _horaEntrada = snapshotData['hora_entrada'] as DateTime?;
    _horaSalida = snapshotData['hora_salida'] as DateTime?;
    _servicioscompletados = snapshotData['servicioscompletados'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('AdminEmpleado')
          : FirebaseFirestore.instance.collectionGroup('AdminEmpleado');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('AdminEmpleado').doc(id);

  static Stream<AdminEmpleadoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminEmpleadoRecord.fromSnapshot(s));

  static Future<AdminEmpleadoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminEmpleadoRecord.fromSnapshot(s));

  static AdminEmpleadoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminEmpleadoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminEmpleadoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminEmpleadoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminEmpleadoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminEmpleadoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminEmpleadoRecordData({
  String? idAsistencia,
  DateTime? fecha,
  DateTime? horaEntrada,
  DateTime? horaSalida,
  String? servicioscompletados,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_asistencia': idAsistencia,
      'fecha': fecha,
      'hora_entrada': horaEntrada,
      'hora_salida': horaSalida,
      'servicioscompletados': servicioscompletados,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminEmpleadoRecordDocumentEquality
    implements Equality<AdminEmpleadoRecord> {
  const AdminEmpleadoRecordDocumentEquality();

  @override
  bool equals(AdminEmpleadoRecord? e1, AdminEmpleadoRecord? e2) {
    return e1?.idAsistencia == e2?.idAsistencia &&
        e1?.fecha == e2?.fecha &&
        e1?.horaEntrada == e2?.horaEntrada &&
        e1?.horaSalida == e2?.horaSalida &&
        e1?.servicioscompletados == e2?.servicioscompletados;
  }

  @override
  int hash(AdminEmpleadoRecord? e) => const ListEquality().hash([
        e?.idAsistencia,
        e?.fecha,
        e?.horaEntrada,
        e?.horaSalida,
        e?.servicioscompletados
      ]);

  @override
  bool isValidKey(Object? o) => o is AdminEmpleadoRecord;
}
