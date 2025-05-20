import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DateTime> disponibilidadHoras(
  DateTime openHour,
  DateTime closeHour,
) {
  List<DateTime> hours = [];

  DateTime currentHour = DateTime(
    openHour.year,
    openHour.month,
    openHour.day,
    openHour.hour,
  );

  while (currentHour.isBefore(closeHour)) {
    hours.add(currentHour);
    currentHour = currentHour.add(Duration(hours: 1));
  }

  return hours;
}

DateTime stringtoDatetime(String hora) {
  final now = DateTime.now(); // Agregar los paréntesis aquí
  final hourAndMinute = hora.split(":");
  final hour = int.parse(hourAndMinute[0]);
  final minute = int.parse(hourAndMinute[1]);
  return DateTime(now.year, now.month, now.day, hour, minute);
}

double totalCarrito(List<double> subtotal) {
  double total = 0;
  for (double add in subtotal) {
    total += add;
  }
  return total;
}

double sumarTotal(
  double valorSub,
  double precio,
) {
  valorSub = valorSub + precio;
  return valorSub;
}

double restarSub(
  double valorSub,
  double precio,
) {
  if (valorSub > 0) {
    valorSub = valorSub - precio;
  }
  return valorSub;
}

double actualizarTotal(
  double totalPrecio,
  double precio,
  bool seleccionado,
) {
  if (seleccionado) {
    totalPrecio += precio;
  } else {
    totalPrecio -= precio;
  }
  return totalPrecio;

  // Retornar el total como un double
}

int? averageRating(List<int>? ratings) {
  if (ratings == null || ratings.isEmpty) {
    return null;
  }

  int sum = 0;
  for (int rating in ratings) {
    sum += rating;
  }
  return (sum / ratings.length).round();
}

String? generarReporteServicios(
  DateTime? fromDate,
  DateTime? toDate,
) {
  // Esta función delega a una función async separada usando Future.
  (() async {
    try {
      if (fromDate == null || toDate == null) {
        print('Fechas inválidas');
        return;
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

      print(buffer.toString()); // Imprimir el resultado para verlo en consola
    } catch (e) {
      print('Error generating report: $e');
    }
  })();

  return null;
}
