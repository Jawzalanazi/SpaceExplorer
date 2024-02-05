import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'inctractions_page3_model.dart';
export 'inctractions_page3_model.dart';

class InctractionsPage3Widget extends StatefulWidget {
  const InctractionsPage3Widget({super.key});

  @override
  State<InctractionsPage3Widget> createState() =>
      _InctractionsPage3WidgetState();
}

class _InctractionsPage3WidgetState extends State<InctractionsPage3Widget> {
  late InctractionsPage3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InctractionsPage3Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Background.jpg',
                  width: 393.0,
                  height: 852.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, -0.85),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/vnimc_1.png',
                  width: 435.0,
                  height: 134.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1.12, -0.32),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/49svh_2.png',
                  width: 385.0,
                  height: 128.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.46, -0.15),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('instructions_Page4');
                },
                child: Text(
                  'Next!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'digital tech',
                        color: FlutterFlowTheme.of(context).alternate,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
