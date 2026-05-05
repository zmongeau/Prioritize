import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  /// If the forgot password button is pressed
  bool _forgotPasswordPressed = false;
  bool get forgotPasswordPressed => _forgotPasswordPressed;
  set forgotPasswordPressed(bool value) {
    _forgotPasswordPressed = value;
  }
}
