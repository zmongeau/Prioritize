import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:prioritize/flutter_flow/flutter_flow_drop_down.dart';
import 'package:prioritize/flutter_flow/flutter_flow_icon_button.dart';
import 'package:prioritize/flutter_flow/flutter_flow_widgets.dart';
import 'package:prioritize/flutter_flow/flutter_flow_theme.dart';
import 'package:prioritize/index.dart';
import 'package:prioritize/main.dart';
import 'package:prioritize/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:prioritize/backend/firebase/firebase_config.dart';
import 'package:prioritize/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('BackendManagement', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('SignUpTab_0glq')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('emailAddress_Create_c91l')));
    await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_Create_c91l')),
        'robert.stevens@uri.edu');
    await tester.tap(find.byKey(const ValueKey('password_Create_6l5m')));
    await tester.enterText(
        find.byKey(const ValueKey('password_Create_6l5m')), 'password');
    await tester.tap(find.byKey(const ValueKey('passwordConfirm_fdsk')));
    await tester.enterText(
        find.byKey(const ValueKey('passwordConfirm_fdsk')), 'password');
    await tester.tap(find.byKey(const ValueKey('SignUpButton_rorj')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Name_0n7z')));
    await tester.enterText(
        find.byKey(const ValueKey('Name_0n7z')), 'Robert Stevens');
    await tester.enterText(
        find.byKey(const ValueKey('Username_l7pi')), 'rstevens19');
    await tester.tap(find.byKey(const ValueKey('Birthday_ca9d')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byIcon(Icons.create_sharp));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('Birthday_ca9d')), '11/26/2000');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Submit_5rmq')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.tap(find.byKey(const ValueKey('Container_fma9')));
    await tester.enterText(
        find.byKey(const ValueKey('task_40mr')), 'Submit 11.2');
    await tester.enterText(
        find.byKey(const ValueKey('description_hugd')), 'Submit 11.2 on time');
    await tester.enterText(
        find.byKey(const ValueKey('TextField_vp6n')), 'CSC305');
    await tester.tap(find.byKey(const ValueKey('DropDown_6xvu')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.tap(find.byKey(const ValueKey('DropDown_6xvu')));
    await tester.enterText(
        find.byKey(const ValueKey('Container_xa4s')), '4/13/2026');
    await tester.tap(find.byKey(const ValueKey('Button_j0ds')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
  });

  testWidgets('MakeTest', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: TaskListWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Container_fma9')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('task_40mr')), 'Submit 11.2');
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(find.byKey(const ValueKey('description_hugd')),
        'Complete 11.2 On Time');
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('TextField_vp6n')), 'CSC305');
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.tap(find.byKey(const ValueKey('DropDown_6xvu')));
    await tester.tap(find.text('High'));
    await tester.enterText(
        find.byKey(const ValueKey('Container_xa4s')), '4/13/2026');
    await tester.tap(find.byKey(const ValueKey('Button_j0ds')));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
