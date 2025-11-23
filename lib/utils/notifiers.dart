import 'package:flutter/material.dart';

class CombinedChangeNotifier extends ChangeNotifier {
  final ChangeNotifier one;
  final ChangeNotifier two;

  CombinedChangeNotifier(this.one, this.two) {
    one.addListener(() => notifyListeners());
    two.addListener(() => notifyListeners());
  }
}


class AccountAddedNotifier extends ChangeNotifier {

  void publish() {
    notifyListeners();
  }
}
