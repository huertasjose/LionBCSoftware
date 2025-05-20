import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'registrar_servicios_widget.dart' show RegistrarServiciosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistrarServiciosModel
    extends FlutterFlowModel<RegistrarServiciosWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for NombreCliente widget.
  FocusNode? nombreClienteFocusNode;
  TextEditingController? nombreClienteTextController;
  String? Function(BuildContext, String?)? nombreClienteTextControllerValidator;
  // State field(s) for emailCliente widget.
  FocusNode? emailClienteFocusNode;
  TextEditingController? emailClienteTextController;
  String? Function(BuildContext, String?)? emailClienteTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  ServiciosRecord? obtenerPrecio;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for firmaURL widget.
  SignatureController? firmaURLController;
  String uploadedSignatureUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreClienteFocusNode?.dispose();
    nombreClienteTextController?.dispose();

    emailClienteFocusNode?.dispose();
    emailClienteTextController?.dispose();

    firmaURLController?.dispose();
  }
}
