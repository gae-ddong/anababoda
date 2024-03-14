import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'account0125_widget.dart' show Account0125Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Account0125Model extends FlutterFlowModel<Account0125Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress_accoount widget.
  FocusNode? emailAddressAccoountFocusNode;
  TextEditingController? emailAddressAccoountController;
  String? Function(BuildContext, String?)?
      emailAddressAccoountControllerValidator;
  // State field(s) for password-Create_accoount widget.
  FocusNode? passwordCreateAccoountFocusNode;
  TextEditingController? passwordCreateAccoountController;
  late bool passwordCreateAccoountVisibility;
  String? Function(BuildContext, String?)?
      passwordCreateAccoountControllerValidator;
  // State field(s) for passwordConfirm_accoount widget.
  FocusNode? passwordConfirmAccoountFocusNode;
  TextEditingController? passwordConfirmAccoountController;
  late bool passwordConfirmAccoountVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmAccoountControllerValidator;
  // State field(s) for yourName_accoount widget.
  FocusNode? yourNameAccoountFocusNode;
  TextEditingController? yourNameAccoountController;
  String? Function(BuildContext, String?)? yourNameAccoountControllerValidator;
  // State field(s) for yourAge_accoount widget.
  FocusNode? yourAgeAccoountFocusNode;
  TextEditingController? yourAgeAccoountController;
  String? Function(BuildContext, String?)? yourAgeAccoountControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordCreateAccoountVisibility = false;
    passwordConfirmAccoountVisibility = false;
  }

  @override
  void dispose() {
    emailAddressAccoountFocusNode?.dispose();
    emailAddressAccoountController?.dispose();

    passwordCreateAccoountFocusNode?.dispose();
    passwordCreateAccoountController?.dispose();

    passwordConfirmAccoountFocusNode?.dispose();
    passwordConfirmAccoountController?.dispose();

    yourNameAccoountFocusNode?.dispose();
    yourNameAccoountController?.dispose();

    yourAgeAccoountFocusNode?.dispose();
    yourAgeAccoountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
