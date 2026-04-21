import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/task_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'task_list_model.dart';
export 'task_list_model.dart';

/// FlutterFlow AI Prompt: Create a page for a tasks list with options to sort
/// by priority and due date with the default view being a combination of
/// both.
class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  static String routeName = 'TaskList';
  static String routePath = '/TaskList';

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  late TaskListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskListModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'TaskList'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TaskDataRecord>>(
      stream: queryTaskDataRecord(
        queryBuilder: (taskDataRecord) => taskDataRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .where(
              'completed',
              isEqualTo: false,
            )
            .orderBy('due_date'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<TaskDataRecord> taskListTaskDataRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(140.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlutterFlowAdBanner(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      showsTestAd: true,
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onLongPress: () async {
                                logFirebaseEvent(
                                    'TASK_LIST_SignOutButton_ON_LONG_PRESS');
                                logFirebaseEvent('SignOutButton_auth');
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(SignUpPageWidget.routeName,
                                    context.mounted);
                              },
                              child: FlutterFlowIconButton(
                                key: ValueKey('SignOutButton_koqx'),
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                hoverIconColor:
                                    FlutterFlowTheme.of(context).error,
                                icon: Icon(
                                  Icons.logout,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('SignOutButton pressed ...');
                                },
                              ),
                            ),
                          ),
                          Text(
                            'My Tasks',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('TASK_LIST_PAGE__BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context
                                    .goNamed(UserProfilePageWidget.routeName);
                              },
                              text: '',
                              icon: Icon(
                                Icons.manage_accounts,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 1.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                color: Color(0x004B39EF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(6.0),
                                hoverTextColor:
                                    FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 3.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TASK_LIST_PAGE_Container_93srrw1y_ON_TAP');
                              logFirebaseEvent(
                                  'Container_google_analytics_event');
                              logFirebaseEvent(
                                'create_task_button',
                                parameters: {
                                  'Param 1': 'Create task button is clicked',
                                },
                              );
                              logFirebaseEvent('Container_navigate_to');

                              context.goNamed(CreateTaskWidget.routeName);
                            },
                            child: Container(
                              key: ValueKey('Container_fma9'),
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF89DC8C),
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 8.0, 6.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.add_rounded,
                                      color: Colors.white,
                                      size: 14.0,
                                    ),
                                    Text(
                                      'Create Task',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              3.0, 0.0, 3.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TASK_LIST_PAGE_Container_7n8fxapu_ON_TAP');
                              logFirebaseEvent('Container_update_page_state');
                              _model.sortMode = 'priority';
                              safeSetState(() {});
                            },
                            child: Container(
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: !((_model.sortMode == 'dueDate') &&
                                        (_model.sortMode != 'priority'))
                                    ? Color(0xFFC7C7C7)
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 8.0, 6.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.flag_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 14.0,
                                    ),
                                    Text(
                                      'Priority',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              3.0, 0.0, 3.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TASK_LIST_PAGE_Container_dm8gvehe_ON_TAP');
                              logFirebaseEvent('Container_update_page_state');
                              _model.sortMode = 'dueDate';
                              safeSetState(() {});
                            },
                            child: Container(
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: (_model.sortMode == 'dueDate') &&
                                        (_model.sortMode != 'priority')
                                    ? Color(0xFFC7C7C7)
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 8.0, 6.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.calendar_today_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 14.0,
                                    ),
                                    Text(
                                      'Due Date',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              3.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TASK_LIST_PAGE_Icon_7nqc5b50_ON_TAP');
                              logFirebaseEvent('Icon_navigate_to');

                              context.goNamed(CalendarPageWidget.routeName);
                            },
                            child: Icon(
                              Icons.calendar_month,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 36.0,
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 0.0)),
                    ),
                  ].divide(SizedBox(height: 1.0)),
                ),
                actions: [],
                centerTitle: false,
                toolbarHeight: 130.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    if (_model.sortMode == 'priority')
                      StreamBuilder<List<TaskDataRecord>>(
                        stream: queryTaskDataRecord(
                          queryBuilder: (taskDataRecord) => taskDataRecord
                              .where(
                                'user',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'completed',
                                isEqualTo: false,
                              ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<TaskDataRecord>
                              priorityListViewTaskDataRecordList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                priorityListViewTaskDataRecordList.length,
                            itemBuilder: (context, priorityListViewIndex) {
                              final priorityListViewTaskDataRecord =
                                  priorityListViewTaskDataRecordList[
                                      priorityListViewIndex];
                              return TaskWidget(
                                key: Key(
                                    'Keynbu_${priorityListViewIndex}_of_${priorityListViewTaskDataRecordList.length}'),
                                tasksDoc: priorityListViewTaskDataRecord,
                                completion: () async {
                                  logFirebaseEvent(
                                      'TASK_LIST_Container_nbud00d7_CALLBACK');
                                  logFirebaseEvent('Task_backend_call');

                                  await priorityListViewTaskDataRecord.reference
                                      .update(createTaskDataRecordData(
                                    completed: true,
                                  ));
                                },
                              );
                            },
                          );
                        },
                      ),
                    if (_model.sortMode == 'dueDate')
                      Builder(
                        builder: (context) {
                          final taskDueDates = functions
                              .getUniqueDueDates(
                                  taskListTaskDataRecordList.toList())
                              .toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: taskDueDates.length,
                            itemBuilder: (context, taskDueDatesIndex) {
                              final taskDueDatesItem =
                                  taskDueDates[taskDueDatesIndex];
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 10.0, 16.0, 4.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            dateTimeFormat(
                                                "MMMMEEEEd", taskDueDatesItem),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 1.2,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    StreamBuilder<List<TaskDataRecord>>(
                                      stream: queryTaskDataRecord(
                                        queryBuilder: (taskDataRecord) =>
                                            taskDataRecord
                                                .where(
                                                  'user',
                                                  isEqualTo:
                                                      currentUserReference,
                                                )
                                                .where(
                                                  'completed',
                                                  isEqualTo: false,
                                                )
                                                .where(
                                                  'due_date',
                                                  isEqualTo: taskDueDatesItem,
                                                )
                                                .orderBy('priority',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<TaskDataRecord>
                                            listViewTaskDataRecordList =
                                            snapshot.data!;

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewTaskDataRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewTaskDataRecord =
                                                listViewTaskDataRecordList[
                                                    listViewIndex];
                                            return Container(
                                              key: ValueKey('Task_mewj'),
                                              child: TaskWidget(
                                                key: Key(
                                                    'Keyzhn_${listViewIndex}_of_${listViewTaskDataRecordList.length}'),
                                                tasksDoc:
                                                    listViewTaskDataRecord,
                                                completion: () async {
                                                  logFirebaseEvent(
                                                      'TASK_LIST_Container_zhnu8tln_CALLBACK');
                                                  logFirebaseEvent(
                                                      'Task_backend_call');

                                                  await listViewTaskDataRecord
                                                      .reference
                                                      .update(
                                                          createTaskDataRecordData(
                                                    completed: true,
                                                  ));
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
