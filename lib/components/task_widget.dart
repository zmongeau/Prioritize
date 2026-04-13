import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_model.dart';
export 'task_model.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
    required this.tasksDoc,
    required this.completion,
  });

  final TaskDataRecord? tasksDoc;
  final Future Function()? completion;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late TaskModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TASK_COMP_Task_ON_INIT_STATE');
      logFirebaseEvent('Task_update_app_state');
      FFAppState().numberCompleted = FFAppState().numberCompleted + 1;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x0D000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: Container(
                  width: 22.0,
                  height: 22.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.0),
                    border: Border.all(
                      color: valueOrDefault<Color>(
                        functions
                            .priorityColorLight(widget.tasksDoc?.priority),
                        FlutterFlowTheme.of(context).alternate,
                      ),
                      width: 2.0,
                    ),
                  ),
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      unselectedWidgetColor: functions
                          .priorityColorDark(widget.tasksDoc?.priority),
                    ),
                    child: Checkbox(
                      value: _model.checkboxValue ??=
                          widget.tasksDoc!.completed,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue = newValue!);
                        if (newValue!) {
                          logFirebaseEvent(
                              'TASK_COMP_Checkbox_3l6b16bx_ON_TOGGLE_ON');
                          logFirebaseEvent('Checkbox_execute_callback');
                          await widget.completion?.call();
                          logFirebaseEvent('Checkbox_update_app_state');
                          FFAppState().numberCompleted =
                              FFAppState().numberCompleted + 1;
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent(
                              'TASK_Checkbox_3l6b16bx_ON_TOGGLE_OFF');
                          logFirebaseEvent('Checkbox_execute_callback');
                          await widget.completion?.call();
                          logFirebaseEvent('Checkbox_update_app_state');
                          FFAppState().numberCompleted =
                              FFAppState().numberCompleted + -1;
                          safeSetState(() {});
                        }
                      },
                      side: (functions.priorityColorDark(
                                  widget.tasksDoc?.priority) !=
                              null)
                          ? BorderSide(
                              width: 2,
                              color: functions.priorityColorDark(
                                  widget.tasksDoc?.priority)!,
                            )
                          : null,
                      activeColor: Color(0xFF89DC8C),
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.tasksDoc!.title,
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Container(
                            height: 22.0,
                            decoration: BoxDecoration(
                              color: functions.priorityColorLight(
                                  widget.tasksDoc?.priority),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                functions
                                    .priorityLabel(widget.tasksDoc?.priority)!,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      color: functions.priorityColorDark(
                                          widget.tasksDoc?.priority),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.tasksDoc!.description,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                            lineHeight: 1.4,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              color: functions.priorityColorDark(
                                  widget.tasksDoc?.priority),
                              size: 14.0,
                            ),
                            Text(
                              dateTimeFormat(
                                  "MMMEd", widget.tasksDoc!.dueDate!),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: functions.priorityColorDark(
                                        widget.tasksDoc?.priority),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.label_outline_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 14.0,
                            ),
                            Text(
                              widget.tasksDoc!.label,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                    if (!widget.tasksDoc!.completed)
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          hoverIconColor: FlutterFlowTheme.of(context).primary,
                          hoverBorderColor: Color(0x00FFFFFF),
                          icon: Icon(
                            Icons.edit,
                            color: Color(0xFF57636C),
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent('TASK_COMP_edit_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_to');

                            context.pushNamed(EditTaskWidget.routeName);
                          },
                        ),
                      ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}
