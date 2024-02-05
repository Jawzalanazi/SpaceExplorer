import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'instructions_page6_model.dart';
export 'instructions_page6_model.dart';

class InstructionsPage6Widget extends StatefulWidget {
  const InstructionsPage6Widget({super.key});

  @override
  State<InstructionsPage6Widget> createState() =>
      _InstructionsPage6WidgetState();
}

class _InstructionsPage6WidgetState extends State<InstructionsPage6Widget> {
  late InstructionsPage6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstructionsPage6Model());

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
              alignment: const AlignmentDirectional(0.0, -0.8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/2emqy_5.png',
                  width: 435.0,
                  height: 118.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.52, -0.59),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('instructions_Page7');
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
