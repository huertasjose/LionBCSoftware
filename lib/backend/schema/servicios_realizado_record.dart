import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiciosRealizadoRecord extends FirestoreRecord {
  ServiciosRealizadoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fecha_hora" field.
  DateTime? _fechaHora;
  DateTime? get fechaHora => _fechaHora;
  bool hasFechaHora() => _fechaHora != null;

  // "metodoPago" field.
  String? _metodoPago;
  String get metodoPago => _metodoPago ?? '';
  bool hasMetodoPago() => _metodoPago != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "clienteNombre" field.
  String? _clienteNombre;
  String get clienteNombre => _clienteNombre ?? '';
  bool hasClienteNombre() => _clienteNombre != null;

  // "barbero" field.
  String? _barbero;
  String get barbero => _barbero ?? '';
  bool hasBarbero() => _barbero != null;

  // "servicios" field.
  List<String>? _servicios;
  List<String> get servicios => _servicios ?? const [];
  bool hasServicios() => _servicios != null;

  // "emailCliente" field.
  String? _emailCliente;
  String get emailCliente => _emailCliente ?? '';
  bool hasEmailCliente() => _emailCliente != null;

  // "firmaURL" field.
  String? _firmaURL;
  String get firmaURL => _firmaURL ?? '';
  bool hasFirmaURL() => _firmaURL != null;

  // "nombreCliente" field.
  DocumentReference? _nombreCliente;
  DocumentReference? get nombreCliente => _nombreCliente;
  bool hasNombreCliente() => _nombreCliente != null;

  void _initializeFields() {
    _fechaHora = snapshotData['fecha_hora'] as DateTime?;
    _metodoPago = snapshotData['metodoPago'] as String?;
    _total = castToType<double>(snapshotData['total']);
    _clienteNombre = snapshotData['clienteNombre'] as String?;
    _barbero = snapshotData['barbero'] as String?;
    _servicios = getDataList(snapshotData['servicios']);
    _emailCliente = snapshotData['emailCliente'] as String?;
    _firmaURL = snapshotData['firmaURL'] as String?;
    _nombreCliente = snapshotData['nombreCliente'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Servicios_Realizado');

  static Stream<ServiciosRealizadoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiciosRealizadoRecord.fromSnapshot(s));

  static Future<ServiciosRealizadoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ServiciosRealizadoRecord.fromSnapshot(s));

  static ServiciosRealizadoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiciosRealizadoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiciosRealizadoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiciosRealizadoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiciosRealizadoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiciosRealizadoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiciosRealizadoRecordData({
  DateTime? fechaHora,
  String? metodoPago,
  double? total,
  String? clienteNombre,
  String? barbero,
  String? emailCliente,
  String? firmaURL,
  DocumentReference? nombreCliente,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fecha_hora': fechaHora,
      'metodoPago': metodoPago,
      'total': total,
      'clienteNombre': clienteNombre,
      'barbero': barbero,
      'emailCliente': emailCliente,
      'firmaURL': firmaURL,
      'nombreCliente': nombreCliente,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiciosRealizadoRecordDocumentEquality
    implements Equality<ServiciosRealizadoRecord> {
  const ServiciosRealizadoRecordDocumentEquality();

  @override
  bool equals(ServiciosRealizadoRecord? e1, ServiciosRealizadoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fechaHora == e2?.fechaHora &&
        e1?.metodoPago == e2?.metodoPago &&
        e1?.total == e2?.total &&
        e1?.clienteNombre == e2?.clienteNombre &&
        e1?.barbero == e2?.barbero &&
        listEquality.equals(e1?.servicios, e2?.servicios) &&
        e1?.emailCliente == e2?.emailCliente &&
        e1?.firmaURL == e2?.firmaURL &&
        e1?.nombreCliente == e2?.nombreCliente;
  }

  @override
  int hash(ServiciosRealizadoRecord? e) => const ListEquality().hash([
        e?.fechaHora,
        e?.metodoPago,
        e?.total,
        e?.clienteNombre,
        e?.barbero,
        e?.servicios,
        e?.emailCliente,
        e?.firmaURL,
        e?.nombreCliente
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiciosRealizadoRecord;
}
