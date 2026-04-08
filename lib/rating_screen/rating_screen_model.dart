import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'rating_screen_widget.dart' show RatingScreenWidget;
import 'package:flutter/material.dart';

class RatingScreenModel extends FlutterFlowModel<RatingScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Feedback widget.
  FocusNode? feedbackFocusNode;
  TextEditingController? feedbackTextController;
  String? Function(BuildContext, String?)? feedbackTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    feedbackFocusNode?.dispose();
    feedbackTextController?.dispose();
  }
}
