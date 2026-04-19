import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_task_widget.dart' show CreateTaskWidget;
import 'package:flutter/material.dart';

class CreateTaskModel extends FlutterFlowModel<CreateTaskWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for taskTitle widget.
  FocusNode? taskTitleFocusNode;
  TextEditingController? taskTitleTextController;
  String? Function(BuildContext, String?)? taskTitleTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for labelText widget.
  FocusNode? labelTextFocusNode;
  TextEditingController? labelTextTextController;
  String? Function(BuildContext, String?)? labelTextTextControllerValidator;
  // State field(s) for PriorityDropDown widget.
  int? priorityDropDownValue;
  FormFieldController<int>? priorityDropDownValueController;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskTitleFocusNode?.dispose();
    taskTitleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    labelTextFocusNode?.dispose();
    labelTextTextController?.dispose();
  }
}
