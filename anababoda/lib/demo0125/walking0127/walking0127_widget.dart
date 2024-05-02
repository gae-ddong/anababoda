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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'walking0127_model.dart';
export 'walking0127_model.dart';

class Walking0127Widget extends StatefulWidget {
  const Walking0127Widget({super.key});

  @override
  State<Walking0127Widget> createState() => _Walking0127WidgetState();
}

class _Walking0127WidgetState extends State<Walking0127Widget> with 
TickerProviderStateMixin{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TabController? controller;
  double threshold = 2.7; // 민감도
  ShakeDetector? shakeDetector; // 흔들기 감지 함수
  late Walking0127Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller!.addListener((tabListener));

    shakeDetector = ShakeDetector.autoStart(
      shakeSlopTimeMS: 100,
      shakeThresholdGravity: threshold,
      onPhoneShake: onPhoneShake,
    );
    _model = createModel(context, () => Walking0127Model());
  }

  tabListener(){
    setState(() {
    });
  }

  @override
  void dispose() {
    _model.dispose();
    controller!.removeListener((tabListener()));
    super.dispose();
  }

  Future<void> onPhoneShake() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('stepper')
          .where('email', isEqualTo: currentUserEmail)
          .get();

      // 사용자의 이메일과 일치하는 문서가 없으면 함수 종료
      if (querySnapshot.docs.isEmpty) return;

      DocumentSnapshot userDoc = querySnapshot.docs.first;
      int currentWalkLog = userDoc.get('walkLog');
      
      // walkLog 값을 1씩 증가시키고 업데이트
      await userDoc.reference.update({'walkLog': currentWalkLog + 1});
    } catch (e) {
      print('Error updating walk log: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StepperRecord>>(
      stream: queryStepperRecord(
        queryBuilder: (stepperRecord) => stepperRecord.where(
          'email',
          isEqualTo: currentUserEmail,
        ),
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
        List<StepperRecord> walking0127StepperRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final walking0127StepperRecord = walking0127StepperRecordList.isNotEmpty
            ? walking0127StepperRecordList.first
            : null;
        return Scaffold(
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
                  'ugyckvuf' /* 만보기 인증 */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
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
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 535.0,
                height: 399.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 50.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.shoePrints,
                                color: Color(0xFF7C826C),
                                size: 80.0,
                              ),
                              Text(
                                formatNumber(
                                valueOrDefault(walking0127StepperRecord!.walkLog, 0),
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.periodDecimal,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                          CircularPercentIndicator(
                            percent: functions.walkCal(
                              walking0127StepperRecord!.walkLog.toDouble())!,
                            radius: 60.0,
                            lineWidth: 12.0,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor: Color(0xFF7C826C),
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent4,
                            center: Text(
                              formatNumber(
                                valueOrDefault(walking0127StepperRecord!
                                    .walkLog
                                    ,0)/10000,
                                formatType: FormatType.percent,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FFButtonWidget(
                            onPressed: walking0127StepperRecord!.checked
                              ? null
                              :() async {
                              if (dateTimeFormat(
                                    'yMd',
                                    walking0127StepperRecord?.date,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ) ==
                                  dateTimeFormat(
                                    'yMd',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )) {
                                if ((walking0127StepperRecord!.walkLog >=
                                        10000) &&
                                    !walking0127StepperRecord!.checked) {
                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'footprint': FieldValue.increment(10),
                                      },
                                    ),
                                  });

                                  await FootprintsLogRecord.collection
                                      .doc()
                                      .set(createFootprintsLogRecordData(
                                        email: currentUserEmail,
                                        from: 'Stepper',
                                        time: getCurrentTimestamp,
                                        footLog: 10,
                                      ));

                                  await walking0127StepperRecord!.reference
                                      .update(createStepperRecordData(
                                    checked: true,
                                  ));
                                }
                              } else {
                                await walking0127StepperRecord!.reference
                                    .update(createStepperRecordData(
                                  walkLog: 0,
                                  date: getCurrentTimestamp,
                                  checked: false,
                                ));
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'isvu1jo9' /* 만보 발자국 받기 */,
                            ),
                            options: FFButtonOptions(
                              width: 168.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF7C826C),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: Container(
                  width: 354.0,
                  height: 79.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F7F8),
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Color(0xFFAFAFB6),
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'jyq8all8' /* 현재 보유 발자국 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: Color(0xFF435F23),
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault(currentUserDocument?.footprint, 0)
                                .toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
