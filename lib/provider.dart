import 'dart:math';

import 'package:flutter/material.dart';

class NumberProvider with ChangeNotifier {
  TextEditingController controller = TextEditingController();
  String userChoice = '';

  int appChoice = 0;
  var random = Random();

  appChoiceFunction() {
    appChoice = random.nextInt(10);
    notifyListeners();
  }

  changeAppChoice(int value) {
    appChoice = value;
    notifyListeners();
  }

  changeUserChoice(String value) {
    userChoice = value;
    notifyListeners();
  }
}
