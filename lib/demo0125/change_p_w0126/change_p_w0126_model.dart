import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_p_w0126_widget.dart' show ChangePW0126Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePW0126Model extends FlutterFlowModel<ChangePW0126Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for current_email widget.
  FocusNode? currentEmailFocusNode;
  TextEditingController? currentEmailController;
  String? Function(BuildContext, String?)? currentEmailControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    currentEmailFocusNode?.dispose();
    currentEmailController?.dispose();
  }
}
