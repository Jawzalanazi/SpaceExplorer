import '/components/right_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 't_f_jupiter_widget.dart' show TFJupiterWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class TFJupiterModel extends FlutterFlowModel<TFJupiterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Model for right component.
  late RightModel rightModel1;
  // Model for right component.
  late RightModel rightModel2;
  // Model for right component.
  late RightModel rightModel3;
  // Model for right component.
  late RightModel rightModel4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    rightModel1 = createModel(context, () => RightModel());
    rightModel2 = createModel(context, () => RightModel());
    rightModel3 = createModel(context, () => RightModel());
    rightModel4 = createModel(context, () => RightModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    rightModel1.dispose();
    rightModel2.dispose();
    rightModel3.dispose();
    rightModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
