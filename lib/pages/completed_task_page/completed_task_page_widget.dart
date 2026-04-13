import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/task_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'completed_task_page_model.dart';
export 'completed_task_page_model.dart';

class CompletedTaskPageWidget extends StatefulWidget {
  const CompletedTaskPageWidget({super.key});

  static String routeName = 'CompletedTaskPage';
  static String routePath = '/completedTaskPage';

  @override
  State<CompletedTaskPageWidget> createState() =>
      _CompletedTaskPageWidgetState();
}

class _CompletedTaskPageWidgetState extends State<CompletedTaskPageWidget> {
  late CompletedTaskPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompletedTaskPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CompletedTaskPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Completed Tasks',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 28.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
              StreamBuilder<List<TaskDataRecord>>(
                stream: queryTaskDataRecord(
                  queryBuilder: (taskDataRecord) => taskDataRecord
                      .where(
                        'user',
                        isEqualTo: currentUserReference,
                      )
                      .where(
                        'completed',
                        isEqualTo: true,
                      )
                      .orderBy('due_date', descending: true),
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
                  List<TaskDataRecord> listViewTaskDataRecordList =
                      snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewTaskDataRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewTaskDataRecord =
                          listViewTaskDataRecordList[listViewIndex];
                      return TaskWidget(
                        key: Key(
                            'Key07p_${listViewIndex}_of_${listViewTaskDataRecordList.length}'),
                        tasksDoc: listViewTaskDataRecord,
                        completion: () async {
                          logFirebaseEvent(
                              'COMPLETED_TASK_Container_07pr1t9e_CALLBA');
                          logFirebaseEvent('Task_backend_call');

                          await listViewTaskDataRecord.reference
                              .update(createTaskDataRecordData(
                            completed: false,
                          ));
                        },
                      );
                    },
                  );
                },
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
