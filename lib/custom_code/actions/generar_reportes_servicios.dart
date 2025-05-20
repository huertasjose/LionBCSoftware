// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Future<String?> generarReportesServicios(
    DateTime? fromDate, DateTime? toDate) async {
  try {
    if (fromDate == null || toDate == null) {
      return 'Fechas inválidas';
    }

    final snapshot = await FirebaseFirestore.instance
        .collection('Servicios_Realizado')
        .where('fecha_hora',
            isGreaterThanOrEqualTo: fromDate, isLessThanOrEqualTo: toDate)
        .get();

    Map<String, double> report = {};

    for (var doc in snapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      String barbero = data['barbero'] ?? 'Sin nombre';
      double total = (data['total'] ?? 0).toDouble();

      report[barbero] = (report[barbero] ?? 0) + total;
    }

    StringBuffer buffer = StringBuffer();
    NumberFormat currencyFormat = NumberFormat.currency(symbol: '₡');

    report.forEach((barbero, total) {
      double ganancia = total * 0.6;
      buffer.writeln('$barbero: ${currencyFormat.format(ganancia)}');
    });

    return buffer.toString();
  } catch (e) {
    return 'Error al generar el reporte: $e';
  }
}
