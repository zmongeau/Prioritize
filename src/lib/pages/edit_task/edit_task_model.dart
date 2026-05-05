import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_task_widget.dart' show EditTaskWidget;
import 'package:flutter/material.dart';

class EditTaskModel extends FlutterFlowModel<EditTaskWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TitleField widget.
  FocusNode? titleFieldFocusNode;
  TextEditingController? titleFieldTextController;
  String? Function(BuildContext, String?)? titleFieldTextControllerValidator;
  // State field(s) for DetailsField widget.
  FocusNode? detailsFieldFocusNode;
  TextEditingController? detailsFieldTextController;
  String? Function(BuildContext, String?)? detailsFieldTextControllerValidator;
  // State field(s) for LabelField widget.
  FocusNode? labelFieldFocusNode;
  TextEditingController? labelFieldTextController;
  String? Function(BuildContext, String?)? labelFieldTextControllerValidator;
  // State field(s) for PriorityField widget.
  int? priorityFieldValue;
  FormFieldController<int>? priorityFieldValueController;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFieldFocusNode?.dispose();
    titleFieldTextController?.dispose();

    detailsFieldFocusNode?.dispose();
    detailsFieldTextController?.dispose();

    labelFieldFocusNode?.dispose();
    labelFieldTextController?.dispose();
  }
}
