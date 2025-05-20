import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CortesRecord extends FirestoreRecord {
  CortesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_corte" field.
  String? _idCorte;
  String get idCorte => _idCorte ?? '';
  bool hasIdCorte() => _idCorte != null;

  // "fecha_inicio" field.
  DateTime? _fechaInicio;
  DateTime? get fechaInicio => _fechaInicio;
  bool hasFechaInicio() => _fechaInicio != null;

  // "fecha_fin" field.
  DateTime? _fechaFin;
  DateTime? get fechaFin => _fechaFin;
  bool hasFechaFin() => _fechaFin != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "total_ingresos" field.
  double? _totalIngresos;
  double get totalIngresos => _totalIngresos ?? 0.0;
  bool hasTotalIngresos() => _totalIngresos != null;

  // "total_egresos" field.
  double? _totalEgresos;
  double get totalEgresos => _totalEgresos ?? 0.0;
  bool hasTotalEgresos() => _totalEgresos != null;

  // "total_ventas" field.
  double? _totalVentas;
  double get totalVentas => _totalVentas ?? 0.0;
  bool hasTotalVentas() => _totalVentas != null;

  // "notas" field.
  String? _notas;
  String get notas => _notas ?? '';
  bool hasNotas() => _notas != null;

  void _initializeFields() {
    _idCorte = snapshotData['id_corte'] as String?;
    _fechaInicio = snapshotData['fecha_inicio'] as DateTime?;
    _fechaFin = snapshotData['fecha_fin'] as DateTime?;
    _tipo = snapshotData['tipo'] as String?;
    _totalIngresos = castToType<double>(snapshotData['total_ingresos']);
    _totalEgresos = castToType<double>(snapshotData['total_egresos']);
    _totalVentas = castToType<double>(snapshotData['total_ventas']);
    _notas = snapshotData['notas'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Cortes');

  static Stream<CortesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CortesRecord.fromSnapshot(s));

  static Future<CortesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CortesRecord.fromSnapshot(s));

  static CortesRecord fromSnapshot(DocumentSnapshot snapshot) => CortesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CortesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CortesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CortesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CortesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCortesRecordData({
  String? idCorte,
  DateTime? fechaInicio,
  DateTime? fechaFin,
  String? tipo,
  double? totalIngresos,
  double? totalEgresos,
  double? totalVentas,
  String? notas,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_corte': idCorte,
      'fecha_inicio': fechaInicio,
      'fecha_fin': fechaFin,
      'tipo': tipo,
      'total_ingresos': totalIngresos,
      'total_egresos': totalEgresos,
      'total_ventas': totalVentas,
      'notas': notas,
    }.withoutNulls,
  );

  return firestoreData;
}

class CortesRecordDocumentEquality implements Equality<CortesRecord> {
  const CortesRecordDocumentEquality();

  @override
  bool equals(CortesRecord? e1, CortesRecord? e2) {
    return e1?.idCorte == e2?.idCorte &&
        e1?.fechaInicio == e2?.fechaInicio &&
        e1?.fechaFin == e2?.fechaFin &&
        e1?.tipo == e2?.tipo &&
        e1?.totalIngresos == e2?.totalIngresos &&
        e1?.totalEgresos == e2?.totalEgresos &&
        e1?.totalVentas == e2?.totalVentas &&
        e1?.notas == e2?.notas;
  }

  @override
  int hash(CortesRecord? e) => const ListEquality().hash([
        e?.idCorte,
        e?.fechaInicio,
        e?.fechaFin,
        e?.tipo,
        e?.totalIngresos,
        e?.totalEgresos,
        e?.totalVentas,
        e?.notas
      ]);

  @override
  bool isValidKey(Object? o) => o is CortesRecord;
}
