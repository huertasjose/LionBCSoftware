import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/index.dart';
import 'seleccion_periodos_productos_widget.dart'
    show SeleccionPeriodosProductosWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SeleccionPeriodosProductosModel
    extends FlutterFlowModel<SeleccionPeriodosProductosWidget> {
  ///  Local state fields for this page.

  bool verPDF = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Reporte de Servicios)] action in Button widget.
  ApiCallResponse? apiResultfgy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
