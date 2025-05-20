import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsUserRecord extends FirestoreRecord {
  ReviewsUserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cliente" field.
  String? _cliente;
  String get cliente => _cliente ?? '';
  bool hasCliente() => _cliente != null;

  // "barbero" field.
  String? _barbero;
  String get barbero => _barbero ?? '';
  bool hasBarbero() => _barbero != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  void _initializeFields() {
    _cliente = snapshotData['cliente'] as String?;
    _barbero = snapshotData['barbero'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
    _comentario = snapshotData['comentario'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ReviewsUser');

  static Stream<ReviewsUserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsUserRecord.fromSnapshot(s));

  static Future<ReviewsUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsUserRecord.fromSnapshot(s));

  static ReviewsUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsUserRecordData({
  String? cliente,
  String? barbero,
  int? rating,
  String? comentario,
  DateTime? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cliente': cliente,
      'barbero': barbero,
      'rating': rating,
      'comentario': comentario,
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsUserRecordDocumentEquality implements Equality<ReviewsUserRecord> {
  const ReviewsUserRecordDocumentEquality();

  @override
  bool equals(ReviewsUserRecord? e1, ReviewsUserRecord? e2) {
    return e1?.cliente == e2?.cliente &&
        e1?.barbero == e2?.barbero &&
        e1?.rating == e2?.rating &&
        e1?.comentario == e2?.comentario &&
        e1?.fecha == e2?.fecha;
  }

  @override
  int hash(ReviewsUserRecord? e) => const ListEquality()
      .hash([e?.cliente, e?.barbero, e?.rating, e?.comentario, e?.fecha]);

  @override
  bool isValidKey(Object? o) => o is ReviewsUserRecord;
}
