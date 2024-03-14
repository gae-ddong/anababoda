import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'information_widget.dart' show InformationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InformationModel extends FlutterFlowModel<InformationWidget> {
  ///  Local state fields for this page.

  bool? create = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for yourName_accoount widget.
  FocusNode? yourNameAccoountFocusNode;
  TextEditingController? yourNameAccoountController;
  String? Function(BuildContext, String?)? yourNameAccoountControllerValidator;
  // State field(s) for yourAge_accoount widget.
  FocusNode? yourAgeAccoountFocusNode;
  TextEditingController? yourAgeAccoountController;
  String? Function(BuildContext, String?)? yourAgeAccoountControllerValidator;
  // State field(s) for yourTitle_accoount widget.
  FocusNode? yourTitleAccoountFocusNode;
  TextEditingController? yourTitleAccoountController;
  String? Function(BuildContext, String?)? yourTitleAccoountControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    yourNameAccoountFocusNode?.dispose();
    yourNameAccoountController?.dispose();

    yourAgeAccoountFocusNode?.dispose();
    yourAgeAccoountController?.dispose();

    yourTitleAccoountFocusNode?.dispose();
    yourTitleAccoountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
