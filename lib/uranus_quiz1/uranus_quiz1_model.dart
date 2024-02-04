import '/components/right_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'uranus_quiz1_widget.dart' show UranusQuiz1Widget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class UranusQuiz1Model extends FlutterFlowModel<UranusQuiz1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Model for right component.
  late RightModel rightModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    rightModel = createModel(context, () => RightModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    rightModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
