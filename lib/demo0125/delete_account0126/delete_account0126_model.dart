import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'delete_account0126_widget.dart' show DeleteAccount0126Widget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteAccount0126Model extends FlutterFlowModel<DeleteAccount0126Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for current_password widget.
  FocusNode? currentPasswordFocusNode;
  TextEditingController? currentPasswordController;
  String? Function(BuildContext, String?)? currentPasswordControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    currentPasswordFocusNode?.dispose();
    currentPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
