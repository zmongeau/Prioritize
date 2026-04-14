import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'password_reset_a_b_test_widget.dart' show PasswordResetABTestWidget;
import 'package:flutter/material.dart';

class PasswordResetABTestModel
    extends FlutterFlowModel<PasswordResetABTestWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for emailForgotPassword widget.
  FocusNode? emailForgotPasswordFocusNode;
  TextEditingController? emailForgotPasswordTextController;
  String? Function(BuildContext, String?)?
      emailForgotPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    emailForgotPasswordFocusNode?.dispose();
    emailForgotPasswordTextController?.dispose();
  }
}
