import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cardNumber = prefs.getString('ff_cardNumber') ?? _cardNumber;
    });
    _safeInit(() {
      _cardHolderName = prefs.getString('ff_cardHolderName') ?? _cardHolderName;
    });
    _safeInit(() {
      _cardName = prefs.getString('ff_cardName') ?? _cardName;
    });
    _safeInit(() {
      _zipCode = prefs.getString('ff_zipCode') ?? _zipCode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _cardNumber = '';
  String get cardNumber => _cardNumber;
  set cardNumber(String value) {
    _cardNumber = value;
    prefs.setString('ff_cardNumber', value);
  }

  String _cardHolderName = '';
  String get cardHolderName => _cardHolderName;
  set cardHolderName(String value) {
    _cardHolderName = value;
    prefs.setString('ff_cardHolderName', value);
  }

  String _cardName = '';
  String get cardName => _cardName;
  set cardName(String value) {
    _cardName = value;
    prefs.setString('ff_cardName', value);
  }

  String _zipCode = '';
  String get zipCode => _zipCode;
  set zipCode(String value) {
    _zipCode = value;
    prefs.setString('ff_zipCode', value);
  }

  DateTime? _fechaReserva;
  DateTime? get fechaReserva => _fechaReserva;
  set fechaReserva(DateTime? value) {
    _fechaReserva = value;
  }

  DateTime? _horaReserva;
  DateTime? get horaReserva => _horaReserva;
  set horaReserva(DateTime? value) {
    _horaReserva = value;
  }

  String _barbero = '';
  String get barbero => _barbero;
  set barbero(String value) {
    _barbero = value;
  }

  String _barberoSeleccionado = '';
  String get barberoSeleccionado => _barberoSeleccionado;
  set barberoSeleccionado(String value) {
    _barberoSeleccionado = value;
  }

  List<String> _ProductosDocuments = [];
  List<String> get ProductosDocuments => _ProductosDocuments;
  set ProductosDocuments(List<String> value) {
    _ProductosDocuments = value;
  }

  void addToProductosDocuments(String value) {
    ProductosDocuments.add(value);
  }

  void removeFromProductosDocuments(String value) {
    ProductosDocuments.remove(value);
  }

  void removeAtIndexFromProductosDocuments(int index) {
    ProductosDocuments.removeAt(index);
  }

  void updateProductosDocumentsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ProductosDocuments[index] = updateFn(_ProductosDocuments[index]);
  }

  void insertAtIndexInProductosDocuments(int index, String value) {
    ProductosDocuments.insert(index, value);
  }

  dynamic _jsonPruebas = jsonDecode(
      '{\"fecha\":\"2025-03-01\",\"ventas\":[{\"id_transaccion\":\"1234\",\"fecha\":\"2025-03-01\",\"tipo\":\"Venta\",\"descripcion\":\"Venta de producto\",\"monto\":100,\"categoria\":\"Electrónica\",\"id_servicio\":\"5678\"}],\"total\":1000}');
  dynamic get jsonPruebas => _jsonPruebas;
  set jsonPruebas(dynamic value) {
    _jsonPruebas = value;
  }

  int _cantidadProductosCarrito = 0;
  int get cantidadProductosCarrito => _cantidadProductosCarrito;
  set cantidadProductosCarrito(int value) {
    _cantidadProductosCarrito = value;
  }

  String _productosCarrito = '';
  String get productosCarrito => _productosCarrito;
  set productosCarrito(String value) {
    _productosCarrito = value;
  }

  double _totalPrecio = 0.0;
  double get totalPrecio => _totalPrecio;
  set totalPrecio(double value) {
    _totalPrecio = value;
  }

  String _reporteGanancias = '';
  String get reporteGanancias => _reporteGanancias;
  set reporteGanancias(String value) {
    _reporteGanancias = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
