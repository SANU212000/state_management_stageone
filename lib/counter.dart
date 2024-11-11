import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  String _lastAction = 'increment';

  int get count => _count;
  String get lastAction => _lastAction;

  void increment() {
    _count++;
    _lastAction = 'increment';
    notifyListeners();
  }

  void decrement() {
    if (_count > 0) {
      _count--;
      _lastAction = 'decrement';
      notifyListeners();
    }
  }

  void reset() {
    _count = 0;
    _lastAction = 'reset';
    notifyListeners();
  }
}
