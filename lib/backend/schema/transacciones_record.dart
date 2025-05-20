import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransaccionesRecord extends FirestoreRecord {
  TransaccionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_transaccion" field.
  String? _idTransaccion;
  String get idTransaccion => _idTransaccion ?? '';
  bool hasIdTransaccion() => _idTransaccion != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "id_servicio" field.
  DocumentReference? _idServicio;
  DocumentReference? get idServicio => _idServicio;
  bool hasIdServicio() => _idServicio != null;

  void _initializeFields() {
    _idTransaccion = snapshotData['id_transaccion'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _tipo = snapshotData['tipo'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _monto = castToType<double>(snapshotData['monto']);
    _categoria = snapshotData['categoria'] as String?;
    _idServicio = snapshotData['id_servicio'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Transacciones');

  static Stream<TransaccionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransaccionesRecord.fromSnapshot(s));

  static Future<TransaccionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransaccionesRecord.fromSnapshot(s));

  static TransaccionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransaccionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransaccionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransaccionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransaccionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransaccionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransaccionesRecordData({
  String? idTransaccion,
  DateTime? fecha,
  String? tipo,
  String? descripcion,
  double? monto,
  String? categoria,
  DocumentReference? idServicio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_transaccion': idTransaccion,
      'fecha': fecha,
      'tipo': tipo,
      'descripcion': descripcion,
      'monto': monto,
      'categoria': categoria,
      'id_servicio': idServicio,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransaccionesRecordDocumentEquality
    implements Equality<TransaccionesRecord> {
  const TransaccionesRecordDocumentEquality();

  @override
  bool equals(TransaccionesRecord? e1, TransaccionesRecord? e2) {
    return e1?.idTransaccion == e2?.idTransaccion &&
        e1?.fecha == e2?.fecha &&
        e1?.tipo == e2?.tipo &&
        e1?.descripcion == e2?.descripcion &&
        e1?.monto == e2?.monto &&
        e1?.categoria == e2?.categoria &&
        e1?.idServicio == e2?.idServicio;
  }

  @override
  int hash(TransaccionesRecord? e) => const ListEquality().hash([
        e?.idTransaccion,
        e?.fecha,
        e?.tipo,
        e?.descripcion,
        e?.monto,
        e?.categoria,
        e?.idServicio
      ]);

  @override
  bool isValidKey(Object? o) => o is TransaccionesRecord;
}
