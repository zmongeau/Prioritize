import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_task_widget.dart' show EditTaskWidget;
import 'package:flutter/material.dart';

class EditTaskModel extends FlutterFlowModel<EditTaskWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for Details widget.
  FocusNode? detailsFocusNode;
  TextEditingController? detailsTextController;
  String? Function(BuildContext, String?)? detailsTextControllerValidator;
  // State field(s) for Label widget.
  FocusNode? labelFocusNode;
  TextEditingController? labelTextController;
  String? Function(BuildContext, String?)? labelTextControllerValidator;
  // State field(s) for Priority widget.
  int? priorityValue;
  FormFieldController<int>? priorityValueController;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    detailsFocusNode?.dispose();
    detailsTextController?.dispose();

    labelFocusNode?.dispose();
    labelTextController?.dispose();
  }
}
