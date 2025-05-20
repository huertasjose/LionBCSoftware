import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromocionesRecord extends FirestoreRecord {
  PromocionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_promocion" field.
  String? _idPromocion;
  String get idPromocion => _idPromocion ?? '';
  bool hasIdPromocion() => _idPromocion != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "servicios_aplicables" field.
  DocumentReference? _serviciosAplicables;
  DocumentReference? get serviciosAplicables => _serviciosAplicables;
  bool hasServiciosAplicables() => _serviciosAplicables != null;

  // "descuento" field.
  double? _descuento;
  double get descuento => _descuento ?? 0.0;
  bool hasDescuento() => _descuento != null;

  // "fecha_inicio" field.
  DateTime? _fechaInicio;
  DateTime? get fechaInicio => _fechaInicio;
  bool hasFechaInicio() => _fechaInicio != null;

  // "fecha_fin" field.
  DateTime? _fechaFin;
  DateTime? get fechaFin => _fechaFin;
  bool hasFechaFin() => _fechaFin != null;

  void _initializeFields() {
    _idPromocion = snapshotData['id_promocion'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _serviciosAplicables =
        snapshotData['servicios_aplicables'] as DocumentReference?;
    _descuento = castToType<double>(snapshotData['descuento']);
    _fechaInicio = snapshotData['fecha_inicio'] as DateTime?;
    _fechaFin = snapshotData['fecha_fin'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Promociones');

  static Stream<PromocionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromocionesRecord.fromSnapshot(s));

  static Future<PromocionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromocionesRecord.fromSnapshot(s));

  static PromocionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromocionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromocionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromocionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromocionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromocionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromocionesRecordData({
  String? idPromocion,
  String? descripcion,
  DocumentReference? serviciosAplicables,
  double? descuento,
  DateTime? fechaInicio,
  DateTime? fechaFin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_promocion': idPromocion,
      'descripcion': descripcion,
      'servicios_aplicables': serviciosAplicables,
      'descuento': descuento,
      'fecha_inicio': fechaInicio,
      'fecha_fin': fechaFin,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromocionesRecordDocumentEquality implements Equality<PromocionesRecord> {
  const PromocionesRecordDocumentEquality();

  @override
  bool equals(PromocionesRecord? e1, PromocionesRecord? e2) {
    return e1?.idPromocion == e2?.idPromocion &&
        e1?.descripcion == e2?.descripcion &&
        e1?.serviciosAplicables == e2?.serviciosAplicables &&
        e1?.descuento == e2?.descuento &&
        e1?.fechaInicio == e2?.fechaInicio &&
        e1?.fechaFin == e2?.fechaFin;
  }

  @override
  int hash(PromocionesRecord? e) => const ListEquality().hash([
        e?.idPromocion,
        e?.descripcion,
        e?.serviciosAplicables,
        e?.descuento,
        e?.fechaInicio,
        e?.fechaFin
      ]);

  @override
  bool isValidKey(Object? o) => o is PromocionesRecord;
}
