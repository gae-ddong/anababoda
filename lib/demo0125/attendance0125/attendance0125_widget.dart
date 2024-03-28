import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'attendance0125_model.dart';
export 'attendance0125_model.dart';

class Attendance0125Widget extends StatefulWidget {
  const Attendance0125Widget({super.key});

  @override
  State<Attendance0125Widget> createState() => _Attendance0125WidgetState();
}

class _Attendance0125WidgetState extends State<Attendance0125Widget> {
  late Attendance0125Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Attendance0125Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DateRecord>>(
      stream: queryDateRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 60.0,
                height: 60.0,
                child: SpinKitPulse(
                  color: Color(0xFF435F23),
                  size: 60.0,
                ),
              ),
            ),
          );
        }
        List<DateRecord> attendance0125DateRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final attendance0125DateRecord = attendance0125DateRecordList.isNotEmpty
            ? attendance0125DateRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Color(0xFF435F23),
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
              ),
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '10w1u00g' /* 오늘의 발자국 */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 10.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: Colors.transparent,
                    icon: Icon(
                      Icons.home_filled,
                      color: Color(0xFFF1F4F8),
                      size: 35.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('homepage0125');
                    },
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: (_model.count != 0)
                                  ? null
                                  : () {
                                      print('Button pressed ...');
                                    },
                              text: FFLocalizations.of(context).getText(
                                'wilm0w0k' /* 1일차 */,
                              ),
                              options: FFButtonOptions(
                                width: 50.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF435F23),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 20.0,
                                borderSide: BorderSide(
                                  color: Color(0xFF848F70),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                                disabledColor: Color(0xFFAAB0A2),
                                disabledTextColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: (_model.count != 1)
                                  ? null
                                  : () {
                                      print('Button pressed ...');
                                    },
                              text: FFLocalizations.of(context).getText(
                                '594kbn60' /* 2일차 */,
                              ),
                              options: FFButtonOptions(
                                width: 50.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF435F23),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Color(0xFFAAB0A2),
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF7C826C),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: (_model.count != 2)
                                  ? null
                                  : () {
                                      print('Button pressed ...');
                                    },
                              text: FFLocalizations.of(context).getText(
                                '053fam6z' /* 3일차 */,
                              ),
                              options: FFButtonOptions(
                                width: 50.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF435F23),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Color(0xFFAAB0A2),
                                      fontSize: 15.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF7C826C),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: (_model.count != 3)
                                    ? null
                                    : () {
                                        print('Button pressed ...');
                                      },
                                text: FFLocalizations.of(context).getText(
                                  '5jezp6lp' /* 4일차 */,
                                ),
                                options: FFButtonOptions(
                                  width: 50.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF435F23),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Color(0xFFAAB0A2),
                                        fontSize: 15.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF7C826C),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: (_model.count != 4)
                                    ? null
                                    : () {
                                        print('Button pressed ...');
                                      },
                                text: FFLocalizations.of(context).getText(
                                  'p3od2ynd' /* 5일차 */,
                                ),
                                options: FFButtonOptions(
                                  width: 50.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF435F23),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Color(0xFFAAB0A2),
                                        fontSize: 15.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF7C826C),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: (_model.count != 5)
                                    ? null
                                    : () {
                                        print('Button pressed ...');
                                      },
                                text: FFLocalizations.of(context).getText(
                                  'cdl10yu9' /* 6일차 */,
                                ),
                                options: FFButtonOptions(
                                  width: 50.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF435F23),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Color(0xFFAAB0A2),
                                        fontSize: 15.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF7C826C),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: (_model.count != 6)
                                    ? null
                                    : () {
                                        print('Button pressed ...');
                                      },
                                text: FFLocalizations.of(context).getText(
                                  'qlys5j10' /* 7일차 */,
                                ),
                                options: FFButtonOptions(
                                  width: 50.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF435F23),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Color(0xFFAAB0A2),
                                        fontSize: 15.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF7C826C),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if ((dateTimeFormat(
                                        'yMd',
                                        functions.subDate(),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ) ==
                                      dateTimeFormat(
                                        'yMd',
                                        attendance0125DateRecord?.createdTimeA,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )) &&
                                  (_model.count! < 7)
                              ? true
                              : true) {
                            await attendance0125DateRecord!.reference
                                .update(createDateRecordData(
                              createdTimeA: getCurrentTimestamp,
                            ));
                            _model.count = _model.count! + 1;

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'footprint': FieldValue.increment(1),
                                },
                              ),
                            });
                          } else {
                            if (functions.checkDate(
                                attendance0125DateRecord!.createdTimeA!)!) {
                              await attendance0125DateRecord!.reference
                                  .update(createDateRecordData(
                                createdTimeA: functions.subDate(),
                              ));
                              _model.count = 0;
                            }
                          }
                        },
                        text: FFLocalizations.of(context).getText(
                          'ty32x4k2' /* Button */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Container(
                        width: 445.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'c4yg8a52' /* 보유 발자국 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 4.0, 20.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            formatNumber(
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.footprint,
                                                  0),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                            ),
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMediumFamily,
                                                  color: Color(0xFF7C826C),
                                                  fontSize: 36.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'wtd1d319' /* 발자국 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
