import 'package:flutter/material.dart';

class TipCalculatorModel extends ChangeNotifier {
  final amountController = TextEditingController();
  final percentageController = TextEditingController();
  var isTipActive = false;

  TipCalculatorModel() {
    amountController.addListener(notifyListeners);
    percentageController.addListener(notifyListeners);
  }

  double get tipAmount {
    final billAmount = double.tryParse(amountController.text) ?? 0.0;
    final tipPercentage = double.tryParse(percentageController.text) ?? 15.0;
    final tip = billAmount * (tipPercentage / 100);

    return isTipActive ? tip.ceilToDouble() : tip;
  }

  void updateIsTipActive(bool value) {
    isTipActive = value;
    notifyListeners();
  }
}