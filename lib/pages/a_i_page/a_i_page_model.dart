import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a_i_page_widget.dart' show AIPageWidget;
import 'package:flutter/material.dart';

class AIPageModel extends FlutterFlowModel<AIPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for prompt widget.
  FocusNode? promptFocusNode;
  TextEditingController? promptTextController;
  String? Function(BuildContext, String?)? promptTextControllerValidator;
  // Stores action output result for [AI Agent - Send Message to AICompanion] action in Button widget.
  String? aIAnswer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    promptFocusNode?.dispose();
    promptTextController?.dispose();
  }
}
